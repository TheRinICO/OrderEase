<template>
	<view style="padding: 40rpx;">
		<view
			style="padding: 20rpx; margin: 80rpx 0; background-color: #fff; box-shadow: 0 2rpx 10rpx rgba(0,0,0,.1); border-radius: 10rpx;">
			<view style="margin: 50rpx auto; font-size: 40rpx;text-align: center;">欢迎登录</view>
			<uni-forms ref="form" :modelValue="form" :rules="rules" validateTrigger='blur'>
				<uni-forms-item name="username">
					<uni-easyinput prefixIcon="person" v-model="form.username" placeholder="请输入账号" />
				</uni-forms-item>
				<uni-forms-item name="password">
					<uni-easyinput prefixIcon="locked" type="password" v-model="form.password" placeholder="请输入密码" />
				</uni-forms-item>
				<uni-forms-item>
					<button @click="login()"
						style="background-color: #409EFF; border-color: #409EFF; height: 70rpx; line-height: 70rpx;color: #fff;">登
						录</button>
				</uni-forms-item>
				<uni-forms-item>
					<view style="text-align: right;">还没有账号？去 <navigator style="display: inline-block; color: dodgerblue; 
						margin-left: 4rpx;" url="/pages/register/register">注册</navigator>
					</view>
				</uni-forms-item>
			</uni-forms>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				form: {
					role: 'USER'
				},
				rules: {
					// 对username字段进行必填验证
					username: {
						// username 字段的校验规则
						rules: [
							// 校验 username 不能为空
							{
								required: true,
								errorMessage: '请输入账号',
							},
							// 对username字段进行长度验证
							{
								minLength: 3,
								maxLength: 10,
								errorMessage: '账号长度在 {minLength} 到 {maxLength} 个字符',
							}
						],
					},
					password: {
						rules: [{
								required: true,
								errorMessage: '请输入密码',
							},
							{
								minLength: 3,
								maxLength: 10,
								errorMessage: '密码长度在 {minLength} 到 {maxLength} 个字符',
							}
						],
					}
				}
			}
		},
		onLoad() {
			if(uni.getStorageSync("xm-user")){
				uni.switchTab({
					url:'/pages/index/index',
				})
			}
		},
		methods: {
			login() {
				this.$refs.form.validate().then(res => {
					this.$request.post('/login', this.form).then(res => {
						if (res.code === '200') {
							uni.showToast({
								icon: 'success',
								title: '登录成功'
							})
							uni.setStorageSync('xm-user', res.data)

							// 跳转主页
							uni.switchTab({
								url: '/pages/index/index'
							})
						} else {
							uni.showToast({
								icon: 'error',
								title: res.msg
							})
						}
					})
				}).catch(err => {
					console.log('表单错误信息：', err);
				})
			}
		}
	}
</script>

<style>

</style>