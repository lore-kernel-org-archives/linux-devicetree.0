Return-Path: <SRS0=iQ2c=LH=chromium.org=swboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <20180820063953.6866-3-vkoul@kernel.org>
References: <20180820063953.6866-1-vkoul@kernel.org>
 <20180820063953.6866-3-vkoul@kernel.org>
Message-ID: <153509585617.28926.14526626631390463379@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v4 2/2] i2c: Add Qualcomm CCI I2C driver
Date: Fri, 24 Aug 2018 00:30:56 -0700
To: Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Quoting Vinod Koul (2018-08-19 23:39:53)
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 4f8df2ec87b1..033958bcdd4b 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -828,6 +828,16 @@ config I2C_PXA_SLAVE
>           is necessary for systems where the PXA may be a target on the
>           I2C bus.
>  =

> +config I2C_QCOM_CCI
> +       tristate "Qualcomm Camera Control Interface"
> +       depends on ARCH_QCOM

 Or COMPILE_TEST?

> +       help
> +         If you say yes to this option, support will be included for the
> +         built-in camera control interface on the Qualcomm SoCs.
> +
> +         This driver can also be built as a module.  If so, the module
> +         will be called i2c-qcom-cci.
> +
>  config I2C_QUP
>         tristate "Qualcomm QUP based I2C controller"
>         depends on ARCH_QCOM
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-cci.c
> new file mode 100644
> index 000000000000..6fd6cecc0ed5
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -0,0 +1,879 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2012-2016, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2017-18 Linaro Limited.
> +
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/i2c.h>
> +#include <linux/io.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#define CCI_HW_VERSION                         0x0
> +#define CCI_RESET_CMD                          0x004
> +#define CCI_RESET_CMD_MASK                     0x0f73f3f7
> +#define CCI_RESET_CMD_M0_MASK                  0x000003f1
> +#define CCI_RESET_CMD_M1_MASK                  0x0003f001
> +#define CCI_QUEUE_START                                0x008
> +#define CCI_HALT_REQ                           0x034
> +#define CCI_HALT_REQ_I2C_M0_Q0Q1               BIT(0)
> +#define CCI_HALT_REQ_I2C_M1_Q0Q1               BIT(1)
> +
> +#define CCI_I2C_Mm_SCL_CTL(m)                  (0x100 + 0x100 * (m))
> +#define CCI_I2C_Mm_SDA_CTL_0(m)                        (0x104 + 0x100 * =
(m))
> +#define CCI_I2C_Mm_SDA_CTL_1(m)                        (0x108 + 0x100 * =
(m))
> +#define CCI_I2C_Mm_SDA_CTL_2(m)                        (0x10c + 0x100 * =
(m))
> +#define CCI_I2C_Mm_MISC_CTL(m)                 (0x110 + 0x100 * (m))
> +
> +#define CCI_I2C_Mm_READ_DATA(m)                        (0x118 + 0x100 * =
(m))
> +#define CCI_I2C_Mm_READ_BUF_LEVEL(m)           (0x11c + 0x100 * (m))
> +#define CCI_I2C_Mm_Qn_EXEC_WORD_CNT(m, n)      (0x300 + 0x200 * (m) + 0x=
100 * (n))
> +#define CCI_I2C_Mm_Qn_CUR_WORD_CNT(m, n)       (0x304 + 0x200 * (m) + 0x=
100 * (n))
> +#define CCI_I2C_Mm_Qn_CUR_CMD(m, n)            (0x308 + 0x200 * (m) + 0x=
100 * (n))
> +#define CCI_I2C_Mm_Qn_REPORT_STATUS(m, n)      (0x30c + 0x200 * (m) + 0x=
100 * (n))
> +#define CCI_I2C_Mm_Qn_LOAD_DATA(m, n)          (0x310 + 0x200 * (m) + 0x=
100 * (n))
> +
> +#define CCI_IRQ_GLOBAL_CLEAR_CMD               0xc00
> +#define CCI_IRQ_MASK_0                         0xc04
> +#define CCI_IRQ_MASK_0_I2C_M0_RD_DONE          BIT(0)
> +#define CCI_IRQ_MASK_0_I2C_M0_Q0_REPORT                BIT(4)
> +#define CCI_IRQ_MASK_0_I2C_M0_Q1_REPORT                BIT(8)
> +#define CCI_IRQ_MASK_0_I2C_M1_RD_DONE          BIT(12)
> +#define CCI_IRQ_MASK_0_I2C_M1_Q0_REPORT                BIT(16)
> +#define CCI_IRQ_MASK_0_I2C_M1_Q1_REPORT                BIT(20)
> +#define CCI_IRQ_MASK_0_RST_DONE_ACK            BIT(24)
> +#define CCI_IRQ_MASK_0_I2C_M0_Q0Q1_HALT_ACK    BIT(25)
> +#define CCI_IRQ_MASK_0_I2C_M1_Q0Q1_HALT_ACK    BIT(26)
> +#define CCI_IRQ_MASK_0_I2C_M0_ERROR            0x18000ee6
> +#define CCI_IRQ_MASK_0_I2C_M1_ERROR            0x60ee6000
> +#define CCI_IRQ_CLEAR_0                                0xc08
> +#define CCI_IRQ_STATUS_0                       0xc0c
> +#define CCI_IRQ_STATUS_0_I2C_M0_RD_DONE                BIT(0)
> +#define CCI_IRQ_STATUS_0_I2C_M0_Q0_REPORT      BIT(4)
> +#define CCI_IRQ_STATUS_0_I2C_M0_Q1_REPORT      BIT(8)
> +#define CCI_IRQ_STATUS_0_I2C_M1_RD_DONE                BIT(12)
> +#define CCI_IRQ_STATUS_0_I2C_M1_Q0_REPORT      BIT(16)
> +#define CCI_IRQ_STATUS_0_I2C_M1_Q1_REPORT      BIT(20)
> +#define CCI_IRQ_STATUS_0_RST_DONE_ACK          BIT(24)
> +#define CCI_IRQ_STATUS_0_I2C_M0_Q0Q1_HALT_ACK  BIT(25)
> +#define CCI_IRQ_STATUS_0_I2C_M1_Q0Q1_HALT_ACK  BIT(26)
> +#define CCI_IRQ_STATUS_0_I2C_M0_ERROR          0x18000ee6
> +#define CCI_IRQ_STATUS_0_I2C_M1_ERROR          0x60ee6000
> +
> +#define CCI_TIMEOUT    (msecs_to_jiffies(100))
> +#define NUM_MASTERS    2
> +#define NUM_QUEUES     2
> +
> +/* Max number of resources + 1 for a NULL terminator */
> +#define CCI_RES_MAX    6
> +
> +enum cci_i2c_cmd {

Make these #defines so we can easily see what the value is instead of
having to count. Plus, the enum isn't helping anyone figure out that a
command is being used because the enum isn't used anywhere in the code.

> +       CCI_I2C_SET_PARAM =3D 1,
> +       CCI_I2C_WAIT,
> +       CCI_I2C_WAIT_SYNC,
> +       CCI_I2C_WAIT_GPIO_EVENT,
> +       CCI_I2C_TRIG_I2C_EVENT,
> +       CCI_I2C_LOCK,
> +       CCI_I2C_UNLOCK,
> +       CCI_I2C_REPORT,
> +       CCI_I2C_WRITE,
> +       CCI_I2C_READ,
> +       CCI_I2C_WRITE_DISABLE_P,
> +       CCI_I2C_READ_DISABLE_P,
> +};
> +
> +#define CCI_I2C_REPORT_IRQ_EN  BIT(8)
> +
> +enum {
> +       I2C_MODE_STANDARD,
> +       I2C_MODE_FAST,
> +       I2C_MODE_FAST_PLUS,
> +};
> +
> +enum cci_i2c_queue_t {
> +       QUEUE_0,
> +       QUEUE_1
> +};
> +
> +struct cci_res {
> +       char *clock[CCI_RES_MAX];
> +       u32 clock_rate[CCI_RES_MAX];
> +};
> +
> +struct hw_params {
> +       u16 thigh;
> +       u16 tlow;
> +       u16 tsu_sto;
> +       u16 tsu_sta;
> +       u16 thd_dat;
> +       u16 thd_sta;
> +       u16 tbuf;
> +       u8 scl_stretch_en;
> +       u16 trdhld;
> +       u16 tsp;

Care to spell these out fully? Or at least add kernel documentation so
we know what they actually mean?

> +};
> +
> +struct cci;
> +
> +struct cci_master {
> +       struct i2c_adapter adap;
> +       u16 master;
> +       u8 mode;
> +       int status;
> +       bool complete_pending;
> +       struct completion irq_complete;

Having a bool and a completion is very odd and probably racy. Can you
get rid of the bool and just complete things when they need completing
and wait for them when they need waiting?

> +       struct cci *cci;
> +};
> +
> +struct cci_data {
> +       unsigned int num_masters;
> +       struct i2c_adapter_quirks quirks;
> +       u16 queue_size[NUM_QUEUES];
> +       struct cci_res res;
> +       struct hw_params params[3];
> +};
> +
> +struct cci {
> +       struct device *dev;
> +       void __iomem *base;
> +       unsigned int irq;
> +       const struct cci_data *data;
> +       struct clk_bulk_data *clock;
> +       int nclocks;
> +       struct cci_master master[NUM_MASTERS];
> +};
> +
> +/**
> + * cci_clock_set_rate() - Set clock frequency rates
> + * @nclocks: Number of clocks
> + * @clock: Clock array
> + * @clock_freq: Clock frequency rate array
> + * @dev: Device
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int cci_clock_set_rate(int nclocks, struct clk_bulk_data *clock,
> +                             const u32 *clock_freq, struct device *dev)
> +{
> +       int i, ret;
> +       long rate;
> +
> +       for (i =3D 0; i < nclocks; i++) {
> +               if (clock_freq[i]) {
> +                       rate =3D clk_round_rate(clock[i].clk, clock_freq[=
i]);
> +                       if (rate < 0) {
> +                               dev_err(dev, "clk round rate failed: %ld\=
n",
> +                                       rate);
> +                               return rate;
> +                       }
> +
> +                       ret =3D clk_set_rate(clock[i].clk, clock_freq[i]);
> +                       if (ret < 0) {
> +                               dev_err(dev, "clk set rate failed: %d\n",=
 ret);
> +                               return ret;
> +                       }
> +               }
> +       }

Hopefully this whole function can go away.

> +
> +       return 0;
> +}
> +
> +static irqreturn_t cci_isr(int irq, void *dev)
> +{
> +       struct cci *cci =3D dev;
> +       u32 val, reset =3D 0;
> +
> +       val =3D readl(cci->base + CCI_IRQ_STATUS_0);
> +       writel(val, cci->base + CCI_IRQ_CLEAR_0);
> +       writel(0x1, cci->base + CCI_IRQ_GLOBAL_CLEAR_CMD);
> +
> +       if (val & CCI_IRQ_STATUS_0_RST_DONE_ACK) {
> +               if (cci->master[0].complete_pending) {
> +                       cci->master[0].complete_pending =3D false;
> +                       complete(&cci->master[0].irq_complete);
> +               }
> +
> +               if (cci->master[1].complete_pending) {
> +                       cci->master[1].complete_pending =3D false;
> +                       complete(&cci->master[1].irq_complete);
> +               }
> +       }
> +
> +       if (val & CCI_IRQ_STATUS_0_I2C_M0_RD_DONE ||
> +                       val & CCI_IRQ_STATUS_0_I2C_M0_Q0_REPORT ||
> +                       val & CCI_IRQ_STATUS_0_I2C_M0_Q1_REPORT) {
> +               cci->master[0].status =3D 0;
> +               complete(&cci->master[0].irq_complete);
> +       }
> +
> +       if (val & CCI_IRQ_STATUS_0_I2C_M1_RD_DONE ||
> +                       val & CCI_IRQ_STATUS_0_I2C_M1_Q0_REPORT ||
> +                       val & CCI_IRQ_STATUS_0_I2C_M1_Q1_REPORT) {
> +               cci->master[1].status =3D 0;
> +               complete(&cci->master[1].irq_complete);
> +       }
> +
> +       if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M0_Q0Q1_HALT_ACK)) {
> +               cci->master[0].complete_pending =3D true;
> +               reset =3D CCI_RESET_CMD_M0_MASK;
> +       }
> +
> +       if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M1_Q0Q1_HALT_ACK)) {
> +               cci->master[1].complete_pending =3D true;
> +               reset =3D CCI_RESET_CMD_M1_MASK;
> +       }
> +
> +       if (unlikely(reset))
> +               writel(reset, cci->base + CCI_RESET_CMD);
> +
> +       if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M0_ERROR)) {
> +               dev_err_ratelimited(cci->dev, "Master 0 error 0x%08x\n", =
val);
> +               cci->master[0].status =3D -EIO;
> +               writel(CCI_HALT_REQ_I2C_M0_Q0Q1, cci->base + CCI_HALT_REQ=
);
> +       }
> +
> +       if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M1_ERROR)) {
> +               dev_err_ratelimited(cci->dev, "Master 1 error 0x%08x\n", =
val);
> +               cci->master[1].status =3D -EIO;
> +               writel(CCI_HALT_REQ_I2C_M1_Q0Q1, cci->base + CCI_HALT_REQ=
);
> +       }
> +
> +       return IRQ_HANDLED;

What if none of the bits above were set? We should return IRQ_NONE in
that case so we can detect spurious interrupts.

> +}
> +
> +static int cci_halt(struct cci *cci, u8 master_num)
> +{
> +       struct cci_master *master;
> +       unsigned long time;
> +       u32 val;
> +
> +       switch (master_num) {
> +       case 0:
> +               val =3D CCI_HALT_REQ_I2C_M0_Q0Q1;
> +               master =3D &cci->master[0];
> +               break;
> +
> +       case 1:
> +               val =3D CCI_HALT_REQ_I2C_M1_Q0Q1;
> +               master =3D &cci->master[1];
> +               break;
> +
> +       default:
> +               dev_err(cci->dev, "Invalid master:%d\n", master_num);
> +               return -EINVAL;
> +       }

Why it this a case statement? It could be

	if (master_num > 1) {
		dev_err(...);
		return -EINVAL;
	}

	val =3D BIT(master_num);
	master =3D &cci->master[master_num];

> +
> +       master->complete_pending =3D true;
> +       writel(val, cci->base + CCI_HALT_REQ);
> +
> +       time =3D wait_for_completion_timeout(&master->irq_complete, CCI_T=
IMEOUT);
> +       if (!time) {

Why not just

	if (!wait_for_completion_timeout(...)

? Applies throughout this patch.

> +               dev_err(cci->dev, "CCI halt timeout\n");
> +               return -ETIMEDOUT;
> +       }
> +
> +       return 0;
> +}
> +
> +static int cci_reset(struct cci *cci)
> +{
> +       unsigned long time;
> +
> +       /*
> +        * we reset the whole controller (CCI_RESET_CMD_MASK),here and for

Add a space after that close parenthesis.

> +        * simplicity use master[0].xxx for waiting on it
> +        */
> +       cci->master[0].complete_pending =3D true;
> +       writel(CCI_RESET_CMD_MASK, cci->base + CCI_RESET_CMD);
> +
> +       time =3D wait_for_completion_timeout
> +               (&cci->master[0].irq_complete, CCI_TIMEOUT);
> +       if (!time) {
> +               dev_err(cci->dev, "CCI reset timeout\n");
> +               return -ETIMEDOUT;
> +       }
> +
> +       return 0;
> +}
> +
> +static int cci_init(struct cci *cci, const struct hw_params *hw)
> +{
> +       u32 val =3D CCI_IRQ_MASK_0_I2C_M0_RD_DONE |
> +                       CCI_IRQ_MASK_0_I2C_M0_Q0_REPORT |
> +                       CCI_IRQ_MASK_0_I2C_M0_Q1_REPORT |
> +                       CCI_IRQ_MASK_0_I2C_M1_RD_DONE |
> +                       CCI_IRQ_MASK_0_I2C_M1_Q0_REPORT |
> +                       CCI_IRQ_MASK_0_I2C_M1_Q1_REPORT |
> +                       CCI_IRQ_MASK_0_RST_DONE_ACK |
> +                       CCI_IRQ_MASK_0_I2C_M0_Q0Q1_HALT_ACK |
> +                       CCI_IRQ_MASK_0_I2C_M1_Q0Q1_HALT_ACK |
> +                       CCI_IRQ_MASK_0_I2C_M0_ERROR |
> +                       CCI_IRQ_MASK_0_I2C_M1_ERROR;
> +       int i;
> +
> +       writel(val, cci->base + CCI_IRQ_MASK_0);
> +
> +       for (i =3D 0; i < cci->data->num_masters; i++) {
> +               val =3D hw->thigh << 16 | hw->tlow;
> +               writel(val, cci->base + CCI_I2C_Mm_SCL_CTL(i));
> +
> +               val =3D hw->tsu_sto << 16 | hw->tsu_sta;
> +               writel(val, cci->base + CCI_I2C_Mm_SDA_CTL_0(i));
> +
> +               val =3D hw->thd_dat << 16 | hw->thd_sta;
> +               writel(val, cci->base + CCI_I2C_Mm_SDA_CTL_1(i));
> +
> +               val =3D hw->tbuf;
> +               writel(val, cci->base + CCI_I2C_Mm_SDA_CTL_2(i));
> +
> +               val =3D hw->scl_stretch_en << 8 | hw->trdhld << 4 | hw->t=
sp;
> +               writel(val, cci->base + CCI_I2C_Mm_MISC_CTL(i));
> +       }
> +
> +       return 0;
> +}
> +
> +static int cci_run_queue(struct cci *cci, u8 master, u8 queue)
> +{
> +       unsigned long time;
> +       u32 val;
> +       int ret;
> +
> +       val =3D readl(cci->base + CCI_I2C_Mm_Qn_CUR_WORD_CNT(master, queu=
e));
> +       writel(val, cci->base + CCI_I2C_Mm_Qn_EXEC_WORD_CNT(master, queue=
));
> +
> +       val =3D BIT(master * 2 + queue);
> +       writel(val, cci->base + CCI_QUEUE_START);
> +
> +       time =3D wait_for_completion_timeout
> +                       (&cci->master[master].irq_complete, CCI_TIMEOUT);

This line is really long. Make a local variable?

> +       if (!time) {
> +               dev_err(cci->dev, "master %d queue %d timeout\n",
> +                       master, queue);
> +
> +               cci_halt(cci, master);
> +
> +               return -ETIMEDOUT;
> +       }
> +
> +       ret =3D cci->master[master].status;
> +       if (ret < 0)
> +               dev_err(cci->dev, "master %d queue %d error %d\n",
> +                       master, queue, ret);
> +
> +       return ret;
> +}
> +
> +static int cci_validate_queue(struct cci *cci, u8 master, u8 queue)
> +{
> +       u32 val;
> +
> +       val =3D readl(cci->base + CCI_I2C_Mm_Qn_CUR_WORD_CNT(master, queu=
e));
> +       if (val =3D=3D cci->data->queue_size[queue])
> +               return -EINVAL;
> +
> +       if (!val)
> +               return val;

return 0?

> +
> +       val =3D CCI_I2C_REPORT | CCI_I2C_REPORT_IRQ_EN;
> +       writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +
> +       return cci_run_queue(cci, master, queue);
> +}
> +
> +static int cci_i2c_read(struct cci *cci, u16 master,
> +                       u16 addr, u8 *buf, u16 len)
> +{
> +       u32 val, words_read, words_exp;
> +       u8 queue =3D QUEUE_1;
> +       int i, index =3D 0, ret;
> +       bool first =3D false;
> +
> +       /*
> +        * Call validate queue to make sure queue is empty before startin=
g.
> +        * This is to avoid overflow / underflow of queue.
> +        */
> +       ret =3D cci_validate_queue(cci, master, queue);
> +       if (ret < 0)
> +               return ret;
> +
> +       val =3D CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
> +       writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +
> +       val =3D CCI_I2C_READ | len << 4;
> +       writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +
> +       ret =3D cci_run_queue(cci, master, queue);
> +       if (ret < 0)
> +               return ret;
> +
> +       words_read =3D readl(cci->base + CCI_I2C_Mm_READ_BUF_LEVEL(master=
));
> +       words_exp =3D len / 4 + 1;
> +       if (words_read !=3D words_exp) {
> +               dev_err(cci->dev, "words read =3D %d, words expected =3D =
%d\n",
> +                       words_read, words_exp);
> +               return -EIO;
> +       }
> +
> +       do {
> +               val =3D readl(cci->base + CCI_I2C_Mm_READ_DATA(master));
> +
> +               for (i =3D 0; i < 4 && index < len; i++) {
> +                       if (first) {
> +                               first =3D false;
> +                               continue;
> +                       }
> +                       buf[index++] =3D (val >> (i * 8)) & 0xff;

Is this some sort of readsl() but where the first byte is ignored?

> +               }
> +       } while (--words_read);
> +
> +       return 0;
> +}
> +
> +static int cci_i2c_write(struct cci *cci, u16 master,
> +                        u16 addr, u8 *buf, u16 len)
> +{
> +       u8 queue =3D QUEUE_0;
> +       u8 load[12] =3D { 0 };
> +       int i =3D 0, j, ret;
> +       u32 val;
> +
> +       /*
> +        * Call validate queue to make sure queue is empty before startin=
g.
> +        * This is to avoid overflow / underflow of queue.
> +        */
> +       ret =3D cci_validate_queue(cci, master, queue);
> +       if (ret < 0)
> +               return ret;
> +
> +       val =3D CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
> +       writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +
> +       load[i++] =3D CCI_I2C_WRITE | len << 4;

Can 'len' really be 16 bits? Because this assignment truncates that very
quickly.

> +
> +       for (j =3D 0; j < len; j++)

Well I guess len can be at most '11', so maybe the type should be u8
instead?

> +               load[i++] =3D buf[j];
> +
> +       for (j =3D 0; j < i; j +=3D 4) {
> +               val =3D load[j];
> +               val |=3D load[j + 1] << 8;
> +               val |=3D load[j + 2] << 16;
> +               val |=3D load[j + 3] << 24;
> +               writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, q=
ueue));

