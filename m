Return-Path: <wuht06@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPDyKFp=XH+Vo_diRyhrMuB+v1rmTmxo3Lid3Wc-u1ohqNisKw@mail.gmail.com>
References: <1439571353-30165-1-git-send-email-wuht06@gmail.com>
	<1439571353-30165-2-git-send-email-wuht06@gmail.com>
	<CAPDyKFp=XH+Vo_diRyhrMuB+v1rmTmxo3Lid3Wc-u1ohqNisKw@mail.gmail.com>
Date: Mon, 28 Sep 2015 15:18:16 +0800
Message-ID: <CAG_R4_VTXCV4NVMOwv-9F56-_pVsK0hU4go79ZhV3OFxwcF0mA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] mmc: sprd: Add MMC host driver for Spreadtrum SoC
From: Hongtao Wu <wuht06@gmail.com>
Content-Type: multipart/alternative; boundary=089e0149c372480f570520c9802e
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc <linux-mmc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Lin <shawn.lin@rock-chips.com>, "Orson.Zhai@spreadtrum.com" <Orson.Zhai@spreadtrum.com>, "Chunyan.Zhang@spreadtrum.com" <Chunyan.Zhang@spreadtrum.com>, "Jason.Wu@spreadtrum.com" <Jason.Wu@spreadtrum.com>
List-ID: <devicetree@vger.kernel.org>

--089e0149c372480f570520c9802e
Content-Type: text/plain; charset=UTF-8

>>

On Thu, Sep 10, 2015 at 9:28 PM, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On 14 August 2015 at 18:55, Hongtao Wu <wuht06@gmail.com> wrote:
> > the Spreadtrum MMC host driver is used to supply EMMC, SD, and
> > SDIO types of memory cards
>
> Perhaps some more information about the controller. Are there any
> specific features it support or doesn't support!?

Thanks for kindly reply.
Yes, spreadtrum MMC host controllers have some specific features as follows:
(1) We don't have controls for sampling clock tuning and re-tuning, we take
      place of them with three registers as follows:
       (a) CLK_WR_DL(Offset 080h): Data write clock delay line.
       (b) CLK_RD_POS_DL(Offset 0x84h): Posedge data read clock delay line.
       (c) CLK_RD_NEG_DL(Offset 088h): Negedge data read clock delay line.

(2) We don't have Power Control Register(Offset 029h), all our controller's
power
      come from PMIC, rather than directly from CPU.

(3) We don't have bit[6](Card Insertion), bit[7] (Card Removal), bit[8]
(Card Interrupt)
and bit[12:9] in Normal Interrupt Status Register(Offset 030h). Because the
detect
gpio pin doesn't connect to the register of our host controller. So we can't
operate bit[18:16](Card Detect Pin Level, Card State stable and Card
Inserted)
in Present State Register(Offset 024h).

>
> Moreover it would be nice to know a bit more what this patch contains.
> For example, you have some debugfs support, what's that?
>
Debugfs is a debug file system about MMC, where we can check some message
about MMC host controller register. Maybe we will improve it and  handle
that in
a separate patch.
Also, we have PM and runtime PM support, which may not be so important  at
this
stage. And we will commit it with a separate patch.

> >
> > Signed-off-by: Billows Wu(WuHongtao) <wuht06@gmail.com>
> > ---
> >  drivers/mmc/host/Kconfig               |    6 +
> >  drivers/mmc/host/Makefile              |    1 +
> >  drivers/mmc/host/sprd_sdhost.c         | 1202
++++++++++++++++++++++++++++++++
> >  drivers/mmc/host/sprd_sdhost.h         |  615 ++++++++++++++++
>
> Just by looking at number of lines here, it tells me that the size of
> header file is just way too big. It's half the size of the c-file,
> that just can't be right. :-)
>
> Just to make it clear. I don't like "one-liner" wrapper functions nor
> macros. If you remove these kind of stuff, the total size would shrink
> significantly I belive.
>
I am sorry. I wrap so many "one-liner" functions. But I have some reasons
to do it.

Firstly, the registers in some of our MMC host controller is designed to
4-byte aligned, but in others are not. So we use __local_readx() or
__local_writex() to calls readx_relaxed() or writex_relaxed(), and use
sdhost_readx() or sdhost_writex() to call __local_readx() or
__local_writex().
Maybe in the future, all our controller will use 4-byte non-aligned. Then
we will use readx_relaxed() or writex_relaxed() directly.

Secondly, in sprd_sdhost.h, For every register we supply corresponding
operation function, i.e, for SDHOST_16_BLK_SIZE(0x04), we use
_sdhost_set_blk_size() to write the block size. Every register corresponding
to an operation function, which logic is nice, I think. What is your
opinion?

The above two points also interpret why the size of the header file is so
big.

> >  drivers/mmc/host/sprd_sdhost_debugfs.c |  212 ++++++
> >  drivers/mmc/host/sprd_sdhost_debugfs.h |   27 +
>
> I had a brief look at the debugfs support, let me suggest that we
> handle that in a separate patch.
>
> Perhaps, some of that code can also be made more generic and used by
> the mmc core instead.

Thanks. I will handle it as a separate patch and use mmc core as possibly
as I can.

>
> >  6 files changed, 2063 insertions(+)
> >  create mode 100644 drivers/mmc/host/sprd_sdhost.c
> >  create mode 100644 drivers/mmc/host/sprd_sdhost.h
> >  create mode 100644 drivers/mmc/host/sprd_sdhost_debugfs.c
> >  create mode 100644 drivers/mmc/host/sprd_sdhost_debugfs.h

[...]

