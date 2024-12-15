package com.example.entity;

import java.io.Serializable;
import java.math.BigDecimal;

public class AmountDTO  implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 总价 */
    private BigDecimal amount;
    /** 优惠金额 */
    private BigDecimal actual;
    /** 实际价格 */
    private BigDecimal discount;

    public BigDecimal getDiscount() {
        return discount;
    }

    public void setDiscount(BigDecimal discount) {
        this.discount = discount;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public BigDecimal getActual() {
        return actual;
    }

    public void setActual(BigDecimal actual) {
        this.actual = actual;
    }
}