Use writesl() instead?

> +       }
> +
> +       val =3D CCI_I2C_REPORT | CCI_I2C_REPORT_IRQ_EN;
> +       writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +
> +       return cci_run_queue(cci, master, queue);
> +}
[...]
> +
> +static int cci_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *of_node;
> +       struct resource *r;
> +       struct cci *cci;
> +       char name[16];
> +       int ret =3D 0, i;
> +       u32 val;
> +
> +       cci =3D devm_kzalloc(dev, sizeof(*cci), GFP_KERNEL);
> +       if (!cci)
> +               return -ENOMEM;
> +
> +       cci->dev =3D dev;
> +       platform_set_drvdata(pdev, cci);
> +       cci->data =3D device_get_match_data(&pdev->dev);
> +       if (!cci->data) {
> +               dev_err(&pdev->dev, "Driver data is null, abort\n");

This would never happen though.

> +               return -EIO;
> +       }
> +
> +       for (i =3D 0; i < cci->data->num_masters; i++) {
> +               cci->master[i].adap.quirks =3D &cci->data->quirks;
> +               cci->master[i].adap.algo =3D &cci_algo;
> +               cci->master[i].adap.dev.parent =3D cci->dev;
> +               cci->master[i].master =3D i;
> +               cci->master[i].cci =3D cci;
> +               i2c_set_adapdata(&cci->master[i].adap, cci);
> +               snprintf(cci->master[i].adap.name,
> +                        sizeof(cci->master[i].adap.name),
> +                        "Qualcomm Camera Control Interface: %d", i);
> +
> +               /* find the child node for i2c-bus as we are on cci node =
*/
> +               snprintf(name, sizeof(name), "i2c-bus%d", i);
> +               of_node =3D of_get_child_by_name(dev->of_node, name);
> +               if (!of_node) {
> +                       dev_err(dev, "couldn't find i2cbus child node\n");
> +                       return -EINVAL;
> +               }
> +               cci->master[i].adap.dev.of_node =3D of_node;
> +
> +               cci->master[i].mode =3D I2C_MODE_STANDARD;
> +               ret =3D of_property_read_u32(of_node, "clock-frequency", =
&val);
> +               if (!ret) {
> +                       if (val =3D=3D 400000)
> +                               cci->master[i].mode =3D I2C_MODE_FAST;
> +                       else if (val =3D=3D 1000000)
> +                               cci->master[i].mode =3D I2C_MODE_FAST_PLU=
S;
> +               }
> +
> +               init_completion(&cci->master[i].irq_complete);
> +       }
> +
> +       /* Memory */
> +
> +       r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       cci->base =3D devm_ioremap_resource(dev, r);
> +       if (IS_ERR(cci->base)) {
> +               dev_err(dev, "could not map memory\n");

devm_ioremap_resource() already prints an error. Drop this.

> +               return PTR_ERR(cci->base);
> +       }
> +
> +       /* Interrupt */
> +
> +       ret =3D platform_get_irq(pdev, 0);
> +       if (ret < 0) {
> +               dev_err(dev, "missing IRQ: %d\n", ret);
> +               return ret;
> +       }
> +       cci->irq =3D ret;
> +
> +       ret =3D devm_request_irq(dev, cci->irq, cci_isr,
> +                              IRQF_TRIGGER_RISING, dev_name(dev), cci);
> +       if (ret < 0) {
> +               dev_err(dev, "request_irq failed, ret: %d\n", ret);
> +               return ret;
> +       }
> +
> +       disable_irq(cci->irq);

