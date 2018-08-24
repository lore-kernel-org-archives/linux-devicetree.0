Return-Path: <vkoul@kernel.org>
Date: Fri, 24 Aug 2018 15:46:35 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v4 2/2] i2c: Add Qualcomm CCI I2C driver
Message-ID: <20180824101635.GO2388@vkoul-mobl>
References: <20180820063953.6866-1-vkoul@kernel.org>
 <20180820063953.6866-3-vkoul@kernel.org>
 <153509585617.28926.14526626631390463379@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <153509585617.28926.14526626631390463379@swboyd.mtv.corp.google.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On 24-08-18, 00:30, Stephen Boyd wrote:
> Quoting Vinod Koul (2018-08-19 23:39:53)
> > diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> > index 4f8df2ec87b1..033958bcdd4b 100644
> > --- a/drivers/i2c/busses/Kconfig
> > +++ b/drivers/i2c/busses/Kconfig
> > @@ -828,6 +828,16 @@ config I2C_PXA_SLAVE
> >           is necessary for systems where the PXA may be a target on the
> >           I2C bus.
> >  
> > +config I2C_QCOM_CCI
> > +       tristate "Qualcomm Camera Control Interface"
> > +       depends on ARCH_QCOM
> 
>  Or COMPILE_TEST?

Sure