> > diff --git a/drivers/mmc/host/sprd_sdhost.c
b/drivers/mmc/host/sprd_sdhost.c
> > new file mode 100644
> > index 0000000..95639a3
> > --- /dev/null
> > +++ b/drivers/mmc/host/sprd_sdhost.c
> > @@ -0,0 +1,1202 @@
> > +/*
> > + * linux/drivers/mmc/host/sprd_sdhost.c - Secure Digital Host
Controller
> > + * Interface driver

[...]

> > +
> > +#include "sprd_sdhost.h"
> > +#include "sprd_sdhost_debugfs.h"
> > +
> > +#define DRIVER_NAME "sdhost"
> > +#define SDHOST_CAPS \
>
> Please remove this define it makes it harder to read the code.

I will remove it in next version.

>
> > +               (MMC_CAP_4_BIT_DATA | MMC_CAP_SD_HIGHSPEED | \
> > +               MMC_CAP_ERASE |  MMC_CAP_UHS_SDR50 | \
> > +               MMC_CAP_CMD23 | MMC_CAP_HW_RESET)
> > +
> > +struct sdhost_caps_data {
> > +       char *name;
> > +       u32 ocr_avail;
> > +       u32 caps;
> > +       u32 caps2;
> > +       u32 pm_caps;
> > +       u32 base_clk;
> > +       u32 signal_default_voltage;
> > +};
>
> I don't think you need this struct, as most of this data is already
> present it struct mmc_host. And for that small pieces that isn't you
> might as well just add into your struct sdhost_host.
>

Yes, most of this data can be removed, such as caps, caps2, base_clk.
However ocr_avail and signal_default_voltage are useful for us.
We can't fetch ocr_avail from external regulator via
mmc_regulator_get_supply,
because our regulator driver can't supply mmc_regulator_get_ocrmask()
interface for MMC driver.
And sometimes our external regulator can not supply 3.0v or 1.8v default
signal voltage that we expect. So this 3.0v or 1.8v default signal voltage
are
mandatory.

> > +
> > +struct sdhost_caps_data caps_info_map[] = {
>
> This is the wrong way of how to assign capabilties. Instead
> mmc_of_parse() parses your DT configuration and assign the
> corresponding caps in the struct mmc_host.
>
> > +       {
> > +               .name = "sd",
> > +               .ocr_avail = MMC_VDD_29_30 | MMC_VDD_30_31,
>
> ocr_avail should be fetched from external regulators via
> mmc_regulator_get_supply() API. I don't think you need this at all
> then, right?

For us the ocr_avail can not be fetched from external regulator, and now
we must set it manually. Could we put the ocr_avail and
signal_default_voltage
in dts?
If you have better possible solution how I can fetch ocr_avail via other
way,
please tell me. Thanks.

>
> > +               .caps = SDHOST_CAPS,
> > +               .caps2 = MMC_CAP2_HC_ERASE_SZ,
> > +               .signal_default_voltage = 3000000,
>
> Again, if this is needed you shall use the regulator API to find out
> this information.

Now our regulator driver can not supply this information that we need.
However, I will talk to our regulator driver and hardware owner.
Maybe they can improve that.

>
> > +       },
> > +       {
> > +               .name = "wifi",
> > +               .ocr_avail = MMC_VDD_165_195 | MMC_VDD_29_30 |
> > +                       MMC_VDD_30_31 | MMC_VDD_32_33 | MMC_VDD_33_34,
> > +               .caps = SDHOST_CAPS | MMC_CAP_POWER_OFF_CARD |
> > +                       MMC_CAP_UHS_SDR12,
> > +       },
> > +       {
> > +               .name = "emmc",
> > +               .ocr_avail = MMC_VDD_29_30 | MMC_VDD_30_31,
> > +               .caps = SDHOST_CAPS |
> > +                       MMC_CAP_8_BIT_DATA | MMC_CAP_UHS_SDR12 |
> > +                       MMC_CAP_UHS_SDR25 | MMC_CAP_UHS_DDR50 |
> > +                       MMC_CAP_MMC_HIGHSPEED,
> > +               .signal_default_voltage = 1800000,
> > +       }
> > +};
> > +
> > +#ifdef CONFIG_PM_RUNTIME
>
> Regarding the system PM and runtime PM support, please remove that
> code from $subject patch and let's add that as a separate patch
> instead.
>
OK, I will remove this code in next version, and commit it as a separate
patch.

> The reason is simply that I see way too many strange things going on
> in that part of code, so I decided that it's easier for me to comment
> on them later and separately.

OK, I will improve it.

>
> > +static void _pm_runtime_setting(struct platform_device *pdev,
> > +                               struct sdhost_host *host);
> > +#else
> > +static void _pm_runtime_setting(struct platform_device *pdev,
> > +                               struct sdhost_host *host)
> > +{
> > +}
> > +#endif

[...]

> > +static void __get_rsp(struct sdhost_host *host)
> > +{
> > +       u32 i, offset;
> > +       unsigned int flags = host->cmd->flags;
> > +       u32 *resp = host->cmd->resp;
> > +
> > +       if (!(flags & MMC_RSP_PRESENT))
> > +               return;
> > +
> > +       if (flags & MMC_RSP_136) {
> > +               /* CRC is stripped so we need to do some shifting. */
> > +               for (i = 0, offset = 12; i < 3; i++, offset -= 4) {
> > +                       resp[i] =
> > +                           _sdhost_readl(host,
>
> Just to make it clear around what I mean with "one-liner" wrapprer
> functions, _sdhost_readl() is a perfect example.
>
> _sdhost_readl() calls __local_readl() which calls readl_relaxed().
>
> This is crazy and completely unnecessary complicated. Please just call
> readl_relaxed() here, since it helps me review and understand what's
> going on in the code.
>

Thanks. Just like the relationship sdhci_readl() and readl(), we wrap
readl_relaxed() with sdhost_readl(). Of course, if you think this is
unnecessary, we will improve it.

> As there are many examples of similar cases, please simplify the code
> according to my suggestions.

Thanks for your kindly suggestions.
Do you think we must modify these "one-liner" wrapprer functions right now?
Or can we change it after all our register are 4-byte non-aligned.

>
> > +                                         SDHOST_32_RESPONSE + offset)
<< 8;
> > +                       resp[i] |=
> > +                           _sdhost_readb(host,
> > +                                         SDHOST_32_RESPONSE + offset -
1);
> > +               }
> > +               resp[3] = _sdhost_readl(host, SDHOST_32_RESPONSE) << 8;
> > +       } else {
> > +               resp[0] = _sdhost_readl(host, SDHOST_32_RESPONSE);
> > +       }
> > +}
> > +
> > +static void _send_cmd(struct sdhost_host *host, struct mmc_command
*cmd)
> > +{
> > +       struct mmc_data *data = cmd->data;
> > +       int sg_cnt;
> > +       u32 flag = 0;
> > +       u16 rsp_type = 0;
> > +       int if_has_data = 0;
> > +       int if_mult = 0;
> > +       int if_read = 0;
> > +       int if_dma = 0;
> > +       u16 auto_cmd = __ACMD_DIS;
> > +
> > +       pr_debug("%s(%s)  CMD%d, arg 0x%x, flag 0x%x\n", __func__,
> > +              host->device_name, cmd->opcode, cmd->arg, cmd->flags);
> > +       if (cmd->data)
> > +               pr_debug("%s(%s) block size %d, cnt %d\n", __func__,
> > +                      host->device_name, cmd->data->blksz,
cmd->data->blocks);
> > +
> > +       _sdhost_disable_all_int(host);
>
> Do you really need to turn the IRQs on/off between each an every
> command? If not, it would save you from reading/writing to the
> registers a few times per each commands.

Thanks. I will remove it.
We turn the IRQs on/off between each an every command. Because
some time ago we recieved some undesirable irq when _send_cmd()
function was running, then _irq() function was called. This might be
cause some problem. However, the undesirable irq may not apper this
days. So it's time to remove the IRQs on/off.

>
> > +
> > +       if (MMC_ERASE == cmd->opcode) {
>
> I guess you might already know that the mmc core suffers from a few
> bugs around how to deal with erase/trim/discard. And it's related to
> the max_busy_timeout value.
>
> Now, this fix you have here is okay for now, but we should really fix
> the problem in the core. Host drivers shouldn't have to care about
> this as a specific command.

Thanks. Maybe we shouldn't have to care about MMC_ERASE as a specific
command, however, from a great deal measurement, we find that only CMD38
(MMC_ERASE) take a long time. So we set a long timeout value for it, and for
others the value is short.

BTW,  In order to avoid that hardware timeout is invalid, in every time
before
sending command, we set software timeout(mod_timer()) and hardware timeout
(write value to SDHOST_8_TIMEOUT ).

>
> > +               /* if it is erase command , it's busy time will long,
> > +                * so we set long timeout value here.
> > +                */
> > +               mod_timer(&host->timer, jiffies +
> > +                       msecs_to_jiffies(host->mmc->max_busy_timeout +
1000));
> > +               _sdhost_writeb(host->ioaddr,
> > +                       __DATA_TIMEOUT_MAX_VAL, SDHOST_8_TIMEOUT);
> > +       } else {
> > +               mod_timer(&host->timer,
> > +                       jiffies + (SDHOST_MAX_TIMEOUT + 1) * HZ);
> > +               _sdhost_writeb(host, host->data_timeout_val,
SDHOST_8_TIMEOUT);
> > +       }
> > +
[...]
> > +       host->int_filter = flag;
> > +       _sdhost_enable_int(host, flag);
> > +       pr_debug("sdhost %s CMD%d rsp:0x%x intflag:0x%x\n"
> > +              "if_mult:0x%x if_read:0x%x auto_cmd:0x%x if_dma:0x%x\n",
> > +              host->device_name, cmd->opcode, mmc_resp_type(cmd),
> > +              flag, if_mult, if_read, auto_cmd, if_dma);
> > +
> > +       _sdhost_set_trans_and_cmd(host, if_mult, if_read, auto_cmd,
if_mult,
> > +                                 if_dma, cmd->opcode, if_has_data,
rsp_type);
>
> I don't like think this kind of wrapper function either. It's just way
> too hard to review and understand.
>

We supply a corresponding function for each MMC host register. That's why
we wrap these functions like this. and from the name of this function
_sdhost_set_trans_and_cmd() we can see it is used to set MMC's transfer mode
and command. If you think it is hard to review, we will use
writel_relaxed() instead
of it.

> Instead I would prefer if _send_cmd() builds the register value in a
> u32 variable itself. Then it writes that value by invoking
> writel_relaxed().
>
> Please follow my suggestion for other similar cases as well.
>
> > +}
> > +
> > +static irqreturn_t _irq(int irq, void *param)
> > +{
>
> Please consider to split up this function in smaller sub-functions, it
> would help me to review.

OK! I will handle it.

>
> > +       u32 intmask;
> > +       struct sdhost_host *host = (struct sdhost_host *)param;
> > +       struct mmc_request *mrq = host->mrq;
> > +       struct mmc_command *cmd = host->cmd;
> > +       struct mmc_data *data;
> > +
> > +       spin_lock(&host->lock);
> > +       /* maybe _timeout() run in one core and _irq() run in
> > +        * another core, this will panic if access cmd->data
> > +        */
> > +       if ((!mrq) || (!cmd)) {
> > +               spin_unlock(&host->lock);
> > +               return IRQ_NONE;
> > +       }
> > +       data = cmd->data;
> > +
> > +       intmask = _sdhost_readl(host, SDHOST_32_INT_ST);
> > +       if (!intmask) {
> > +               spin_unlock(&host->lock);
> > +               return IRQ_NONE;
> > +       }
> > +       pr_debug("%s(%s) CMD%d, intmask 0x%x, filter = 0x%x\n",
__func__,
> > +              host->device_name, cmd->opcode, intmask,
host->int_filter);
> > +
> > +       /* sometimes an undesired interrupt will happen, so we must
clear
> > +     * this unused interrupt.
> > +     */
> > +       _sdhost_clear_int(host, intmask);
> > +       /* just care about the interrupt that we want */
> > +       intmask &= host->int_filter;
> > +
> > +       while (intmask) {
> > +               if (_INT_FILTER_ERR & intmask) {
> > +                       /* some error happened in command */
> > +                       if (_INT_FILTER_ERR_CMD & intmask) {
> > +                               if (_INT_ERR_CMD_TIMEOUT & intmask)
> > +                                       cmd->error = -ETIMEDOUT;
> > +                               else
> > +                                       cmd->error = -EILSEQ;
> > +                       }
> > +                       /* some error happened in data token or command
> > +                        * with R1B
> > +                        */
> > +                       if (_INT_FILTER_ERR_DATA & intmask) {
> > +                               if (data) {
> > +                                       /* current error is happened in
data
> > +                                        * token
> > +                                        */
> > +                                       if (_INT_ERR_DATA_TIMEOUT &
intmask)
> > +                                               data->error =
-ETIMEDOUT;
> > +                                       else
> > +                                               data->error = -EILSEQ;
> > +                               } else {
> > +                                       /* current error is happend in
response
> > +                                        * with busy
> > +                                        */
> > +                                       if (_INT_ERR_DATA_TIMEOUT &
intmask)
> > +                                               cmd->error = -ETIMEDOUT;
> > +                                       else
> > +                                               cmd->error = -EILSEQ;
> > +                               }
> > +                       }
> > +                       if (_INT_ERR_ACMD & intmask) {
> > +                               /* Auto cmd12 and cmd23 error is belong
to data
> > +                                * token error
> > +                                */
> > +                               data->error = -EILSEQ;
> > +                       }
> > +                       if (_INT_ERR_ADMA & intmask)
> > +                               data->error = -EIO;
> > +
> > +                       pr_debug("sdhost %s int 0x%x\n",
host->device_name,
> > +                                intmask);
> > +                       dump_sdio_reg(host);
> > +                       _sdhost_disable_all_int(host);
> > +                       /* if current error happened in data token,
> > +                        * we send cmd12 to stop it
> > +                        */
> > +                       if ((mrq->cmd == cmd) && (mrq->stop)) {
> > +                               _sdhost_reset(host, _RST_CMD |
_RST_DATA);
> > +                               _send_cmd(host, mrq->stop);
> > +                       } else {
> > +                               /* request finish with error, so reset
it and
> > +                                * stop the request
> > +                                */
> > +                               _sdhost_reset(host, _RST_CMD |
_RST_DATA);
> > +                               tasklet_schedule(&host->finish_tasklet);
>
> Instead of using tasklets, please convert to threaded IRQ handlers.

OK. I will handle it.

>
> > +                       }
> > +                       goto out;
> > +               } else {
> > +                       /* delete irq that wanted in filter */
> > +                       host->int_filter &= ~(_INT_FILTER_NORMAL &
intmask);
> > +                       if (_INT_DMA_END & intmask) {
> > +                               _sdhost_writel(host,
> > +                                       _sdhost_readl(host,
SDHOST_32_SYS_ADDR),
> > +                                       SDHOST_32_SYS_ADDR);
> > +                       }
> > +                       if (_INT_CMD_END & intmask) {
> > +                               cmd->error = 0;
> > +                               __get_rsp(host);
> > +                       }
> > +                       if (_INT_TRAN_END & intmask) {
> > +                               if (data) {
> > +                                       dma_unmap_sg(mmc_dev(host->mmc),
> > +                                               data->sg, data->sg_len,
> > +                                               (data->flags &
MMC_DATA_READ) ?
> > +                                               DMA_FROM_DEVICE :
> > +                                               DMA_TO_DEVICE);
> > +                                       data->error = 0;
> > +                                       data->bytes_xfered =
> > +                                       data->blksz * data->blocks;
> > +                               } else {
> > +                                       /* R1B also can produce
transferComplete
> > +                                        * interrupt
> > +                                        */
> > +                                       cmd->error = 0;
> > +                               }
> > +                       }
> > +                       if (!(_INT_FILTER_NORMAL & host->int_filter)) {
> > +                               /* current cmd finished */
> > +                               _sdhost_disable_all_int(host);
> > +                               if (mrq->sbc == cmd) {
> > +                                       _send_cmd(host, mrq->cmd);
> > +                               } else if ((mrq->cmd == host->cmd)
> > +                                          && (mrq->stop)) {
> > +                                       _send_cmd(host, mrq->stop);
> > +                               } else {
> > +                                       /* finish with success and stop
the
> > +                                        * request
> > +                                        */
> > +
tasklet_schedule(&host->finish_tasklet);
> > +                                       goto out;
> > +                               }
> > +                       }
> > +               }
> > +
> > +               intmask = _sdhost_readl(host, SDHOST_32_INT_ST);
> > +               _sdhost_clear_int(host, intmask);
> > +               intmask &= host->int_filter;
> > +       };
> > +
> > +out:
> > +       spin_unlock(&host->lock);
> > +       return IRQ_HANDLED;
> > +}
> > +
> > +static void _tasklet(unsigned long param)
>
> As already stated, please convert to threaded IRQ handlers in favor of
tasklets.

Thanks. I will deal with it.