Why? Is the irq always triggering or something?

> +
> +       /* Clocks */
> +
> +       cci->nclocks =3D 0;
> +       while (cci->data->res.clock[cci->nclocks])
> +               cci->nclocks++;
> +
> +       cci->clock =3D devm_kcalloc(dev, cci->nclocks,
> +                                 sizeof(*cci->clock), GFP_KERNEL);
> +       if (!cci->clock)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < cci->nclocks; i++)
> +               cci->clock[i].id =3D cci->data->res.clock[i];
> +
> +       ret =3D devm_clk_bulk_get(dev, cci->nclocks, cci->clock);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret =3D cci_clock_set_rate(cci->nclocks, cci->clock,
> +                                cci->data->res.clock_rate, dev);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret =3D cci_enable_clocks(cci);
> +       if (ret < 0)
> +               return ret;
> +
> +       pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
> +       pm_runtime_use_autosuspend(dev);
> +       pm_runtime_set_active(dev);
> +       pm_runtime_enable(dev);
> +
> +       val =3D readl_relaxed(cci->base + CCI_HW_VERSION);
> +       dev_dbg(dev, "%s: CCI HW version =3D 0x%08x", __func__, val);
> +
> +       enable_irq(cci->irq);
> +
> +       ret =3D cci_reset(cci);
> +       if (ret < 0)
> +               goto error;
> +
> +       for (i =3D 0; i < cci->data->num_masters; i++) {
> +               ret =3D cci_init(cci, &cci->data->params[cci->master[i].m=
ode]);
> +               if (ret < 0)
> +                       goto pm_error;
> +
> +               ret =3D i2c_add_adapter(&cci->master[i].adap);
> +               if (ret < 0)
> +                       goto error_i2c;
> +       }
> +
> +       return 0;
> +
> +error_i2c:
> +       for (; i >=3D 0; i--)
> +               i2c_del_adapter(&cci->master[i].adap);
> +pm_error:
> +       pm_runtime_disable(dev);
> +       pm_runtime_set_suspended(dev);
> +error:
> +       disable_irq(cci->irq);
> +       cci_disable_clocks(cci);
> +
> +       return ret;
> +}
> +
> +static int cci_remove(struct platform_device *pdev)
> +{
> +       struct cci *cci =3D platform_get_drvdata(pdev);
> +       int i;
> +
> +       for (i =3D 0; i < cci->data->num_masters; i++) {
> +               i2c_del_adapter(&cci->master[i].adap);
> +               cci_halt(cci, i);
> +       }
> +
> +       disable_irq(cci->irq);
> +       pm_runtime_disable(&pdev->dev);
> +       pm_runtime_set_suspended(&pdev->dev);
> +
> +       return 0;
> +}
> +
> +static const struct cci_data cci_8916_data =3D {
> +       .num_masters =3D 1,
> +       .queue_size =3D { 64, 16 },
> +       .quirks =3D {
> +               .max_write_len =3D 10,
> +               .max_read_len =3D 12,
> +       },
> +       .res =3D {
> +               .clock =3D {
> +                       "camss_top_ahb",
> +                       "cci_ahb",
> +                       "camss_ahb",
> +                       "cci"

I guess this is another design where you just want to "get all the clks"
and not care about what they are?

> +               },
> +               .clock_rate =3D {
> +                       0,
> +                       80000000,
> +                       0,
> +                       19200000
> +               },
> +       },
> +       .params =3D {
> +               {
> +                       /* I2C_MODE_STANDARD */
> +                       .thigh =3D 78,
> +                       .tlow =3D 114,
> +                       .tsu_sto =3D 28,
> +                       .tsu_sta =3D 28,
> +                       .thd_dat =3D 10,
> +                       .thd_sta =3D 77,
> +                       .tbuf =3D 118,
> +                       .scl_stretch_en =3D 0,
> +                       .trdhld =3D 6,
> +                       .tsp =3D 1
> +               },
> +               {
> +                       /* I2C_MODE_FAST */
> +                       .thigh =3D 20,
> +                       .tlow =3D 28,
> +                       .tsu_sto =3D 21,
> +                       .tsu_sta =3D 21,
> +                       .thd_dat =3D 13,
> +                       .thd_sta =3D 18,
> +                       .tbuf =3D 32,
> +                       .scl_stretch_en =3D 0,
> +                       .trdhld =3D 6,
> +                       .tsp =3D 3
> +               },
> +       },
> +};
> +
> +static const struct cci_data cci_8996_data =3D {
> +       .num_masters =3D 2,
> +       .queue_size =3D { 64, 16 },
> +       .quirks =3D {
> +               .max_write_len =3D 11,
> +               .max_read_len =3D 12,
> +       },
> +       .res =3D {
> +               .clock =3D {
> +                       "camss_top_ahb",
> +                       "cci_ahb",
> +                       "camss_ahb",
> +                       "cci"
> +               },
> +               .clock_rate =3D {
> +                       0,
> +                       0,
> +                       0,
> +                       37500000

Use assigned clock rates from DT instead?

> +               },
> +       },
> +       .params =3D {
> +               {
> +                       /* I2C_MODE_STANDARD */
> +                       .thigh =3D 201,
> +                       .tlow =3D 174,
> +                       .tsu_sto =3D 204,
> +                       .tsu_sta =3D 231,
> +                       .thd_dat =3D 22,
> +                       .thd_sta =3D 162,
> +                       .tbuf =3D 227,
> +                       .scl_stretch_en =3D 0,
> +                       .trdhld =3D 6,
> +                       .tsp =3D 3
> +               },
> +               {
> +                       /* I2C_MODE_FAST */
> +                       .thigh =3D 38,
> +                       .tlow =3D 56,
> +                       .tsu_sto =3D 40,
> +                       .tsu_sta =3D 40,
> +                       .thd_dat =3D 22,
> +                       .thd_sta =3D 35,
> +                       .tbuf =3D 62,
> +                       .scl_stretch_en =3D 0,
> +                       .trdhld =3D 6,
> +                       .tsp =3D 3
> +               },
> +               {
> +                       /* I2C_MODE_FAST_PLUS */

Could be written like [I2C_MODE_FAST_PLUS] =3D { ... } and then drop the
comments and positional magic.

> +                       .thigh =3D 16,
> +                       .tlow =3D 22,
> +                       .tsu_sto =3D 17,
> +                       .tsu_sta =3D 18,
> +                       .thd_dat =3D 16,
> +                       .thd_sta =3D 15,
> +                       .tbuf =3D 24,
> +                       .scl_stretch_en =3D 0,
> +                       .trdhld =3D 3,
> +                       .tsp =3D 3
> +               }
> +       },
> +};
