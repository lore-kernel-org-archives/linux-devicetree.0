Return-Path: <SRS0=RKHO=ZT=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1486351569-4814-3-git-send-email-baoyou.xie@linaro.org>
References: <1486351569-4814-1-git-send-email-baoyou.xie@linaro.org> <1486351569-4814-3-git-send-email-baoyou.xie@linaro.org>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Mon, 6 Feb 2017 11:28:20 +0800
Message-ID: <CA+DQWkw70=cJUW4xbj91gMTpnfk4bOSgv9u9bv8427GjEVQoYA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] i2c: zx2967: add i2c controller driver for ZTE's
 zx2967 family
Content-Type: multipart/alternative; boundary=94eb2c0b0b9c2c9a090547d43914
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Jun Nie <jun.nie@linaro.org>, Baoyou Xie <baoyou.xie@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-i2c@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--94eb2c0b0b9c2c9a090547d43914
Content-Type: text/plain; charset=UTF-8

+ Shawn

On 6 February 2017 at 11:26, Baoyou Xie <baoyou.xie@linaro.org> wrote:

> This patch adds i2c controller driver for ZTE's zx2967 family.
>
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> ---
>  drivers/i2c/busses/Kconfig      |   9 +
>  drivers/i2c/busses/Makefile     |   1 +
>  drivers/i2c/busses/i2c-zx2967.c | 688 ++++++++++++++++++++++++++++++
> ++++++++++
>  3 files changed, 698 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-zx2967.c
>
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index e4a603e..d983e36 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1246,4 +1246,13 @@ config I2C_OPAL
>           This driver can also be built as a module. If so, the module
> will be
>           called as i2c-opal.
>
> +config I2C_ZX2967
> +       tristate "ZTE zx2967 I2C support"
> +       depends on ARCH_ZX
> +       default y
> +       help
> +         Selecting this option will add ZX2967 I2C driver.
> +         This driver can also be built as a module. If so, the module
> will be
> +         called i2c-zx2967.
> +
>  endmenu
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index beb4809..16b2901 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -101,6 +101,7 @@ obj-$(CONFIG_I2C_XILINX)    += i2c-xiic.o
>  obj-$(CONFIG_I2C_XLR)          += i2c-xlr.o
>  obj-$(CONFIG_I2C_XLP9XX)       += i2c-xlp9xx.o
>  obj-$(CONFIG_I2C_RCAR)         += i2c-rcar.o
> +obj-$(CONFIG_I2C_ZX2967)       += i2c-zx2967.o
>
>  # External I2C/SMBus adapter drivers
>  obj-$(CONFIG_I2C_DIOLAN_U2C)   += i2c-diolan-u2c.o
> diff --git a/drivers/i2c/busses/i2c-zx2967.c b/drivers/i2c/busses/i2c-
> zx2967.c
> new file mode 100644
> index 0000000..7b3471a
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-zx2967.c
> @@ -0,0 +1,688 @@
> +/*
> + * ZTE's zx2967 family i2c bus controller driver
> + *
> + * Copyright (C) 2017 ZTE Ltd.
> + *
> + * Author: Baoyou Xie <baoyou.xie@linaro.org>
> + *
> + * License terms: GNU General Public License (GPL) version 2
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#define REG_CMD                                0x04
> +#define REG_DEVADDR_H                  0x0C
> +#define REG_DEVADDR_L                  0x10
> +#define REG_CLK_DIV_FS                 0x14
> +#define REG_CLK_DIV_HS                 0x18
> +#define REG_WRCONF                     0x1C
> +#define REG_RDCONF                     0x20
> +#define REG_DATA                       0x24
> +#define REG_STAT                       0x28
> +
> +#define I2C_STOP                       0
> +#define I2C_MASTER                     BIT(0)
> +#define I2C_ADDR_MODE_TEN              BIT(1)
> +#define I2C_IRQ_MSK_ENABLE             BIT(3)
> +#define I2C_RW_READ                    BIT(4)
> +#define I2C_CMB_RW_EN                  BIT(5)
> +#define I2C_START                      BIT(6)
> +#define I2C_ADDR_MODE_TEN              BIT(1)
> +
> +#define I2C_WFIFO_RESET                        BIT(7)
> +#define I2C_RFIFO_RESET                        BIT(7)
> +
> +#define I2C_IRQ_ACK_CLEAR              BIT(7)
> +#define I2C_INT_MASK                   GENMASK(6, 0)
> +
> +#define I2C_TRANS_DONE                 BIT(0)
> +#define I2C_ERROR_DEVICE               BIT(1)
> +#define I2C_ERROR_DATA                 BIT(2)
> +#define I2C_ERROR_MASK                 GENMASK(2, 1)
> +
> +#define I2C_SR_BUSY                    BIT(6)
> +
> +#define I2C_SR_EDEVICE                 BIT(1)
> +#define I2C_SR_EDATA                   BIT(2)
> +
> +#define I2C_FIFO_MAX                   16
> +
> +#define I2C_TIMEOUT                    msecs_to_jiffies(1000)
> +
> +struct zx2967_i2c_info {
> +       spinlock_t              lock;
> +       struct device           *dev;
> +       struct i2c_adapter      adap;
> +       struct clk              *clk;
> +       struct completion       complete;
> +       u32                     clk_freq;
> +       void __iomem            *reg_base;
> +       size_t                  residue;
> +       int                     irq;
> +       int                     msg_rd;
> +       u8                      *buf;
> +       u8                      access_cnt;
> +       bool                    is_suspended;
> +};
> +
> +static void zx2967_i2c_writel(struct zx2967_i2c_info *zx_i2c,
> +                             u32 val, unsigned long reg)
> +{
> +       writel_relaxed(val, zx_i2c->reg_base + reg);
> +}
> +
> +static u32 zx2967_i2c_readl(struct zx2967_i2c_info *zx_i2c, unsigned long
> reg)
> +{
> +       return readl_relaxed(zx_i2c->reg_base + reg);
> +}
> +
> +static void zx2967_i2c_writesb(struct zx2967_i2c_info *zx_i2c,
> +                              void *data, unsigned long reg, int len)
> +{
> +       writesb(zx_i2c->reg_base + reg, data, len);
> +}
> +
> +static void zx2967_i2c_readsb(struct zx2967_i2c_info *zx_i2c,
> +                             void *data, unsigned long reg, int len)
> +{
> +       readsb(zx_i2c->reg_base + reg, data, len);
> +}
> +
> +static void zx2967_i2c_start_ctrl(struct zx2967_i2c_info *zx_i2c)
> +{
> +       u32 status;
> +       u32 ctl;
> +
> +       status = zx2967_i2c_readl(zx_i2c, REG_STAT);
> +       status |= I2C_IRQ_ACK_CLEAR;
> +       zx2967_i2c_writel(zx_i2c, status, REG_STAT);
> +
> +       ctl = zx2967_i2c_readl(zx_i2c, REG_CMD);
> +       if (zx_i2c->msg_rd)
> +               ctl |= I2C_RW_READ;
> +       else
> +               ctl &= ~I2C_RW_READ;
> +       ctl &= ~I2C_CMB_RW_EN;
> +       ctl |= I2C_START;
> +       zx2967_i2c_writel(zx_i2c, ctl, REG_CMD);
> +}
> +
> +static void zx2967_i2c_flush_fifos(struct zx2967_i2c_info *zx_i2c)
> +{
> +       u32 val;
> +       u32 offset;
> +
> +       if (zx_i2c->msg_rd) {
> +               offset = REG_RDCONF;
> +               val = I2C_RFIFO_RESET;
> +       } else {
> +               offset = REG_WRCONF;
> +               val = I2C_WFIFO_RESET;
> +       }
> +
> +       val |= zx2967_i2c_readl(zx_i2c, offset);
> +       zx2967_i2c_writel(zx_i2c, val, offset);
> +}
> +
> +static int zx2967_i2c_empty_rx_fifo(struct zx2967_i2c_info *zx_i2c, u32
> size)
> +{
> +       u8 val[I2C_FIFO_MAX] = {0};
> +       int i;
> +
> +       if (size > I2C_FIFO_MAX) {
> +               dev_err(zx_i2c->dev, "fifo size %d over the max value
> %d\n",
> +                       size, I2C_FIFO_MAX);
> +               return -EINVAL;
> +       }
> +
> +       zx2967_i2c_readsb(zx_i2c, val, REG_DATA, size);
> +       for (i = 0; i < size; i++) {
> +               *(zx_i2c->buf++) = val[i];
> +               zx_i2c->residue--;
> +               if (zx_i2c->residue <= 0)
> +                       break;
> +       }
> +
> +       barrier();
> +
> +       return 0;
> +}
> +
> +static int zx2967_i2c_fill_tx_fifo(struct zx2967_i2c_info *zx_i2c)
> +{
> +       u8 *buf = zx_i2c->buf;
> +       size_t residue = zx_i2c->residue;
> +
> +       if (residue == 0) {
> +               dev_err(zx_i2c->dev, "residue is %d\n", (int)residue);
> +               return -EINVAL;
> +       }
> +
> +       if (residue <= I2C_FIFO_MAX) {
> +               zx2967_i2c_writesb(zx_i2c, buf, REG_DATA, residue);
> +
> +               /* Again update before writing to FIFO to make sure isr
> sees. */
> +               zx_i2c->residue = 0;
> +               zx_i2c->buf = NULL;
> +       } else {
> +               zx2967_i2c_writesb(zx_i2c, buf, REG_DATA, I2C_FIFO_MAX);
> +               zx_i2c->residue -= I2C_FIFO_MAX;
> +               zx_i2c->buf += I2C_FIFO_MAX;
> +       }
> +
> +       barrier();
> +
> +       return 0;
> +}
> +
> +static int zx2967_i2c_reset_hardware(struct zx2967_i2c_info *zx_i2c)
> +{
> +       u32 val;
> +       u32 clk_div;
> +       u32 status;
> +
> +       val = I2C_MASTER | I2C_IRQ_MSK_ENABLE;
> +       zx2967_i2c_writel(zx_i2c, val, REG_CMD);
> +
> +       clk_div = clk_get_rate(zx_i2c->clk) / zx_i2c->clk_freq - 1;
> +       zx2967_i2c_writel(zx_i2c, clk_div, REG_CLK_DIV_FS);
> +       zx2967_i2c_writel(zx_i2c, clk_div, REG_CLK_DIV_HS);
> +
> +       zx2967_i2c_writel(zx_i2c, I2C_FIFO_MAX - 1, REG_WRCONF);
> +       zx2967_i2c_writel(zx_i2c, I2C_FIFO_MAX - 1, REG_RDCONF);
> +       zx2967_i2c_writel(zx_i2c, 1, REG_RDCONF);
> +
> +       zx2967_i2c_flush_fifos(zx_i2c);
> +
> +       status = zx2967_i2c_readl(zx_i2c, REG_STAT);
> +       if (status & I2C_SR_BUSY)
> +               return -EBUSY;
> +       if (status & (I2C_SR_EDEVICE | I2C_SR_EDATA))
> +               return -EIO;
> +
> +       enable_irq(zx_i2c->irq);
> +
> +       return 0;
> +}
> +
> +static void zx2967_i2c_isr_clr(struct zx2967_i2c_info *zx_i2c)
> +{
> +       u32 status;
> +
> +       status = zx2967_i2c_readl(zx_i2c, REG_STAT);
> +       status |= I2C_IRQ_ACK_CLEAR;
> +       zx2967_i2c_writel(zx_i2c, status, REG_STAT);
> +}
> +
> +static irqreturn_t zx2967_i2c_isr(int irq, void *dev_id)
> +{
> +       u32 status;
> +       struct zx2967_i2c_info *zx_i2c = (struct zx2967_i2c_info *)dev_id;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&zx_i2c->lock, flags);
> +
> +       status = zx2967_i2c_readl(zx_i2c, REG_STAT) & I2C_INT_MASK;
> +       zx2967_i2c_isr_clr(zx_i2c);
> +
> +       if (status & I2C_ERROR_MASK) {
> +               spin_unlock_irqrestore(&zx_i2c->lock, flags);
> +               return IRQ_HANDLED;
> +       }
> +
> +       if (status & I2C_TRANS_DONE)
> +               complete(&zx_i2c->complete);
> +
> +       spin_unlock_irqrestore(&zx_i2c->lock, flags);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static void zx2967_enable_tenbit(struct zx2967_i2c_info *zx_i2c, __u16
> addr)
> +{
> +       u16 val = (addr >> 7) & 0x7;
> +
> +       if (val > 0) {
> +               zx2967_i2c_writel(zx_i2c, val, REG_DEVADDR_H);
> +               val = (zx2967_i2c_readl(zx_i2c, REG_CMD)) |
> I2C_ADDR_MODE_TEN;
> +               zx2967_i2c_writel(zx_i2c, val, REG_CMD);
> +       }
> +}
> +
> +static int
> +zx2967_i2c_xfer_read_bytes(struct zx2967_i2c_info *zx_i2c, u32 bytes)
> +{
> +       unsigned long time_left;
> +
> +       reinit_completion(&zx_i2c->complete);
> +       zx2967_i2c_writel(zx_i2c, bytes - 1, REG_RDCONF);
> +       zx2967_i2c_start_ctrl(zx_i2c);
> +
> +       time_left = wait_for_completion_timeout(&zx_i2c->complete,
> +                               I2C_TIMEOUT);
> +       if (time_left == 0) {
> +               dev_err(zx_i2c->dev, "read i2c transfer timed out\n");
> +               disable_irq(zx_i2c->irq);
> +               zx2967_i2c_reset_hardware(zx_i2c);
> +               return -EIO;
> +       }
> +
> +       return zx2967_i2c_empty_rx_fifo(zx_i2c, bytes);
> +}
> +
> +static int zx2967_i2c_xfer_read(struct zx2967_i2c_info *zx_i2c)
> +{
> +       int ret;
> +       int i;
> +
> +       for (i = 0; i < zx_i2c->access_cnt; i++) {
> +               ret = zx2967_i2c_xfer_read_bytes(zx_i2c, I2C_FIFO_MAX);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       if (zx_i2c->residue > 0) {
> +               ret = zx2967_i2c_xfer_read_bytes(zx_i2c, I2C_FIFO_MAX);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       zx_i2c->residue = 0;
> +       zx_i2c->access_cnt = 0;
> +       return 0;
> +}
> +
> +static int
> +zx2967_i2c_xfer_write_bytes(struct zx2967_i2c_info *zx_i2c, u32 bytes)
> +{
> +       unsigned long time_left;
> +       int ret;
> +
> +       reinit_completion(&zx_i2c->complete);
> +
> +       ret = zx2967_i2c_fill_tx_fifo(zx_i2c);
> +       if (ret)
> +               return ret;
> +
> +       zx2967_i2c_start_ctrl(zx_i2c);
> +
> +       time_left = wait_for_completion_timeout(&zx_i2c->complete,
> +                               I2C_TIMEOUT);
> +       if (time_left == 0) {
> +               dev_err(zx_i2c->dev, "write i2c transfer timed out\n");
> +               disable_irq(zx_i2c->irq);
> +               zx2967_i2c_reset_hardware(zx_i2c);
> +               return -EIO;
> +       }
> +
> +       return 0;
> +}
> +
> +static int zx2967_i2c_xfer_write(struct zx2967_i2c_info *zx_i2c)
> +{
> +       int ret;
> +       int i;
> +
> +       for (i = 0; i < zx_i2c->access_cnt; i++) {
> +               ret = zx2967_i2c_xfer_write_bytes(zx_i2c, I2C_FIFO_MAX);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       if (zx_i2c->residue > 0) {
> +               ret = zx2967_i2c_xfer_write_bytes(zx_i2c, I2C_FIFO_MAX);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       zx_i2c->residue = 0;
> +       zx_i2c->access_cnt = 0;
> +       return 0;
> +}
> +
> +static int zx2967_i2c_xfer_msg(struct zx2967_i2c_info *zx_i2c,
> +                              struct i2c_msg *msg)
> +{
> +       if (msg->len == 0)
> +               return -EINVAL;
> +
> +       zx2967_i2c_flush_fifos(zx_i2c);
> +
> +       zx_i2c->buf = msg->buf;
> +       zx_i2c->residue = msg->len;
> +       zx_i2c->access_cnt = msg->len / I2C_FIFO_MAX;
> +       zx_i2c->msg_rd = (msg->flags & I2C_M_RD);
> +
> +       if (zx_i2c->msg_rd)
> +               return zx2967_i2c_xfer_read(zx_i2c);
> +
> +       return zx2967_i2c_xfer_write(zx_i2c);
> +}
> +
> +static int zx2967_i2c_xfer(struct i2c_adapter *adap,
> +                          struct i2c_msg *msgs, int num)
> +{
> +       struct zx2967_i2c_info *zx_i2c = i2c_get_adapdata(adap);
> +       int ret;
> +       int i;
> +
> +       if (zx_i2c->is_suspended)
> +               return -EBUSY;
> +
> +       zx2967_i2c_writel(zx_i2c, (msgs->addr & 0x7f), REG_DEVADDR_L);
> +       zx2967_i2c_writel(zx_i2c, (msgs->addr >> 7) & 0x7, REG_DEVADDR_H);
> +       if (zx2967_i2c_readl(zx_i2c, REG_DEVADDR_H) > 0)
> +               zx2967_enable_tenbit(zx_i2c, msgs->addr);
> +
> +       for (i = 0; i < num; i++) {
> +               ret = zx2967_i2c_xfer_msg(zx_i2c, &msgs[i]);
> +               if (ret)
> +                       return ret;
> +               if (num > 1)
> +                       usleep_range(1000, 2000);
> +       }
> +
> +       return num;
> +}
> +
> +static void
> +zx2967_smbus_xfer_prepare(struct zx2967_i2c_info *zx_i2c, u16 addr,
> +                         char read_write, u8 command, int size,
> +                         union i2c_smbus_data *data)
> +{
> +       u32 val;
> +
> +       val = zx2967_i2c_readl(zx_i2c, REG_RDCONF);
> +       val |= I2C_RFIFO_RESET;
> +       zx2967_i2c_writel(zx_i2c, val, REG_RDCONF);
> +       zx2967_i2c_writel(zx_i2c, (addr & 0x7f), REG_DEVADDR_L);
> +
> +       zx2967_enable_tenbit(zx_i2c, addr);
> +       val = zx2967_i2c_readl(zx_i2c, REG_CMD);
> +       val &= ~I2C_RW_READ;
> +       zx2967_i2c_writel(zx_i2c, val, REG_CMD);
> +
> +       switch (size) {
> +       case I2C_SMBUS_BYTE:
> +               zx2967_i2c_writel(zx_i2c, command, REG_DATA);
> +               break;
> +       case I2C_SMBUS_BYTE_DATA:
> +               zx2967_i2c_writel(zx_i2c, command, REG_DATA);
> +               if (read_write == I2C_SMBUS_WRITE)
> +                       zx2967_i2c_writel(zx_i2c, data->byte, REG_DATA);
> +               break;
> +       case I2C_SMBUS_WORD_DATA:
> +               zx2967_i2c_writel(zx_i2c, command, REG_DATA);
> +               if (read_write == I2C_SMBUS_WRITE) {
> +                       zx2967_i2c_writel(zx_i2c, (data->word >> 8),
> REG_DATA);
> +                       zx2967_i2c_writel(zx_i2c, (data->word & 0xff),
> +                                         REG_DATA);
> +               }
> +               break;
> +       }
> +}
> +
> +static int zx2967_smbus_xfer_read(struct zx2967_i2c_info *zx_i2c, int
> size,
> +                                 union i2c_smbus_data *data)
> +{
> +       unsigned long time_left;
> +       u8 buf[2];
> +       u32 val;
> +
> +       reinit_completion(&zx_i2c->complete);
> +
> +       val = zx2967_i2c_readl(zx_i2c, REG_CMD);
> +       val |= I2C_CMB_RW_EN;
> +       zx2967_i2c_writel(zx_i2c, val, REG_CMD);
> +
> +       val = zx2967_i2c_readl(zx_i2c, REG_CMD);
> +       val |= I2C_START;
> +       zx2967_i2c_writel(zx_i2c, val, REG_CMD);
> +
> +       time_left = wait_for_completion_timeout(&zx_i2c->complete,
> +                                               I2C_TIMEOUT);
> +       if (time_left == 0) {
> +               dev_err(zx_i2c->dev, "i2c read transfer timed out\n");
> +               disable_irq(zx_i2c->irq);
> +               zx2967_i2c_reset_hardware(zx_i2c);
> +               return -EIO;
> +       }
> +
> +       usleep_range(1000, 2000);
> +       switch (size) {
> +       case I2C_SMBUS_BYTE:
> +       case I2C_SMBUS_BYTE_DATA:
> +               val = zx2967_i2c_readl(zx_i2c, REG_DATA);
> +               data->byte = val;
> +               break;
> +       case I2C_SMBUS_WORD_DATA:
> +       case I2C_SMBUS_PROC_CALL:
> +               buf[0] = zx2967_i2c_readl(zx_i2c, REG_DATA);
> +               buf[1] = zx2967_i2c_readl(zx_i2c, REG_DATA);
> +               data->word = (buf[0] << 8) | buf[1];
> +               break;
> +       default:
> +               dev_warn(zx_i2c->dev, "Unsupported transaction %d\n",
> size);
> +               return -EOPNOTSUPP;
> +       }
> +
> +       return 0;
> +}
> +
> +static int zx2967_smbus_xfer_write(struct zx2967_i2c_info *zx_i2c)
> +{
> +       unsigned long time_left;
> +       u32 val;
> +
> +       reinit_completion(&zx_i2c->complete);
> +       val = zx2967_i2c_readl(zx_i2c, REG_CMD);
> +       val |= I2C_START;
> +       zx2967_i2c_writel(zx_i2c, val, REG_CMD);
> +
> +       time_left = wait_for_completion_timeout(&zx_i2c->complete,
> +                                               I2C_TIMEOUT);
> +       if (time_left == 0) {
> +               dev_err(zx_i2c->dev, "i2c write transfer timed out\n");
> +               disable_irq(zx_i2c->irq);
> +               zx2967_i2c_reset_hardware(zx_i2c);
> +               return -EIO;
> +       }
> +
> +       return 0;
> +}
> +
> +static int zx2967_smbus_xfer(struct i2c_adapter *adap, u16 addr,
> +                            unsigned short flags, char read_write,
> +                            u8 command, int size, union i2c_smbus_data
> *data)
> +{
> +       struct zx2967_i2c_info *zx_i2c = i2c_get_adapdata(adap);
> +
> +       if (size == I2C_SMBUS_QUICK)
> +               read_write = I2C_SMBUS_WRITE;
> +
> +       switch (size) {
> +       case I2C_SMBUS_QUICK:
> +       case I2C_SMBUS_BYTE:
> +       case I2C_SMBUS_BYTE_DATA:
> +       case I2C_SMBUS_WORD_DATA:
> +               zx2967_smbus_xfer_prepare(zx_i2c, addr, read_write,
> +                                         command, size, data);
> +               break;
> +       default:
> +               dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
> +               return -EOPNOTSUPP;
> +       }
> +
> +       if (read_write == I2C_SMBUS_READ)
> +               return zx2967_smbus_xfer_read(zx_i2c, size, data);
> +
> +       return zx2967_smbus_xfer_write(zx_i2c);
> +}
> +
> +#define ZX2967_I2C_FUNCS (I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE | \
> +               I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |   \
> +               I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_PROC_CALL |  \
> +               I2C_FUNC_I2C | I2C_FUNC_SMBUS_I2C_BLOCK)
> +
> +static u32 zx2967_i2c_func(struct i2c_adapter *adap)
> +{
> +       return ZX2967_I2C_FUNCS;
> +}
> +
> +static int __maybe_unused zx2967_i2c_suspend(struct device *dev)
> +{
> +       struct zx2967_i2c_info *zx_i2c = dev_get_drvdata(dev);
> +
> +       zx_i2c->is_suspended = true;
> +       clk_disable_unprepare(zx_i2c->clk);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused zx2967_i2c_resume(struct device *dev)
> +{
> +       struct zx2967_i2c_info *zx_i2c = dev_get_drvdata(dev);
> +
> +       zx_i2c->is_suspended = false;
> +       clk_prepare_enable(zx_i2c->clk);
> +
> +       return 0;
> +}
> +
> +#ifdef CONFIG_PM
> +static const struct dev_pm_ops zx2967_i2c_dev_pm_ops = {
> +       .suspend        = zx2967_i2c_suspend,
> +       .resume         = zx2967_i2c_resume,
> +};
> +#define ZX2967_I2C_DEV_PM_OPS  (&zx2967_i2c_dev_pm_ops)
> +#else
> +#define        ZX2967_I2C_DEV_PM_OPS   NULL
> +#endif
> +
> +static const struct i2c_algorithm zx2967_i2c_algo = {
> +       .master_xfer = zx2967_i2c_xfer,
> +       .smbus_xfer = zx2967_smbus_xfer,
> +       .functionality = zx2967_i2c_func,
> +};
> +
> +static const struct of_device_id zx2967_i2c_of_match[] = {
> +       { .compatible = "zte,zx296718-i2c", },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, zx2967_i2c_of_match);
> +
> +static int zx2967_i2c_probe(struct platform_device *pdev)
> +{
> +       struct zx2967_i2c_info *zx_i2c;
> +       void __iomem *reg_base;
> +       struct resource *res;
> +       struct clk *clk;
> +       int ret;
> +
> +       zx_i2c = devm_kzalloc(&pdev->dev, sizeof(*zx_i2c), GFP_KERNEL);
> +       if (!zx_i2c)
> +               return -ENOMEM;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       reg_base = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(reg_base))
> +               return PTR_ERR(reg_base);
> +
> +       clk = devm_clk_get(&pdev->dev, NULL);
> +       if (IS_ERR(clk)) {
> +               dev_err(&pdev->dev, "missing controller clock");
> +               return PTR_ERR(clk);
> +       }
> +
> +       ret = clk_prepare_enable(clk);
> +       if (ret) {
> +               dev_err(&pdev->dev, "failed to enable i2c_clk\n");
> +               return ret;
> +       }
> +
> +       ret = platform_get_irq(pdev, 0);
> +       if (ret < 0)
> +               return ret;
> +       zx_i2c->irq = ret;
> +
> +       ret = device_property_read_u32(&pdev->dev, "clock-frequency",
> +                                      &zx_i2c->clk_freq);
> +       if (ret) {
> +               dev_err(&pdev->dev, "missing clock-frequency");
> +               return ret;
> +       }
> +
> +       zx_i2c->reg_base = reg_base;
> +       zx_i2c->clk = clk;
> +       zx_i2c->dev = &pdev->dev;
> +
> +       spin_lock_init(&zx_i2c->lock);
> +       init_completion(&zx_i2c->complete);
> +       platform_set_drvdata(pdev, zx_i2c);
> +
> +       ret = zx2967_i2c_reset_hardware(zx_i2c);
> +       if (ret) {
> +               dev_err(&pdev->dev, "failed to initialize i2c
> controller\n");
> +               goto err_clk_unprepare;
> +       }
> +
> +       ret = devm_request_irq(&pdev->dev, zx_i2c->irq,
> +                       zx2967_i2c_isr, 0, dev_name(&pdev->dev), zx_i2c);
> +       if (ret) {
> +               dev_err(&pdev->dev, "failed to request irq %i\n",
> zx_i2c->irq);
> +               goto err_clk_unprepare;
> +       }
> +
> +       i2c_set_adapdata(&zx_i2c->adap, zx_i2c);
> +       zx_i2c->adap.owner = THIS_MODULE;
> +       zx_i2c->adap.class = I2C_CLASS_DEPRECATED;
> +       strlcpy(zx_i2c->adap.name, "zx2967 i2c adapter",
> +               sizeof(zx_i2c->adap.name));
> +       zx_i2c->adap.algo = &zx2967_i2c_algo;
> +       zx_i2c->adap.dev.parent = &pdev->dev;
> +       zx_i2c->adap.nr = pdev->id;
> +       zx_i2c->adap.dev.of_node = pdev->dev.of_node;
> +
> +       ret = i2c_add_numbered_adapter(&zx_i2c->adap);
> +       if (ret) {
> +               dev_err(&pdev->dev, "failed to add zx2967 i2c adapter\n");
> +               goto err_clk_unprepare;
> +       }
> +
> +       return 0;
> +
> +err_clk_unprepare:
> +       clk_disable_unprepare(zx_i2c->clk);
> +       return ret;
> +}
> +
> +static int zx2967_i2c_remove(struct platform_device *pdev)
> +{
> +       struct zx2967_i2c_info *zx_i2c = platform_get_drvdata(pdev);
> +
> +       i2c_del_adapter(&zx_i2c->adap);
> +       clk_disable_unprepare(zx_i2c->clk);
> +
> +       return 0;
> +}
> +
> +static struct platform_driver zx2967_i2c_driver = {
> +       .probe  = zx2967_i2c_probe,
> +       .remove = zx2967_i2c_remove,
> +       .driver = {
> +               .name  = "zx2967_i2c",
> +               .of_match_table = zx2967_i2c_of_match,
> +               .pm             = ZX2967_I2C_DEV_PM_OPS,
> +       },
> +};
> +module_platform_driver(zx2967_i2c_driver);
> +
> +MODULE_AUTHOR("Baoyou Xie <baoyou.xie@linaro.org>");
> +MODULE_DESCRIPTION("ZTE zx2967 I2C Bus Controller driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.7.4
>
>

--94eb2c0b0b9c2c9a090547d43914
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+KyBTaGF3bjxicj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+
PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj5PbiA2IEZlYnJ1YXJ5IDIwMTcgYXQgMTE6MjYs
IEJhb3lvdSBYaWUgPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86YmFveW91Lnhp
ZUBsaW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+YmFveW91LnhpZUBsaW5hcm8ub3JnPC9hPiZn
dDs8L3NwYW4+IHdyb3RlOjxicj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxl
PSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxl
ZnQ6MWV4Ij5UaGlzIHBhdGNoIGFkZHMgaTJjIGNvbnRyb2xsZXIgZHJpdmVyIGZvciBaVEUmIzM5
O3MgengyOTY3IGZhbWlseS48YnI+DQo8YnI+DQpTaWduZWQtb2ZmLWJ5OiBCYW95b3UgWGllICZs
dDs8YSBocmVmPSJtYWlsdG86YmFveW91LnhpZUBsaW5hcm8ub3JnIj5iYW95b3UueGllQGxpbmFy
by5vcmc8L2E+Jmd0Ozxicj4NCi0tLTxicj4NCsKgZHJpdmVycy9pMmMvYnVzc2VzL0tjb25maWfC
oCDCoCDCoCB8wqAgwqA5ICs8YnI+DQrCoGRyaXZlcnMvaTJjL2J1c3Nlcy9NYWtlZmlsZcKgIMKg
IMKgfMKgIMKgMSArPGJyPg0KwqBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXp4Mjk2Ny48d2JyPmMg
fCA2ODggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrPHdicj4rKysrKysrKysrPGJyPg0K
wqAzIGZpbGVzIGNoYW5nZWQsIDY5OCBpbnNlcnRpb25zKCspPGJyPg0KwqBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy16eDI5NjcuPHdicj5jPGJyPg0KPGJyPg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9LY29uZmlnIGIvZHJpdmVycy9pMmMvYnVzc2Vz
L0tjb25maWc8YnI+DQppbmRleCBlNGE2MDNlLi5kOTgzZTM2IDEwMDY0NDxicj4NCi0tLSBhL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9LY29uZmlnPGJyPg0KKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL0tj
b25maWc8YnI+DQpAQCAtMTI0Niw0ICsxMjQ2LDEzIEBAIGNvbmZpZyBJMkNfT1BBTDxicj4NCsKg
IMKgIMKgIMKgIMKgIFRoaXMgZHJpdmVyIGNhbiBhbHNvIGJlIGJ1aWx0IGFzIGEgbW9kdWxlLiBJ
ZiBzbywgdGhlIG1vZHVsZSB3aWxsIGJlPGJyPg0KwqAgwqAgwqAgwqAgwqAgY2FsbGVkIGFzIGky
Yy1vcGFsLjxicj4NCjxicj4NCitjb25maWcgSTJDX1pYMjk2Nzxicj4NCivCoCDCoCDCoCDCoHRy
aXN0YXRlICZxdW90O1pURSB6eDI5NjcgSTJDIHN1cHBvcnQmcXVvdDs8YnI+DQorwqAgwqAgwqAg
wqBkZXBlbmRzIG9uIEFSQ0hfWlg8YnI+DQorwqAgwqAgwqAgwqBkZWZhdWx0IHk8YnI+DQorwqAg
wqAgwqAgwqBoZWxwPGJyPg0KK8KgIMKgIMKgIMKgIMKgU2VsZWN0aW5nIHRoaXMgb3B0aW9uIHdp
bGwgYWRkIFpYMjk2NyBJMkMgZHJpdmVyLjxicj4NCivCoCDCoCDCoCDCoCDCoFRoaXMgZHJpdmVy
IGNhbiBhbHNvIGJlIGJ1aWx0IGFzIGEgbW9kdWxlLiBJZiBzbywgdGhlIG1vZHVsZSB3aWxsIGJl
PGJyPg0KK8KgIMKgIMKgIMKgIMKgY2FsbGVkIGkyYy16eDI5NjcuPGJyPg0KKzxicj4NCsKgZW5k
bWVudTxicj4NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvTWFrZWZpbGUgYi9kcml2
ZXJzL2kyYy9idXNzZXMvTWFrZWZpbGU8YnI+DQppbmRleCBiZWI0ODA5Li4xNmIyOTAxIDEwMDY0
NDxicj4NCi0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9NYWtlZmlsZTxicj4NCisrKyBiL2RyaXZl
cnMvaTJjL2J1c3Nlcy9NYWtlZmlsZTxicj4NCkBAIC0xMDEsNiArMTAxLDcgQEAgb2JqLSQoQ09O
RklHX0kyQ19YSUxJTlgpwqAgwqAgKz0gaTJjLXhpaWMubzxicj4NCsKgb2JqLSQoQ09ORklHX0ky
Q19YTFIpwqAgwqAgwqAgwqAgwqAgKz0gaTJjLXhsci5vPGJyPg0KwqBvYmotJChDT05GSUdfSTJD
X1hMUDlYWCnCoCDCoCDCoCDCoCs9IGkyYy14bHA5eHgubzxicj4NCsKgb2JqLSQoQ09ORklHX0ky
Q19SQ0FSKcKgIMKgIMKgIMKgIMKgKz0gaTJjLXJjYXIubzxicj4NCitvYmotJChDT05GSUdfSTJD
X1pYMjk2NynCoCDCoCDCoCDCoCs9IGkyYy16eDI5Njcubzxicj4NCjxicj4NCsKgIyBFeHRlcm5h
bCBJMkMvU01CdXMgYWRhcHRlciBkcml2ZXJzPGJyPg0KwqBvYmotJChDT05GSUdfSTJDX0RJT0xB
Tl9VMkMpwqAgwqArPSBpMmMtZGlvbGFuLXUyYy5vPGJyPg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtPHdicj56eDI5NjcuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtPHdi
cj56eDI5NjcuYzxicj4NCm5ldyBmaWxlIG1vZGUgMTAwNjQ0PGJyPg0KaW5kZXggMDAwMDAwMC4u
N2IzNDcxYTxicj4NCi0tLSAvZGV2L251bGw8YnI+DQorKysgYi9kcml2ZXJzL2kyYy9idXNzZXMv
aTJjLTx3YnI+engyOTY3LmM8YnI+DQpAQCAtMCwwICsxLDY4OCBAQDxicj4NCisvKjxicj4NCisg
KiBaVEUmIzM5O3MgengyOTY3IGZhbWlseSBpMmMgYnVzIGNvbnRyb2xsZXIgZHJpdmVyPGJyPg0K
KyAqPGJyPg0KKyAqIENvcHlyaWdodCAoQykgMjAxNyBaVEUgTHRkLjxicj4NCisgKjxicj4NCisg
KiBBdXRob3I6IEJhb3lvdSBYaWUgJmx0OzxhIGhyZWY9Im1haWx0bzpiYW95b3UueGllQGxpbmFy
by5vcmciPmJhb3lvdS54aWVAbGluYXJvLm9yZzwvYT4mZ3Q7PGJyPg0KKyAqPGJyPg0KKyAqIExp
Y2Vuc2UgdGVybXM6IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIChHUEwpIHZlcnNpb24gMjxi
cj4NCisgKi88YnI+DQorPGJyPg0KKyNpbmNsdWRlICZsdDtsaW51eC9jbGsuaCZndDs8YnI+DQor
I2luY2x1ZGUgJmx0O2xpbnV4L2RlbGF5LmgmZ3Q7PGJyPg0KKyNpbmNsdWRlICZsdDtsaW51eC9p
MmMuaCZndDs8YnI+DQorI2luY2x1ZGUgJmx0O2xpbnV4L2ludGVycnVwdC5oJmd0Ozxicj4NCisj
aW5jbHVkZSAmbHQ7bGludXgvaW8uaCZndDs8YnI+DQorI2luY2x1ZGUgJmx0O2xpbnV4L21vZHVs
ZS5oJmd0Ozxicj4NCisjaW5jbHVkZSAmbHQ7bGludXgvcGxhdGZvcm1fZGV2aWNlLmgmZ3Q7PGJy
Pg0KKzxicj4NCisjZGVmaW5lIFJFR19DTUTCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCAweDA0PGJyPg0KKyNkZWZpbmUgUkVHX0RFVkFERFJfSMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIDB4MEM8YnI+DQorI2RlZmluZSBSRUdfREVWQUREUl9MwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgMHgxMDxicj4NCisjZGVmaW5lIFJFR19DTEtfRElWX0ZTwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAweDE0PGJyPg0KKyNkZWZpbmUgUkVHX0NMS19ESVZfSFPC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDB4MTg8YnI+DQorI2RlZmluZSBSRUdfV1JDT05GwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAweDFDPGJyPg0KKyNkZWZpbmUgUkVHX1JEQ09O
RsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMHgyMDxicj4NCisjZGVmaW5lIFJFR19E
QVRBwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAweDI0PGJyPg0KKyNkZWZpbmUg
UkVHX1NUQVTCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDB4Mjg8YnI+DQorPGJy
Pg0KKyNkZWZpbmUgSTJDX1NUT1DCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDA8
YnI+DQorI2RlZmluZSBJMkNfTUFTVEVSwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBC
SVQoMCk8YnI+DQorI2RlZmluZSBJMkNfQUREUl9NT0RFX1RFTsKgIMKgIMKgIMKgIMKgIMKgIMKg
IEJJVCgxKTxicj4NCisjZGVmaW5lIEkyQ19JUlFfTVNLX0VOQUJMRcKgIMKgIMKgIMKgIMKgIMKg
IMKgQklUKDMpPGJyPg0KKyNkZWZpbmUgSTJDX1JXX1JFQUTCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBCSVQoNCk8YnI+DQorI2RlZmluZSBJMkNfQ01CX1JXX0VOwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgQklUKDUpPGJyPg0KKyNkZWZpbmUgSTJDX1NUQVJUwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgQklUKDYpPGJyPg0KKyNkZWZpbmUgSTJDX0FERFJfTU9ERV9URU7C
oCDCoCDCoCDCoCDCoCDCoCDCoCBCSVQoMSk8YnI+DQorPGJyPg0KKyNkZWZpbmUgSTJDX1dGSUZP
X1JFU0VUwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQklUKDcpPGJyPg0KKyNk
ZWZpbmUgSTJDX1JGSUZPX1JFU0VUwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
QklUKDcpPGJyPg0KKzxicj4NCisjZGVmaW5lIEkyQ19JUlFfQUNLX0NMRUFSwqAgwqAgwqAgwqAg
wqAgwqAgwqAgQklUKDcpPGJyPg0KKyNkZWZpbmUgSTJDX0lOVF9NQVNLwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBHRU5NQVNLKDYsIDApPGJyPg0KKzxicj4NCisjZGVmaW5lIEkyQ19UUkFO
U19ET05FwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBCSVQoMCk8YnI+DQorI2RlZmluZSBJMkNf
RVJST1JfREVWSUNFwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBCSVQoMSk8YnI+DQorI2RlZmluZSBJ
MkNfRVJST1JfREFUQcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQklUKDIpPGJyPg0KKyNkZWZp
bmUgSTJDX0VSUk9SX01BU0vCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEdFTk1BU0soMiwgMSk8
YnI+DQorPGJyPg0KKyNkZWZpbmUgSTJDX1NSX0JVU1nCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBCSVQoNik8YnI+DQorPGJyPg0KKyNkZWZpbmUgSTJDX1NSX0VERVZJQ0XCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoEJJVCgxKTxicj4NCisjZGVmaW5lIEkyQ19TUl9FREFUQcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgQklUKDIpPGJyPg0KKzxicj4NCisjZGVmaW5lIEkyQ19GSUZP
X01BWMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMTY8YnI+DQorPGJyPg0KKyNkZWZpbmUg
STJDX1RJTUVPVVTCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBtc2Vjc190b19qaWZmaWVz
KDEwMDApPGJyPg0KKzxicj4NCitzdHJ1Y3QgengyOTY3X2kyY19pbmZvIHs8YnI+DQorwqAgwqAg
wqAgwqBzcGlubG9ja190wqAgwqAgwqAgwqAgwqAgwqAgwqAgbG9jazs8YnI+DQorwqAgwqAgwqAg
wqBzdHJ1Y3QgZGV2aWNlwqAgwqAgwqAgwqAgwqAgwqAqZGV2Ozxicj4NCivCoCDCoCDCoCDCoHN0
cnVjdCBpMmNfYWRhcHRlcsKgIMKgIMKgIGFkYXA7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IGNs
a8KgIMKgIMKgIMKgIMKgIMKgIMKgICpjbGs7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IGNvbXBs
ZXRpb27CoCDCoCDCoCDCoGNvbXBsZXRlOzxicj4NCivCoCDCoCDCoCDCoHUzMsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xrX2ZyZXE7PGJyPg0KK8KgIMKgIMKgIMKgdm9pZCBfX2lv
bWVtwqAgwqAgwqAgwqAgwqAgwqAgKnJlZ19iYXNlOzxicj4NCivCoCDCoCDCoCDCoHNpemVfdMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlc2lkdWU7PGJyPg0KK8KgIMKgIMKgIMKgaW50wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpcnE7PGJyPg0KK8KgIMKgIMKgIMKgaW50wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtc2dfcmQ7PGJyPg0KK8KgIMKgIMKgIMKgdTjC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqYnVmOzxicj4NCivCoCDCoCDCoCDCoHU4
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYWNjZXNzX2NudDs8YnI+DQorwqAgwqAg
wqAgwqBib29swqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaXNfc3VzcGVuZGVkOzxicj4N
Cit9Ozxicj4NCis8YnI+DQorc3RhdGljIHZvaWQgengyOTY3X2kyY193cml0ZWwoc3RydWN0IHp4
Mjk2N19pMmNfaW5mbyAqenhfaTJjLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHUzMiB2YWwsIHVuc2lnbmVkIGxvbmcgcmVnKTxicj4NCit7PGJyPg0K
K8KgIMKgIMKgIMKgd3JpdGVsX3JlbGF4ZWQodmFsLCB6eF9pMmMtJmd0O3JlZ19iYXNlICsgcmVn
KTs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIHUzMiB6eDI5NjdfaTJjX3JlYWRsKHN0cnVj
dCB6eDI5NjdfaTJjX2luZm8gKnp4X2kyYywgdW5zaWduZWQgbG9uZyByZWcpPGJyPg0KK3s8YnI+
DQorwqAgwqAgwqAgwqByZXR1cm4gcmVhZGxfcmVsYXhlZCh6eF9pMmMtJmd0O3JlZ19iYXNlICsg
cmVnKTs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIHZvaWQgengyOTY3X2kyY193cml0ZXNi
KHN0cnVjdCB6eDI5NjdfaTJjX2luZm8gKnp4X2kyYyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdm9pZCAqZGF0YSwgdW5zaWduZWQgbG9uZyByZWcs
IGludCBsZW4pPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqB3cml0ZXNiKHp4X2kyYy0mZ3Q7cmVn
X2Jhc2UgKyByZWcsIGRhdGEsIGxlbik7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyB2b2lk
IHp4Mjk2N19pMmNfcmVhZHNiKHN0cnVjdCB6eDI5NjdfaTJjX2luZm8gKnp4X2kyYyw8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2b2lkICpkYXRhLCB1
bnNpZ25lZCBsb25nIHJlZywgaW50IGxlbik8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHJlYWRz
Yih6eF9pMmMtJmd0O3JlZ19iYXNlICsgcmVnLCBkYXRhLCBsZW4pOzxicj4NCit9PGJyPg0KKzxi
cj4NCitzdGF0aWMgdm9pZCB6eDI5NjdfaTJjX3N0YXJ0X2N0cmwoc3RydWN0IHp4Mjk2N19pMmNf
aW5mbyAqenhfaTJjKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgdTMyIHN0YXR1czs8YnI+DQor
wqAgwqAgwqAgwqB1MzIgY3RsOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBzdGF0dXMgPSB6eDI5
NjdfaTJjX3JlYWRsKHp4X2kyYywgUkVHX1NUQVQpOzxicj4NCivCoCDCoCDCoCDCoHN0YXR1cyB8
PSBJMkNfSVJRX0FDS19DTEVBUjs8YnI+DQorwqAgwqAgwqAgwqB6eDI5NjdfaTJjX3dyaXRlbCh6
eF9pMmMsIHN0YXR1cywgUkVHX1NUQVQpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBjdGwgPSB6
eDI5NjdfaTJjX3JlYWRsKHp4X2kyYywgUkVHX0NNRCk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKHp4
X2kyYy0mZ3Q7bXNnX3JkKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGN0bCB8PSBJMkNf
UldfUkVBRDs8YnI+DQorwqAgwqAgwqAgwqBlbHNlPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgY3RsICZhbXA7PSB+STJDX1JXX1JFQUQ7PGJyPg0KK8KgIMKgIMKgIMKgY3RsICZhbXA7PSB+
STJDX0NNQl9SV19FTjs8YnI+DQorwqAgwqAgwqAgwqBjdGwgfD0gSTJDX1NUQVJUOzxicj4NCivC
oCDCoCDCoCDCoHp4Mjk2N19pMmNfd3JpdGVsKHp4X2kyYywgY3RsLCBSRUdfQ01EKTs8YnI+DQor
fTxicj4NCis8YnI+DQorc3RhdGljIHZvaWQgengyOTY3X2kyY19mbHVzaF9maWZvcyhzdHJ1Y3Qg
engyOTY3X2kyY19pbmZvICp6eF9pMmMpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqB1MzIgdmFs
Ozxicj4NCivCoCDCoCDCoCDCoHUzMiBvZmZzZXQ7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGlm
ICh6eF9pMmMtJmd0O21zZ19yZCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG9mZnNl
dCA9IFJFR19SRENPTkY7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdmFsID0gSTJDX1JG
SUZPX1JFU0VUOzxicj4NCivCoCDCoCDCoCDCoH0gZWxzZSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgb2Zmc2V0ID0gUkVHX1dSQ09ORjs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB2YWwgPSBJMkNfV0ZJRk9fUkVTRVQ7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqB2YWwgfD0gengyOTY3X2kyY19yZWFkbCh6eF9pMmMsIG9mZnNldCk7PGJyPg0K
K8KgIMKgIMKgIMKgengyOTY3X2kyY193cml0ZWwoenhfaTJjLCB2YWwsIG9mZnNldCk7PGJyPg0K
K308YnI+DQorPGJyPg0KK3N0YXRpYyBpbnQgengyOTY3X2kyY19lbXB0eV9yeF9maWZvKDx3YnI+
c3RydWN0IHp4Mjk2N19pMmNfaW5mbyAqenhfaTJjLCB1MzIgc2l6ZSk8YnI+DQorezxicj4NCivC
oCDCoCDCoCDCoHU4IHZhbFtJMkNfRklGT19NQVhdID0gezB9Ozxicj4NCivCoCDCoCDCoCDCoGlu
dCBpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAoc2l6ZSAmZ3Q7IEkyQ19GSUZPX01BWCkg
ezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRldl9lcnIoenhfaTJjLSZndDtkZXYsICZx
dW90O2ZpZm8gc2l6ZSAlZCBvdmVyIHRoZSBtYXggdmFsdWUgJWRcbiZxdW90Oyw8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzaXplLCBJMkNfRklGT19NQVgpOzxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiAtRUlOVkFMOzxicj4NCivCoCDCoCDCoCDC
oH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgengyOTY3X2kyY19yZWFkc2IoenhfaTJjLCB2YWws
IFJFR19EQVRBLCBzaXplKTs8YnI+DQorwqAgwqAgwqAgwqBmb3IgKGkgPSAwOyBpICZsdDsgc2l6
ZTsgaSsrKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKih6eF9pMmMtJmd0O2J1Zisr
KSA9IHZhbFtpXTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB6eF9pMmMtJmd0O3Jlc2lk
dWUtLTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoenhfaTJjLSZndDtyZXNpZHVl
ICZsdDs9IDApPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7
PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBiYXJyaWVyKCk7PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoHJldHVybiAwOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0
aWMgaW50IHp4Mjk2N19pMmNfZmlsbF90eF9maWZvKHN0cnVjdCB6eDI5NjdfaTJjX2luZm8gKnp4
X2kyYyk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHU4ICpidWYgPSB6eF9pMmMtJmd0O2J1Zjs8
YnI+DQorwqAgwqAgwqAgwqBzaXplX3QgcmVzaWR1ZSA9IHp4X2kyYy0mZ3Q7cmVzaWR1ZTs8YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgaWYgKHJlc2lkdWUgPT0gMCkgezxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGRldl9lcnIoenhfaTJjLSZndDtkZXYsICZxdW90O3Jlc2lkdWUgaXMgJWRc
biZxdW90OywgKGludClyZXNpZHVlKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1
cm4gLUVJTlZBTDs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGlm
IChyZXNpZHVlICZsdDs9IEkyQ19GSUZPX01BWCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHp4Mjk2N19pMmNfd3JpdGVzYih6eF9pMmMsIGJ1ZiwgUkVHX0RBVEEsIHJlc2lkdWUpOzxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBBZ2FpbiB1cGRhdGUgYmVmb3Jl
IHdyaXRpbmcgdG8gRklGTyB0byBtYWtlIHN1cmUgaXNyIHNlZXMuICovPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgenhfaTJjLSZndDtyZXNpZHVlID0gMDs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB6eF9pMmMtJmd0O2J1ZiA9IE5VTEw7PGJyPg0KK8KgIMKgIMKgIMKgfSBlbHNl
IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB6eDI5NjdfaTJjX3dyaXRlc2IoenhfaTJj
LCBidWYsIFJFR19EQVRBLCBJMkNfRklGT19NQVgpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHp4X2kyYy0mZ3Q7cmVzaWR1ZSAtPSBJMkNfRklGT19NQVg7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgenhfaTJjLSZndDtidWYgKz0gSTJDX0ZJRk9fTUFYOzxicj4NCivCoCDCoCDC
oCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgYmFycmllcigpOzxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqByZXR1cm4gMDs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIGludCB6eDI5Njdf
aTJjX3Jlc2V0X2hhcmR3YXJlKDx3YnI+c3RydWN0IHp4Mjk2N19pMmNfaW5mbyAqenhfaTJjKTxi
cj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgdTMyIHZhbDs8YnI+DQorwqAgwqAgwqAgwqB1MzIgY2xr
X2Rpdjs8YnI+DQorwqAgwqAgwqAgwqB1MzIgc3RhdHVzOzxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqB2YWwgPSBJMkNfTUFTVEVSIHwgSTJDX0lSUV9NU0tfRU5BQkxFOzxicj4NCivCoCDCoCDCoCDC
oHp4Mjk2N19pMmNfd3JpdGVsKHp4X2kyYywgdmFsLCBSRUdfQ01EKTs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgY2xrX2RpdiA9IGNsa19nZXRfcmF0ZSh6eF9pMmMtJmd0O2NsaykgLyB6eF9pMmMt
Jmd0O2Nsa19mcmVxIC0gMTs8YnI+DQorwqAgwqAgwqAgwqB6eDI5NjdfaTJjX3dyaXRlbCh6eF9p
MmMsIGNsa19kaXYsIFJFR19DTEtfRElWX0ZTKTs8YnI+DQorwqAgwqAgwqAgwqB6eDI5NjdfaTJj
X3dyaXRlbCh6eF9pMmMsIGNsa19kaXYsIFJFR19DTEtfRElWX0hTKTs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgengyOTY3X2kyY193cml0ZWwoenhfaTJjLCBJMkNfRklGT19NQVggLSAxLCBSRUdf
V1JDT05GKTs8YnI+DQorwqAgwqAgwqAgwqB6eDI5NjdfaTJjX3dyaXRlbCh6eF9pMmMsIEkyQ19G
SUZPX01BWCAtIDEsIFJFR19SRENPTkYpOzxicj4NCivCoCDCoCDCoCDCoHp4Mjk2N19pMmNfd3Jp
dGVsKHp4X2kyYywgMSwgUkVHX1JEQ09ORik7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHp4Mjk2
N19pMmNfZmx1c2hfZmlmb3MoenhfaTJjKTx3YnI+Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBz
dGF0dXMgPSB6eDI5NjdfaTJjX3JlYWRsKHp4X2kyYywgUkVHX1NUQVQpOzxicj4NCivCoCDCoCDC
oCDCoGlmIChzdGF0dXMgJmFtcDsgSTJDX1NSX0JVU1kpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcmV0dXJuIC1FQlVTWTs8YnI+DQorwqAgwqAgwqAgwqBpZiAoc3RhdHVzICZhbXA7IChJ
MkNfU1JfRURFVklDRSB8IEkyQ19TUl9FREFUQSkpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcmV0dXJuIC1FSU87PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGVuYWJsZV9pcnEoenhfaTJj
LSZndDtpcnEpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gMDs8YnI+DQorfTxicj4N
Cis8YnI+DQorc3RhdGljIHZvaWQgengyOTY3X2kyY19pc3JfY2xyKHN0cnVjdCB6eDI5NjdfaTJj
X2luZm8gKnp4X2kyYyk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHUzMiBzdGF0dXM7PGJyPg0K
Kzxicj4NCivCoCDCoCDCoCDCoHN0YXR1cyA9IHp4Mjk2N19pMmNfcmVhZGwoenhfaTJjLCBSRUdf
U1RBVCk7PGJyPg0KK8KgIMKgIMKgIMKgc3RhdHVzIHw9IEkyQ19JUlFfQUNLX0NMRUFSOzxicj4N
CivCoCDCoCDCoCDCoHp4Mjk2N19pMmNfd3JpdGVsKHp4X2kyYywgc3RhdHVzLCBSRUdfU1RBVCk7
PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyBpcnFyZXR1cm5fdCB6eDI5NjdfaTJjX2lzcihp
bnQgaXJxLCB2b2lkICpkZXZfaWQpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqB1MzIgc3RhdHVz
Ozxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCB6eDI5NjdfaTJjX2luZm8gKnp4X2kyYyA9IChzdHJ1
Y3QgengyOTY3X2kyY19pbmZvICopZGV2X2lkOzxicj4NCivCoCDCoCDCoCDCoHVuc2lnbmVkIGxv
bmcgZmxhZ3M7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHNwaW5fbG9ja19pcnFzYXZlKCZhbXA7
enhfaTJjLSZndDs8d2JyPmxvY2ssIGZsYWdzKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgc3Rh
dHVzID0gengyOTY3X2kyY19yZWFkbCh6eF9pMmMsIFJFR19TVEFUKSAmYW1wOyBJMkNfSU5UX01B
U0s7PGJyPg0KK8KgIMKgIMKgIMKgengyOTY3X2kyY19pc3JfY2xyKHp4X2kyYyk7PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoGlmIChzdGF0dXMgJmFtcDsgSTJDX0VSUk9SX01BU0spIHs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhbXA7enhfPHdi
cj5pMmMtJmd0O2xvY2ssIGZsYWdzKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1
cm4gSVJRX0hBTkRMRUQ7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqBpZiAoc3RhdHVzICZhbXA7IEkyQ19UUkFOU19ET05FKTxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGNvbXBsZXRlKCZhbXA7enhfaTJjLSZndDtjb21wbGV0ZSk7PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFtcDt6eF88d2JyPmkyYy0mZ3Q7bG9j
aywgZmxhZ3MpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gSVJRX0hBTkRMRUQ7PGJy
Pg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyB2b2lkIHp4Mjk2N19lbmFibGVfdGVuYml0KHN0cnVj
dCB6eDI5NjdfaTJjX2luZm8gKnp4X2kyYywgX191MTYgYWRkcik8YnI+DQorezxicj4NCivCoCDC
oCDCoCDCoHUxNiB2YWwgPSAoYWRkciAmZ3Q7Jmd0OyA3KSAmYW1wOyAweDc7PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoGlmICh2YWwgJmd0OyAwKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgengyOTY3X2kyY193cml0ZWwoenhfaTJjLCB2YWwsIFJFR19ERVZBRERSX0gpOzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZhbCA9ICh6eDI5NjdfaTJjX3JlYWRsKHp4X2kyYywgUkVH
X0NNRCkpIHwgSTJDX0FERFJfTU9ERV9URU47PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
engyOTY3X2kyY193cml0ZWwoenhfaTJjLCB2YWwsIFJFR19DTUQpOzxicj4NCivCoCDCoCDCoCDC
oH08YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIGludDxicj4NCit6eDI5NjdfaTJjX3hmZXJf
cmVhZF9ieXRlcyg8d2JyPnN0cnVjdCB6eDI5NjdfaTJjX2luZm8gKnp4X2kyYywgdTMyIGJ5dGVz
KTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgdW5zaWduZWQgbG9uZyB0aW1lX2xlZnQ7PGJyPg0K
Kzxicj4NCivCoCDCoCDCoCDCoHJlaW5pdF9jb21wbGV0aW9uKCZhbXA7enhfaTJjLSZndDs8d2Jy
PmNvbXBsZXRlKTs8YnI+DQorwqAgwqAgwqAgwqB6eDI5NjdfaTJjX3dyaXRlbCh6eF9pMmMsIGJ5
dGVzIC0gMSwgUkVHX1JEQ09ORik7PGJyPg0KK8KgIMKgIMKgIMKgengyOTY3X2kyY19zdGFydF9j
dHJsKHp4X2kyYyk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHRpbWVfbGVmdCA9IHdhaXRfZm9y
X2NvbXBsZXRpb25fdGltZW91dCgmYW1wOzx3YnI+enhfaTJjLSZndDtjb21wbGV0ZSw8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBJMkNfVElNRU9V
VCk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKHRpbWVfbGVmdCA9PSAwKSB7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgZGV2X2Vycih6eF9pMmMtJmd0O2RldiwgJnF1b3Q7cmVhZCBpMmMgdHJh
bnNmZXIgdGltZWQgb3V0XG4mcXVvdDspOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRp
c2FibGVfaXJxKHp4X2kyYy0mZ3Q7aXJxKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB6
eDI5NjdfaTJjX3Jlc2V0X2hhcmR3YXJlKHp4Xzx3YnI+aTJjKTs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqByZXR1cm4gLUVJTzs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoHJldHVybiB6eDI5NjdfaTJjX2VtcHR5X3J4X2ZpZm8oenhfPHdicj5pMmMsIGJ5
dGVzKTs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIGludCB6eDI5NjdfaTJjX3hmZXJfcmVh
ZChzdHJ1Y3QgengyOTY3X2kyY19pbmZvICp6eF9pMmMpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAg
wqBpbnQgcmV0Ozxicj4NCivCoCDCoCDCoCDCoGludCBpOzxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqBmb3IgKGkgPSAwOyBpICZsdDsgenhfaTJjLSZndDthY2Nlc3NfY250OyBpKyspIHs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXQgPSB6eDI5NjdfaTJjX3hmZXJfcmVhZF9ieXRlcyh6
eF88d2JyPmkyYywgSTJDX0ZJRk9fTUFYKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBp
ZiAocmV0KTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiBy
ZXQ7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAoenhfaTJj
LSZndDtyZXNpZHVlICZndDsgMCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldCA9
IHp4Mjk2N19pMmNfeGZlcl9yZWFkX2J5dGVzKHp4Xzx3YnI+aTJjLCBJMkNfRklGT19NQVgpOzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChyZXQpPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIHJldDs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0K
Kzxicj4NCivCoCDCoCDCoCDCoHp4X2kyYy0mZ3Q7cmVzaWR1ZSA9IDA7PGJyPg0KK8KgIMKgIMKg
IMKgenhfaTJjLSZndDthY2Nlc3NfY250ID0gMDs8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gMDs8
YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIGludDxicj4NCit6eDI5NjdfaTJjX3hmZXJfd3Jp
dGVfYnl0ZXMoPHdicj5zdHJ1Y3QgengyOTY3X2kyY19pbmZvICp6eF9pMmMsIHUzMiBieXRlcyk8
YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHVuc2lnbmVkIGxvbmcgdGltZV9sZWZ0Ozxicj4NCivC
oCDCoCDCoCDCoGludCByZXQ7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJlaW5pdF9jb21wbGV0
aW9uKCZhbXA7enhfaTJjLSZndDs8d2JyPmNvbXBsZXRlKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgcmV0ID0gengyOTY3X2kyY19maWxsX3R4X2ZpZm8oenhfPHdicj5pMmMpOzxicj4NCivCoCDC
oCDCoCDCoGlmIChyZXQpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIHJldDs8
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgengyOTY3X2kyY19zdGFydF9jdHJsKHp4X2kyYyk7PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoHRpbWVfbGVmdCA9IHdhaXRfZm9yX2NvbXBsZXRpb25fdGlt
ZW91dCgmYW1wOzx3YnI+enhfaTJjLSZndDtjb21wbGV0ZSw8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBJMkNfVElNRU9VVCk7PGJyPg0KK8KgIMKg
IMKgIMKgaWYgKHRpbWVfbGVmdCA9PSAwKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ZGV2X2Vycih6eF9pMmMtJmd0O2RldiwgJnF1b3Q7d3JpdGUgaTJjIHRyYW5zZmVyIHRpbWVkIG91
dFxuJnF1b3Q7KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkaXNhYmxlX2lycSh6eF9p
MmMtJmd0O2lycSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgengyOTY3X2kyY19yZXNl
dF9oYXJkd2FyZSh6eF88d2JyPmkyYyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0
dXJuIC1FSU87PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXR1
cm4gMDs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIGludCB6eDI5NjdfaTJjX3hmZXJfd3Jp
dGUoc3RydWN0IHp4Mjk2N19pMmNfaW5mbyAqenhfaTJjKTxicj4NCit7PGJyPg0KK8KgIMKgIMKg
IMKgaW50IHJldDs8YnI+DQorwqAgwqAgwqAgwqBpbnQgaTs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgZm9yIChpID0gMDsgaSAmbHQ7IHp4X2kyYy0mZ3Q7YWNjZXNzX2NudDsgaSsrKSB7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0ID0gengyOTY3X2kyY194ZmVyX3dyaXRlX2J5dGVz
KDx3YnI+enhfaTJjLCBJMkNfRklGT19NQVgpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGlmIChyZXQpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJu
IHJldDs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGlmICh6eF9p
MmMtJmd0O3Jlc2lkdWUgJmd0OyAwKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0
ID0gengyOTY3X2kyY194ZmVyX3dyaXRlX2J5dGVzKDx3YnI+enhfaTJjLCBJMkNfRklGT19NQVgp
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChyZXQpPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIHJldDs8YnI+DQorwqAgwqAgwqAgwqB9PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoHp4X2kyYy0mZ3Q7cmVzaWR1ZSA9IDA7PGJyPg0KK8KgIMKg
IMKgIMKgenhfaTJjLSZndDthY2Nlc3NfY250ID0gMDs8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4g
MDs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIGludCB6eDI5NjdfaTJjX3hmZXJfbXNnKHN0
cnVjdCB6eDI5NjdfaTJjX2luZm8gKnp4X2kyYyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc3RydWN0IGkyY19tc2cgKm1zZyk8YnI+DQorezxicj4N
CivCoCDCoCDCoCDCoGlmIChtc2ctJmd0O2xlbiA9PSAwKTxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHJldHVybiAtRUlOVkFMOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqB6eDI5NjdfaTJj
X2ZsdXNoX2ZpZm9zKHp4X2kyYyk8d2JyPjs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgenhfaTJj
LSZndDtidWYgPSBtc2ctJmd0O2J1Zjs8YnI+DQorwqAgwqAgwqAgwqB6eF9pMmMtJmd0O3Jlc2lk
dWUgPSBtc2ctJmd0O2xlbjs8YnI+DQorwqAgwqAgwqAgwqB6eF9pMmMtJmd0O2FjY2Vzc19jbnQg
PSBtc2ctJmd0O2xlbiAvIEkyQ19GSUZPX01BWDs8YnI+DQorwqAgwqAgwqAgwqB6eF9pMmMtJmd0
O21zZ19yZCA9IChtc2ctJmd0O2ZsYWdzICZhbXA7IEkyQ19NX1JEKTs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgaWYgKHp4X2kyYy0mZ3Q7bXNnX3JkKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHJldHVybiB6eDI5NjdfaTJjX3hmZXJfcmVhZCh6eF9pMmMpOzxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqByZXR1cm4gengyOTY3X2kyY194ZmVyX3dyaXRlKHp4X2kyYyk7PGJyPg0KK308YnI+
DQorPGJyPg0KK3N0YXRpYyBpbnQgengyOTY3X2kyY194ZmVyKHN0cnVjdCBpMmNfYWRhcHRlciAq
YWRhcCw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc3RydWN0
IGkyY19tc2cgKm1zZ3MsIGludCBudW0pPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3Qg
engyOTY3X2kyY19pbmZvICp6eF9pMmMgPSBpMmNfZ2V0X2FkYXBkYXRhKGFkYXApOzxicj4NCivC
oCDCoCDCoCDCoGludCByZXQ7PGJyPg0KK8KgIMKgIMKgIMKgaW50IGk7PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoGlmICh6eF9pMmMtJmd0O2lzX3N1c3BlbmRlZCk8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqByZXR1cm4gLUVCVVNZOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqB6eDI5Njdf
aTJjX3dyaXRlbCh6eF9pMmMsIChtc2dzLSZndDthZGRyICZhbXA7IDB4N2YpLCBSRUdfREVWQURE
Ul9MKTs8YnI+DQorwqAgwqAgwqAgwqB6eDI5NjdfaTJjX3dyaXRlbCh6eF9pMmMsIChtc2dzLSZn
dDthZGRyICZndDsmZ3Q7IDcpICZhbXA7IDB4NywgUkVHX0RFVkFERFJfSCk7PGJyPg0KK8KgIMKg
IMKgIMKgaWYgKHp4Mjk2N19pMmNfcmVhZGwoenhfaTJjLCBSRUdfREVWQUREUl9IKSAmZ3Q7IDAp
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgengyOTY3X2VuYWJsZV90ZW5iaXQoenhfaTJj
LCBtc2dzLSZndDthZGRyKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgZm9yIChpID0gMDsgaSAm
bHQ7IG51bTsgaSsrKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0ID0gengyOTY3
X2kyY194ZmVyX21zZyh6eF9pMmMsICZhbXA7bXNnc1tpXSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgaWYgKHJldCk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZXR1cm4gcmV0Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChudW0gJmd0OyAx
KTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVzbGVlcF9yYW5nZSgx
MDAwLCAyMDAwKTs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJl
dHVybiBudW07PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyB2b2lkPGJyPg0KK3p4Mjk2N19z
bWJ1c194ZmVyX3ByZXBhcmUoPHdicj5zdHJ1Y3QgengyOTY3X2kyY19pbmZvICp6eF9pMmMsIHUx
NiBhZGRyLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNoYXIg
cmVhZF93cml0ZSwgdTggY29tbWFuZCwgaW50IHNpemUsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgdW5pb24gaTJjX3NtYnVzX2RhdGEgKmRhdGEpPGJyPg0KK3s8
YnI+DQorwqAgwqAgwqAgwqB1MzIgdmFsOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqB2YWwgPSB6
eDI5NjdfaTJjX3JlYWRsKHp4X2kyYywgUkVHX1JEQ09ORik7PGJyPg0KK8KgIMKgIMKgIMKgdmFs
IHw9IEkyQ19SRklGT19SRVNFVDs8YnI+DQorwqAgwqAgwqAgwqB6eDI5NjdfaTJjX3dyaXRlbCh6
eF9pMmMsIHZhbCwgUkVHX1JEQ09ORik7PGJyPg0KK8KgIMKgIMKgIMKgengyOTY3X2kyY193cml0
ZWwoenhfaTJjLCAoYWRkciAmYW1wOyAweDdmKSwgUkVHX0RFVkFERFJfTCk7PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoHp4Mjk2N19lbmFibGVfdGVuYml0KHp4X2kyYywgYWRkcik7PGJyPg0KK8Kg
IMKgIMKgIMKgdmFsID0gengyOTY3X2kyY19yZWFkbCh6eF9pMmMsIFJFR19DTUQpOzxicj4NCivC
oCDCoCDCoCDCoHZhbCAmYW1wOz0gfkkyQ19SV19SRUFEOzxicj4NCivCoCDCoCDCoCDCoHp4Mjk2
N19pMmNfd3JpdGVsKHp4X2kyYywgdmFsLCBSRUdfQ01EKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgc3dpdGNoIChzaXplKSB7PGJyPg0KK8KgIMKgIMKgIMKgY2FzZSBJMkNfU01CVVNfQllURTo8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB6eDI5NjdfaTJjX3dyaXRlbCh6eF9pMmMsIGNv
bW1hbmQsIFJFR19EQVRBKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+
DQorwqAgwqAgwqAgwqBjYXNlIEkyQ19TTUJVU19CWVRFX0RBVEE6PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgengyOTY3X2kyY193cml0ZWwoenhfaTJjLCBjb21tYW5kLCBSRUdfREFUQSk7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHJlYWRfd3JpdGUgPT0gSTJDX1NNQlVT
X1dSSVRFKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHp4Mjk2N19p
MmNfd3JpdGVsKHp4X2kyYywgZGF0YS0mZ3Q7Ynl0ZSwgUkVHX0RBVEEpOzxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCivCoCDCoCDCoCDCoGNhc2UgSTJDX1NNQlVTX1dP
UkRfREFUQTo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB6eDI5NjdfaTJjX3dyaXRlbCh6
eF9pMmMsIGNvbW1hbmQsIFJFR19EQVRBKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBp
ZiAocmVhZF93cml0ZSA9PSBJMkNfU01CVVNfV1JJVEUpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB6eDI5NjdfaTJjX3dyaXRlbCh6eF9pMmMsIChkYXRhLSZndDt3
b3JkICZndDsmZ3Q7IDgpLCBSRUdfREFUQSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgengyOTY3X2kyY193cml0ZWwoenhfaTJjLCAoZGF0YS0mZ3Q7d29yZCAmYW1w
OyAweGZmKSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBSRUdfREFUQSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCivCoCDCoCDCoCDC
oH08YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIGludCB6eDI5Njdfc21idXNfeGZlcl9yZWFk
KHN0cnVjdCB6eDI5NjdfaTJjX2luZm8gKnp4X2kyYywgaW50IHNpemUsPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdW5pb24gaTJjX3NtYnVz
X2RhdGEgKmRhdGEpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqB1bnNpZ25lZCBsb25nIHRpbWVf
bGVmdDs8YnI+DQorwqAgwqAgwqAgwqB1OCBidWZbMl07PGJyPg0KK8KgIMKgIMKgIMKgdTMyIHZh
bDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmVpbml0X2NvbXBsZXRpb24oJmFtcDt6eF9pMmMt
Jmd0Ozx3YnI+Y29tcGxldGUpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqB2YWwgPSB6eDI5Njdf
aTJjX3JlYWRsKHp4X2kyYywgUkVHX0NNRCk7PGJyPg0KK8KgIMKgIMKgIMKgdmFsIHw9IEkyQ19D
TUJfUldfRU47PGJyPg0KK8KgIMKgIMKgIMKgengyOTY3X2kyY193cml0ZWwoenhfaTJjLCB2YWws
IFJFR19DTUQpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqB2YWwgPSB6eDI5NjdfaTJjX3JlYWRs
KHp4X2kyYywgUkVHX0NNRCk7PGJyPg0KK8KgIMKgIMKgIMKgdmFsIHw9IEkyQ19TVEFSVDs8YnI+
DQorwqAgwqAgwqAgwqB6eDI5NjdfaTJjX3dyaXRlbCh6eF9pMmMsIHZhbCwgUkVHX0NNRCk7PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoHRpbWVfbGVmdCA9IHdhaXRfZm9yX2NvbXBsZXRpb25fdGlt
ZW91dCgmYW1wOzx3YnI+enhfaTJjLSZndDtjb21wbGV0ZSw8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBJ
MkNfVElNRU9VVCk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKHRpbWVfbGVmdCA9PSAwKSB7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGV2X2Vycih6eF9pMmMtJmd0O2RldiwgJnF1b3Q7aTJj
IHJlYWQgdHJhbnNmZXIgdGltZWQgb3V0XG4mcXVvdDspOzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGRpc2FibGVfaXJxKHp4X2kyYy0mZ3Q7aXJxKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB6eDI5NjdfaTJjX3Jlc2V0X2hhcmR3YXJlKHp4Xzx3YnI+aTJjKTs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gLUVJTzs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0K
Kzxicj4NCivCoCDCoCDCoCDCoHVzbGVlcF9yYW5nZSgxMDAwLCAyMDAwKTs8YnI+DQorwqAgwqAg
wqAgwqBzd2l0Y2ggKHNpemUpIHs8YnI+DQorwqAgwqAgwqAgwqBjYXNlIEkyQ19TTUJVU19CWVRF
Ojxicj4NCivCoCDCoCDCoCDCoGNhc2UgSTJDX1NNQlVTX0JZVEVfREFUQTo8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB2YWwgPSB6eDI5NjdfaTJjX3JlYWRsKHp4X2kyYywgUkVHX0RBVEEp
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRhdGEtJmd0O2J5dGUgPSB2YWw7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KK8KgIMKgIMKgIMKgY2FzZSBJMkNf
U01CVVNfV09SRF9EQVRBOjxicj4NCivCoCDCoCDCoCDCoGNhc2UgSTJDX1NNQlVTX1BST0NfQ0FM
TDo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidWZbMF0gPSB6eDI5NjdfaTJjX3JlYWRs
KHp4X2kyYywgUkVHX0RBVEEpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJ1ZlsxXSA9
IHp4Mjk2N19pMmNfcmVhZGwoenhfaTJjLCBSRUdfREFUQSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZGF0YS0mZ3Q7d29yZCA9IChidWZbMF0gJmx0OyZsdDsgOCkgfCBidWZbMV07PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KK8KgIMKgIMKgIMKgZGVmYXVs
dDo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkZXZfd2Fybih6eF9pMmMtJmd0O2Rldiwg
JnF1b3Q7VW5zdXBwb3J0ZWQgdHJhbnNhY3Rpb24gJWRcbiZxdW90Oywgc2l6ZSk7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIC1FT1BOT1RTVVBQOzxicj4NCivCoCDCoCDCoCDC
oH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJuIDA7PGJyPg0KK308YnI+DQorPGJyPg0K
K3N0YXRpYyBpbnQgengyOTY3X3NtYnVzX3hmZXJfd3JpdGUoc3RydWN0IHp4Mjk2N19pMmNfaW5m
byAqenhfaTJjKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgdW5zaWduZWQgbG9uZyB0aW1lX2xl
ZnQ7PGJyPg0KK8KgIMKgIMKgIMKgdTMyIHZhbDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmVp
bml0X2NvbXBsZXRpb24oJmFtcDt6eF9pMmMtJmd0Ozx3YnI+Y29tcGxldGUpOzxicj4NCivCoCDC
oCDCoCDCoHZhbCA9IHp4Mjk2N19pMmNfcmVhZGwoenhfaTJjLCBSRUdfQ01EKTs8YnI+DQorwqAg
wqAgwqAgwqB2YWwgfD0gSTJDX1NUQVJUOzxicj4NCivCoCDCoCDCoCDCoHp4Mjk2N19pMmNfd3Jp
dGVsKHp4X2kyYywgdmFsLCBSRUdfQ01EKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdGltZV9s
ZWZ0ID0gd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZhbXA7PHdicj56eF9pMmMtJmd0O2Nv
bXBsZXRlLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEkyQ19USU1FT1VUKTs8YnI+DQorwqAgwqAgwqAg
wqBpZiAodGltZV9sZWZ0ID09IDApIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkZXZf
ZXJyKHp4X2kyYy0mZ3Q7ZGV2LCAmcXVvdDtpMmMgd3JpdGUgdHJhbnNmZXIgdGltZWQgb3V0XG4m
cXVvdDspOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRpc2FibGVfaXJxKHp4X2kyYy0m
Z3Q7aXJxKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB6eDI5NjdfaTJjX3Jlc2V0X2hh
cmR3YXJlKHp4Xzx3YnI+aTJjKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4g
LUVJTzs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldHVybiAw
Ozxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgaW50IHp4Mjk2N19zbWJ1c194ZmVyKHN0cnVj
dCBpMmNfYWRhcHRlciAqYWRhcCwgdTE2IGFkZHIsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHVuc2lnbmVkIHNob3J0IGZsYWdzLCBjaGFyIHJlYWRfd3Jp
dGUsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHU4IGNv
bW1hbmQsIGludCBzaXplLCB1bmlvbiBpMmNfc21idXNfZGF0YSAqZGF0YSk8YnI+DQorezxicj4N
CivCoCDCoCDCoCDCoHN0cnVjdCB6eDI5NjdfaTJjX2luZm8gKnp4X2kyYyA9IGkyY19nZXRfYWRh
cGRhdGEoYWRhcCk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGlmIChzaXplID09IEkyQ19TTUJV
U19RVUlDSyk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWFkX3dyaXRlID0gSTJDX1NN
QlVTX1dSSVRFOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBzd2l0Y2ggKHNpemUpIHs8YnI+DQor
wqAgwqAgwqAgwqBjYXNlIEkyQ19TTUJVU19RVUlDSzo8YnI+DQorwqAgwqAgwqAgwqBjYXNlIEky
Q19TTUJVU19CWVRFOjxicj4NCivCoCDCoCDCoCDCoGNhc2UgSTJDX1NNQlVTX0JZVEVfREFUQTo8
YnI+DQorwqAgwqAgwqAgwqBjYXNlIEkyQ19TTUJVU19XT1JEX0RBVEE6PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgengyOTY3X3NtYnVzX3hmZXJfcHJlcGFyZSh6eF88d2JyPmkyYywgYWRk
ciwgcmVhZF93cml0ZSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21tYW5kLCBzaXplLCBkYXRhKTs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQorwqAgwqAgwqAgwqBkZWZhdWx0Ojxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRldl93YXJuKCZhbXA7YWRhcC0mZ3Q7ZGV2LCAmcXVv
dDtVbnN1cHBvcnRlZCB0cmFuc2FjdGlvbiAlZFxuJnF1b3Q7LCBzaXplKTs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gLUVPUE5PVFNVUFA7PGJyPg0KK8KgIMKgIMKgIMKgfTxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAocmVhZF93cml0ZSA9PSBJMkNfU01CVVNfUkVBRCk8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gengyOTY3X3NtYnVzX3hmZXJfcmVh
ZCh6eF9pMmMsIHNpemUsIGRhdGEpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gengy
OTY3X3NtYnVzX3hmZXJfd3JpdGUoenhfPHdicj5pMmMpOzxicj4NCit9PGJyPg0KKzxicj4NCisj
ZGVmaW5lIFpYMjk2N19JMkNfRlVOQ1MgKEkyQ19GVU5DX1NNQlVTX1FVSUNLIHwgSTJDX0ZVTkNf
U01CVVNfQllURSB8IFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBJMkNfRlVOQ19TTUJV
U19CWVRFX0RBVEEgfCBJMkNfRlVOQ19TTUJVU19XT1JEX0RBVEEgfMKgIMKgXDxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoEkyQ19GVU5DX1NNQlVTX0JMT0NLX0RBVEEgfCBJMkNfRlVOQ19T
TUJVU19QUk9DX0NBTEwgfMKgIFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBJMkNfRlVO
Q19JMkMgfCBJMkNfRlVOQ19TTUJVU19JMkNfQkxPQ0spPGJyPg0KKzxicj4NCitzdGF0aWMgdTMy
IHp4Mjk2N19pMmNfZnVuYyhzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXApPGJyPg0KK3s8YnI+DQor
wqAgwqAgwqAgwqByZXR1cm4gWlgyOTY3X0kyQ19GVU5DUzs8YnI+DQorfTxicj4NCis8YnI+DQor
c3RhdGljIGludCBfX21heWJlX3VudXNlZCB6eDI5NjdfaTJjX3N1c3BlbmQoc3RydWN0IGRldmlj
ZSAqZGV2KTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IHp4Mjk2N19pMmNfaW5mbyAq
enhfaTJjID0gZGV2X2dldF9kcnZkYXRhKGRldik7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHp4
X2kyYy0mZ3Q7aXNfc3VzcGVuZGVkID0gdHJ1ZTs8YnI+DQorwqAgwqAgwqAgwqBjbGtfZGlzYWJs
ZV91bnByZXBhcmUoenhfaTJjLSZndDs8d2JyPmNsayk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oHJldHVybiAwOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgaW50IF9fbWF5YmVfdW51c2Vk
IHp4Mjk2N19pMmNfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldik8YnI+DQorezxicj4NCivCoCDC
oCDCoCDCoHN0cnVjdCB6eDI5NjdfaTJjX2luZm8gKnp4X2kyYyA9IGRldl9nZXRfZHJ2ZGF0YShk
ZXYpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqB6eF9pMmMtJmd0O2lzX3N1c3BlbmRlZCA9IGZh
bHNlOzxicj4NCivCoCDCoCDCoCDCoGNsa19wcmVwYXJlX2VuYWJsZSh6eF9pMmMtJmd0Ozx3YnI+
Y2xrKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJuIDA7PGJyPg0KK308YnI+DQorPGJy
Pg0KKyNpZmRlZiBDT05GSUdfUE08YnI+DQorc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3Bz
IHp4Mjk2N19pMmNfZGV2X3BtX29wcyA9IHs8YnI+DQorwqAgwqAgwqAgwqAuc3VzcGVuZMKgIMKg
IMKgIMKgID0gengyOTY3X2kyY19zdXNwZW5kLDxicj4NCivCoCDCoCDCoCDCoC5yZXN1bWXCoCDC
oCDCoCDCoCDCoD0gengyOTY3X2kyY19yZXN1bWUsPGJyPg0KK307PGJyPg0KKyNkZWZpbmUgWlgy
OTY3X0kyQ19ERVZfUE1fT1BTwqAgKCZhbXA7engyOTY3X2kyY19kZXZfcG1fb3BzKTxicj4NCisj
ZWxzZTxicj4NCisjZGVmaW5lwqAgwqAgwqAgwqAgWlgyOTY3X0kyQ19ERVZfUE1fT1BTwqAgwqBO
VUxMPGJyPg0KKyNlbmRpZjxicj4NCis8YnI+DQorc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfYWxn
b3JpdGhtIHp4Mjk2N19pMmNfYWxnbyA9IHs8YnI+DQorwqAgwqAgwqAgwqAubWFzdGVyX3hmZXIg
PSB6eDI5NjdfaTJjX3hmZXIsPGJyPg0KK8KgIMKgIMKgIMKgLnNtYnVzX3hmZXIgPSB6eDI5Njdf
c21idXNfeGZlciw8YnI+DQorwqAgwqAgwqAgwqAuZnVuY3Rpb25hbGl0eSA9IHp4Mjk2N19pMmNf
ZnVuYyw8YnI+DQorfTs8YnI+DQorPGJyPg0KK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNl
X2lkIHp4Mjk2N19pMmNfb2ZfbWF0Y2hbXSA9IHs8YnI+DQorwqAgwqAgwqAgwqB7IC5jb21wYXRp
YmxlID0gJnF1b3Q7enRlLHp4Mjk2NzE4LWkyYyZxdW90OywgfSw8YnI+DQorwqAgwqAgwqAgwqB7
fSw8YnI+DQorfTs8YnI+DQorTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgengyOTY3X2kyY19vZl9t
YXRjaCk7PGJyPg0KKzxicj4NCitzdGF0aWMgaW50IHp4Mjk2N19pMmNfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldik8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCB6eDI5
NjdfaTJjX2luZm8gKnp4X2kyYzs8YnI+DQorwqAgwqAgwqAgwqB2b2lkIF9faW9tZW0gKnJlZ19i
YXNlOzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCByZXNvdXJjZSAqcmVzOzxicj4NCivCoCDCoCDC
oCDCoHN0cnVjdCBjbGsgKmNsazs8YnI+DQorwqAgwqAgwqAgwqBpbnQgcmV0Ozxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqB6eF9pMmMgPSBkZXZtX2t6YWxsb2MoJmFtcDtwZGV2LSZndDtkZXYsIHNp
emVvZigqenhfaTJjKSwgR0ZQX0tFUk5FTCk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKCF6eF9pMmMp
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIC1FTk9NRU07PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoHJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNF
X01FTSwgMCk7PGJyPg0KK8KgIMKgIMKgIMKgcmVnX2Jhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3Vy
Y2UoJmFtcDtwZGV2LSZndDs8d2JyPmRldiwgcmVzKTs8YnI+DQorwqAgwqAgwqAgwqBpZiAoSVNf
RVJSKHJlZ19iYXNlKSk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gUFRSX0VS
UihyZWdfYmFzZSk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGNsayA9IGRldm1fY2xrX2dldCgm
YW1wO3BkZXYtJmd0O2RldiwgTlVMTCk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKElTX0VSUihjbGsp
KSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGV2X2VycigmYW1wO3BkZXYtJmd0O2Rl
diwgJnF1b3Q7bWlzc2luZyBjb250cm9sbGVyIGNsb2NrJnF1b3Q7KTs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZXR1cm4gUFRSX0VSUihjbGspOzxicj4NCivCoCDCoCDCoCDCoH08YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKGNsayk7PGJyPg0K
K8KgIMKgIMKgIMKgaWYgKHJldCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRldl9l
cnIoJmFtcDtwZGV2LSZndDtkZXYsICZxdW90O2ZhaWxlZCB0byBlbmFibGUgaTJjX2Nsa1xuJnF1
b3Q7KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gcmV0Ozxicj4NCivCoCDC
oCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0ID0gcGxhdGZvcm1fZ2V0X2lycShw
ZGV2LCAwKTs8YnI+DQorwqAgwqAgwqAgwqBpZiAocmV0ICZsdDsgMCk8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZXR1cm4gcmV0Ozxicj4NCivCoCDCoCDCoCDCoHp4X2kyYy0mZ3Q7aXJx
ID0gcmV0Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXQgPSBkZXZpY2VfcHJvcGVydHlfcmVh
ZF91MzIoJmFtcDs8d2JyPnBkZXYtJmd0O2RldiwgJnF1b3Q7Y2xvY2stZnJlcXVlbmN5JnF1b3Q7
LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAmYW1wO3p4X2kyYy0mZ3Q7Y2xrX2ZyZXEpOzxicj4NCivCoCDCoCDCoCDCoGlmIChy
ZXQpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkZXZfZXJyKCZhbXA7cGRldi0mZ3Q7
ZGV2LCAmcXVvdDttaXNzaW5nIGNsb2NrLWZyZXF1ZW5jeSZxdW90Oyk7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmV0dXJuIHJldDs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoHp4X2kyYy0mZ3Q7cmVnX2Jhc2UgPSByZWdfYmFzZTs8YnI+DQorwqAgwqAg
wqAgwqB6eF9pMmMtJmd0O2NsayA9IGNsazs8YnI+DQorwqAgwqAgwqAgwqB6eF9pMmMtJmd0O2Rl
diA9ICZhbXA7cGRldi0mZ3Q7ZGV2Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBzcGluX2xvY2tf
aW5pdCgmYW1wO3p4X2kyYy0mZ3Q7bG9jayk7PGJyPg0KK8KgIMKgIMKgIMKgaW5pdF9jb21wbGV0
aW9uKCZhbXA7enhfaTJjLSZndDs8d2JyPmNvbXBsZXRlKTs8YnI+DQorwqAgwqAgwqAgwqBwbGF0
Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCB6eF9pMmMpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBy
ZXQgPSB6eDI5NjdfaTJjX3Jlc2V0X2hhcmR3YXJlKHp4Xzx3YnI+aTJjKTs8YnI+DQorwqAgwqAg
wqAgwqBpZiAocmV0KSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGV2X2VycigmYW1w
O3BkZXYtJmd0O2RldiwgJnF1b3Q7ZmFpbGVkIHRvIGluaXRpYWxpemUgaTJjIGNvbnRyb2xsZXJc
biZxdW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byBlcnJfY2xrX3VucHJl
cGFyZTs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldCA9IGRl
dm1fcmVxdWVzdF9pcnEoJmFtcDtwZGV2LSZndDtkZXYsIHp4X2kyYy0mZ3Q7aXJxLDxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHp4Mjk2N19pMmNfaXNyLCAwLCBkZXZf
bmFtZSgmYW1wO3BkZXYtJmd0O2RldiksIHp4X2kyYyk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKHJl
dCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRldl9lcnIoJmFtcDtwZGV2LSZndDtk
ZXYsICZxdW90O2ZhaWxlZCB0byByZXF1ZXN0IGlycSAlaVxuJnF1b3Q7LCB6eF9pMmMtJmd0O2ly
cSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byBlcnJfY2xrX3VucHJlcGFyZTs8
YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGkyY19zZXRfYWRhcGRh
dGEoJmFtcDt6eF9pMmMtJmd0Ozx3YnI+YWRhcCwgenhfaTJjKTs8YnI+DQorwqAgwqAgwqAgwqB6
eF9pMmMtJmd0O2FkYXAub3duZXIgPSBUSElTX01PRFVMRTs8YnI+DQorwqAgwqAgwqAgwqB6eF9p
MmMtJmd0O2FkYXAuY2xhc3MgPSBJMkNfQ0xBU1NfREVQUkVDQVRFRDs8YnI+DQorwqAgwqAgwqAg
wqBzdHJsY3B5KHp4X2kyYy0mZ3Q7PGEgaHJlZj0iaHR0cDovL2FkYXAubmFtZSIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+YWRhcC5uYW1lPC9hPiwgJnF1b3Q7engyOTY3IGkyYyBh
ZGFwdGVyJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNpemVvZih6eF9pMmMt
Jmd0OzxhIGhyZWY9Imh0dHA6Ly9hZGFwLm5hbWUiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmFkYXAubmFtZTwvYT4pKTs8YnI+DQorwqAgwqAgwqAgwqB6eF9pMmMtJmd0O2FkYXAu
YWxnbyA9ICZhbXA7engyOTY3X2kyY19hbGdvOzxicj4NCivCoCDCoCDCoCDCoHp4X2kyYy0mZ3Q7
YWRhcC5kZXYucGFyZW50ID0gJmFtcDtwZGV2LSZndDtkZXY7PGJyPg0KK8KgIMKgIMKgIMKgenhf
aTJjLSZndDs8YSBocmVmPSJodHRwOi8vYWRhcC5uciIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+YWRhcC5ucjwvYT4gPSBwZGV2LSZndDtpZDs8YnI+DQorwqAgwqAgwqAgwqB6eF9p
MmMtJmd0O2FkYXAuZGV2Lm9mX25vZGUgPSBwZGV2LSZndDtkZXYub2Zfbm9kZTs8YnI+DQorPGJy
Pg0KK8KgIMKgIMKgIMKgcmV0ID0gaTJjX2FkZF9udW1iZXJlZF9hZGFwdGVyKCZhbXA7enhfPHdi
cj5pMmMtJmd0O2FkYXApOzxicj4NCivCoCDCoCDCoCDCoGlmIChyZXQpIHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBkZXZfZXJyKCZhbXA7cGRldi0mZ3Q7ZGV2LCAmcXVvdDtmYWlsZWQg
dG8gYWRkIHp4Mjk2NyBpMmMgYWRhcHRlclxuJnF1b3Q7KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBnb3RvIGVycl9jbGtfdW5wcmVwYXJlOzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQor
PGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJuIDA7PGJyPg0KKzxicj4NCitlcnJfY2xrX3VucHJlcGFy
ZTo8YnI+DQorwqAgwqAgwqAgwqBjbGtfZGlzYWJsZV91bnByZXBhcmUoenhfaTJjLSZndDs8d2Jy
PmNsayk7PGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJuIHJldDs8YnI+DQorfTxicj4NCis8YnI+DQor
c3RhdGljIGludCB6eDI5NjdfaTJjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IHp4Mjk2N19pMmNfaW5mbyAqenhfaTJj
ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGky
Y19kZWxfYWRhcHRlcigmYW1wO3p4X2kyYy0mZ3Q7YWRhcCk8d2JyPjs8YnI+DQorwqAgwqAgwqAg
wqBjbGtfZGlzYWJsZV91bnByZXBhcmUoenhfaTJjLSZndDs8d2JyPmNsayk7PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoHJldHVybiAwOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgc3RydWN0
IHBsYXRmb3JtX2RyaXZlciB6eDI5NjdfaTJjX2RyaXZlciA9IHs8YnI+DQorwqAgwqAgwqAgwqAu
cHJvYmXCoCA9IHp4Mjk2N19pMmNfcHJvYmUsPGJyPg0KK8KgIMKgIMKgIMKgLnJlbW92ZSA9IHp4
Mjk2N19pMmNfcmVtb3ZlLDxicj4NCivCoCDCoCDCoCDCoC5kcml2ZXIgPSB7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgLm5hbWXCoCA9ICZxdW90O3p4Mjk2N19pMmMmcXVvdDssPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm9mX21hdGNoX3RhYmxlID0gengyOTY3X2kyY19vZl9t
YXRjaCw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAucG3CoCDCoCDCoCDCoCDCoCDCoCDC
oD0gWlgyOTY3X0kyQ19ERVZfUE1fT1BTLDxicj4NCivCoCDCoCDCoCDCoH0sPGJyPg0KK307PGJy
Pg0KK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoPHdicj56eDI5NjdfaTJjX2RyaXZlcik7PGJyPg0K
Kzxicj4NCitNT0RVTEVfQVVUSE9SKCZxdW90O0Jhb3lvdSBYaWUgJmx0OzxhIGhyZWY9Im1haWx0
bzpiYW95b3UueGllQGxpbmFyby5vcmciPmJhb3lvdS54aWVAbGluYXJvLm9yZzwvYT4mZ3Q7JnF1
b3Q7KTs8YnI+DQorTU9EVUxFX0RFU0NSSVBUSU9OKCZxdW90O1pURSB6eDI5NjcgSTJDIEJ1cyBD
b250cm9sbGVyIGRyaXZlciZxdW90Oyk7PGJyPg0KK01PRFVMRV9MSUNFTlNFKCZxdW90O0dQTCB2
MiZxdW90Oyk7PGJyPg0KPHNwYW4gY2xhc3M9IkhPRW5aYiI+PGZvbnQgY29sb3I9IiM4ODg4ODgi
Pi0tPGJyPg0KMi43LjQ8YnI+DQo8YnI+DQo8L2ZvbnQ+PC9zcGFuPjwvYmxvY2txdW90ZT48L2Rp
dj48YnI+PC9kaXY+DQo=
--94eb2c0b0b9c2c9a090547d43914--