> 
> > +       help
> > +         If you say yes to this option, support will be included for the
> > +         built-in camera control interface on the Qualcomm SoCs.
> > +
> > +         This driver can also be built as a module.  If so, the module
> > +         will be called i2c-qcom-cci.
> > +
> >  config I2C_QUP
> >         tristate "Qualcomm QUP based I2C controller"
> >         depends on ARCH_QCOM
> > diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> > new file mode 100644
> > index 000000000000..6fd6cecc0ed5
> > --- /dev/null
> > +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> > @@ -0,0 +1,879 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (c) 2012-2016, The Linux Foundation. All rights reserved.
> > +// Copyright (c) 2017-18 Linaro Limited.
> > +
> > +#include <linux/clk.h>
> > +#include <linux/completion.h>
> > +#include <linux/i2c.h>
> > +#include <linux/io.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +
> > +#define CCI_HW_VERSION                         0x0
> > +#define CCI_RESET_CMD                          0x004
> > +#define CCI_RESET_CMD_MASK                     0x0f73f3f7
> > +#define CCI_RESET_CMD_M0_MASK                  0x000003f1
> > +#define CCI_RESET_CMD_M1_MASK                  0x0003f001
> > +#define CCI_QUEUE_START                                0x008
> > +#define CCI_HALT_REQ                           0x034
> > +#define CCI_HALT_REQ_I2C_M0_Q0Q1               BIT(0)
> > +#define CCI_HALT_REQ_I2C_M1_Q0Q1               BIT(1)
> > +
> > +#define CCI_I2C_Mm_SCL_CTL(m)                  (0x100 + 0x100 * (m))
> > +#define CCI_I2C_Mm_SDA_CTL_0(m)                        (0x104 + 0x100 * (m))
> > +#define CCI_I2C_Mm_SDA_CTL_1(m)                        (0x108 + 0x100 * (m))
> > +#define CCI_I2C_Mm_SDA_CTL_2(m)                        (0x10c + 0x100 * (m))
> > +#define CCI_I2C_Mm_MISC_CTL(m)                 (0x110 + 0x100 * (m))
> > +
> > +#define CCI_I2C_Mm_READ_DATA(m)                        (0x118 + 0x100 * (m))
> > +#define CCI_I2C_Mm_READ_BUF_LEVEL(m)           (0x11c + 0x100 * (m))
> > +#define CCI_I2C_Mm_Qn_EXEC_WORD_CNT(m, n)      (0x300 + 0x200 * (m) + 0x100 * (n))
> > +#define CCI_I2C_Mm_Qn_CUR_WORD_CNT(m, n)       (0x304 + 0x200 * (m) + 0x100 * (n))
> > +#define CCI_I2C_Mm_Qn_CUR_CMD(m, n)            (0x308 + 0x200 * (m) + 0x100 * (n))
> > +#define CCI_I2C_Mm_Qn_REPORT_STATUS(m, n)      (0x30c + 0x200 * (m) + 0x100 * (n))
> > +#define CCI_I2C_Mm_Qn_LOAD_DATA(m, n)          (0x310 + 0x200 * (m) + 0x100 * (n))
> > +
> > +#define CCI_IRQ_GLOBAL_CLEAR_CMD               0xc00
> > +#define CCI_IRQ_MASK_0                         0xc04
> > +#define CCI_IRQ_MASK_0_I2C_M0_RD_DONE          BIT(0)
> > +#define CCI_IRQ_MASK_0_I2C_M0_Q0_REPORT                BIT(4)
> > +#define CCI_IRQ_MASK_0_I2C_M0_Q1_REPORT                BIT(8)
> > +#define CCI_IRQ_MASK_0_I2C_M1_RD_DONE          BIT(12)
> > +#define CCI_IRQ_MASK_0_I2C_M1_Q0_REPORT                BIT(16)
> > +#define CCI_IRQ_MASK_0_I2C_M1_Q1_REPORT                BIT(20)
> > +#define CCI_IRQ_MASK_0_RST_DONE_ACK            BIT(24)
> > +#define CCI_IRQ_MASK_0_I2C_M0_Q0Q1_HALT_ACK    BIT(25)
> > +#define CCI_IRQ_MASK_0_I2C_M1_Q0Q1_HALT_ACK    BIT(26)
> > +#define CCI_IRQ_MASK_0_I2C_M0_ERROR            0x18000ee6
> > +#define CCI_IRQ_MASK_0_I2C_M1_ERROR            0x60ee6000
> > +#define CCI_IRQ_CLEAR_0                                0xc08
> > +#define CCI_IRQ_STATUS_0                       0xc0c
> > +#define CCI_IRQ_STATUS_0_I2C_M0_RD_DONE                BIT(0)
> > +#define CCI_IRQ_STATUS_0_I2C_M0_Q0_REPORT      BIT(4)
> > +#define CCI_IRQ_STATUS_0_I2C_M0_Q1_REPORT      BIT(8)
> > +#define CCI_IRQ_STATUS_0_I2C_M1_RD_DONE                BIT(12)
> > +#define CCI_IRQ_STATUS_0_I2C_M1_Q0_REPORT      BIT(16)
> > +#define CCI_IRQ_STATUS_0_I2C_M1_Q1_REPORT      BIT(20)
> > +#define CCI_IRQ_STATUS_0_RST_DONE_ACK          BIT(24)
> > +#define CCI_IRQ_STATUS_0_I2C_M0_Q0Q1_HALT_ACK  BIT(25)
> > +#define CCI_IRQ_STATUS_0_I2C_M1_Q0Q1_HALT_ACK  BIT(26)
> > +#define CCI_IRQ_STATUS_0_I2C_M0_ERROR          0x18000ee6
> > +#define CCI_IRQ_STATUS_0_I2C_M1_ERROR          0x60ee6000
> > +
> > +#define CCI_TIMEOUT    (msecs_to_jiffies(100))
> > +#define NUM_MASTERS    2
> > +#define NUM_QUEUES     2
> > +
> > +/* Max number of resources + 1 for a NULL terminator */
> > +#define CCI_RES_MAX    6
> > +
> > +enum cci_i2c_cmd {
> 
> Make these #defines so we can easily see what the value is instead of
> having to count. Plus, the enum isn't helping anyone figure out that a
> command is being used because the enum isn't used anywhere in the code.

OK, will remove the unused ones and define used ones

> > +       CCI_I2C_SET_PARAM = 1,
> > +       CCI_I2C_WAIT,
> > +       CCI_I2C_WAIT_SYNC,
> > +       CCI_I2C_WAIT_GPIO_EVENT,
> > +       CCI_I2C_TRIG_I2C_EVENT,
> > +       CCI_I2C_LOCK,
> > +       CCI_I2C_UNLOCK,
> > +       CCI_I2C_REPORT,
> > +       CCI_I2C_WRITE,
> > +       CCI_I2C_READ,
> > +       CCI_I2C_WRITE_DISABLE_P,
> > +       CCI_I2C_READ_DISABLE_P,
> > +};
> > +
> > +#define CCI_I2C_REPORT_IRQ_EN  BIT(8)
> > +
> > +enum {
> > +       I2C_MODE_STANDARD,
> > +       I2C_MODE_FAST,
> > +       I2C_MODE_FAST_PLUS,
> > +};
> > +
> > +enum cci_i2c_queue_t {
> > +       QUEUE_0,
> > +       QUEUE_1
> > +};
> > +
> > +struct cci_res {
> > +       char *clock[CCI_RES_MAX];
> > +       u32 clock_rate[CCI_RES_MAX];
> > +};
> > +
> > +struct hw_params {
> > +       u16 thigh;
> > +       u16 tlow;
> > +       u16 tsu_sto;
> > +       u16 tsu_sta;
> > +       u16 thd_dat;
> > +       u16 thd_sta;
> > +       u16 tbuf;
> > +       u8 scl_stretch_en;
> > +       u16 trdhld;
> > +       u16 tsp;
> 
> Care to spell these out fully? Or at least add kernel documentation so
> we know what they actually mean?

Sure will add, they are the parameters used for i2c bus configuration.

> 
> > +};
> > +
> > +struct cci;
> > +
> > +struct cci_master {
> > +       struct i2c_adapter adap;
> > +       u16 master;
> > +       u8 mode;
> > +       int status;
> > +       bool complete_pending;
> > +       struct completion irq_complete;
> 
> Having a bool and a completion is very odd and probably racy. Can you
> get rid of the bool and just complete things when they need completing
> and wait for them when they need waiting?

sounds sensible to me, will fix.

> 
> > +       struct cci *cci;
> > +};
> > +
> > +struct cci_data {
> > +       unsigned int num_masters;
> > +       struct i2c_adapter_quirks quirks;
> > +       u16 queue_size[NUM_QUEUES];
> > +       struct cci_res res;
> > +       struct hw_params params[3];
> > +};
> > +
> > +struct cci {
> > +       struct device *dev;
> > +       void __iomem *base;
> > +       unsigned int irq;
> > +       const struct cci_data *data;
> > +       struct clk_bulk_data *clock;
> > +       int nclocks;
> > +       struct cci_master master[NUM_MASTERS];
> > +};
> > +
> > +/**
> > + * cci_clock_set_rate() - Set clock frequency rates
> > + * @nclocks: Number of clocks
> > + * @clock: Clock array
> > + * @clock_freq: Clock frequency rate array
> > + * @dev: Device
> > + *
> > + * Return 0 on success or a negative error code otherwise
> > + */
> > +static int cci_clock_set_rate(int nclocks, struct clk_bulk_data *clock,
> > +                             const u32 *clock_freq, struct device *dev)
> > +{
> > +       int i, ret;
> > +       long rate;
> > +
> > +       for (i = 0; i < nclocks; i++) {
> > +               if (clock_freq[i]) {
> > +                       rate = clk_round_rate(clock[i].clk, clock_freq[i]);
> > +                       if (rate < 0) {
> > +                               dev_err(dev, "clk round rate failed: %ld\n",
> > +                                       rate);
> > +                               return rate;
> > +                       }
> > +
> > +                       ret = clk_set_rate(clock[i].clk, clock_freq[i]);
> > +                       if (ret < 0) {
> > +                               dev_err(dev, "clk set rate failed: %d\n", ret);
> > +                               return ret;
> > +                       }
> > +               }
> > +       }
> 
> Hopefully this whole function can go away.

okay will revisit this

> > +
> > +       return 0;
> > +}
> > +
> > +static irqreturn_t cci_isr(int irq, void *dev)
> > +{
> > +       struct cci *cci = dev;
> > +       u32 val, reset = 0;
> > +
> > +       val = readl(cci->base + CCI_IRQ_STATUS_0);
> > +       writel(val, cci->base + CCI_IRQ_CLEAR_0);
> > +       writel(0x1, cci->base + CCI_IRQ_GLOBAL_CLEAR_CMD);
> > +
> > +       if (val & CCI_IRQ_STATUS_0_RST_DONE_ACK) {
> > +               if (cci->master[0].complete_pending) {
> > +                       cci->master[0].complete_pending = false;
> > +                       complete(&cci->master[0].irq_complete);
> > +               }
> > +
> > +               if (cci->master[1].complete_pending) {
> > +                       cci->master[1].complete_pending = false;
> > +                       complete(&cci->master[1].irq_complete);
> > +               }
> > +       }
> > +
> > +       if (val & CCI_IRQ_STATUS_0_I2C_M0_RD_DONE ||
> > +                       val & CCI_IRQ_STATUS_0_I2C_M0_Q0_REPORT ||
> > +                       val & CCI_IRQ_STATUS_0_I2C_M0_Q1_REPORT) {
> > +               cci->master[0].status = 0;
> > +               complete(&cci->master[0].irq_complete);
> > +       }
> > +
> > +       if (val & CCI_IRQ_STATUS_0_I2C_M1_RD_DONE ||
> > +                       val & CCI_IRQ_STATUS_0_I2C_M1_Q0_REPORT ||
> > +                       val & CCI_IRQ_STATUS_0_I2C_M1_Q1_REPORT) {
> > +               cci->master[1].status = 0;
> > +               complete(&cci->master[1].irq_complete);
> > +       }
> > +
> > +       if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M0_Q0Q1_HALT_ACK)) {
> > +               cci->master[0].complete_pending = true;
> > +               reset = CCI_RESET_CMD_M0_MASK;
> > +       }
> > +
> > +       if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M1_Q0Q1_HALT_ACK)) {
> > +               cci->master[1].complete_pending = true;
> > +               reset = CCI_RESET_CMD_M1_MASK;
> > +       }
> > +
> > +       if (unlikely(reset))
> > +               writel(reset, cci->base + CCI_RESET_CMD);
> > +
> > +       if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M0_ERROR)) {
> > +               dev_err_ratelimited(cci->dev, "Master 0 error 0x%08x\n", val);
> > +               cci->master[0].status = -EIO;
> > +               writel(CCI_HALT_REQ_I2C_M0_Q0Q1, cci->base + CCI_HALT_REQ);
> > +       }
> > +
> > +       if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M1_ERROR)) {
> > +               dev_err_ratelimited(cci->dev, "Master 1 error 0x%08x\n", val);
> > +               cci->master[1].status = -EIO;
> > +               writel(CCI_HALT_REQ_I2C_M1_Q0Q1, cci->base + CCI_HALT_REQ);
> > +       }
> > +
> > +       return IRQ_HANDLED;
> 
> What if none of the bits above were set? We should return IRQ_NONE in
> that case so we can detect spurious interrupts.

