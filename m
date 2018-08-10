From: vnkgutta@codeaurora.org
Subject: Re: [PATCH v1 3/4] drivers: edac: Add EDAC driver support for QCOM
 SoCs
Date: Fri, 10 Aug 2018 16:13:01 -0700
Message-ID: <2f1f8fcb95ed82219817800577ced67d@codeaurora.org>
References: <1533155615-27929-1-git-send-email-vnkgutta@codeaurora.org>
 <1533155615-27929-4-git-send-email-vnkgutta@codeaurora.org>
 <CAE=gft5-5sVE-ih26KzJdpeth7Hq6QKNrP+oj_1JR=zYrdo0rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAE=gft5-5sVE-ih26KzJdpeth7Hq6QKNrP+oj_1JR=zYrdo0rw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>
Cc: robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, bp@alien8.de
List-Id: devicetree@vger.kernel.org

On 2018-08-10 10:23, Evan Green wrote:
> On Wed, Aug 1, 2018 at 1:34 PM Venkata Narendra Kumar Gutta
> <vnkgutta@codeaurora.org> wrote:
>> 
>> From: Channagoud Kadabi <ckadabi@codeaurora.org>
>> 
>> Add error reporting driver for SBEs and DBEs. As of now, this driver
>> supports erp for Last Level Cache Controller (LLCC). This driver takes
>> care of dumping registers and adding config options to enable and
>> disable panic when the errors happen in cache.
>> 
>> Co-developed-by: Venkata Narendra Kumar Gutta 
>> <vnkgutta@codeaurora.org>
>> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
>> Signed-off-by: Channagoud Kadabi <ckadabi@codeaurora.org>
>> ---
>>  MAINTAINERS              |   7 +
>>  drivers/edac/Kconfig     |  28 +++
>>  drivers/edac/Makefile    |   1 +
>>  drivers/edac/qcom_edac.c | 507 
>> +++++++++++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 543 insertions(+)
>>  create mode 100644 drivers/edac/qcom_edac.c
>> 
> ...
>> diff --git a/drivers/edac/qcom_edac.c b/drivers/edac/qcom_edac.c
>> new file mode 100644
>> index 0000000..cf3e2b0
>> --- /dev/null
>> +++ b/drivers/edac/qcom_edac.c
>> @@ -0,0 +1,507 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/edac.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/smp.h>
>> +#include <linux/regmap.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/soc/qcom/llcc-qcom.h>
> 
> Please alphabetize these includes, and remove any unneeded ones.
Ok, I'll update it in the next version. I didn't know that it's 
mandatory to have in alphabetic order.
Is it recommended or a strict rule that we have includes in alphabetize 
order?
> 
>> +#include "edac_mc.h"
>> +#include "edac_device.h"
>> +
>> +#ifdef CONFIG_EDAC_QCOM_LLCC_PANIC_ON_UE
>> +#define LLCC_ERP_PANIC_ON_UE            1
>> +#else
>> +#define LLCC_ERP_PANIC_ON_UE            0
>> +#endif
>> +
>> +#define EDAC_LLCC                       "qcom_llcc"
>> +
>> +#define TRP_SYN_REG_CNT                 6
>> +
>> +#define DRP_SYN_REG_CNT                 8
>> +
>> +#define LLCC_COMMON_STATUS0             0x0003000C
>> +#define LLCC_LB_CNT_MASK                GENMASK(31, 28)
>> +#define LLCC_LB_CNT_SHIFT               28
>> +
>> +/* single & Double Bit syndrome register offsets */
>> +#define TRP_ECC_SB_ERR_SYN0             0x0002304C
>> +#define TRP_ECC_DB_ERR_SYN0             0x00020370
>> +#define DRP_ECC_SB_ERR_SYN0             0x0004204C
>> +#define DRP_ECC_DB_ERR_SYN0             0x00042070
>> +
>> +/* Error register offsets */
>> +#define TRP_ECC_ERROR_STATUS1           0x00020348
>> +#define TRP_ECC_ERROR_STATUS0           0x00020344
>> +#define DRP_ECC_ERROR_STATUS1           0x00042048
>> +#define DRP_ECC_ERROR_STATUS0           0x00042044
>> +
>> +/* TRP, DRP interrupt register offsets */
>> +#define DRP_INTERRUPT_STATUS            0x00041000
>> +#define TRP_INTERRUPT_0_STATUS          0x00020480
>> +#define DRP_INTERRUPT_CLEAR             0x00041008
>> +#define DRP_ECC_ERROR_CNTR_CLEAR        0x00040004
>> +#define TRP_INTERRUPT_0_CLEAR           0x00020484
>> +#define TRP_ECC_ERROR_CNTR_CLEAR        0x00020440
>> +
>> +/* Mask and shift macros */
>> +#define ECC_DB_ERR_COUNT_MASK           GENMASK(4, 0)
>> +#define ECC_DB_ERR_WAYS_MASK            GENMASK(31, 16)
>> +#define ECC_DB_ERR_WAYS_SHIFT           BIT(4)
>> +
>> +#define ECC_SB_ERR_COUNT_MASK           GENMASK(23, 16)
>> +#define ECC_SB_ERR_COUNT_SHIFT          BIT(4)
>> +#define ECC_SB_ERR_WAYS_MASK            GENMASK(15, 0)
>> +
>> +#define SB_ECC_ERROR                    BIT(0)
>> +#define DB_ECC_ERROR                    BIT(1)
>> +
>> +#define DRP_TRP_INT_CLEAR               GENMASK(1, 0)
>> +#define DRP_TRP_CNT_CLEAR               GENMASK(1, 0)
>> +
>> +/* Config registers offsets*/
>> +#define DRP_ECC_ERROR_CFG               0x00040000
>> +
>> +/* TRP, DRP interrupt register offsets */
>> +#define CMN_INTERRUPT_0_ENABLE          0x0003001C
>> +#define CMN_INTERRUPT_2_ENABLE          0x0003003C
>> +#define TRP_INTERRUPT_0_ENABLE          0x00020488
>> +#define DRP_INTERRUPT_ENABLE            0x0004100C
>> +
>> +#define SB_ERROR_THRESHOLD              0x1
>> +#define SB_ERROR_THRESHOLD_SHIFT        24
>> +#define SB_DB_TRP_INTERRUPT_ENABLE      0x3
>> +#define TRP0_INTERRUPT_ENABLE           0x1
>> +#define DRP0_INTERRUPT_ENABLE           BIT(6)
>> +#define SB_DB_DRP_INTERRUPT_ENABLE      0x3
>> +
>> +
>> +enum {
>> +       LLCC_DRAM_CE = 0,
>> +       LLCC_DRAM_UE,
>> +       LLCC_TRAM_CE,
>> +       LLCC_TRAM_UE,
>> +};
>> +
>> +struct errors_edac {
>> +       const char *msg;
>> +       void (*func)(struct edac_device_ctl_info *edev_ctl,
>> +                               int inst_nr, int block_nr, const char 
>> *msg);
>> +};
>> +
>> +static const struct errors_edac errors[] = {
>> +       {"LLCC Data RAM correctable Error", edac_device_handle_ce},
>> +       {"LLCC Data RAM uncorrectable Error", edac_device_handle_ue},
>> +       {"LLCC Tag RAM correctable Error", edac_device_handle_ce},
>> +       {"LLCC Tag RAM uncorrectable Error", edac_device_handle_ue},
>> +};
>> +
>> +static int qcom_llcc_core_setup(struct regmap *llcc_bcast_regmap)
>> +{
>> +       u32 sb_err_threshold;
>> +       int ret;
>> +
>> +       /* Enable TRP in instance 2 of common interrupt enable 
>> register */
>> +       ret = regmap_update_bits(llcc_bcast_regmap, 
>> CMN_INTERRUPT_2_ENABLE,
>> +                                TRP0_INTERRUPT_ENABLE,
>> +                                TRP0_INTERRUPT_ENABLE);
>> +       if (ret)
>> +               return ret;
>> +
>> +       /* Enable ECC interrupts on Tag Ram */
>> +       ret = regmap_update_bits(llcc_bcast_regmap, 
>> TRP_INTERRUPT_0_ENABLE,
>> +                                SB_DB_TRP_INTERRUPT_ENABLE,
>> +                                SB_DB_TRP_INTERRUPT_ENABLE);
>> +       if (ret)
>> +               return ret;
>> +
>> +       /* Enable SB error for Data RAM */
>> +       sb_err_threshold = (SB_ERROR_THRESHOLD << 
>> SB_ERROR_THRESHOLD_SHIFT);
>> +       ret = regmap_write(llcc_bcast_regmap, DRP_ECC_ERROR_CFG,
>> +                          sb_err_threshold);
>> +       if (ret)
>> +               return ret;
>> +
>> +       /* Enable DRP in instance 2 of common interrupt enable 
>> register */
>> +       ret = regmap_update_bits(llcc_bcast_regmap, 
>> CMN_INTERRUPT_2_ENABLE,
>> +                                DRP0_INTERRUPT_ENABLE,
>> +                                DRP0_INTERRUPT_ENABLE);
>> +       if (ret)
>> +               return ret;
>> +
>> +       /* Enable ECC interrupts on Data Ram */
>> +       ret = regmap_write(llcc_bcast_regmap, DRP_INTERRUPT_ENABLE,
>> +                          SB_DB_DRP_INTERRUPT_ENABLE);
>> +       return ret;
>> +}
>> +
>> +/* Clear the error interrupt and counter registers */
>> +static int qcom_llcc_clear_errors(int err_type, struct llcc_drv_data 
>> *drv)
>> +{
>> +       int ret = 0;
>> +
>> +       switch (err_type) {
>> +       case LLCC_DRAM_CE:
>> +       case LLCC_DRAM_UE:
>> +               /* Clear the interrupt */
>> +               ret = regmap_write(drv->bcast_regmap, 
>> DRP_INTERRUPT_CLEAR,
>> +                                  DRP_TRP_INT_CLEAR);
>> +               if (ret)
>> +                       return ret;
>> +
>> +               /* Clear the counters */
>> +               ret = regmap_write(drv->bcast_regmap, 
>> DRP_ECC_ERROR_CNTR_CLEAR,
>> +                                  DRP_TRP_CNT_CLEAR);
>> +               if (ret)
>> +                       return ret;
>> +               break;
>> +       case LLCC_TRAM_CE:
>> +       case LLCC_TRAM_UE:
>> +               ret = regmap_write(drv->bcast_regmap, 
>> TRP_INTERRUPT_0_CLEAR,
>> +                                  DRP_TRP_INT_CLEAR);
>> +               if (ret)
>> +                       return ret;
>> +
>> +               ret = regmap_write(drv->bcast_regmap, 
>> TRP_ECC_ERROR_CNTR_CLEAR,
>> +                                  DRP_TRP_CNT_CLEAR);
>> +               if (ret)
>> +                       return ret;
>> +               break;
>> +       }
>> +       return ret;
>> +}
>> +
>> +/* Dump syndrome registers for tag Ram Double bit errors */
>> +static int dump_trp_db_syn_reg(struct llcc_drv_data *drv, u32 bank)
>> +{
>> +       int db_err_cnt, db_err_ways, ret, i;
>> +       u32 synd_reg, synd_val;
>> +
>> +       for (i = 0; i < TRP_SYN_REG_CNT; i++) {
>> +               synd_reg = TRP_ECC_DB_ERR_SYN0 + (i * 4);
>> +               ret = regmap_read(drv->regmap, drv->offsets[bank] + 
>> synd_reg,
>> +                                 &synd_val);
>> +               if (ret)
>> +                       return ret;
>> +               edac_printk(KERN_CRIT, EDAC_LLCC, "TRP_ECC_SYN%d: 
>> 0x%8x\n",
>> +                           i, synd_val);
>> +       }
>> +
>> +       ret = regmap_read(drv->regmap,
>> +                         drv->offsets[bank] + TRP_ECC_ERROR_STATUS1,
>> +                         &db_err_cnt);
>> +       if (ret)
>> +               return ret;
>> +       db_err_cnt = (db_err_cnt & ECC_DB_ERR_COUNT_MASK);
>> +       edac_printk(KERN_CRIT, EDAC_LLCC, "Double-Bit error count: 
>> 0x%4x\n",
>> +                   db_err_cnt);
>> +
>> +       ret = regmap_read(drv->regmap,
>> +                         drv->offsets[bank] + TRP_ECC_ERROR_STATUS0,
>> +                         &db_err_ways);
>> +       if (ret)
>> +               return ret;
>> +       db_err_ways = (db_err_ways & ECC_DB_ERR_WAYS_MASK);
>> +       db_err_ways >>= ECC_DB_ERR_WAYS_SHIFT;
>> +
>> +       edac_printk(KERN_CRIT, EDAC_LLCC, "Double-Bit error ways: 
>> 0x%4x\n",
>> +                   db_err_ways);
>> +
>> +       return ret;
>> +}
>> +
>> +/* Dump syndrome register for tag Ram Single Bit Errors */
>> +static int dump_trp_sb_syn_reg(struct llcc_drv_data *drv, u32 bank)
>> +{
>> +       int sb_err_cnt, sb_err_ways, ret, i;
>> +       u32 synd_reg, synd_val;
>> +
>> +       for (i = 0; i < TRP_SYN_REG_CNT; i++) {
>> +               synd_reg = TRP_ECC_SB_ERR_SYN0 + (i * 4);
>> +               ret = regmap_read(drv->regmap, drv->offsets[bank] + 
>> synd_reg,
>> +                                 &synd_val);
>> +               if (ret)
>> +                       return ret;
>> +               edac_printk(KERN_CRIT, EDAC_LLCC, "TRP_ECC_SYN%d: 
>> 0x%8x\n", i,
>> +                           synd_val);
>> +       }
>> +
>> +       ret = regmap_read(drv->regmap,
>> +                         drv->offsets[bank] + TRP_ECC_ERROR_STATUS1,
>> +                         &sb_err_cnt);
>> +       if (ret)
>> +               return ret;
>> +       sb_err_cnt = (sb_err_cnt & ECC_SB_ERR_COUNT_MASK);
>> +       sb_err_cnt >>= ECC_SB_ERR_COUNT_SHIFT;
>> +       edac_printk(KERN_CRIT, EDAC_LLCC, "Single-Bit error count: 
>> 0x%4x\n",
>> +                   sb_err_cnt);
>> +
>> +       ret = regmap_read(drv->regmap,
>> +                         drv->offsets[bank] + TRP_ECC_ERROR_STATUS0,
>> +                         &sb_err_ways);
>> +       if (ret)
>> +               return ret;
>> +
>> +       sb_err_ways = sb_err_ways & ECC_SB_ERR_WAYS_MASK;
>> +
>> +       edac_printk(KERN_CRIT, EDAC_LLCC, "Single-Bit error ways: 
>> 0x%4x\n",
>> +                   sb_err_ways);
>> +
>> +       return ret;
>> +}
>> +
>> +/* Dump syndrome registers for Data Ram Double bit errors */
>> +static int dump_drp_db_syn_reg(struct llcc_drv_data *drv, u32 bank)
>> +{
>> +       int db_err_cnt, db_err_ways, ret, i;
>> +       u32 synd_reg, synd_val;
>> +
>> +       for (i = 0; i < DRP_SYN_REG_CNT; i++) {
>> +               synd_reg = DRP_ECC_DB_ERR_SYN0 + (i * 4);
>> +               ret = regmap_read(drv->regmap, drv->offsets[bank] + 
>> synd_reg,
>> +                                 &synd_val);
>> +               if (ret)
>> +                       return ret;
>> +               edac_printk(KERN_CRIT, EDAC_LLCC, "DRP_ECC_SYN%d: 
>> 0x%8x\n", i,
>> +                           synd_val);
>> +       }
>> +
>> +       ret = regmap_read(drv->regmap,
>> +                         drv->offsets[bank] + DRP_ECC_ERROR_STATUS1,
>> +                         &db_err_cnt);
>> +       if (ret)
>> +               return ret;
>> +       db_err_cnt = (db_err_cnt & ECC_DB_ERR_COUNT_MASK);
>> +       edac_printk(KERN_CRIT, EDAC_LLCC, "Double-Bit error count: 
>> 0x%4x\n",
>> +                   db_err_cnt);
>> +
>> +       ret = regmap_read(drv->regmap,
>> +                         drv->offsets[bank] + DRP_ECC_ERROR_STATUS0,
>> +                         &db_err_ways);
>> +       if (ret)
>> +               return ret;
>> +       db_err_ways &= ECC_DB_ERR_WAYS_MASK;
>> +       db_err_ways >>= ECC_DB_ERR_WAYS_SHIFT;
>> +       edac_printk(KERN_CRIT, EDAC_LLCC, "Double-Bit error ways: 
>> 0x%4x\n",
>> +                   db_err_ways);
>> +
>> +       return ret;
>> +}
>> +
>> +/* Dump Syndrome registers for Data Ram Single bit errors*/
>> +static int dump_drp_sb_syn_reg(struct llcc_drv_data *drv, u32 bank)
>> +{
>> +       int sb_err_cnt, sb_err_ways, ret, i;
>> +       u32 synd_reg, synd_val;
>> +
>> +       for (i = 0; i < DRP_SYN_REG_CNT; i++) {
>> +               synd_reg = DRP_ECC_SB_ERR_SYN0 + (i * 4);
>> +               ret = regmap_read(drv->regmap, drv->offsets[bank] + 
>> synd_reg,
>> +                                 &synd_val);
>> +               if (ret)
>> +                       return ret;
>> +               edac_printk(KERN_CRIT, EDAC_LLCC, "DRP_ECC_SYN%d: 
>> 0x%8x\n", i,
>> +                           synd_val);
>> +       }
>> +
>> +       ret = regmap_read(drv->regmap,
>> +                         drv->offsets[bank] + DRP_ECC_ERROR_STATUS1,
>> +                         &sb_err_cnt);
>> +       if (ret)
>> +               return ret;
>> +       sb_err_cnt &= ECC_SB_ERR_COUNT_MASK;
>> +       sb_err_cnt >>= ECC_SB_ERR_COUNT_SHIFT;
>> +       edac_printk(KERN_CRIT, EDAC_LLCC, "Single-Bit error count: 
>> 0x%4x\n",
>> +                   sb_err_cnt);
>> +
>> +       ret = regmap_read(drv->regmap,
>> +                         drv->offsets[bank] + DRP_ECC_ERROR_STATUS0,
>> +                         &sb_err_ways);
>> +       if (ret)
>> +               return ret;
>> +       sb_err_ways = sb_err_ways & ECC_SB_ERR_WAYS_MASK;
>> +
>> +       edac_printk(KERN_CRIT, EDAC_LLCC, "Single-Bit error ways: 
>> 0x%4x\n",
>> +                   sb_err_ways);
>> +
>> +       return ret;
>> +}
> 
> As Borislav mentioned, dump_{trp,drp}_{db,sb}_syn_reg are basically
> copy/pastes of each other with minor differences. I wonder if there's
> a way to refactor this so that there's less boilerplate. Maybe a
> helper function for the for loop, and maybe another one to read both
> of the status registers (or optionally just one) might help. Or you
> might do even better with a table, depending on how things shake out.