>
> > +{
> > +       struct sdhost_host *host = (struct sdhost_host *)param;
> > +       unsigned long flags;
> > +       struct mmc_request *mrq;
> > +
> > +       del_timer(&host->timer);
> > +

[...]

> > +static void sdhost_request(struct mmc_host *mmc, struct mmc_request
*mrq)
> > +{
> > +       struct sdhost_host *host = mmc_priv(mmc);
> > +       unsigned long flags;
> > +
> > +       _runtime_get(host);
> > +       spin_lock_irqsave(&host->lock, flags);
> > +
> > +       host->mrq = mrq;
> > +       /* 1 find whether card is still in slot */
> > +       if (!(host->mmc->caps & MMC_CAP_NONREMOVABLE)) {
> > +               if (!mmc_gpio_get_cd(host->mmc)) {
>
> This means for every new request you will be reading a gpio line to
> see if the card is still there. That's going to be highly inefficient
> and affecting performance.
>
> I would instead leave this to be entirely controlled by the mmc core.
>
> Typically what's needed from your controller would be that it provides
> an IRQ for a CMD timeout reasonably fast, in the case when card has
> been removed. Then you will be okay.
>

Thanks. But I noticed that the standard MMC host driver sdhci.c also to do
it as follows:
sdhci_request() --> sdhci_do_get_cd() --> mmc_gpio_get_cd().
However I will try to remove it and test whether there is a problem when
insert or remove a SD card randomly.


> > +                       mrq->cmd->error = -ENOMEDIUM;
> > +                       tasklet_schedule(&host->finish_tasklet);
> > +                       mmiowb();
> > +                       spin_unlock_irqrestore(&host->lock, flags);
> > +                       return;
> > +               }
> > +               /* else asume sdcard is present */
> > +       }
> > +
> > +       /*
> > +        * in our control we can not use auto cmd12 and auto cmd23
together
> > +        * so in following program we use auto cmd23 prior to auto cmd12
> > +        */
>
> I don't really follow what's the issue is here. Can you perhaps elaborate
a bit?

Sorry. Now our host driver don't use neither auto cmd12 nor auto cmd23.

>
> I noticed that you have set MMC_CAP_CMD23, which indicates to the mmc
> core that it shall use mrq->sbc when creating reqeusts.
> Now, are you saying that you controller internally handles CMD12 when
> using the CMD23 way of reading/writing data?

No. Our controller doesn't internally handles CMD12 when using the CMD23 way
of reading/writing data. We don't use auto CMD12 or auto CMD23. When
createing
requests, we use mrq->sbc and CMD23 but not auto command.

>
> I don't like that you need to change the values of the mrq->data. If
> special treatment is needed, it's better to indicate that through a
> new mmc cap to the mmc core, somehow...

Thanks. I will remove the change of mrq->data.

>
> > +       pr_debug("%s(%s) CMD%d request %d %d %d\n",
> > +               __func__, host->device_name, mrq->cmd->opcode,
> > +              !!mrq->sbc, !!mrq->cmd, !!mrq->stop);
> > +       host->auto_cmd_mode = __ACMD_DIS;
> > +       if (!mrq->sbc && mrq->stop && SDHOST_FLAG_ENABLE_ACMD12) {
> > +               host->auto_cmd_mode = __ACMD12;
> > +               mrq->data->stop = NULL;
> > +               mrq->stop = NULL;
> > +       }
> > +
> > +       /* 3 send cmd list */
> > +       if ((mrq->sbc) && SDHOST_FLAG_ENABLE_ACMD23) {
> > +               host->auto_cmd_mode = __ACMD23;
> > +               mrq->data->stop = NULL;
> > +               mrq->stop = NULL;
> > +               _send_cmd(host, mrq->cmd);
> > +       } else if (mrq->sbc) {
> > +               mrq->data->stop = NULL;
> > +               mrq->stop = NULL;
> > +               _send_cmd(host, mrq->sbc);
> > +       } else {
> > +               _send_cmd(host, mrq->cmd);
> > +       }
> > +

[...]

> > +
> > +static void sdhost_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
> > +{
> > +       struct sdhost_host *host = mmc_priv(mmc);
> > +       unsigned long flags;
> > +
> > +       pr_debug("%s(%s) ios:\n"
> > +                "sdhost clock = %d-->%d\n"
> > +                "sdhost vdd = %d-->%d\n"
> > +                "sdhost bus_mode = %d-->%d\n"
> > +                "sdhost chip_select = %d-->%d\n"
> > +                "sdhost power_mode = %d-->%d\n"
> > +                "sdhost bus_width = %d-->%d\n"
> > +                "sdhost timing = %d-->%d\n"
> > +                "sdhost signal_voltage = %d-->%d\n"
> > +                "sdhost drv_type = %d-->%d\n",
> > +                __func__, host->device_name,
> > +                host->ios.clock, ios->clock,
> > +                host->ios.vdd, ios->vdd,
> > +                host->ios.bus_mode, ios->bus_mode,
> > +                host->ios.chip_select, ios->chip_select,
> > +                host->ios.power_mode, ios->power_mode,
> > +                host->ios.bus_width, ios->bus_width,
> > +                host->ios.timing, ios->timing,
> > +                host->ios.signal_voltage, ios->signal_voltage,
> > +                host->ios.drv_type, ios->drv_type);
>
> Huh, this seems like a leftover from an ongoing development. Please
remove.
>
> Potentially we might want this information through a TRACE buffer
> instead, but then it should be handled by the mmc core and thus
> helping debugging for all mmc hosts.

Thanks, we will remove this debug information.

>
> > +
> > +       _runtime_get(host);
> > +       spin_lock_irqsave(&host->lock, flags);
> > +
> > +       if (0 == ios->clock) {
> > +               _sdhost_all_clk_off(host);
> > +               host->ios.clock = 0;
> > +       } else if (ios->clock != host->ios.clock) {
> > +               u32 div;
> > +
> > +               div = _sdhost_calc_div(host->base_clk, ios->clock);
> > +               _sdhost_sd_clk_off(host);
> > +               _sdhost_clk_set_and_on(host, div);
> > +               _sdhost_sd_clk_on(host);
> > +               host->ios.clock = ios->clock;
> > +               host->data_timeout_val =
> > +                   _sdhost_calc_timeout(host->base_clk,
SDHOST_MAX_TIMEOUT);
> > +               mmc->max_busy_timeout = (1 << 30) / (ios->clock / 1000);
> > +       }
> > +
> > +       if (ios->power_mode != host->ios.power_mode) {
> > +               switch (ios->power_mode) {
> > +               case MMC_POWER_OFF:

[...]

> > +
> > +static int sdhost_get_cd(struct mmc_host *mmc)
> > +{
> > +       struct sdhost_host *host = mmc_priv(mmc);
> > +       unsigned long flags;
> > +       int gpio_cd;
> > +
> > +       _runtime_get(host);
> > +       spin_lock_irqsave(&host->lock, flags);
> > +
> > +       if (host->mmc->caps & MMC_CAP_NONREMOVABLE) {
> > +               spin_unlock_irqrestore(&host->lock, flags);
> > +               _runtime_put(host);
> > +               return 1;
> > +       }
> > +
> > +       gpio_cd = mmc_gpio_get_cd(host->mmc);
> > +       if (IS_ERR_VALUE(gpio_cd))
> > +               gpio_cd = 1;
> > +       mmiowb();
> > +       spin_unlock_irqrestore(&host->lock, flags);
> > +       _runtime_put(host);
> > +       return !!gpio_cd;
>
> I think you should be able to assign your ->get_cd() callback directly
> to mmc_gpio_get_cd() as I think the other stuff is already managed by
> the mmc core.
>

We have already assign our ->get_cd() callback as follows:
static const struct mmc_host_ops sdhost_ops = {
...
.get_cd = sdhost_get_cd,
...
};

> Moreover, I don't understand the runtime*() calls here, but let's
> leave that out of this review...
>

Sorry, we will remove all PM and PM_RUNTIME function in next version.
And commit it as a separate patch, then we talk about it.

> > +}
> > +
> > +static int sdhost_card_busy(struct mmc_host *mmc)
> > +{
> > +       struct sdhost_host *host = mmc_priv(mmc);
> > +       unsigned long flags;
> > +       u32 present_state;
> > +
> > +       _runtime_get(host);
> > +       spin_lock_irqsave(&host->lock, flags);
> > +
> > +       /* Check whether DAT[3:0] is 0000 */
> > +       present_state = _sdhost_readl(host, SDHOST_32_PRES_STATE);
> > +
> > +       mmiowb();
> > +       spin_unlock_irqrestore(&host->lock, flags);
> > +       _runtime_put(host);
> > +
> > +       return !(present_state & _DATA_LVL_MASK);

[...]

> > +static int get_caps_info(struct sdhost_host *host)
> > +{
> > +       struct sdhost_caps_data *pdata = NULL;
> > +       int index;
> > +       int ret;
> > +
> > +       for (index = 0; index < sizeof(caps_info_map) /
> > +               sizeof(struct sdhost_caps_data); index++) {
> > +               if (strcmp(host->device_name,
caps_info_map[index].name) == 0) {
> > +                       pdata = &caps_info_map[index];
> > +                       break;
> > +               }
> > +       }
> > +
>
> As stated in the beginning, the above way isn't what you should be
> doing. Instead...
>

Thanks. We will deal with it.

> > +       host->ocr_avail = pdata->ocr_avail;
> > +       host->caps = pdata->caps;
> > +       host->caps2 = pdata->caps2;
> > +       host->pm_caps = pdata->pm_caps;
> > +       host->signal_default_voltage = pdata->signal_default_voltage;
> > +
> > +       ret = mmc_of_parse(host->mmc);
>
> ... let mmc_of_parse() take care of this.
>
> > +       if (ret)
> > +               pr_err("parse sprd %s controller fail\n",
host->device_name);
> > +
> > +       return ret;
> > +}
> > +
> > +static int _get_dt_resource(struct platform_device *pdev,
> > +                              struct sdhost_host *host)
> > +{
> > +       struct device_node *np = pdev->dev.of_node;
> > +       u32 sdhost_delay[3];
> > +       int ret = 0;
> > +
> > +       host->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       if (!host->res)
> > +               return -ENOENT;
> > +
> > +       host->ioaddr = devm_ioremap_resource(&pdev->dev, host->res);
> > +       if (IS_ERR(host->ioaddr)) {
> > +               ret = PTR_ERR(host->ioaddr);
> > +               dev_err(&pdev->dev, "can not map iomem: %d\n", ret);
> > +               goto err;
> > +       }
> > +
> > +       host->mapbase = host->res->start;
> > +       host->irq = platform_get_irq(pdev, 0);
> > +       if (host->irq < 0) {
> > +               ret = host->irq;
> > +               goto err;
> > +       }
> > +
> > +       host->clk = devm_clk_get(&pdev->dev, NULL);
> > +       if (IS_ERR_OR_NULL(host->clk)) {
> > +               ret = PTR_ERR(host->clk);
> > +               dev_err(&pdev->dev, "can not get clock: %d\n", ret);
>
> Remove, printed by the clock framework.

Ok, thanks!

>
> > +               goto err;
> > +       }
> > +
> > +       host->base_clk = clk_get_rate(host->clk);
> > +
> > +       ret = of_property_read_string(np, "sprd,name",
&host->device_name);
> > +       if (ret) {
> > +               dev_err(&pdev->dev,
> > +                       "can not read the property of sprd name\n");
> > +               goto err;
> > +       }
> > +
> > +       ret = get_caps_info(host);
> > +       if (ret)
> > +               goto err;
> > +
> > +       host->detect_gpio = of_get_named_gpio(np, "cd-gpios", 0);
>
> Already covered by mmc_of_parse().

Sorry, we will deal with it.

>
> > +       if (!gpio_is_valid(host->detect_gpio))
> > +               host->detect_gpio = -1;
> > +
> > +       ret = of_property_read_u32_array(np, "sprd,delay",
sdhost_delay, 3);
> > +       if (!ret) {
> > +               host->write_delay = sdhost_delay[0];
> > +               host->read_pos_delay = sdhost_delay[1];
> > +               host->read_neg_delay = sdhost_delay[2];
> > +       } else
> > +               dev_err(&pdev->dev,
> > +                       "can not read the property of sprd delay\n");
> > +
> > +       return 0;
> > +
> > +err:
> > +       dev_err(&pdev->dev, "sprd_sdhost get basic resource fail\n");
> > +       return ret;
> > +}
> > +
> > +static int _get_ext_resource(struct sdhost_host *host)
> > +{
> > +       int err;
> > +       struct mmc_host *mmc = host->mmc;
> > +
> > +       host->dma_mask = DMA_BIT_MASK(64);
> > +       host->data_timeout_val = 0;
> > +
> > +       /* 1 LDO */
> > +       mmc_regulator_get_supply(mmc);
> > +       if (IS_ERR_OR_NULL(mmc->supply.vmmc)) {
> > +               pr_err("%s(%s): no vmmc regulator found\n",
> > +                      __func__, host->device_name);
> > +               mmc->supply.vmmc = NULL;
> > +       }
> > +       if (IS_ERR_OR_NULL(mmc->supply.vqmmc)) {
> > +               pr_err("%s(%s): no vqmmc regulator found\n",
> > +                      __func__, host->device_name);
> > +               mmc->supply.vqmmc = NULL;
>
> First; both regulators are made optional when fetching them via
> mmc_regulator_get_supply().
>
> Second; the prints are already managed by the mmc core, so I don't
> think you need it here as well.
>
Yes, thanks.
We will delete this redundant debug informaton.


> > +       } else {
> > +               regulator_is_supported_voltage(mmc->supply.vqmmc,
> > +
 host->signal_default_voltage,
> > +
 host->signal_default_voltage);
> > +               regulator_set_voltage(mmc->supply.vqmmc,
> > +                                     host->signal_default_voltage,
> > +                                     host->signal_default_voltage);
> > +       }
> > +       host->mmc = mmc;
> > +
> > +       /* 2 clock */
> > +       clk_prepare_enable(host->clk);
> > +

[...]

> > +static int sdhost_remove(struct platform_device *pdev)
> > +{
> > +       struct sdhost_host *host = platform_get_drvdata(pdev);
> > +       struct mmc_host *mmc = host->mmc;
> > +
> > +       if (-1 != host->detect_gpio)
> > +               mmc_gpio_free_cd(mmc);
> > +
> > +       mmc_remove_host(mmc);
> > +       clk_disable_unprepare(host->clk);
> > +       free_irq(host->irq, host);
> > +       release_mem_region(host->res->start, resource_size(host->res));
>
> Both free_irq() and release_mem_region() isn't need since I think you
> used the devm_* functions, right!?
>

Yes, I will deal with it.
Thanks.

[...]

> > +static const struct of_device_id sdhost_of_match[] = {
> > +       {.compatible = "sprd,sdhost-3.0"},
> > +       { /* sentinel */ }
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, sdhost_of_match);
> > +
> > +static struct platform_driver sdhost_driver = {
> > +       .probe = sdhost_probe,
> > +       .remove = sdhost_remove,
> > +       .driver = {
> > +                  .owner = THIS_MODULE,
> > +                  .pm = &sdhost_dev_pm_ops,
> > +                  .name = DRIVER_NAME,
> > +                  .of_match_table = of_match_ptr(sdhost_of_match),
> > +                  },
> > +};
> > +
> > +module_platform_driver(sdhost_driver);
> > +
> > +MODULE_DESCRIPTION("Spreadtrum sdio host controller driver");
> > +MODULE_LICENSE("GPL");
>
> So I will stop here for now and let you address my comments. Hopefully
> I should be able to give a quicker response once you post the next
> version.

Thanks for your kindly review.

>
> Kind regards
> Uffe
>
> > diff --git a/drivers/mmc/host/sprd_sdhost.h
b/drivers/mmc/host/sprd_sdhost.h
> > new file mode 100644
> > index 0000000..d5cc438
> > --- /dev/null
> > +++ b/drivers/mmc/host/sprd_sdhost.h
> > @@ -0,0 +1,615 @@
> > +/*
> > + * linux/drivers/mmc/host/sprd_sdhost.h - Secure Digital Host
Controller
> > + * Interface driver
> > + *
> > + * Copyright (C) 2015 Spreadtrum corporation.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
(at
> > + * your option) any later version.
> > + *
> > + */
> > +
> > +#ifndef __SDHOST_H_
> > +#define __SDHOST_H_
> > +
> > +#include <linux/clk.h>
> > +#include <linux/compiler.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mmc/card.h>
> > +#include <linux/mmc/host.h>
> > +#include <linux/mmc/mmc.h>
> > +#include <linux/mmc/slot-gpio.h>
> > +#include <linux/scatterlist.h>
> > +#include <linux/types.h>
> > +
> > +/**********************************************************\
> > + *
> > + * Controller block structure
> > + *
> > +\**********************************************************/
> > +struct sdhost_host {
> > +       /* --globe resource--- */
> > +       spinlock_t lock;
> > +       struct mmc_host *mmc;
> > +
> > +       /*--basic resource-- */
> > +       struct resource *res;
> > +       void __iomem *ioaddr;
> > +       int irq;
> > +       const char *device_name;
> > +       struct platform_device *pdev;
> > +       unsigned long mapbase;
> > +

[...]

> > +#define SDHOST_32_ARG                  0x08
> > +#define SDHOST_16_TR_MODE              0x0C
> > +#define __ACMD_DIS     0x00
> > +#define __ACMD12       0x01
> > +#define __ACMD23       0x02
> > +
> > +static inline void _sdhost_set_trans_mode(struct sdhost_host *host,
> > +                                         u16 if_mult, u16 if_read,
> > +                                         u16 auto_cmd,
> > +                                         u16 if_blk_cnt, u16 if_dma)
> > +{
> > +       __local_writew((((if_mult ? 1 : 0) << 5) |
> > +                       ((if_read ? 1 : 0) << 4) |
> > +                       (auto_cmd << 2) |
> > +                       ((if_blk_cnt ? 1 : 0) << 1) |
> > +                       ((if_dma ? 1 : 0) << 0)), host,
SDHOST_16_TR_MODE);
> > +}

> > +
> > +#endif
> > --
> > 1.7.9.5
> >

--089e0149c372480f570520c9802e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>&gt;&gt;<br><br>On Thu, Sep 10, 2=
015 at 9:28 PM, Ulf Hansson &lt;<a href=3D"mailto:ulf.hansson@linaro.org" t=
arget=3D"_blank">ulf.hansson@linaro.org</a>&gt; wrote:<br>&gt;<br>&gt; On 1=
4 August 2015 at 18:55, Hongtao Wu &lt;<a href=3D"mailto:wuht06@gmail.com" =
target=3D"_blank">wuht06@gmail.com</a>&gt; wrote:<br>&gt; &gt; the Spreadtr=
um MMC host driver is used to supply EMMC, SD, and<br>&gt; &gt; SDIO types =
of memory cards<br>&gt;<br>&gt; Perhaps some more information about the con=
troller. Are there any<br>&gt; specific features it support or doesn&#39;t =
support!?<br><br>Thanks for kindly reply.<br>Yes, spreadtrum MMC host contr=
ollers have some specific features as follows:<br>(1) We don&#39;t have con=
trols for sampling clock tuning and re-tuning, we take <br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 place of them with three registers as follows:<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (a) CLK_WR_DL(Offset 080h): Data write clock de=
lay line.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (b) CLK_RD_POS_DL(Offset =
0x84h): Posedge data read clock delay line.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (c) CLK_RD_NEG_DL(Offset 088h): Negedge data read clock delay lin=
e.<br><br>(2) We don&#39;t have Power Control Register(Offset 029h), all ou=
r controller&#39;s power<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 come from PMIC, =
rather than directly from CPU.<br><br></div><div>(3) We don&#39;t have bit[=
6](Card Insertion), bit[7] (Card Removal), bit[8] (Card Interrupt)<br>and b=
it[12:9] in Normal Interrupt Status Register(Offset 030h). Because the dete=
ct<br></div><div>gpio pin doesn&#39;t connect to the register of our host c=
ontroller. So we can&#39;t<br></div><div>operate bit[18:16](Card Detect Pin=
 Level, Card State stable and Card Inserted)<br></div><div>in Present State=
 Register(Offset 024h).<br></div><div><br>&gt;<br>&gt; Moreover it would be=
 nice to know a bit more what this patch contains.<br>&gt; For example, you=
 have some debugfs support, what&#39;s that?<br>&gt;<br>Debugfs is a debug =
file system about MMC, where we can check some message<br>about MMC host co=
ntroller register. Maybe we will improve it and=C2=A0 handle that in<br>a s=
eparate patch.<br>Also, we have PM and runtime PM support, which may not be=
 so important=C2=A0 at this<br>stage. And we will commit it with a separate=
 patch.<br><br>&gt; &gt;<br>&gt; &gt; Signed-off-by: Billows Wu(WuHongtao) =
&lt;<a href=3D"mailto:wuht06@gmail.com" target=3D"_blank">wuht06@gmail.com<=
/a>&gt;<br>&gt; &gt; ---<br>&gt; &gt; =C2=A0drivers/mmc/host/Kconfig =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A06 +<br>&gt; &gt; =
=C2=A0drivers/mmc/host/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A01 +<br>&gt; &gt; =C2=A0drivers/mmc/host/sprd_sdhost.c =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1202 ++++++++++++++++++++++++++++++++<br>&gt;=
 &gt; =C2=A0drivers/mmc/host/sprd_sdhost.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0615 ++++++++++++++++<br>&gt;<br>&gt; Just by looking at number of lin=
es here, it tells me that the size of<br>&gt; header file is just way too b=
ig. It&#39;s half the size of the c-file,<br>&gt; that just can&#39;t be ri=
ght. :-)<br>&gt;<br>&gt; Just to make it clear. I don&#39;t like &quot;one-=
liner&quot; wrapper functions nor<br>&gt; macros. If you remove these kind =
of stuff, the total size would shrink<br>&gt; significantly I belive.<br>&g=
t;<br>I am sorry. I wrap so many &quot;one-liner&quot; functions. But I hav=
e some reasons<br>to do it.<br></div><br>Firstly, the registers in some of =
our MMC host controller is designed to<br>4-byte aligned, but in others are=
 not. So we use __local_readx() or <br>__local_writex() to calls readx_rela=
xed() or writex_relaxed(), and use<br>sdhost_readx() or sdhost_writex() to =
call __local_readx() or __local_writex(). <br>Maybe in the future, all our =
controller will use 4-byte non-aligned. Then<br>we will use readx_relaxed()=
 or writex_relaxed() directly.<br></div></div><br>Secondly, in sprd_sdhost.=
h, For every register we supply corresponding<br>operation function, i.e, f=
or SDHOST_16_BLK_SIZE(0x04), we use <br>_sdhost_set_blk_size() to write the=
 block size. Every register corresponding<br>to an operation function, whic=
h logic is nice, I think. What is your opinion?<br><br></div><div>The above=
 two points also interpret why the size of the header file is so big. <br><=
/div></div><div><div><div><div><div><br>&gt; &gt; =C2=A0drivers/mmc/host/sp=
rd_sdhost_debugfs.c | =C2=A0212 ++++++<br>&gt; &gt; =C2=A0drivers/mmc/host/=
sprd_sdhost_debugfs.h | =C2=A0 27 +<br>&gt;<br>&gt; I had a brief look at t=
he debugfs support, let me suggest that we<br>&gt; handle that in a separat=
e patch.<br>&gt;<br>&gt; Perhaps, some of that code can also be made more g=
eneric and used by<br>&gt; the mmc core instead.<br><br></div><div>Thanks. =
I will handle it as a separate patch and use mmc core as possibly<br>as I c=
an.<br></div><div><br>&gt;<br>&gt; &gt; =C2=A06 files changed, 2063 inserti=
ons(+)<br>&gt; &gt; =C2=A0create mode 100644 drivers/mmc/host/sprd_sdhost.c=
<br>&gt; &gt; =C2=A0create mode 100644 drivers/mmc/host/sprd_sdhost.h<br>&g=
t; &gt; =C2=A0create mode 100644 drivers/mmc/host/sprd_sdhost_debugfs.c<br>=
&gt; &gt; =C2=A0create mode 100644 drivers/mmc/host/sprd_sdhost_debugfs.h<b=
r><br>[...]<br><br>&gt; &gt; diff --git a/drivers/mmc/host/sprd_sdhost.c b/=
drivers/mmc/host/sprd_sdhost.c<br>&gt; &gt; new file mode 100644<br>&gt; &g=
t; index 0000000..95639a3<br>&gt; &gt; --- /dev/null<br>&gt; &gt; +++ b/dri=
vers/mmc/host/sprd_sdhost.c<br>&gt; &gt; @@ -0,0 +1,1202 @@<br>&gt; &gt; +/=
*<br>&gt; &gt; + * linux/drivers/mmc/host/sprd_sdhost.c - Secure Digital Ho=
st Controller<br>&gt; &gt; + * Interface driver<br><br>[...]<br><br>&gt; &g=
t; +<br>&gt; &gt; +#include &quot;sprd_sdhost.h&quot;<br>&gt; &gt; +#includ=
e &quot;sprd_sdhost_debugfs.h&quot;<br>&gt; &gt; +<br>&gt; &gt; +#define DR=
IVER_NAME &quot;sdhost&quot;<br>&gt; &gt; +#define SDHOST_CAPS \<br>&gt;<br=
>&gt; Please remove this define it makes it harder to read the code.<br><br=
>I will remove it in next version.<br><br>&gt;<br>&gt; &gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (MMC_CAP_4_BIT_DATA | MMC_CAP_SD_HIGHSP=
EED | \<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMC=
_CAP_ERASE | =C2=A0MMC_CAP_UHS_SDR50 | \<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMC_CAP_CMD23 | MMC_CAP_HW_RESET)<br>&gt; &=
gt; +<br>&gt; &gt; +struct sdhost_caps_data {<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 char *name;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 u32 ocr_avail;<br>&g=
t; &gt; + =C2=A0 =C2=A0 =C2=A0 u32 caps;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 u32 caps2;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 u32 pm_caps;<br>&gt; &gt=
; + =C2=A0 =C2=A0 =C2=A0 u32 base_clk;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =
u32 signal_default_voltage;<br>&gt; &gt; +};<br>&gt;<br>&gt; I don&#39;t th=
ink you need this struct, as most of this data is already<br>&gt; present i=
t struct mmc_host. And for that small pieces that isn&#39;t you<br>&gt; mig=
ht as well just add into your struct sdhost_host.<br>&gt;<br><br>Yes, most =
of this data can be removed, such as caps, caps2, base_clk.<br>However ocr_=
avail and signal_default_voltage are useful for us.<br>We can&#39;t fetch o=
cr_avail from external regulator via mmc_regulator_get_supply,<br>because o=
ur regulator driver can&#39;t supply mmc_regulator_get_ocrmask()<br>interfa=
ce for MMC driver.<br>And sometimes our external regulator can not supply 3=
.0v or 1.8v default<br>signal voltage that we expect. So this 3.0v or 1.8v =
default signal voltage are<br>mandatory.<br><br>&gt; &gt; +<br>&gt; &gt; +s=
truct sdhost_caps_data caps_info_map[] =3D {<br>&gt;<br>&gt; This is the wr=
ong way of how to assign capabilties. Instead<br>&gt; mmc_of_parse() parses=
 your DT configuration and assign the<br>&gt; corresponding caps in the str=
uct mmc_host.<br>&gt;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 {<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;sd&quot;,<=
br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ocr_avail =
=3D MMC_VDD_29_30 | MMC_VDD_30_31,<br>&gt;<br>&gt; ocr_avail should be fetc=
hed from external regulators via<br>&gt; mmc_regulator_get_supply() API. I =
don&#39;t think you need this at all<br>&gt; then, right?<br><br>For us the=
 ocr_avail can not be fetched from external regulator, and now<br>we must s=
et it manually. Could we put the ocr_avail and=C2=A0 signal_default_voltage=
<br>in dts?<br>If you have better possible solution how I can fetch ocr_ava=
il via other way,<br>please tell me. Thanks. <br><br>&gt;<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .caps =3D SDHOST_CAPS,<br>=
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .caps2 =3D MMC=
_CAP2_HC_ERASE_SZ,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 .signal_default_voltage =3D 3000000,<br>&gt;<br>&gt; Again, if this=
 is needed you shall use the regulator API to find out<br>&gt; this informa=
tion.<br><br>Now our regulator driver can not supply this information that =
we need.<br>However, I will talk to our regulator driver and hardware owner=
. <br>Maybe they can improve that.<br><br>&gt;<br>&gt; &gt; + =C2=A0 =C2=A0=
 =C2=A0 },<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 {<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;wifi&quot;,<br>&gt; =
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ocr_avail =3D MMC_=
VDD_165_195 | MMC_VDD_29_30 |<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMC_VDD_30_31 | MMC_VDD_32=
_33 | MMC_VDD_33_34,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 .caps =3D SDHOST_CAPS | MMC_CAP_POWER_OFF_CARD |<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 MMC_CAP_UHS_SDR12,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 },<br>&gt; &gt; =
+ =C2=A0 =C2=A0 =C2=A0 {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 .name =3D &quot;emmc&quot;,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ocr_avail =3D MMC_VDD_29_30 | MMC_VDD_30_3=
1,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .caps =
=3D SDHOST_CAPS |<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMC_CAP_8_BIT_DATA | MMC_CAP_UHS_SDR12 |=
<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 MMC_CAP_UHS_SDR25 | MMC_CAP_UHS_DDR50 |<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 MMC_CAP_MMC_HIGHSPEED,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 .signal_default_voltage =3D 1800000,<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; +};<br>&gt; &gt; +<br>&gt; &gt; +#ifdef CO=
NFIG_PM_RUNTIME<br>&gt;<br>&gt; Regarding the system PM and runtime PM supp=
ort, please remove that<br>&gt; code from $subject patch and let&#39;s add =
that as a separate patch<br>&gt; instead.<br>&gt;<br>OK, I will remove this=
 code in next version, and commit it as a separate<br>patch. <br><br>&gt; T=
he reason is simply that I see way too many strange things going on<br>&gt;=
 in that part of code, so I decided that it&#39;s easier for me to comment<=
br>&gt; on them later and separately.<br><br>OK, I will improve it.<br><br>=
&gt;<br>&gt; &gt; +static void _pm_runtime_setting(struct platform_device *=
pdev,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct sdhost_host *ho=
st);<br>&gt; &gt; +#else<br>&gt; &gt; +static void _pm_runtime_setting(stru=
ct platform_device *pdev,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stru=
ct sdhost_host *host)<br>&gt; &gt; +{<br>&gt; &gt; +}<br>&gt; &gt; +#endif<=
br><br>[...]<br><br>&gt; &gt; +static void __get_rsp(struct sdhost_host *ho=
st)<br>&gt; &gt; +{<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 u32 i, offset;<br>&=
gt; &gt; + =C2=A0 =C2=A0 =C2=A0 unsigned int flags =3D host-&gt;cmd-&gt;fla=
gs;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 u32 *resp =3D host-&gt;cmd-&gt;resp=
;<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 if (!(flags &amp; MMC_=
RSP_PRESENT))<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return;<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 if (flags &a=
mp; MMC_RSP_136) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 /* CRC is stripped so we need to do some shifting. */<br>&gt; &gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0, offset =3D=
 12; i &lt; 3; i++, offset -=3D 4) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resp[i] =3D<br>&gt;=
 &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 _sdhost_readl(host,<br>&gt;<br>&gt; Just to make i=
t clear around what I mean with &quot;one-liner&quot; wrapprer<br>&gt; func=
tions, _sdhost_readl() is a perfect example.<br>&gt;<br>&gt; _sdhost_readl(=
) calls __local_readl() which calls readl_relaxed().<br>&gt;<br>&gt; This i=
s crazy and completely unnecessary complicated. Please just call<br>&gt; re=
adl_relaxed() here, since it helps me review and understand what&#39;s<br>&=
gt; going on in the code.<br>&gt;<br><br>Thanks. Just like the relationship=
 sdhci_readl() and readl(), we wrap<br>readl_relaxed() with sdhost_readl().=
 Of course, if you think this is<br>unnecessary, we will improve it.=C2=A0 =
<br><br>&gt; As there are many examples of similar cases, please simplify t=
he code<br>&gt; according to my suggestions.<br><br>Thanks for your kindly =
suggestions.<br>Do you think we must modify these &quot;one-liner&quot; wra=
pprer functions right now?<br>Or can we change it after all our register ar=
e 4-byte non-aligned. <br><br>&gt;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SDHOST_32_RESPONSE + offset) &lt;=
&lt; 8;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 resp[i] |=3D<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _sdho=
st_readb(host,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 SDHOST_32_RESPONSE + offset - 1);<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resp[3] =3D _sdhost_readl(host, SDHO=
ST_32_RESPONSE) &lt;&lt; 8;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 } else {<br=
>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resp[0] =3D _=
sdhost_readl(host, SDHOST_32_RESPONSE);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0=
 }<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +static void _send_cmd(struc=
t sdhost_host *host, struct mmc_command *cmd)<br>&gt; &gt; +{<br>&gt; &gt; =
+ =C2=A0 =C2=A0 =C2=A0 struct mmc_data *data =3D cmd-&gt;data;<br>&gt; &gt;=
 + =C2=A0 =C2=A0 =C2=A0 int sg_cnt;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 u32=
 flag =3D 0;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 u16 rsp_type =3D 0;<br>&gt=
; &gt; + =C2=A0 =C2=A0 =C2=A0 int if_has_data =3D 0;<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 int if_mult =3D 0;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 int if=
_read =3D 0;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 int if_dma =3D 0;<br>&gt; =
&gt; + =C2=A0 =C2=A0 =C2=A0 u16 auto_cmd =3D __ACMD_DIS;<br>&gt; &gt; +<br>=
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 pr_debug(&quot;%s(%s) =C2=A0CMD%d, arg 0x%=
x, flag 0x%x\n&quot;, __func__,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0host-&gt;device_name, cmd-&gt;opcode, cmd-&gt;arg, cmd-=
&gt;flags);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 if (cmd-&gt;data)<br>&gt; &=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_debug(&quot;%s(%s=
) block size %d, cnt %d\n&quot;, __func__,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host-&gt;device_=
name, cmd-&gt;data-&gt;blksz, cmd-&gt;data-&gt;blocks);<br>&gt; &gt; +<br>&=
gt; &gt; + =C2=A0 =C2=A0 =C2=A0 _sdhost_disable_all_int(host);<br>&gt;<br>&=
gt; Do you really need to turn the IRQs on/off between each an every<br>&gt=
; command? If not, it would save you from reading/writing to the<br>&gt; re=
gisters a few times per each commands.<br><br>Thanks. I will remove it.<br>=
We turn the IRQs on/off between each an every command. Because<br>some time=
 ago we recieved some undesirable irq when _send_cmd()<br>function was runn=
ing, then _irq() function was called. This might be<br>cause some problem. =
However, the undesirable irq may not apper this<br>days. So it&#39;s time t=
o remove the IRQs on/off.<br><br>&gt;<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 if (MMC_ERASE =3D=3D cmd-&gt;opcode) {<br>&gt;<br>&gt; I gues=
s you might already know that the mmc core suffers from a few<br>&gt; bugs =
around how to deal with erase/trim/discard. And it&#39;s related to<br>&gt;=
 the max_busy_timeout value.<br>&gt;<br>&gt; Now, this fix you have here is=
 okay for now, but we should really fix<br>&gt; the problem in the core. Ho=
st drivers shouldn&#39;t have to care about<br>&gt; this as a specific comm=
and.<br><br>Thanks. Maybe we shouldn&#39;t have to care about MMC_ERASE as =
a specific<br>command, however, from a great deal measurement, we find that=
 only CMD38<br>(MMC_ERASE) take a long time. So we set a long timeout value=
 for it, and for<br>others the value is short.<br><br>BTW,=C2=A0 In order t=
o avoid that hardware timeout is invalid, in every time before<br>sending c=
ommand, we set software timeout(mod_timer()) and hardware timeout<br>(write=
 value to SDHOST_8_TIMEOUT ). <br><br>&gt;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* if it is erase command , it&#39;s busy t=
ime will long,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* so we set long timeout value here.<br>&gt; &gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mod_timer(&amp;host-&gt;timer, jiffies +=
<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 msecs_to_jiffies(host-&gt;mmc-&gt;max_busy_timeout + 1000=
));<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _sdhost=
_writeb(host-&gt;ioaddr,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __DATA_TIMEOUT_MAX_VAL, SDHOST_8_=
TIMEOUT);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 } else {<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mod_timer(&amp;host-&gt;timer=
,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 jiffies + (SDHOST_MAX_TIMEOUT + 1) * HZ);<br>&gt; &gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _sdhost_writeb(host, ho=
st-&gt;data_timeout_val, SDHOST_8_TIMEOUT);<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 }<br>&gt; &gt; +<br>[...]<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 host-&=
gt;int_filter =3D flag;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 _sdhost_enable_=
int(host, flag);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 pr_debug(&quot;sdhost =
%s CMD%d rsp:0x%x intflag:0x%x\n&quot;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;if_mult:0x%x if_read:0x%x auto_cmd:0x%x if=
_dma:0x%x\n&quot;,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0host-&gt;device_name, cmd-&gt;opcode, mmc_resp_type(cmd),<br>&gt; &g=
t; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flag, if_mult, if_read=
, auto_cmd, if_dma);<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 _sd=
host_set_trans_and_cmd(host, if_mult, if_read, auto_cmd, if_mult,<br>&gt; &=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if_dma, cmd-&gt;opcode, if_has_d=
ata, rsp_type);<br>&gt;<br>&gt; I don&#39;t like think this kind of wrapper=
 function either. It&#39;s just way<br>&gt; too hard to review and understa=
nd.<br>&gt;<br><br>We supply a corresponding function for each MMC host reg=
ister. That&#39;s why<br>we wrap these functions like this. and from the na=
me of this function<br>_sdhost_set_trans_and_cmd() we can see it is used to=
 set MMC&#39;s transfer mode<br>and command. If you think it is hard to rev=
iew, we will use writel_relaxed() instead<br>of it.<br><br>&gt; Instead I w=
ould prefer if _send_cmd() builds the register value in a<br>&gt; u32 varia=
ble itself. Then it writes that value by invoking<br>&gt; writel_relaxed().=
<br>&gt;<br>&gt; Please follow my suggestion for other similar cases as wel=
l.<br>&gt;<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +static irqreturn_t =
_irq(int irq, void *param)<br>&gt; &gt; +{<br>&gt;<br>&gt; Please consider =
to split up this function in smaller sub-functions, it<br>&gt; would help m=
e to review.<br><br>OK! I will handle it.<br><br>&gt;<br>&gt; &gt; + =C2=A0=
 =C2=A0 =C2=A0 u32 intmask;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 struct sdho=
st_host *host =3D (struct sdhost_host *)param;<br>&gt; &gt; + =C2=A0 =C2=A0=
 =C2=A0 struct mmc_request *mrq =3D host-&gt;mrq;<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 struct mmc_command *cmd =3D host-&gt;cmd;<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 struct mmc_data *data;<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 spin_lock(&amp;host-&gt;lock);<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 /* maybe _timeout() run in one core and _irq() run in<br>&gt; &gt; +=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0* another core, this will panic if access cmd-&=
gt;data<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 if ((!mrq) || (!cmd)) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock(&amp;host-&gt;lock);<br>&gt; &gt; +=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return IRQ_NONE;<br>&gt; =
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 data =3D =
cmd-&gt;data;<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 intmask =
=3D _sdhost_readl(host, SDHOST_32_INT_ST);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 if (!intmask) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 spin_unlock(&amp;host-&gt;lock);<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return IRQ_NONE;<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 }<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 pr_debug(&quot;%s(%s) C=
MD%d, intmask 0x%x, filter =3D 0x%x\n&quot;, __func__,<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host-&gt;device_name, cmd-&gt;=
opcode, intmask, host-&gt;int_filter);<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0=
 =C2=A0 =C2=A0 /* sometimes an undesired interrupt will happen, so we must =
clear<br>&gt; &gt; + =C2=A0 =C2=A0 * this unused interrupt.<br>&gt; &gt; + =
=C2=A0 =C2=A0 */<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 _sdhost_clear_int(host=
, intmask);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 /* just care about the inte=
rrupt that we want */<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 intmask &amp;=3D =
host-&gt;int_filter;<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 whi=
le (intmask) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (_INT_FILTER_ERR &amp; intmask) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* some error h=
appened in command */<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (_INT_FILTER_ERR_CMD &amp; intmas=
k) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (_INT_ERR_CMD_TIMEOUT =
&amp; intmask)<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 cmd-&gt;error =3D -ETIMEDOUT;<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 else<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;error =3D -EILSEQ;<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* some error happened in data token or command<br>&gt; &gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* with R1B<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (_INT=
_FILTER_ERR_DATA &amp; intmask) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (data) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* current error is happened in data<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* token<br>&g=
t; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*/<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (_INT_ERR_DATA_TIMEOUT &amp; intmask)<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 data-&gt;error =3D -ETIMEDOUT;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data-&gt=
;error =3D -EILSEQ;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {=
<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /=
* current error is happend in response<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* with busy<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt; &g=
t; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (_INT_ERR=
_DATA_TIMEOUT &amp; intmask)<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;error =3D -=
ETIMEDOUT;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 else<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;error =3D -EILSEQ;<br=
>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; &g=
t; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (_INT_ERR_ACMD &amp; intmask) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* Auto cmd12 and cmd23 error is belong to data<br>&gt; &gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* token error<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 data-&gt;error =3D -EILSEQ;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f (_INT_ERR_ADMA &amp; intmask)<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 data-&gt;error =3D -EIO;<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_debug(&qu=
ot;sdhost %s int 0x%x\n&quot;, host-&gt;device_name,<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intmask);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dump_sdio_reg(h=
ost);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 _sdhost_disable_all_int(host);<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /=
* if current error happened in data token,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we send=
 cmd12 to stop it<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((mrq-&gt=
;cmd =3D=3D cmd) &amp;&amp; (mrq-&gt;stop)) {<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 _sdhost_reset(host, _RST_CMD | _RST_DATA);<br>&gt; &gt; +=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _send_cmd(host, mrq-&gt;stop);<br>&gt; &gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 } else {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* request f=
inish with error, so reset it and<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0* stop the request<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*/<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _sdhost_reset(h=
ost, _RST_CMD | _RST_DATA);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
asklet_schedule(&amp;host-&gt;finish_tasklet);<br>&gt;<br>&gt; Instead of u=
sing tasklets, please convert to threaded IRQ handlers.<br><br>OK. I will h=
andle it.<br><br>&gt;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>&g=
t; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>&gt;=
 &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* delete irq that wanted in filter */<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt=
;int_filter &amp;=3D ~(_INT_FILTER_NORMAL &amp; intmask);<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (_INT_DMA_END &amp; intmask) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 _sdhost_writel(host,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _sdhost_readl(host, SDHOST_32_SYS_ADDR),<br=
>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SDHO=
ST_32_SYS_ADDR);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (_INT_CMD_END &a=
mp; intmask) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;error =
=3D 0;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __get_rsp(host);<br>&g=
t; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (_INT_TRAN_END &amp; intmask) {<br>&g=
t; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (data) {<br>&gt; &gt; + =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_unmap_sg(mmc_dev(h=
ost-&gt;mmc),<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data-&gt;sg, data-&gt;sg_len,<br>=
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (data-&gt;flags &amp; MMC_DATA_READ) ?<br>&gt; &gt=
; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 DMA_FROM_DEVICE :<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMA_TO_DEVIC=
E);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 data-&gt;error =3D 0;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 data-&gt;bytes_xfered =3D<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data-&gt;blksz * data-=
&gt;blocks;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>&gt; &=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* R1B also=
 can produce transferComplete<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* interrupt<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;error =
=3D 0;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }=
<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (!(_INT_FILTER_NORMAL &amp; host-&gt;int_filter)) {<br=
>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* current cmd finished */<br>&g=
t; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _sdhost_disable_all_int(host);<br=
>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mrq-&gt;sbc =3D=3D cmd) {<br=
>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _sen=
d_cmd(host, mrq-&gt;cmd);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } el=
se if ((mrq-&gt;cmd =3D=3D host-&gt;cmd)<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (mrq-&gt;=
stop)) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 _send_cmd(host, mrq-&gt;stop);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 } else {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* finish with success and stop the<br>&gt; &gt; +=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* request=
<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0*/<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tasklet_schedule(&amp;host-&gt;finish_tasklet);<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>&g=
t; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; &g=
t; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; +<br>&=
gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 intmask =3D _sd=
host_readl(host, SDHOST_32_INT_ST);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 _sdhost_clear_int(host, intmask);<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 intmask &amp;=3D host-&gt;=
int_filter;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 };<br>&gt; &gt; +<br>&gt; &=
gt; +out:<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 spin_unlock(&amp;host-&gt;loc=
k);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 return IRQ_HANDLED;<br>&gt; &gt; +}=
<br>&gt; &gt; +<br>&gt; &gt; +static void _tasklet(unsigned long param)<br>=
&gt;<br>&gt; As already stated, please convert to threaded IRQ handlers in =
favor of tasklets.<br><br>Thanks. I will deal with it.<br><br>&gt;<br>&gt; =
&gt; +{<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 struct sdhost_host *host =3D (s=
truct sdhost_host *)param;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 unsigned lon=
g flags;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 struct mmc_request *mrq;<br>&g=
t; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 del_timer(&amp;host-&gt;timer=
);<br>&gt; &gt; +<br><br>[...]<br><br>&gt; &gt; +static void sdhost_request=
(struct mmc_host *mmc, struct mmc_request *mrq)<br>&gt; &gt; +{<br>&gt; &gt=
; + =C2=A0 =C2=A0 =C2=A0 struct sdhost_host *host =3D mmc_priv(mmc);<br>&gt=
; &gt; + =C2=A0 =C2=A0 =C2=A0 unsigned long flags;<br>&gt; &gt; +<br>&gt; &=
gt; + =C2=A0 =C2=A0 =C2=A0 _runtime_get(host);<br>&gt; &gt; + =C2=A0 =C2=A0=
 =C2=A0 spin_lock_irqsave(&amp;host-&gt;lock, flags);<br>&gt; &gt; +<br>&gt=
; &gt; + =C2=A0 =C2=A0 =C2=A0 host-&gt;mrq =3D mrq;<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 /* 1 find whether card is still in slot */<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 if (!(host-&gt;mmc-&gt;caps &amp; MMC_CAP_NONREMOVABLE)) =
{<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!mmc_=
gpio_get_cd(host-&gt;mmc)) {<br>&gt;<br>&gt; This means for every new reque=
st you will be reading a gpio line to<br>&gt; see if the card is still ther=
e. That&#39;s going to be highly inefficient<br>&gt; and affecting performa=
nce.<br>&gt;<br>&gt; I would instead leave this to be entirely controlled b=
y the mmc core.<br>&gt;<br>&gt; Typically what&#39;s needed from your contr=
oller would be that it provides<br>&gt; an IRQ for a CMD timeout reasonably=
 fast, in the case when card has<br>&gt; been removed. Then you will be oka=
y.<br>&gt;<br><br>Thanks. But I noticed that the standard MMC host driver s=
dhci.c also to do<br>it as follows:<br>sdhci_request() --&gt; sdhci_do_get_=
cd() --&gt; mmc_gpio_get_cd().<br>However I will try to remove it and test =
whether there is a problem when<br>insert or remove a SD card randomly. <br=
><br><br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 mrq-&gt;cmd-&gt;error =3D -ENOMEDIUM;<br>&gt; &gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 tasklet_schedule(&amp;host-&gt;finish_tasklet);<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m=
miowb();<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock_irqrestore(&amp;host-&gt;lock, flag=
s);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 return;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* else asume sdcard is present */<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 }<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 /*<br>&gt; &gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0* in our control we can not use auto cmd12 an=
d auto cmd23 together<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* so in fol=
lowing program we use auto cmd23 prior to auto cmd12<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0*/<br>&gt;<br>&gt; I don&#39;t really follow what&#39;s=
 the issue is here. Can you perhaps elaborate a bit?<br><br>Sorry. Now our =
host driver don&#39;t use neither auto cmd12 nor auto cmd23.<br><br>&gt;<br=
>&gt; I noticed that you have set MMC_CAP_CMD23, which indicates to the mmc=
<br>&gt; core that it shall use mrq-&gt;sbc when creating reqeusts.<br>&gt;=
 Now, are you saying that you controller internally handles CMD12 when<br>&=
gt; using the CMD23 way of reading/writing data?<br><br></div><div>No. Our =
controller doesn&#39;t internally handles CMD12 when using the CMD23 way<br=
></div><div>of reading/writing data. We don&#39;t use auto CMD12 or auto CM=
D23. When createing<br></div><div>requests, we use mrq-&gt;sbc and CMD23 bu=
t not auto command.<br></div><div><br>&gt;<br>&gt; I don&#39;t like that yo=
u need to change the values of the mrq-&gt;data. If<br>&gt; special treatme=
nt is needed, it&#39;s better to indicate that through a<br>&gt; new mmc ca=
p to the mmc core, somehow...<br></div><div><br>Thanks. I will remove the c=
hange of mrq-&gt;data.<br></div><div><br>&gt;<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 pr_debug(&quot;%s(%s) CMD%d request %d %d %d\n&quot;,<br>&gt; &gt; +=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, host-&gt;device=
_name, mrq-&gt;cmd-&gt;opcode,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0!!mrq-&gt;sbc, !!mrq-&gt;cmd, !!mrq-&gt;stop);<br>&gt; =
&gt; + =C2=A0 =C2=A0 =C2=A0 host-&gt;auto_cmd_mode =3D __ACMD_DIS;<br>&gt; =
&gt; + =C2=A0 =C2=A0 =C2=A0 if (!mrq-&gt;sbc &amp;&amp; mrq-&gt;stop &amp;&=
amp; SDHOST_FLAG_ENABLE_ACMD12) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;auto_cmd_mode =3D __ACMD12;<br>&gt; &gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mrq-&gt;data-&gt;stop =
=3D NULL;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m=
rq-&gt;stop =3D NULL;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; +<=
br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 /* 3 send cmd list */<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 if ((mrq-&gt;sbc) &amp;&amp; SDHOST_FLAG_ENABLE_ACMD23=
) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&g=
t;auto_cmd_mode =3D __ACMD23;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 mrq-&gt;data-&gt;stop =3D NULL;<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mrq-&gt;stop =3D NULL;<br>&gt; &g=
t; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _send_cmd(host, mrq-&=
gt;cmd);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 } else if (mrq-&gt;sbc) {<br>&=
gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mrq-&gt;data-&g=
t;stop =3D NULL;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mrq-&gt;stop =3D NULL;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 _send_cmd(host, mrq-&gt;sbc);<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 } else {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 _send_cmd(host, mrq-&gt;cmd);<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 }<br>&gt; &gt; +<br><br>[...]<br><br>&gt; &gt; +<br>&gt; &gt; +stati=
c void sdhost_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)<br>&gt; &g=
t; +{<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 struct sdhost_host *host =3D mmc_=
priv(mmc);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 unsigned long flags;<br>&gt;=
 &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 pr_debug(&quot;%s(%s) ios:\n&qu=
ot;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&=
quot;sdhost clock =3D %d--&gt;%d\n&quot;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;sdhost vdd =3D %d--&gt;%d\n&quo=
t;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;sdhost bus_mode =3D %d--&gt;%d\n&quot;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;sdhost chip_select =3D %d--&gt;=
%d\n&quot;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;sdhost power_mode =3D %d--&gt;%d\n&quot;<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;sdhost bus_width =3D =
%d--&gt;%d\n&quot;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;sdhost timing =3D %d--&gt;%d\n&quot;<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;sdhost signal_vol=
tage =3D %d--&gt;%d\n&quot;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;sdhost drv_type =3D %d--&gt;%d\n&quot;,<br>&g=
t; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, =
host-&gt;device_name,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0host-&gt;ios.clock, ios-&gt;clock,<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host-&gt;ios.vdd, ios-&gt;v=
dd,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0h=
ost-&gt;ios.bus_mode, ios-&gt;bus_mode,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host-&gt;ios.chip_select, ios-&gt;chip_s=
elect,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0host-&gt;ios.power_mode, ios-&gt;power_mode,<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host-&gt;ios.bus_width, ios-&g=
t;bus_width,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0host-&gt;ios.timing, ios-&gt;timing,<br>&gt; &gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host-&gt;ios.signal_voltage, ios-=
&gt;signal_voltage,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0host-&gt;ios.drv_type, ios-&gt;drv_type);<br>&gt;<br>&gt; =
Huh, this seems like a leftover from an ongoing development. Please remove.=
<br>&gt;<br>&gt; Potentially we might want this information through a TRACE=
 buffer<br>&gt; instead, but then it should be handled by the mmc core and =
thus<br>&gt; helping debugging for all mmc hosts.<br><br>Thanks, we will re=
move this debug information.<br><br>&gt;<br>&gt; &gt; +<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 _runtime_get(host);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 s=
pin_lock_irqsave(&amp;host-&gt;lock, flags);<br>&gt; &gt; +<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 if (0 =3D=3D ios-&gt;clock) {<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _sdhost_all_clk_off(host);<br>&gt=
; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;ios.cloc=
k =3D 0;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 } else if (ios-&gt;clock !=3D =
host-&gt;ios.clock) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 u32 div;<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 div =3D _sdhost_calc_div(host-&gt;base_clk, ios-&g=
t;clock);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _=
sdhost_sd_clk_off(host);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 _sdhost_clk_set_and_on(host, div);<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _sdhost_sd_clk_on(host);<br>&gt; &gt=
; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;ios.clock =3D=
 ios-&gt;clock;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 host-&gt;data_timeout_val =3D<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _sdhost_calc_timeout(host-&gt;bas=
e_clk, SDHOST_MAX_TIMEOUT);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 mmc-&gt;max_busy_timeout =3D (1 &lt;&lt; 30) / (ios-&gt;c=
lock / 1000);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; +<br>&gt; =
&gt; + =C2=A0 =C2=A0 =C2=A0 if (ios-&gt;power_mode !=3D host-&gt;ios.power_=
mode) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 swi=
tch (ios-&gt;power_mode) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 case MMC_POWER_OFF:<br><br>[...]<br><br>&gt; &gt; +<br>&g=
t; &gt; +static int sdhost_get_cd(struct mmc_host *mmc)<br>&gt; &gt; +{<br>=
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 struct sdhost_host *host =3D mmc_priv(mmc)=
;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 unsigned long flags;<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 int gpio_cd;<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 _runtime_get(host);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 spin_loc=
k_irqsave(&amp;host-&gt;lock, flags);<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 if (host-&gt;mmc-&gt;caps &amp; MMC_CAP_NONREMOVABLE) {<br>&g=
t; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock_irqr=
estore(&amp;host-&gt;lock, flags);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 _runtime_put(host);<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 }<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 gpio_cd =3D mmc=
_gpio_get_cd(host-&gt;mmc);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR_=
VALUE(gpio_cd))<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 gpio_cd =3D 1;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 mmiowb();<br>&gt;=
 &gt; + =C2=A0 =C2=A0 =C2=A0 spin_unlock_irqrestore(&amp;host-&gt;lock, fla=
gs);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 _runtime_put(host);<br>&gt; &gt; +=
 =C2=A0 =C2=A0 =C2=A0 return !!gpio_cd;<br>&gt;<br>&gt; I think you should =
be able to assign your -&gt;get_cd() callback directly<br>&gt; to mmc_gpio_=
get_cd() as I think the other stuff is already managed by<br>&gt; the mmc c=
ore.<br>&gt;<br><br></div><div>We have already assign our -&gt;get_cd() cal=
lback as follows:<br></div><div>static const struct mmc_host_ops sdhost_ops=
 =3D {<br>...<br></div><div>.get_cd =3D sdhost_get_cd,<br>...<br></div><div=
>};<br></div><div><br>&gt; Moreover, I don&#39;t understand the runtime*() =
calls here, but let&#39;s<br>&gt; leave that out of this review...<br>&gt;<=
br><br>Sorry, we will remove all PM and PM_RUNTIME function in next version=
.<br>And commit it as a separate patch, then we talk about it.<br><br>&gt; =
&gt; +}<br>&gt; &gt; +<br>&gt; &gt; +static int sdhost_card_busy(struct mmc=
_host *mmc)<br>&gt; &gt; +{<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 struct sdho=
st_host *host =3D mmc_priv(mmc);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 unsign=
ed long flags;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 u32 present_state;<br>&g=
t; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 _runtime_get(host);<br>&gt; &=
gt; + =C2=A0 =C2=A0 =C2=A0 spin_lock_irqsave(&amp;host-&gt;lock, flags);<br=
>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 /* Check whether DAT[3:0] =
is 0000 */<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 present_state =3D _sdhost_re=
adl(host, SDHOST_32_PRES_STATE);<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 mmiowb();<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 spin_unlock_irqres=
tore(&amp;host-&gt;lock, flags);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 _runti=
me_put(host);<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 return !(p=
resent_state &amp; _DATA_LVL_MASK);<br><br>[...]<br><br>&gt; &gt; +static i=
nt get_caps_info(struct sdhost_host *host)<br>&gt; &gt; +{<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 struct sdhost_caps_data *pdata =3D NULL;<br>&gt; &gt; =
+ =C2=A0 =C2=A0 =C2=A0 int index;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 int r=
et;<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 for (index =3D 0; in=
dex &lt; sizeof(caps_info_map) /<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 sizeof(struct sdhost_caps_data); index++) {<br>&gt; &=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(host-&gt;=
device_name, caps_info_map[index].name) =3D=3D 0) {<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pdata=
 =3D &amp;caps_info_map[index];<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 }<br>&gt; &gt; +<br>&gt;<br>&gt; As stated in the beginning, the=
 above way isn&#39;t what you should be<br>&gt; doing. Instead...<br>&gt;<b=
r><br>Thanks. We will deal with it.<br><br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0=
 host-&gt;ocr_avail =3D pdata-&gt;ocr_avail;<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 host-&gt;caps =3D pdata-&gt;caps;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 host-&gt;caps2 =3D pdata-&gt;caps2;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0=
 host-&gt;pm_caps =3D pdata-&gt;pm_caps;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 host-&gt;signal_default_voltage =3D pdata-&gt;signal_default_voltage;<b=
r>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 ret =3D mmc_of_parse(host=
-&gt;mmc);<br>&gt;<br>&gt; ... let mmc_of_parse() take care of this.<br>&gt=
;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 if (ret)<br>&gt; &gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err(&quot;parse sprd %s controller f=
ail\n&quot;, host-&gt;device_name);<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 return ret;<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +stat=
ic int _get_dt_resource(struct platform_device *pdev,<br>&gt; &gt; + =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct sdhost_host *host)<br>&gt; &gt; +{<br>&gt; &=
gt; + =C2=A0 =C2=A0 =C2=A0 struct device_node *np =3D pdev-&gt;dev.of_node;=
<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 u32 sdhost_delay[3];<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 host-&gt;res =3D platform_get_resource(pdev, IORESOURCE_MEM, =
0);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 if (!host-&gt;res)<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOENT;<br>&gt; &g=
t; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 host-&gt;ioaddr =3D devm_ioremap_r=
esource(&amp;pdev-&gt;dev, host-&gt;res);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 if (IS_ERR(host-&gt;ioaddr)) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D PTR_ERR(host-&gt;ioaddr);<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;pdev-&gt;dev,=
 &quot;can not map iomem: %d\n&quot;, ret);<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 }<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 host-&gt;mapbas=
e =3D host-&gt;res-&gt;start;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 host-&gt;=
irq =3D platform_get_irq(pdev, 0);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 if (=
host-&gt;irq &lt; 0) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ret =3D host-&gt;irq;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 }<br=
>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 host-&gt;clk =3D devm_clk_=
get(&amp;pdev-&gt;dev, NULL);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 if (IS_ER=
R_OR_NULL(host-&gt;clk)) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ret =3D PTR_ERR(host-&gt;clk);<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;pdev-&gt;dev, &quot;can=
 not get clock: %d\n&quot;, ret);<br>&gt;<br>&gt; Remove, printed by the cl=
ock framework.<br><br>Ok, thanks!<br><br>&gt;<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 }<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 host-&gt;base_c=
lk =3D clk_get_rate(host-&gt;clk);<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 ret =3D of_property_read_string(np, &quot;sprd,name&quot;, &amp;=
host-&gt;device_name);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>&g=
t; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;pde=
v-&gt;dev,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;can not read the property of sprd name\n&=
quot;);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 got=
o err;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; +<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 ret =3D get_caps_info(host);<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 if (ret)<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto err;<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 hos=
t-&gt;detect_gpio =3D of_get_named_gpio(np, &quot;cd-gpios&quot;, 0);<br>&g=
t;<br>&gt; Already covered by mmc_of_parse().<br><br>Sorry, we will deal wi=
th it.<br><br>&gt;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 if (!gpio_is_valid(h=
ost-&gt;detect_gpio))<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 host-&gt;detect_gpio =3D -1;<br>&gt; &gt; +<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 ret =3D of_property_read_u32_array(np, &quot;sprd,delay&q=
uot;, sdhost_delay, 3);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 if (!ret) {<br>=
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;write=
_delay =3D sdhost_delay[0];<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 host-&gt;read_pos_delay =3D sdhost_delay[1];<br>&gt; &gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;read_neg_delay=
 =3D sdhost_delay[2];<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 } else<br>&gt; &g=
t; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;pdev-&gt=
;dev,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;can not read the property of sprd delay\n&qu=
ot;);<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 return 0;<br>&gt; =
&gt; +<br>&gt; &gt; +err:<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;=
pdev-&gt;dev, &quot;sprd_sdhost get basic resource fail\n&quot;);<br>&gt; &=
gt; + =C2=A0 =C2=A0 =C2=A0 return ret;<br>&gt; &gt; +}<br>&gt; &gt; +<br>&g=
t; &gt; +static int _get_ext_resource(struct sdhost_host *host)<br>&gt; &gt=
; +{<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 int err;<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 struct mmc_host *mmc =3D host-&gt;mmc;<br>&gt; &gt; +<br>&gt; &g=
t; + =C2=A0 =C2=A0 =C2=A0 host-&gt;dma_mask =3D DMA_BIT_MASK(64);<br>&gt; &=
gt; + =C2=A0 =C2=A0 =C2=A0 host-&gt;data_timeout_val =3D 0;<br>&gt; &gt; +<=
br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 /* 1 LDO */<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 mmc_regulator_get_supply(mmc);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 if (IS_ERR_OR_NULL(mmc-&gt;supply.vmmc)) {<br>&gt; &gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err(&quot;%s(%s): no vmmc regulator =
found\n&quot;,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, host-&gt;device_name);<br>&gt; &gt=
; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmc-&gt;supply.vmmc =
=3D NULL;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 if (IS_ERR_OR_NULL(mmc-&gt;supply.vqmmc)) {<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err(&quot;%s(%s): no vqmmc=
 regulator found\n&quot;,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, host-&gt;device_name);<=
br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmc-&gt;sup=
ply.vqmmc =3D NULL;<br>&gt;<br>&gt; First; both regulators are made optiona=
l when fetching them via<br>&gt; mmc_regulator_get_supply().<br>&gt;<br>&gt=
; Second; the prints are already managed by the mmc core, so I don&#39;t<br=
>&gt; think you need it here as well.<br>&gt;<br>Yes, thanks.<br>We will de=
lete this redundant debug informaton.<br><br><br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 } else {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 regulator_is_supported_voltage(mmc-&gt;supply.vqmmc,<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0host-&gt;signal_default_voltage,<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ho=
st-&gt;signal_default_voltage);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 regulator_set_voltage(mmc-&gt;supply.vqmmc,<br>&gt; &g=
t; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;signal_def=
ault_voltage,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 host-&gt;signal_default_voltage);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 }<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 host-&gt;mmc =3D mmc;<br>&gt; &gt=
; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 /* 2 clock */<br>&gt; &gt; + =C2=A0=
 =C2=A0 =C2=A0 clk_prepare_enable(host-&gt;clk);<br>&gt; &gt; +<br><br>[...=
]<br><br>&gt; &gt; +static int sdhost_remove(struct platform_device *pdev)<=
br>&gt; &gt; +{<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 struct sdhost_host *hos=
t =3D platform_get_drvdata(pdev);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 struc=
t mmc_host *mmc =3D host-&gt;mmc;<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 if (-1 !=3D host-&gt;detect_gpio)<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmc_gpio_free_cd(mmc);<br>&gt; &gt; +<br=
>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 mmc_remove_host(mmc);<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 clk_disable_unprepare(host-&gt;clk);<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 free_irq(host-&gt;irq, host);<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 release_mem_region(host-&gt;res-&gt;start, resource_size(host-&g=
t;res));<br>&gt;<br>&gt; Both free_irq() and release_mem_region() isn&#39;t=
 need since I think you<br>&gt; used the devm_* functions, right!?<br>&gt;<=
br><br>Yes, I will deal with it.<br>Thanks. <br><br>[...]<br><br>&gt; &gt; =
+static const struct of_device_id sdhost_of_match[] =3D {<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 {.compatible =3D &quot;sprd,sdhost-3.0&quot;},<br>&gt;=
 &gt; + =C2=A0 =C2=A0 =C2=A0 { /* sentinel */ }<br>&gt; &gt; +};<br>&gt; &g=
t; +<br>&gt; &gt; +MODULE_DEVICE_TABLE(of, sdhost_of_match);<br>&gt; &gt; +=
<br>&gt; &gt; +static struct platform_driver sdhost_driver =3D {<br>&gt; &g=
t; + =C2=A0 =C2=A0 =C2=A0 .probe =3D sdhost_probe,<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 .remove =3D sdhost_remove,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 .driver =3D {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0.owner =3D THIS_MODULE,<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pm =3D &amp;sdhost_dev_pm_=
ops,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.name =3D DRIVER_NAME,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D of_match_ptr(sdhost_o=
f_match),<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0},<br>&gt; &gt; +};<br>&gt; &gt; +<br>&gt; &gt; +module_platfo=
rm_driver(sdhost_driver);<br>&gt; &gt; +<br>&gt; &gt; +MODULE_DESCRIPTION(&=
quot;Spreadtrum sdio host controller driver&quot;);<br>&gt; &gt; +MODULE_LI=
CENSE(&quot;GPL&quot;);<br>&gt;<br>&gt; So I will stop here for now and let=
 you address my comments. Hopefully<br>&gt; I should be able to give a quic=
ker response once you post the next<br>&gt; version.<br><br>Thanks for your=
 kindly review.<br><br>&gt;<br>&gt; Kind regards<br>&gt; Uffe<br>&gt;<br>&g=
t; &gt; diff --git a/drivers/mmc/host/sprd_sdhost.h b/drivers/mmc/host/sprd=
_sdhost.h<br>&gt; &gt; new file mode 100644<br>&gt; &gt; index 0000000..d5c=
c438<br>&gt; &gt; --- /dev/null<br>&gt; &gt; +++ b/drivers/mmc/host/sprd_sd=
host.h<br>&gt; &gt; @@ -0,0 +1,615 @@<br>&gt; &gt; +/*<br>&gt; &gt; + * lin=
ux/drivers/mmc/host/sprd_sdhost.h - Secure Digital Host Controller<br>&gt; =
&gt; + * Interface driver<br>&gt; &gt; + *<br>&gt; &gt; + * Copyright (C) 2=
015 Spreadtrum corporation.<br>&gt; &gt; + *<br>&gt; &gt; + * This program =
is free software; you can redistribute it and/or modify<br>&gt; &gt; + * it=
 under the terms of the GNU General Public License as published by<br>&gt; =
&gt; + * the Free Software Foundation; either version 2 of the License, or =
(at<br>&gt; &gt; + * your option) any later version.<br>&gt; &gt; + *<br>&g=
t; &gt; + */<br>&gt; &gt; +<br>&gt; &gt; +#ifndef __SDHOST_H_<br>&gt; &gt; =
+#define __SDHOST_H_<br>&gt; &gt; +<br>&gt; &gt; +#include &lt;linux/clk.h&=
gt;<br>&gt; &gt; +#include &lt;linux/compiler.h&gt;<br>&gt; &gt; +#include =
&lt;linux/io.h&gt;<br>&gt; &gt; +#include &lt;linux/kernel.h&gt;<br>&gt; &g=
t; +#include &lt;linux/mmc/card.h&gt;<br>&gt; &gt; +#include &lt;linux/mmc/=
host.h&gt;<br>&gt; &gt; +#include &lt;linux/mmc/mmc.h&gt;<br>&gt; &gt; +#in=
clude &lt;linux/mmc/slot-gpio.h&gt;<br>&gt; &gt; +#include &lt;linux/scatte=
rlist.h&gt;<br>&gt; &gt; +#include &lt;linux/types.h&gt;<br>&gt; &gt; +<br>=
&gt; &gt; +/**********************************************************\<br>=
&gt; &gt; + *<br>&gt; &gt; + * Controller block structure<br>&gt; &gt; + *<=
br>&gt; &gt; +\**********************************************************/<=
br>&gt; &gt; +struct sdhost_host {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 /* -=
-globe resource--- */<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 spinlock_t lock;<=
br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 struct mmc_host *mmc;<br>&gt; &gt; +<br=
>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 /*--basic resource-- */<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 struct resource *res;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 void __iomem *ioaddr;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 int irq;<br>&=
gt; &gt; + =C2=A0 =C2=A0 =C2=A0 const char *device_name;<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 struct platform_device *pdev;<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 unsigned long mapbase;<br>&gt; &gt; +<br><br>[...]<br><br>&gt; &=
gt; +#define SDHOST_32_ARG =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A00x08<br>&gt; &gt; +#define SDHOST_16_TR_MODE =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0C<br>&gt; &gt; +#define __ACMD_DIS =C2=
=A0 =C2=A0 0x00<br>&gt; &gt; +#define __ACMD12 =C2=A0 =C2=A0 =C2=A0 0x01<br=
>&gt; &gt; +#define __ACMD23 =C2=A0 =C2=A0 =C2=A0 0x02<br>&gt; &gt; +<br>&g=
t; &gt; +static inline void _sdhost_set_trans_mode(struct sdhost_host *host=
,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 u16 if_mult, u16 if_read,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u16 auto_cmd,<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u16 if_b=
lk_cnt, u16 if_dma)<br>&gt; &gt; +{<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 __l=
ocal_writew((((if_mult ? 1 : 0) &lt;&lt; 5) |<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((if_read ? =
1 : 0) &lt;&lt; 4) |<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (auto_cmd &lt;&lt; 2) |<br>&gt; &gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ((if_blk_cnt ? 1 : 0) &lt;&lt; 1) |<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((if_dma ? 1 : =
0) &lt;&lt; 0)), host, SDHOST_16_TR_MODE);<br>&gt; &gt; +}<br><br>&gt; &gt;=
 +<br>&gt; &gt; +#endif<br>&gt; &gt; --<br>&gt; &gt; 1.7.9.5<br>&gt; &gt;<b=
r><br></div></div></div></div></div></div>

--089e0149c372480f570520c9802e--