yes will do

> 
> > +}
> > +
> > +static int cci_halt(struct cci *cci, u8 master_num)
> > +{
> > +       struct cci_master *master;
> > +       unsigned long time;
> > +       u32 val;
> > +
> > +       switch (master_num) {
> > +       case 0:
> > +               val = CCI_HALT_REQ_I2C_M0_Q0Q1;
> > +               master = &cci->master[0];
> > +               break;
> > +
> > +       case 1:
> > +               val = CCI_HALT_REQ_I2C_M1_Q0Q1;
> > +               master = &cci->master[1];
> > +               break;
> > +
> > +       default:
> > +               dev_err(cci->dev, "Invalid master:%d\n", master_num);
> > +               return -EINVAL;
> > +       }
> 
> Why it this a case statement? It could be
> 
> 	if (master_num > 1) {
> 		dev_err(...);
> 		return -EINVAL;
> 	}
> 
> 	val = BIT(master_num);
> 	master = &cci->master[master_num];

yes that can be the alternate implementation.

> 
> > +
> > +       master->complete_pending = true;
> > +       writel(val, cci->base + CCI_HALT_REQ);
> > +
> > +       time = wait_for_completion_timeout(&master->irq_complete, CCI_TIMEOUT);
> > +       if (!time) {
> 
> Why not just
> 
> 	if (!wait_for_completion_timeout(...)
> 
> ? Applies throughout this patch.


> 
> > +               dev_err(cci->dev, "CCI halt timeout\n");
> > +               return -ETIMEDOUT;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int cci_reset(struct cci *cci)
> > +{
> > +       unsigned long time;
> > +
> > +       /*
> > +        * we reset the whole controller (CCI_RESET_CMD_MASK),here and for
> 
> Add a space after that close parenthesis.

oops missed that

> 
> > +        * simplicity use master[0].xxx for waiting on it
> > +        */
> > +       cci->master[0].complete_pending = true;
> > +       writel(CCI_RESET_CMD_MASK, cci->base + CCI_RESET_CMD);
> > +
> > +       time = wait_for_completion_timeout
> > +               (&cci->master[0].irq_complete, CCI_TIMEOUT);
> > +       if (!time) {
> > +               dev_err(cci->dev, "CCI reset timeout\n");
> > +               return -ETIMEDOUT;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int cci_init(struct cci *cci, const struct hw_params *hw)
> > +{
> > +       u32 val = CCI_IRQ_MASK_0_I2C_M0_RD_DONE |
> > +                       CCI_IRQ_MASK_0_I2C_M0_Q0_REPORT |
> > +                       CCI_IRQ_MASK_0_I2C_M0_Q1_REPORT |
> > +                       CCI_IRQ_MASK_0_I2C_M1_RD_DONE |
> > +                       CCI_IRQ_MASK_0_I2C_M1_Q0_REPORT |
> > +                       CCI_IRQ_MASK_0_I2C_M1_Q1_REPORT |
> > +                       CCI_IRQ_MASK_0_RST_DONE_ACK |
> > +                       CCI_IRQ_MASK_0_I2C_M0_Q0Q1_HALT_ACK |
> > +                       CCI_IRQ_MASK_0_I2C_M1_Q0Q1_HALT_ACK |
> > +                       CCI_IRQ_MASK_0_I2C_M0_ERROR |
> > +                       CCI_IRQ_MASK_0_I2C_M1_ERROR;
> > +       int i;
> > +
> > +       writel(val, cci->base + CCI_IRQ_MASK_0);
> > +
> > +       for (i = 0; i < cci->data->num_masters; i++) {
> > +               val = hw->thigh << 16 | hw->tlow;
> > +               writel(val, cci->base + CCI_I2C_Mm_SCL_CTL(i));
> > +
> > +               val = hw->tsu_sto << 16 | hw->tsu_sta;
> > +               writel(val, cci->base + CCI_I2C_Mm_SDA_CTL_0(i));
> > +
> > +               val = hw->thd_dat << 16 | hw->thd_sta;
> > +               writel(val, cci->base + CCI_I2C_Mm_SDA_CTL_1(i));
> > +
> > +               val = hw->tbuf;
> > +               writel(val, cci->base + CCI_I2C_Mm_SDA_CTL_2(i));
> > +
> > +               val = hw->scl_stretch_en << 8 | hw->trdhld << 4 | hw->tsp;
> > +               writel(val, cci->base + CCI_I2C_Mm_MISC_CTL(i));
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int cci_run_queue(struct cci *cci, u8 master, u8 queue)
> > +{
> > +       unsigned long time;
> > +       u32 val;
> > +       int ret;
> > +
> > +       val = readl(cci->base + CCI_I2C_Mm_Qn_CUR_WORD_CNT(master, queue));
> > +       writel(val, cci->base + CCI_I2C_Mm_Qn_EXEC_WORD_CNT(master, queue));
> > +
> > +       val = BIT(master * 2 + queue);
> > +       writel(val, cci->base + CCI_QUEUE_START);
> > +
> > +       time = wait_for_completion_timeout
> > +                       (&cci->master[master].irq_complete, CCI_TIMEOUT);
> 
> This line is really long. Make a local variable?

yeah sure

> 
> > +       if (!time) {
> > +               dev_err(cci->dev, "master %d queue %d timeout\n",
> > +                       master, queue);
> > +
> > +               cci_halt(cci, master);
> > +
> > +               return -ETIMEDOUT;
> > +       }
> > +
> > +       ret = cci->master[master].status;
> > +       if (ret < 0)
> > +               dev_err(cci->dev, "master %d queue %d error %d\n",
> > +                       master, queue, ret);
> > +
> > +       return ret;
> > +}
> > +
> > +static int cci_validate_queue(struct cci *cci, u8 master, u8 queue)
> > +{
> > +       u32 val;
> > +
> > +       val = readl(cci->base + CCI_I2C_Mm_Qn_CUR_WORD_CNT(master, queue));
> > +       if (val == cci->data->queue_size[queue])
> > +               return -EINVAL;
> > +
> > +       if (!val)
> > +               return val;
> 
> return 0?

do you want to make it explicit? both seem to me to do the same thing

> > +       val = CCI_I2C_REPORT | CCI_I2C_REPORT_IRQ_EN;
> > +       writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> > +
> > +       return cci_run_queue(cci, master, queue);
> > +}
> > +
> > +static int cci_i2c_read(struct cci *cci, u16 master,
> > +                       u16 addr, u8 *buf, u16 len)
> > +{
> > +       u32 val, words_read, words_exp;
> > +       u8 queue = QUEUE_1;
> > +       int i, index = 0, ret;
> > +       bool first = false;
> > +
> > +       /*
> > +        * Call validate queue to make sure queue is empty before starting.
> > +        * This is to avoid overflow / underflow of queue.
> > +        */
> > +       ret = cci_validate_queue(cci, master, queue);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
> > +       writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> > +
> > +       val = CCI_I2C_READ | len << 4;
> > +       writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> > +
> > +       ret = cci_run_queue(cci, master, queue);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       words_read = readl(cci->base + CCI_I2C_Mm_READ_BUF_LEVEL(master));
> > +       words_exp = len / 4 + 1;
> > +       if (words_read != words_exp) {
> > +               dev_err(cci->dev, "words read = %d, words expected = %d\n",
> > +                       words_read, words_exp);
> > +               return -EIO;
> > +       }
> > +
> > +       do {
> > +               val = readl(cci->base + CCI_I2C_Mm_READ_DATA(master));
> > +
> > +               for (i = 0; i < 4 && index < len; i++) {
> > +                       if (first) {
> > +                               first = false;
> > +                               continue;
> > +                       }
> > +                       buf[index++] = (val >> (i * 8)) & 0xff;
> 
> Is this some sort of readsl() but where the first byte is ignored?

Let me check with Todor and get back

> 
> > +               }
> > +       } while (--words_read);
> > +
> > +       return 0;
> > +}
> > +
> > +static int cci_i2c_write(struct cci *cci, u16 master,
> > +                        u16 addr, u8 *buf, u16 len)
> > +{
> > +       u8 queue = QUEUE_0;
> > +       u8 load[12] = { 0 };
> > +       int i = 0, j, ret;
> > +       u32 val;
> > +
> > +       /*
> > +        * Call validate queue to make sure queue is empty before starting.
> > +        * This is to avoid overflow / underflow of queue.
> > +        */
> > +       ret = cci_validate_queue(cci, master, queue);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
> > +       writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> > +
> > +       load[i++] = CCI_I2C_WRITE | len << 4;
> 
> Can 'len' really be 16 bits? Because this assignment truncates that very
> quickly.

Yes, this is passed from i2c_msg->len which is 16 bytes. But here it
doesn't support so it is truncated here

> 
> > +
> > +       for (j = 0; j < len; j++)
> 
> Well I guess len can be at most '11', so maybe the type should be u8
> instead?

I can use a local variable and cast to it, but am not sure that helps!

> > +               load[i++] = buf[j];
> > +
> > +       for (j = 0; j < i; j += 4) {
> > +               val = load[j];
> > +               val |= load[j + 1] << 8;
> > +               val |= load[j + 2] << 16;
> > +               val |= load[j + 3] << 24;
> > +               writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> 
> Use writesl() instead?

hmm should be possible. Will try and update.

> > +static int cci_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +       struct device_node *of_node;
> > +       struct resource *r;
> > +       struct cci *cci;
> > +       char name[16];
> > +       int ret = 0, i;
> > +       u32 val;
> > +
> > +       cci = devm_kzalloc(dev, sizeof(*cci), GFP_KERNEL);
> > +       if (!cci)
> > +               return -ENOMEM;
> > +
> > +       cci->dev = dev;
> > +       platform_set_drvdata(pdev, cci);
> > +       cci->data = device_get_match_data(&pdev->dev);
> > +       if (!cci->data) {
> > +               dev_err(&pdev->dev, "Driver data is null, abort\n");
> 
> This would never happen though.

not currently, but when someone adds an entry and misses driver data :)

> > +               return -EIO;
> > +       }
> > +
> > +       for (i = 0; i < cci->data->num_masters; i++) {
> > +               cci->master[i].adap.quirks = &cci->data->quirks;
> > +               cci->master[i].adap.algo = &cci_algo;
> > +               cci->master[i].adap.dev.parent = cci->dev;
> > +               cci->master[i].master = i;
> > +               cci->master[i].cci = cci;
> > +               i2c_set_adapdata(&cci->master[i].adap, cci);
> > +               snprintf(cci->master[i].adap.name,
> > +                        sizeof(cci->master[i].adap.name),
> > +                        "Qualcomm Camera Control Interface: %d", i);
> > +
> > +               /* find the child node for i2c-bus as we are on cci node */
> > +               snprintf(name, sizeof(name), "i2c-bus%d", i);
> > +               of_node = of_get_child_by_name(dev->of_node, name);
> > +               if (!of_node) {
> > +                       dev_err(dev, "couldn't find i2cbus child node\n");
> > +                       return -EINVAL;
> > +               }
> > +               cci->master[i].adap.dev.of_node = of_node;
> > +
> > +               cci->master[i].mode = I2C_MODE_STANDARD;
> > +               ret = of_property_read_u32(of_node, "clock-frequency", &val);
> > +               if (!ret) {
> > +                       if (val == 400000)
> > +                               cci->master[i].mode = I2C_MODE_FAST;
> > +                       else if (val == 1000000)
> > +                               cci->master[i].mode = I2C_MODE_FAST_PLUS;
> > +               }
> > +
> > +               init_completion(&cci->master[i].irq_complete);
> > +       }
> > +
> > +       /* Memory */
> > +
> > +       r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       cci->base = devm_ioremap_resource(dev, r);
> > +       if (IS_ERR(cci->base)) {
> > +               dev_err(dev, "could not map memory\n");
> 
> devm_ioremap_resource() already prints an error. Drop this.

sure

> > +               return PTR_ERR(cci->base);
> > +       }
> > +
> > +       /* Interrupt */
> > +
> > +       ret = platform_get_irq(pdev, 0);
> > +       if (ret < 0) {
> > +               dev_err(dev, "missing IRQ: %d\n", ret);
> > +               return ret;
> > +       }
> > +       cci->irq = ret;
> > +
> > +       ret = devm_request_irq(dev, cci->irq, cci_isr,
> > +                              IRQF_TRIGGER_RISING, dev_name(dev), cci);
> > +       if (ret < 0) {
> > +               dev_err(dev, "request_irq failed, ret: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       disable_irq(cci->irq);
> 
> Why? Is the irq always triggering or something?

I supposed Todor didn't want to enable IRQ until everything is set.
I could move this block before adding i2c adapter.

> > +static const struct cci_data cci_8916_data = {
> > +       .num_masters = 1,
> > +       .queue_size = { 64, 16 },
> > +       .quirks = {
> > +               .max_write_len = 10,
> > +               .max_read_len = 12,
> > +       },
> > +       .res = {
> > +               .clock = {
> > +                       "camss_top_ahb",
> > +                       "cci_ahb",
> > +                       "camss_ahb",
> > +                       "cci"
> 
> I guess this is another design where you just want to "get all the clks"
> and not care about what they are?

Yes that is how this seems to be

> > +static const struct cci_data cci_8996_data = {
> > +       .num_masters = 2,
> > +       .queue_size = { 64, 16 },
> > +       .quirks = {
> > +               .max_write_len = 11,
> > +               .max_read_len = 12,
> > +       },
> > +       .res = {
> > +               .clock = {
> > +                       "camss_top_ahb",
> > +                       "cci_ahb",
> > +                       "camss_ahb",
> > +                       "cci"
> > +               },
> > +               .clock_rate = {
> > +                       0,
> > +                       0,
> > +                       0,
> > +                       37500000
> 
> Use assigned clock rates from DT instead?

Yes should be possible.

> > +               },
> > +       },
> > +       .params = {
> > +               {
> > +                       /* I2C_MODE_STANDARD */
> > +                       .thigh = 201,
> > +                       .tlow = 174,
> > +                       .tsu_sto = 204,
> > +                       .tsu_sta = 231,
> > +                       .thd_dat = 22,
> > +                       .thd_sta = 162,
> > +                       .tbuf = 227,
> > +                       .scl_stretch_en = 0,
> > +                       .trdhld = 6,
> > +                       .tsp = 3
> > +               },
> > +               {
> > +                       /* I2C_MODE_FAST */
> > +                       .thigh = 38,
> > +                       .tlow = 56,
> > +                       .tsu_sto = 40,
> > +                       .tsu_sta = 40,
> > +                       .thd_dat = 22,
> > +                       .thd_sta = 35,
> > +                       .tbuf = 62,
> > +                       .scl_stretch_en = 0,
> > +                       .trdhld = 6,
> > +                       .tsp = 3
> > +               },
> > +               {
> > +                       /* I2C_MODE_FAST_PLUS */
> 
> Could be written like [I2C_MODE_FAST_PLUS] = { ... } and then drop the
> comments and positional magic.

Agreed

-- 
~Vinod
