Return-Path: <SRS0=20ow=F7=codeaurora.org=kramasub@kernel.org>
Subject: Re: [v3, 3/4] i2c: i2c-qcom-geni: Add bus driver for the Qualcomm
 GENI I2C controller
References: <1519781889-16117-4-git-send-email-kramasub@codeaurora.org>
 <CAD=FV=WbeP8xpVi7cji9hsNyxEam2D5D+_21ur_MuUO8FK42OQ@mail.gmail.com>
From: Karthik Ramasubramanian <kramasub@codeaurora.org>
Message-ID: <dc855339-4bb7-7500-bb81-37b0da5b8c7e@codeaurora.org>
Date: Thu, 8 Mar 2018 23:43:16 -0700
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WbeP8xpVi7cji9hsNyxEam2D5D+_21ur_MuUO8FK42OQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Doug Anderson <dianders@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wolfram Sang <wsa@the-dreams.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>, evgreen@chromium.org, acourbot@chromium.org, Sagar Dharia <sdharia@codeaurora.org>, Girish Mahadevan <girishm@codeaurora.org>, swboyd@chromium.org
List-ID: <devicetree@vger.kernel.org>



On 3/7/2018 2:16 PM, Doug Anderson wrote:
> Hi,
> 
> On Tue, Feb 27, 2018 at 5:38 PM, Karthikeyan Ramasubramanian
> <kramasub@codeaurora.org> wrote:
>> This bus driver supports the GENI based i2c hardware controller in the
>> Qualcomm SOCs. The Qualcomm Generic Interface (GENI) is a programmable
>> module supporting a wide range of serial interfaces including I2C. The
>> driver supports FIFO mode and DMA mode of transfer and switches modes
>> dynamically depending on the size of the transfer.
>>
>> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
>> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
>> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
>> ---
>>   drivers/i2c/busses/Kconfig         |  11 +
>>   drivers/i2c/busses/Makefile        |   1 +
>>   drivers/i2c/busses/i2c-qcom-geni.c | 626 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 638 insertions(+)
> 
> I'm not an expert on geni (and, to be honest, I haven't read the main
> geni patch yet).  ...but I figured I could at least add my $0.02 since
> I've stared at i2c bus drivers a lot in the past.  Feel free to tell
> me if I'm full or crap...
> 
> 
>>   create mode 100644 drivers/i2c/busses/i2c-qcom-geni.c
>>
>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>> index e2954fb..1ddf5cd 100644
>> --- a/drivers/i2c/busses/Kconfig
>> +++ b/drivers/i2c/busses/Kconfig
>> @@ -848,6 +848,17 @@ config I2C_PXA_SLAVE
>>            is necessary for systems where the PXA may be a target on the
>>            I2C bus.
>>
>> +config I2C_QCOM_GENI
>> +       tristate "Qualcomm Technologies Inc.'s GENI based I2C controller"
>> +       depends on ARCH_QCOM
>> +       depends on QCOM_GENI_SE
>> +       help
>> +         If you say yes to this option, support will be included for the
>> +         built-in I2C interface on the Qualcomm Technologies Inc.'s SoCs.
> 
> Kind of a generic description and this driver is only for new SoCs,
> right?  Maybe make it a little more specific?
Ok.
> 
> 
>> +
>> +         This driver can also be built as a module.  If so, the module
>> +         will be called i2c-qcom-geni.
>> +
>>   config I2C_QUP
>>          tristate "Qualcomm QUP based I2C controller"
>>          depends on ARCH_QCOM
>> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
>> index 2ce8576..201fce1 100644
>> --- a/drivers/i2c/busses/Makefile
>> +++ b/drivers/i2c/busses/Makefile
>> @@ -84,6 +84,7 @@ obj-$(CONFIG_I2C_PNX)         += i2c-pnx.o
>>   obj-$(CONFIG_I2C_PUV3)         += i2c-puv3.o
>>   obj-$(CONFIG_I2C_PXA)          += i2c-pxa.o
>>   obj-$(CONFIG_I2C_PXA_PCI)      += i2c-pxa-pci.o
>> +obj-$(CONFIG_I2C_QCOM_GENI)    += i2c-qcom-geni.o
>>   obj-$(CONFIG_I2C_QUP)          += i2c-qup.o
>>   obj-$(CONFIG_I2C_RIIC)         += i2c-riic.o
>>   obj-$(CONFIG_I2C_RK3X)         += i2c-rk3x.o
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> new file mode 100644
>> index 0000000..e1e4268
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -0,0 +1,626 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
>> +
>> +#include <linux/clk.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/err.h>
>> +#include <linux/i2c.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/qcom-geni-se.h>
>> +
>> +#define SE_I2C_TX_TRANS_LEN            0x26c
>> +#define SE_I2C_RX_TRANS_LEN            0x270
>> +#define SE_I2C_SCL_COUNTERS            0x278
>> +
>> +#define SE_I2C_ERR  (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE_EN |\
>> +                       M_GP_IRQ_1_EN | M_GP_IRQ_3_EN | M_GP_IRQ_4_EN)
>> +#define SE_I2C_ABORT           BIT(1)
>> +
>> +/* M_CMD OP codes for I2C */
>> +#define I2C_WRITE              0x1
>> +#define I2C_READ               0x2
>> +#define I2C_WRITE_READ         0x3
>> +#define I2C_ADDR_ONLY          0x4
>> +#define I2C_BUS_CLEAR          0x6
>> +#define I2C_STOP_ON_BUS                0x7
>> +/* M_CMD params for I2C */
>> +#define PRE_CMD_DELAY          BIT(0)
>> +#define TIMESTAMP_BEFORE       BIT(1)
>> +#define STOP_STRETCH           BIT(2)
>> +#define TIMESTAMP_AFTER                BIT(3)
>> +#define POST_COMMAND_DELAY     BIT(4)
>> +#define IGNORE_ADD_NACK                BIT(6)
>> +#define READ_FINISHED_WITH_ACK BIT(7)
>> +#define BYPASS_ADDR_PHASE      BIT(8)
>> +#define SLV_ADDR_MSK           GENMASK(15, 9)
>> +#define SLV_ADDR_SHFT          9
>> +/* I2C SCL COUNTER fields */
>> +#define HIGH_COUNTER_MSK       GENMASK(29, 20)
>> +#define HIGH_COUNTER_SHFT      20
>> +#define LOW_COUNTER_MSK                GENMASK(19, 10)
>> +#define LOW_COUNTER_SHFT       10
>> +#define CYCLE_COUNTER_MSK      GENMASK(9, 0)
>> +
>> +#define GP_IRQ0                        0
>> +#define GP_IRQ1                        1
>> +#define GP_IRQ2                        2
>> +#define GP_IRQ3                        3
>> +#define GP_IRQ4                        4
>> +#define GP_IRQ5                        5
>> +#define GENI_OVERRUN           6
>> +#define GENI_ILLEGAL_CMD       7
>> +#define GENI_ABORT_DONE                8
>> +#define GENI_TIMEOUT           9
> 
> Above should be an enum; then use the enum type as the parameter to
> geni_i2c_err() so it's obvious that "err" is not a normal linux error
> code.
> 
> 
>> +#define I2C_NACK               GP_IRQ1
>> +#define I2C_BUS_PROTO          GP_IRQ3
>> +#define I2C_ARB_LOST           GP_IRQ4
> 
> Get rid of definition of GP_IRQ1, 3, and 4 and just define I2C_NACK,
> I2C_BUS_PROTO, and I2C_ARB_LOST directly.
> 
> 
>> +#define DM_I2C_CB_ERR          ((BIT(GP_IRQ1) | BIT(GP_IRQ3) | BIT(GP_IRQ4)) \
>> +                                                                       << 5)
> 
> Should these really be using "GP_IRQ1", "GP_IRQ3", and "GP_IRQ4".
> Does this use of those numbers have anything to do with the other use
> of them?  Seems like this should just be BIT(1) | BIT(3) | BIT(4).
> 
> Said another way: does bit 1 in this field coorespond to NACK, bit 3
> correspond to BUS_PROTO, and bit 4 correspond to ARB_LOST?  If not
> then I see no reason to try to tie them together.  If they do
> correspond then use BIT(I2C_NACK), etc...
> 
The programming manual identifies the bits of the IRQ_STATUS register as 
GP_IRQ* and when the concerned serial engines are used as I2C 
controllers, those bit fields mean NACK, BUS_PROTO, ARB_LOST, etc. That 
is why it was mentioned that way. I will update as you point out.
> 
>> +
>> +#define I2C_AUTO_SUSPEND_DELAY 250
> 
> Why 250 ms?  That seems like an eternity.  Is it really that expensive
> to turn resources off and on?  I would sorta just expect clocks and
> stuff to get turned off right after a transaction finished unless
> another one was pending right behind it...
> 
> 
>> +#define KHz(freq)              (1000 * freq)
> 
> I probably wouldn't define KHz macro and just used numbers like 100000
> like all the other i2c drivers, but I guess it's OK.  Should be all
> caps, though?
I will change to all caps.
> 
> 
>> +#define PACKING_BYTES_PW       4
>> +
>> +struct geni_i2c_dev {
>> +       struct geni_se se;
>> +       u32 tx_wm;
>> +       int irq;
>> +       int err;
>> +       struct i2c_adapter adap;
>> +       struct completion done;
>> +       struct i2c_msg *cur;
>> +       int cur_wr;
>> +       int cur_rd;
>> +       u32 clk_freq_out;
>> +       const struct geni_i2c_clk_fld *clk_fld;
>> +};
>> +
>> +struct geni_i2c_err_log {
>> +       int err;
>> +       const char *msg;
>> +};
>> +
>> +static struct geni_i2c_err_log gi2c_log[] = {
> 
> static const?
Ok.
> 
> 
>> +       [GP_IRQ0] = {-EINVAL, "Unknown I2C err GP_IRQ0"},
>> +       [I2C_NACK] = {-ENOTCONN, "NACK: slv unresponsive, check its power/reset-ln"},
> 
> Longer than 80 characters; don't split the string, but you could still
> wrap better.
In the v2 patch, there was a comment to break the 80 character limit to 
improve the readability.
> 
> 
>> +       [GP_IRQ2] = {-EINVAL, "Unknown I2C err GP IRQ2"},
>> +       [I2C_BUS_PROTO] = {-EPROTO, "Bus proto err, noisy/unepxected start/stop"},
>> +       [I2C_ARB_LOST] = {-EBUSY, "Bus arbitration lost, clock line undriveable"},
>> +       [GP_IRQ5] = {-EINVAL, "Unknown I2C err GP IRQ5"},
>> +       [GENI_OVERRUN] = {-EIO, "Cmd overrun, check GENI cmd-state machine"},
>> +       [GENI_ILLEGAL_CMD] = {-EILSEQ, "Illegal cmd, check GENI cmd-state machine"},
>> +       [GENI_ABORT_DONE] = {-ETIMEDOUT, "Abort after timeout successful"},
>> +       [GENI_TIMEOUT] = {-ETIMEDOUT, "I2C TXN timed out"},
>> +};
>> +
>> +struct geni_i2c_clk_fld {
>> +       u32     clk_freq_out;
>> +       u8      clk_div;
>> +       u8      t_high;
>> +       u8      t_low;
>> +       u8      t_cycle;
>> +};
>> +
>> +static const struct geni_i2c_clk_fld geni_i2c_clk_map[] = {
>> +       {KHz(100), 7, 10, 11, 26},
>> +       {KHz(400), 2,  5, 12, 24},
>> +       {KHz(1000), 1, 3,  9, 18},
> 
> So I guess this is all relying on an input serial clock of 19.2MHz?
> Maybe document that?
> 
> Assuming I'm understanding the math here, is it really OK for your
> 100kHz and 1MHz mode to be running slightly fast?
> 
> 19200. / 2 / 24
>>>> 400.0
> 
> 19200. / 7 / 26
>>>> 105.49450549450549
> 
> 19200. / 1 / 18
>>>> 1066.6666666666667
> 
> It seems like you'd want the fastest clock that you can make that's
> _less than_ the spec.
> 
> 
> It would also be interesting to know if it's expected that boards
> might need to tweak the t_high / t_low depending on their electrical
> characteristics.  In the past I've had lots of requests from board
> makers to tweak things because they've got a long trace, or a stronger
> or weaker pull, or ...  If so we might later need to add some dts
> properties like "i2c-scl-rising-time-ns" and make the math more
> dynamic here, unless your hardware somehow automatically adjusts for
> this type of thing...
> 
> 
>> +};
>> +
>> +static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>> +{
>> +       int i;
>> +       const struct geni_i2c_clk_fld *itr = geni_i2c_clk_map;
>> +
>> +       for (i = 0; i < ARRAY_SIZE(geni_i2c_clk_map); i++, itr++) {
>> +               if (itr->clk_freq_out == gi2c->clk_freq_out) {
>> +                       gi2c->clk_fld = geni_i2c_clk_map + i;
> 
> Isn't "geni_i2c_clk_map + i" just "itr"?
Yes right.
> 
> 
>> +                       return 0;
>> +               }
>> +       }
>> +       return -EINVAL;
>> +}
>> +
>> +static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
>> +{
>> +       const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>> +       u32 val;
>> +
>> +       writel_relaxed(0, gi2c->se.base + SE_GENI_CLK_SEL);
>> +
>> +       val = (itr->clk_div << CLK_DIV_SHFT) | SER_CLK_EN;
>> +       writel_relaxed(val, gi2c->se.base + GENI_SER_M_CLK_CFG);
>> +
>> +       val = itr->t_high << HIGH_COUNTER_SHFT;
>> +       val |= itr->t_low << LOW_COUNTER_SHFT;
>> +       val |= itr->t_cycle;
>> +       writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
>> +       /*
>> +        * Ensure later writes/reads to serial engine register block is
>> +        * not reordered before this point.
>> +        */
>> +       mb();
> 
> This mb() is to make sure that later writes to "gi2c->se.base" are not
> reordered to be above the ones in this function?  You don't need a
> mb().  writel_relaxed() already enforces this.
Let me check if there are no readl_relaxed after this. If not, I will 
remove the barrier.
> 
> 
>> +}
>> +
>> +static void geni_i2c_err_misc(struct geni_i2c_dev *gi2c)
>> +{
>> +       u32 m_cmd = readl_relaxed(gi2c->se.base + SE_GENI_M_CMD0);
>> +       u32 m_stat = readl_relaxed(gi2c->se.base + SE_GENI_M_IRQ_STATUS);
>> +       u32 geni_s = readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
>> +       u32 geni_ios = readl_relaxed(gi2c->se.base + SE_GENI_IOS);
>> +       u32 dma = readl_relaxed(gi2c->se.base + SE_GENI_DMA_MODE_EN);
>> +       u32 rx_st, tx_st;
>> +
>> +       if (dma) {
>> +               rx_st = readl_relaxed(gi2c->se.base + SE_DMA_RX_IRQ_STAT);
>> +               tx_st = readl_relaxed(gi2c->se.base + SE_DMA_TX_IRQ_STAT);
>> +       } else {
>> +               rx_st = readl_relaxed(gi2c->se.base + SE_GENI_RX_FIFO_STATUS);
>> +               tx_st = readl_relaxed(gi2c->se.base + SE_GENI_TX_FIFO_STATUS);
>> +       }
>> +       dev_dbg(gi2c->se.dev, "DMA:%d tx_stat:0x%x, rx_stat:0x%x, irq-stat:0x%x\n",
>> +               dma, tx_st, rx_st, m_stat);
>> +       dev_dbg(gi2c->se.dev, "m_cmd:0x%x, geni_status:0x%x, geni_ios:0x%x\n",
>> +               m_cmd, geni_s, geni_ios);
>> +}
>> +
>> +static void geni_i2c_err(struct geni_i2c_dev *gi2c, int err)
>> +{
>> +       gi2c->err = gi2c_log[err].err;
> 
> You should only set gi2c->err if it was 0 to start with.  You want
> "err" to contain the first error, not the last one.  This is
> especially important due to the comment elsewhere in this patch "if
> this is err with done-bit not set, handle that through timeout".  You
> don't want the timeout to clobber the true error.
True.
> 
> 
> On a separate note: I wonder if it makes sense to couch the rest of
> this function in something that will compile to a no-op if DEBUG and
> DYNAMIC_DEBUG aren't defined?  Then you can avoid including code for
> all these readl calls.
Given that these are not common scenarios, it may be a premature 
optimization.
> 
>> +       if (gi2c->cur)
>> +               dev_dbg(gi2c->se.dev, "len:%d, slv-addr:0x%x, RD/WR:%d\n",
>> +                       gi2c->cur->len, gi2c->cur->addr, gi2c->cur->flags);
>> +       dev_dbg(gi2c->se.dev, "%s\n", gi2c_log[err].msg);
>> +
>> +       if (err != I2C_NACK && err != GENI_ABORT_DONE)
>> +               geni_i2c_err_misc(gi2c);
>> +}
>> +
>> +static irqreturn_t geni_i2c_irq(int irq, void *dev)
>> +{
>> +       struct geni_i2c_dev *gi2c = dev;
>> +       int j;
>> +       u32 m_stat = readl_relaxed(gi2c->se.base + SE_GENI_M_IRQ_STATUS);
>> +       u32 rx_st = readl_relaxed(gi2c->se.base + SE_GENI_RX_FIFO_STATUS);
>> +       u32 dm_tx_st = readl_relaxed(gi2c->se.base + SE_DMA_TX_IRQ_STAT);
>> +       u32 dm_rx_st = readl_relaxed(gi2c->se.base + SE_DMA_RX_IRQ_STAT);
>> +       u32 dma = readl_relaxed(gi2c->se.base + SE_GENI_DMA_MODE_EN);
>> +       struct i2c_msg *cur = gi2c->cur;
>> +
>> +       if (!cur ||
>> +           m_stat & (M_CMD_FAILURE_EN | M_CMD_ABORT_EN) ||
>> +           dm_rx_st & (DM_I2C_CB_ERR)) {
>> +               if (m_stat & M_GP_IRQ_1_EN)
>> +                       geni_i2c_err(gi2c, I2C_NACK);
>> +               if (m_stat & M_GP_IRQ_3_EN)
>> +                       geni_i2c_err(gi2c, I2C_BUS_PROTO);
>> +               if (m_stat & M_GP_IRQ_4_EN)
>> +                       geni_i2c_err(gi2c, I2C_ARB_LOST);
>> +               if (m_stat & M_CMD_OVERRUN_EN)
>> +                       geni_i2c_err(gi2c, GENI_OVERRUN);
>> +               if (m_stat & M_ILLEGAL_CMD_EN)
>> +                       geni_i2c_err(gi2c, GENI_ILLEGAL_CMD);
>> +               if (m_stat & M_CMD_ABORT_EN)
>> +                       geni_i2c_err(gi2c, GENI_ABORT_DONE);
>> +               if (m_stat & M_GP_IRQ_0_EN)
>> +                       geni_i2c_err(gi2c, GP_IRQ0);
>> +
>> +               /* Disable the TX Watermark interrupt to stop TX */
>> +               if (!dma)
>> +                       writel_relaxed(0, gi2c->se.base +
>> +                                          SE_GENI_TX_WATERMARK_REG);
>> +               goto irqret;
>> +       }
>> +
>> +       if (dma) {
>> +               dev_dbg(gi2c->se.dev, "i2c dma tx:0x%x, dma rx:0x%x\n",
>> +                       dm_tx_st, dm_rx_st);
>> +               goto irqret;
>> +       }
>> +
>> +       if (cur->flags & I2C_M_RD &&
>> +           m_stat & (M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN)) {
>> +               u32 rxcnt = rx_st & RX_FIFO_WC_MSK;
>> +
>> +               for (j = 0; j < rxcnt; j++) {
>> +                       u32 val;
>> +                       int p = 0;
>> +
>> +                       val = readl_relaxed(gi2c->se.base + SE_GENI_RX_FIFOn);
>> +                       while (gi2c->cur_rd < cur->len && p < sizeof(val)) {
>> +                               cur->buf[gi2c->cur_rd++] = val & 0xff;
>> +                               val >>= 8;
>> +                               p++;
>> +                       }
>> +                       if (gi2c->cur_rd == cur->len)
>> +                               break;
>> +               }
>> +       } else if (!(cur->flags & I2C_M_RD) &&
>> +                  m_stat & M_TX_FIFO_WATERMARK_EN) {
>> +               for (j = 0; j < gi2c->tx_wm; j++) {
>> +                       u32 temp;
>> +                       u32 val = 0;
>> +                       int p = 0;
>> +
>> +                       while (gi2c->cur_wr < cur->len && p < sizeof(val)) {
>> +                               temp = (u32)cur->buf[gi2c->cur_wr++];
> 
> What is the (u32) cast doing here?
The intention is to cast a char to u32. I will revisit its purpose and 
also check if any warnings were observed.
> 
> 
>> +                               val |= (temp << (p * 8));
> 
> Get rid of extra parenthesis.
Ok.
> 
> 
>> +                               p++;
>> +                       }
>> +                       writel_relaxed(val, gi2c->se.base + SE_GENI_TX_FIFOn);
>> +                       /* TX Complete, Disable the TX Watermark interrupt */
>> +                       if (gi2c->cur_wr == cur->len) {
>> +                               writel_relaxed(0, gi2c->se.base +
>> +                                               SE_GENI_TX_WATERMARK_REG);
>> +                               break;
>> +                       }
>> +               }
>> +       }
>> +irqret:
>> +       if (m_stat)
>> +               writel_relaxed(m_stat, gi2c->se.base + SE_GENI_M_IRQ_CLEAR);
>> +
>> +       if (dma) {
>> +               if (dm_tx_st)
>> +                       writel_relaxed(dm_tx_st, gi2c->se.base +
>> +                                               SE_DMA_TX_IRQ_CLR);
>> +               if (dm_rx_st)
>> +                       writel_relaxed(dm_rx_st, gi2c->se.base +
>> +                                               SE_DMA_RX_IRQ_CLR);
>> +       }
>> +       /* if this is err with done-bit not set, handle that through timeout. */
>> +       if (m_stat & M_CMD_DONE_EN)
>> +               complete(&gi2c->done);
>> +       else if ((dm_tx_st & TX_DMA_DONE) || (dm_rx_st & RX_DMA_DONE))
>> +               complete(&gi2c->done);
>> +
>> +       return IRQ_HANDLED;
>> +}
>> +
>> +static void geni_i2c_abort_xfer(struct geni_i2c_dev *gi2c)
>> +{
>> +       u32 val;
>> +       unsigned long timeout = HZ;
> 
> Rename to time_left?  ...and maybe use a #define for the init value?
Ok.
> 
> 
>> +
>> +       geni_i2c_err(gi2c, GENI_TIMEOUT);
>> +       gi2c->cur = NULL;
> 
> Don't you need a spinlock or something?  In most of the other cases
> you could get away with no locking because the irq isn't happening at
> the same time as other code that's mucking with stuff, but in the
> timeout case we may be mucking with stuff at the same time as the irq.
Except for aborting the current command, there is no yanking away of 
buffer used by IRQ. But I will check the programming manual regarding 
what will happen to the contents of the RX FIFO & access to the TX FIFO 
when the command gets aborted.
> 
> 
>> +       geni_se_abort_m_cmd(&gi2c->se);
>> +       do {
>> +               timeout = wait_for_completion_timeout(&gi2c->done, timeout);
>> +               val = readl_relaxed(gi2c->se.base + SE_GENI_M_IRQ_STATUS);
>> +       } while (!(val & M_CMD_ABORT_EN) && timeout);
> 
> Print an error if there was a timeout aborting?
Ok.
> 
> 
>> +}
>> +
>> +static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>> +                               u32 m_param)
>> +{
>> +       dma_addr_t rx_dma;
>> +       enum geni_se_xfer_mode mode;
>> +       unsigned long timeout;
>> +
>> +       gi2c->cur = msg;
>> +       mode = msg->len > 32 ? GENI_SE_DMA : GENI_SE_FIFO;
> 
> DMA is hard and i2c transfers > 32 bytes are rare.  Do we really gain
> a lot by transferring i2c commands over DMA compared to a FIFO?
> Enough to justify the code complexity and the set of bugs that will
> show up?  I'm sure it will be a controversial assertion given that the
> code's already written, but personally I'd be supportive of ripping
> DMA mode out to simplify the driver.  I'd be curious if anyone else
> agrees.  To me it seems like premature optimization.
> 
> 
>> +       geni_se_select_mode(&gi2c->se, mode);
>> +       writel_relaxed(msg->len, gi2c->se.base + SE_I2C_RX_TRANS_LEN);
>> +       geni_se_setup_m_cmd(&gi2c->se, I2C_READ, m_param);
>> +       if (mode == GENI_SE_DMA) {
>> +               rx_dma = geni_se_rx_dma_prep(&gi2c->se, msg->buf, msg->len);
> 
> Randomly I noticed a flag called "I2C_M_DMA_SAFE".  Do we need to
> check this flag before using msg->buf for DMA?  ...or use
> i2c_get_dma_safe_msg_buf()?
> 
> ...btw: the relative lack of people doing this in the kernel is
> further evidence of DMA not really being worth it for i2c busses.
> 
> 
>> +               if (!rx_dma) {
>> +                       mode = GENI_SE_FIFO;
>> +                       geni_se_select_mode(&gi2c->se, mode);
>> +               }
>> +       }
>> +
>> +       timeout = wait_for_completion_timeout(&gi2c->done, HZ);
> 
> Perhaps make a #define for the timeout instead of just hardcoding HZ (1 second).
> 
> 
>> +       if (!timeout)
> 
> Can you rename "timeout" to "time_left"?  Otherwise this read like "if
> there wasn't a timeout then abort".
> 
> 
>> +               geni_i2c_abort_xfer(gi2c);
>> +
>> +       gi2c->cur_rd = 0;
>> +       if (mode == GENI_SE_DMA) {
>> +               if (gi2c->err) {
>> +                       writel_relaxed(1, gi2c->se.base + SE_DMA_RX_FSM_RST);
>> +                       wait_for_completion_timeout(&gi2c->done, HZ);
> 
> Worth printing an error if this one times out?  Seems like we'd be in
> bad shape...
Ok.
> 
> ...also: to be paranoid do you need a re_init_completion before you
> reset things?  In theory one could conceive of the concept that the
> earlier completion timed out and then the DMA interrupt came right
> after.  Now there will be a completion already on the books so your
> wait will return instantly even though the reset hasn't been done.
> 
reinit_completion can help only if the prior DMA interrupt came before 
reinit_completion. If it comes after reinit_completion, then it will end 
up signaling the wait prematurely.

Rather the better idea is to wait and check if indeed the reset is done. 
If it is done, then all is fine. Else go back to wait again. Same logic 
like in the case of abort.
> 
>> +               }
>> +               geni_se_rx_dma_unprep(&gi2c->se, rx_dma, msg->len);
>> +       }
>> +       if (gi2c->err)
>> +               dev_err(gi2c->se.dev, "i2c error :%d\n", gi2c->err);
> 
> OK, so I'm a bit baffled.  You've got all these tables in this driver
> that give you nice/informative error messages.  Then those nice error
> messages are just calling dev_dbg() and here you print out an arcane
> linux error?
Agree, I will try to log a human-readable error while avoiding the log spew.
> 
> Also: seems like you wouldn't want to print errors for NACKs, right?
> Otherwise i2cdetect is going to be spewing isn't it?
> 
> 
>> +       return gi2c->err;
>> +}
>> +
>> +static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>> +                               u32 m_param)
>> +{
>> +       dma_addr_t tx_dma;
>> +       enum geni_se_xfer_mode mode;
>> +       unsigned long timeout;
>> +
>> +       gi2c->cur = msg;
>> +       mode = msg->len > 32 ? GENI_SE_DMA : GENI_SE_FIFO;
>> +       geni_se_select_mode(&gi2c->se, mode);
>> +       writel_relaxed(msg->len, gi2c->se.base + SE_I2C_TX_TRANS_LEN);
>> +       geni_se_setup_m_cmd(&gi2c->se, I2C_WRITE, m_param);
>> +       if (mode == GENI_SE_DMA) {
>> +               tx_dma = geni_se_tx_dma_prep(&gi2c->se, msg->buf, msg->len);
>> +               if (!tx_dma) {
>> +                       mode = GENI_SE_FIFO;
>> +                       geni_se_select_mode(&gi2c->se, mode);
>> +               }
>> +       }
>> +
>> +       if (mode == GENI_SE_FIFO) /* Get FIFO IRQ */
>> +               writel_relaxed(1, gi2c->se.base + SE_GENI_TX_WATERMARK_REG);
>> +
>> +       timeout = wait_for_completion_timeout(&gi2c->done, HZ);
>> +       if (!timeout)
>> +               geni_i2c_abort_xfer(gi2c);
>> +
>> +       gi2c->cur_wr = 0;
>> +       if (mode == GENI_SE_DMA) {
>> +               if (gi2c->err) {
>> +                       writel_relaxed(1, gi2c->se.base + SE_DMA_TX_FSM_RST);
>> +                       wait_for_completion_timeout(&gi2c->done, HZ);
>> +               }
>> +               geni_se_tx_dma_unprep(&gi2c->se, tx_dma, msg->len);
>> +       }
>> +       if (gi2c->err)
>> +               dev_err(gi2c->se.dev, "i2c error :%d\n", gi2c->err);
>> +       return gi2c->err;
>> +}
>> +
>> +static int geni_i2c_xfer(struct i2c_adapter *adap,
>> +                        struct i2c_msg msgs[],
>> +                        int num)
>> +{
>> +       struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
>> +       int i, ret;
>> +
>> +       gi2c->err = 0;
>> +       reinit_completion(&gi2c->done);
>> +       ret = pm_runtime_get_sync(gi2c->se.dev);
>> +       if (ret < 0) {
>> +               dev_err(gi2c->se.dev, "error turning SE resources:%d\n", ret);
>> +               pm_runtime_put_noidle(gi2c->se.dev);
>> +               /* Set device in suspended since resume failed */
>> +               pm_runtime_set_suspended(gi2c->se.dev);
>> +               return ret;
> 
> Wow, that's a cluster of arcane calls to handle a call that probably
> will never fail (it just enables clocks and sets pinctrl).  Sigh.
> ...but as far as I can tell the whole sequence is right.  You
> definitely need a "put" after a failed get and it looks like
> pm_runtime_set_suspended() has a special exception where it can be
> called if you got a runtime error...
> 
> 
>> +       }
>> +
>> +       qcom_geni_i2c_conf(gi2c);
>> +       for (i = 0; i < num; i++) {
>> +               u32 m_param = i < (num - 1) ? STOP_STRETCH : 0;
>> +
>> +               m_param |= ((msgs[i].addr << SLV_ADDR_SHFT) & SLV_ADDR_MSK);
>> +
>> +               if (msgs[i].flags & I2C_M_RD)
>> +                       ret = geni_i2c_rx_one_msg(gi2c, &msgs[i], m_param);
>> +               else
>> +                       ret = geni_i2c_tx_one_msg(gi2c, &msgs[i], m_param);
>> +
>> +               if (ret) {
>> +                       dev_err(gi2c->se.dev, "i2c error %d @ %d\n", ret, i);
>> +                       break;
>> +               }
>> +       }
>> +       if (ret == 0)
>> +               ret = num;
>> +
>> +       pm_runtime_mark_last_busy(gi2c->se.dev);
>> +       pm_runtime_put_autosuspend(gi2c->se.dev);
>> +       gi2c->cur = NULL;
>> +       gi2c->err = 0;
>> +       return ret;
>> +}
>> +
>> +static u32 geni_i2c_func(struct i2c_adapter *adap)
>> +{
>> +       return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
>> +}
>> +
>> +static const struct i2c_algorithm geni_i2c_algo = {
>> +       .master_xfer    = geni_i2c_xfer,
>> +       .functionality  = geni_i2c_func,
>> +};
>> +
>> +static int geni_i2c_probe(struct platform_device *pdev)
>> +{
>> +       struct geni_i2c_dev *gi2c;
>> +       struct resource *res;
>> +       u32 proto, tx_depth;
>> +       int ret;
>> +
>> +       gi2c = devm_kzalloc(&pdev->dev, sizeof(*gi2c), GFP_KERNEL);
>> +       if (!gi2c)
>> +               return -ENOMEM;
>> +
>> +       gi2c->se.dev = &pdev->dev;
>> +       gi2c->se.wrapper = dev_get_drvdata(pdev->dev.parent);
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       gi2c->se.base = devm_ioremap_resource(&pdev->dev, res);
>> +       if (IS_ERR(gi2c->se.base)) {
>> +               ret = PTR_ERR(gi2c->se.base);
>> +               dev_err(&pdev->dev, "Err IO Mapping register block %d\n", ret);
> 
> No need for error message with devm_ioremap_resource().
Ok.
> 
> 
>> +               return ret;
>> +       }
>> +
>> +       gi2c->se.clk = devm_clk_get(&pdev->dev, "se");
>> +       if (IS_ERR(gi2c->se.clk)) {
>> +               ret = PTR_ERR(gi2c->se.clk);
>> +               dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       ret = device_property_read_u32(&pdev->dev, "clock-frequency",
>> +                                                       &gi2c->clk_freq_out);
>> +       if (ret) {
>> +               dev_info(&pdev->dev,
>> +                       "Bus frequency not specified, default to 400KHz.\n");
>> +               gi2c->clk_freq_out = KHz(400);
>> +       }
> 
> I feel like it should default to 100KHz.  i2c_parse_fw_timings()
> defaults to this and to me the wording "New drivers almost always
> should use the defaults" makes me feel this should be the defaults.
> 
>> +
>> +       gi2c->irq = platform_get_irq(pdev, 0);
>> +       if (gi2c->irq < 0) {
>> +               dev_err(&pdev->dev, "IRQ error for i2c-geni\n");
>> +               return gi2c->irq;
>> +       }
>> +
>> +       ret = geni_i2c_clk_map_idx(gi2c);
>> +       if (ret) {
>> +               dev_err(&pdev->dev, "Invalid clk frequency %d KHz: %d\n",
>> +                       gi2c->clk_freq_out, ret);
> 
> Need a divide by 1000 since your printout includes "KHz".  Also note
> that the proper Si units is kHz not KHz, isn't it?
I will remove the KHz and just log as Hz.
> 
> 
>> +               return ret;
>> +       }
>> +
>> +       gi2c->adap.algo = &geni_i2c_algo;
>> +       init_completion(&gi2c->done);
>> +       platform_set_drvdata(pdev, gi2c);
>> +       ret = devm_request_irq(&pdev->dev, gi2c->irq, geni_i2c_irq,
>> +                              IRQF_TRIGGER_HIGH, "i2c_geni", gi2c);
>> +       if (ret) {
>> +               dev_err(&pdev->dev, "Request_irq failed:%d: err:%d\n",
>> +                       gi2c->irq, ret);
>> +               return ret;
>> +       }
>> +       disable_irq(gi2c->irq);
> 
> Can you explain the goal of the disable_irq() here.  Is it actually
> needed for something or does it somehow save power?  From drivers I've
> reviewed in the past this doesn't seem like a common thing to do, so
> I'm curious what it's supposed to gain for you.  I'd be inclined to
> just delete the whole disable/enable of the irq from this driver.
> 
> 
>> +       i2c_set_adapdata(&gi2c->adap, gi2c);
>> +       gi2c->adap.dev.parent = &pdev->dev;
>> +       gi2c->adap.dev.of_node = pdev->dev.of_node;
>> +       strlcpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
>> +
>> +       ret = geni_se_resources_on(&gi2c->se);
>> +       if (ret) {
>> +               dev_err(&pdev->dev, "Error turning on resources %d\n", ret);
>> +               return ret;
>> +       }
>> +       proto = geni_se_read_proto(&gi2c->se);
>> +       tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
>> +       if (unlikely(proto != GENI_SE_I2C)) {
> 
> Avoid compiler hints like unlikely() unless you're really truly
> optimizing a tight inner loop.  Otherwise let the compiler do its job.
Ok.
> 
> 
>> +               dev_err(&pdev->dev, "Invalid proto %d\n", proto);
>> +               geni_se_resources_off(&gi2c->se);
>> +               return -ENXIO;
>> +       }
>> +       gi2c->tx_wm = tx_depth - 1;
>> +       geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
>> +       geni_se_config_packing(&gi2c->se, BITS_PER_BYTE, PACKING_BYTES_PW,
>> +                                                       true, true, true);
>> +       geni_se_resources_off(&gi2c->se);
>> +       dev_dbg(&pdev->dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
>> +
>> +       pm_runtime_set_suspended(gi2c->se.dev);
>> +       pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
>> +       pm_runtime_use_autosuspend(gi2c->se.dev);
>> +       pm_runtime_enable(gi2c->se.dev);
>> +       i2c_add_adapter(&gi2c->adap);
>> +
>> +       dev_dbg(&pdev->dev, "I2C probed\n");
> 
> Is this really a useful dev_dbg()?  Just turn on initcall debugging...
Can be removed.
> 
> 
>> +       return 0;
>> +}
>> +
>> +static int geni_i2c_remove(struct platform_device *pdev)
>> +{
>> +       struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
>> +
>> +       pm_runtime_disable(gi2c->se.dev);
> 
> Is this right?  You don't want to disable PM Runtime transitions but
> you actually want to force the adapter into suspended state, don't
> you?  I don't see anything that does that...
> 
> 
>> +       i2c_del_adapter(&gi2c->adap);
>> +       return 0;
>> +}
>> +
>> +static int geni_i2c_resume_noirq(struct device *device)
>> +{
>> +       return 0;
>> +}
> 
> No need for a dummy function; just stick NULL in the structure, no?
> 
>> +
>> +#ifdef CONFIG_PM
>> +static int geni_i2c_runtime_suspend(struct device *dev)
>> +{
>> +       struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>> +
>> +       disable_irq(gi2c->irq);
>> +       geni_se_resources_off(&gi2c->se);
>> +       return 0;
>> +}
>> +
>> +static int geni_i2c_runtime_resume(struct device *dev)
>> +{
>> +       int ret;
>> +       struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>> +
>> +       ret = geni_se_resources_on(&gi2c->se);
>> +       if (ret)
>> +               return ret;
>> +
>> +       enable_irq(gi2c->irq);
>> +       return 0;
>> +}
>> +
>> +static int geni_i2c_suspend_noirq(struct device *device)
>> +{
>> +       struct geni_i2c_dev *gi2c = dev_get_drvdata(device);
>> +       int ret;
>> +
>> +       /* Make sure no transactions are pending */
>> +       ret = i2c_trylock_bus(&gi2c->adap, I2C_LOCK_SEGMENT);
>> +       if (!ret) {
>> +               dev_err(gi2c->se.dev, "late I2C transaction request\n");
>> +               return -EBUSY;
>> +       }
> 
> Does this happen?  How?
> 
> Nothing about this code looks special for your hardware.  If this is
> really needed, why is it not part of the i2c core since there's
> nothing specific about your driver here?
> 
> 
>> +       if (!pm_runtime_status_suspended(device)) {
>> +               geni_i2c_runtime_suspend(device);
>> +               pm_runtime_disable(device);
>> +               pm_runtime_set_suspended(device);
>> +               pm_runtime_enable(device);
>> +       }
> 
> Similar question.  Why do you need this special case code?  Are there
> cases where we're all the way at suspend_noirq and yet we still
> haven't runtime suspended?  Can you please document how we get into
> this state?
> 
> 
>> +       i2c_unlock_bus(&gi2c->adap, I2C_LOCK_SEGMENT);
>> +       return 0;
>> +}
>> +#else
>> +static int geni_i2c_runtime_suspend(struct device *dev)
>> +{
>> +       return 0;
>> +}
>> +
>> +static int geni_i2c_runtime_resume(struct device *dev)
>> +{
>> +       return 0;
>> +}
>> +
>> +static int geni_i2c_suspend_noirq(struct device *device)
>> +{
>> +       return 0;
>> +}
>> +#endif
>> +
>> +static const struct dev_pm_ops geni_i2c_pm_ops = {
>> +       .suspend_noirq          = geni_i2c_suspend_noirq,
>> +       .resume_noirq           = geni_i2c_resume_noirq,
>> +       .runtime_suspend        = geni_i2c_runtime_suspend,
>> +       .runtime_resume         = geni_i2c_runtime_resume,
> 
> Please use SET_NOIRQ_SYSTEM_SLEEP_PM_OPS and SET_RUNTIME_PM_OPS.  Then
> you can get rid of all the dummy functions.  AKA something like:
> 
> static const struct dev_pm_ops geni_i2c_pm_ops = {
>    SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(geni_i2c_suspend_noirq, NULL)
>    SET_RUNTIME_PM_OPS(geni_i2c_runtime_suspend, geni_i2c_runtime_resume, NULL)
> };
> 
Ok.
> 
>> +};
>> +
>> +static const struct of_device_id geni_i2c_dt_match[] = {
>> +       { .compatible = "qcom,geni-i2c" },
>> +       {}
>> +};
>> +MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
>> +
>> +static struct platform_driver geni_i2c_driver = {
>> +       .probe  = geni_i2c_probe,
>> +       .remove = geni_i2c_remove,
>> +       .driver = {
>> +               .name = "geni_i2c",
>> +               .pm = &geni_i2c_pm_ops,
>> +               .of_match_table = geni_i2c_dt_match,
>> +       },
>> +};
>> +
>> +module_platform_driver(geni_i2c_driver);
>> +
>> +MODULE_DESCRIPTION("I2C Controller Driver for GENI based QUP cores");
>> +MODULE_LICENSE("GPL v2");

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