Sure, I'll explore that option.

> 
>> +
>> +static int dump_syn_reg(struct edac_device_ctl_info *edev_ctl,
>> +                        int err_type, u32 bank)
>> +{
>> +       struct llcc_drv_data *drv = edev_ctl->pvt_info;
>> +       int ret = 0;
>> +
>> +       switch (err_type) {
>> +       case LLCC_DRAM_CE:
>> +               ret = dump_drp_sb_syn_reg(drv, bank);
>> +               break;
>> +       case LLCC_DRAM_UE:
>> +               ret = dump_drp_db_syn_reg(drv, bank);
>> +               break;
>> +       case LLCC_TRAM_CE:
>> +               ret = dump_trp_sb_syn_reg(drv, bank);
>> +               break;
>> +       case LLCC_TRAM_UE:
>> +               ret = dump_trp_db_syn_reg(drv, bank);
>> +               break;
>> +       }
>> +       if (ret)
>> +               return ret;
>> +
> 
> If something fails and you return here without clearing errors, would
> there be an interrupt storm?

I'm not sure on this. I'll have to go back and check the spec. I can 
update
it in the next patch set based on the findings.

> 
>> +       ret = qcom_llcc_clear_errors(err_type, drv);
>> +       if (ret)
>> +               return ret;
>> +
>> +       errors[err_type].func(edev_ctl, 0, bank, 
>> errors[err_type].msg);
>> +
>> +       return ret;
>> +}
>> +
> 
> Whoops, I clipped the rest of this message already, but in probe, the
> type of ecc_irq should be int. Also, in patch 2 you directly assigned
> platform_get_irq into the ecc_irq member, so the if (!ecc_irq) logic
> in probe doesn't quite work if platform_get_irq returns a negative
> number. Is 0 a valid irq number? I don't know.

Yeah, I'll update the data type and fix the logic accordingly.
