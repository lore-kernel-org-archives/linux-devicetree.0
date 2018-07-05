From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH v3 2/2] phy: bcm-sr-pcie: Add Stingray PCIe PHY driver
Date: Thu, 5 Jul 2018 09:19:19 -0700
Message-ID: <dbd3a46c-a56f-f982-7227-98c660f645f4@broadcom.com>
References: <1530728533-28770-1-git-send-email-ray.jui@broadcom.com>
 <1530728533-28770-3-git-send-email-ray.jui@broadcom.com>
 <b6b9afb5-4644-537d-92b0-1d1e7ea1b026@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b6b9afb5-4644-537d-92b0-1d1e7ea1b026@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Hi Kishon,

On 7/5/2018 4:39 AM, Kishon Vijay Abraham I wrote:
> Hi,
> 
> On Wednesday 04 July 2018 11:52 PM, Ray Jui wrote:
>> Add Stingray PCIe PHY driver for both PAXB and PAXC root complex
>>
>> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
>> ---
>>   drivers/phy/broadcom/Kconfig           |  10 +
>>   drivers/phy/broadcom/Makefile          |   2 +
>>   drivers/phy/broadcom/phy-bcm-sr-pcie.c | 327 +++++++++++++++++++++++++++++++++
>>   3 files changed, 339 insertions(+)
>>   create mode 100644 drivers/phy/broadcom/phy-bcm-sr-pcie.c
>>
>> diff --git a/drivers/phy/broadcom/Kconfig b/drivers/phy/broadcom/Kconfig
>> index 97d27b0d5..8786a96 100644
>> --- a/drivers/phy/broadcom/Kconfig
>> +++ b/drivers/phy/broadcom/Kconfig
>> @@ -80,3 +80,13 @@ config PHY_BRCM_USB
>>   	  This driver is required by the USB XHCI, EHCI and OHCI
>>   	  drivers.
>>   	  If unsure, say N.
>> +
>> +config PHY_BCM_SR_PCIE
>> +	tristate "Broadcom Stingray PCIe PHY driver"
>> +	depends on OF && (ARCH_BCM_IPROC || COMPILE_TEST)
>> +	select GENERIC_PHY
>> +	select MFD_SYSCON
>> +	default ARCH_BCM_IPROC
>> +	help
>> +	  Enable this to support the Broadcom Stingray PCIe PHY
>> +	  If unsure, say N.
>> diff --git a/drivers/phy/broadcom/Makefile b/drivers/phy/broadcom/Makefile
>> index 13e000c..0f60184 100644
>> --- a/drivers/phy/broadcom/Makefile
>> +++ b/drivers/phy/broadcom/Makefile
>> @@ -9,3 +9,5 @@ obj-$(CONFIG_PHY_BRCM_SATA)		+= phy-brcm-sata.o
>>   obj-$(CONFIG_PHY_BRCM_USB)		+= phy-brcm-usb-dvr.o
>>   
>>   phy-brcm-usb-dvr-objs := phy-brcm-usb.o phy-brcm-usb-init.o
>> +
>> +obj-$(CONFIG_PHY_BCM_SR_PCIE)		+= phy-bcm-sr-pcie.o
>> diff --git a/drivers/phy/broadcom/phy-bcm-sr-pcie.c b/drivers/phy/broadcom/phy-bcm-sr-pcie.c
>> new file mode 100644
>> index 0000000..ff15dae
>> --- /dev/null
>> +++ b/drivers/phy/broadcom/phy-bcm-sr-pcie.c
>> @@ -0,0 +1,327 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2016-2018 Broadcom
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/of.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +/* we have up to 8 PAXB based RC. The 9th one is always PAXC */
>> +#define SR_NR_PCIE_PHYS               9
>> +#define SR_PAXC_PHY_IDX               (SR_NR_PCIE_PHYS - 1)
>> +
>> +#define PCIE_PIPEMUX_CFG_OFFSET       0x10c
>> +#define PCIE_PIPEMUX_SELECT_STRAP     0xf
>> +
>> +#define CDRU_STRAP_DATA_LSW_OFFSET    0x5c
>> +#define PCIE_PIPEMUX_SHIFT            19
>> +#define PCIE_PIPEMUX_MASK             0xf
>> +
>> +#define MHB_MEM_PW_PAXC_OFFSET        0x1c0
>> +#define MHB_PWR_ARR_POWERON           0x8
>> +#define MHB_PWR_ARR_POWEROK           0x4
>> +#define MHB_PWR_POWERON               0x2
>> +#define MHB_PWR_POWEROK               0x1
>> +#define MHB_PWR_STATUS_MASK           (MHB_PWR_ARR_POWERON | \
>> +				       MHB_PWR_ARR_POWEROK | \
>> +				       MHB_PWR_POWERON | \
>> +				       MHB_PWR_POWEROK)
>> +
>> +struct sr_pcie_phy_core;
>> +
>> +/**
>> + * struct sr_pcie_phy - Stingray PCIe PHY
>> + *
>> + * @core: pointer to the Stingray PCIe PHY core control
>> + * @index: PHY index
>> + * @phy: pointer to the kernel PHY device
>> + */
>> +struct sr_pcie_phy {
>> +	struct sr_pcie_phy_core *core;
>> +	unsigned int index;
>> +	struct phy *phy;
>> +};
>> +
>> +/**
>> + * struct sr_pcie_phy_core - Stingray PCIe PHY core control
>> + *
>> + * @dev: pointer to device
>> + * @base: base register of PCIe SS
>> + * @cdru: regmap to the CDRU device
>> + * @mhb: regmap to the MHB device
>> + * @pipemux: pipemuex strap
>> + * @phys: array of PCIe PHYs
>> + */
>> +struct sr_pcie_phy_core {
>> +	struct device *dev;
>> +	void __iomem *base;
>> +	struct regmap *cdru;
>> +	struct regmap *mhb;
>> +	u32 pipemux;
>> +	struct sr_pcie_phy phys[SR_NR_PCIE_PHYS];
>> +};
>> +
>> +/*
>> + * PCIe PIPEMUX lookup table
>> + *
>> + * Each array index represents a PIPEMUX strap setting
>> + * The array element represents a bitmap where a set bit means the PCIe
>> + * core and associated serdes has been enabled as RC and is available for use
>> + */
>> +static const u8 pipemux_table[] = {
>> +	/* PIPEMUX = 0, EP 1x16 */
>> +	0x00,
>> +	/* PIPEMUX = 1, EP 2x8 */
>> +	0x00,
>> +	/* PIPEMUX = 2, EP 4x4 */
>> +	0x00,
>> +	/* PIPEMUX = 3, RC 2x8, cores 0, 7 */
>> +	0x81,
>> +	/* PIPEMUX = 4, RC 4x4, cores 0, 1, 6, 7 */
>> +	0xc3,
>> +	/* PIPEMUX = 5, RC 8x2, all 8 cores */
>> +	0xff,
>> +	/* PIPEMUX = 6, RC 3x4 + 2x2, cores 0, 2, 3, 6, 7 */
>> +	0xcd,
>> +	/* PIPEMUX = 7, RC 1x4 + 6x2, cores 0, 2, 3, 4, 5, 6, 7 */
>> +	0xfd,
>> +	/* PIPEMUX = 8, EP 1x8 + RC 4x2, cores 4, 5, 6, 7 */
>> +	0xf0,
>> +	/* PIPEMUX = 9, EP 1x8 + RC 2x4, cores 6, 7 */
>> +	0xc0,
>> +	/* PIPEMUX = 10, EP 2x4 + RC 2x4, cores 1, 6 */
>> +	0x42,
>> +	/* PIPEMUX = 11, EP 2x4 + RC 4x2, cores 2, 3, 4, 5 */
>> +	0x3c,
>> +	/* PIPEMUX = 12, EP 1x4 + RC 6x2, cores 2, 3, 4, 5, 6, 7 */
>> +	0xfc,
>> +	/* PIPEMUX = 13, RC 2x4 + RC 1x4 + 2x2, cores 2, 3, 6 */
>> +	0x4c,
>> +};
> 
> Please use mux framework for this. (drivers/mux/mmio.c)

I took a look at drivers/mux/core.c and drivers/mux/mmio.c. If my 
understanding is correct, they aim to use a "mux controller" that allows 
programming of registers based on "mux state" change, which is what 
mux_mmio_set does.

My case is very different here, note all PIPEMUX settings here are 
preset very early in our bootloader, we are *not* capable of changing 
any mux settings in Linux. Instead, we are only reading the preset 
PIPEMUX setting to determine which PHY is active, and then perform 
further operations on that PHY when needed.

Therefore, I do not think mux framework is suitable to be used in this 
driver here.

>> +
>> +/*
>> + * Return true if the strap setting is valid
>> + */
>> +static bool pipemux_strap_is_valid(u32 pipemux)
>> +{
>> +	return !!(pipemux < ARRAY_SIZE(pipemux_table));
>> +}
>> +
>> +/*
>> + * Read the PCIe PIPEMUX from strap
>> + */
>> +static u32 pipemux_strap_read(struct sr_pcie_phy_core *core)
>> +{
>> +	u32 pipemux;
>> +
>> +	/*
>> +	 * Read PIPEMUX configuration register to determine the pipemux setting
>> +	 *
>> +	 * In the case when the value indicates using HW strap, fall back to
>> +	 * use HW strap
>> +	 */
>> +	pipemux = readl(core->base + PCIE_PIPEMUX_CFG_OFFSET);
>> +	pipemux &= PCIE_PIPEMUX_MASK;
>> +	if (pipemux == PCIE_PIPEMUX_SELECT_STRAP) {
>> +		regmap_read(core->cdru, CDRU_STRAP_DATA_LSW_OFFSET, &pipemux);
>> +		pipemux >>= PCIE_PIPEMUX_SHIFT;
>> +		pipemux &= PCIE_PIPEMUX_MASK;
>> +	}
>> +
>> +	return pipemux;
>> +}
>> +
>> +/*
>> + * Given a PIPEMUX strap and PCIe core index, this function returns true if the
>> + * PCIe core needs to be enabled
>> + */
>> +static bool pcie_core_is_for_rc(struct sr_pcie_phy *phy)
>> +{
>> +	struct sr_pcie_phy_core *core = phy->core;
>> +	unsigned int core_idx = phy->index;
>> +
>> +	return !!((pipemux_table[core->pipemux] >> core_idx) & 0x1);
>> +}
>> +
>> +static int sr_pcie_phy_init(struct phy *p)
>> +{
>> +	struct sr_pcie_phy *phy = phy_get_drvdata(p);
>> +
>> +	/*
>> +	 * Check whether this PHY is for root complex or not. If yes, return
>> +	 * zero so the host driver can proceed to enumeration. If not, return
>> +	 * an error and that will force the host driver to bail out
>> +	 */
>> +	if (pcie_core_is_for_rc(phy))
>> +		return 0;
>> +	else
> 
> This else can be removed.

Sure I'll remove the else here.

>> +		return -ENODEV;
>> +}
>> +
>> +static int sr_paxc_phy_init(struct phy *p)
>> +{
>> +	struct sr_pcie_phy *phy = phy_get_drvdata(p);
>> +	struct sr_pcie_phy_core *core = phy->core;
>> +	unsigned int core_idx = phy->index;
>> +	u32 val;
>> +
>> +	if (core_idx != SR_PAXC_PHY_IDX)
>> +		return -EINVAL;
>> +
>> +	regmap_read(core->mhb, MHB_MEM_PW_PAXC_OFFSET, &val);
>> +	if ((val & MHB_PWR_STATUS_MASK) != MHB_PWR_STATUS_MASK) {
>> +		dev_err(core->dev, "PAXC is not powered up\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int sr_pcie_phy_exit(struct phy *p)
>> +{
>> +	/* dummy function to allow host driver to proceed */
>> +	return 0;
>> +}
>> +
>> +static int sr_pcie_phy_power_on(struct phy *p)
>> +{
>> +	/* dummy function to allow host driver to proceed */
>> +	return 0;
>> +}
>> +
>> +static int sr_pcie_phy_power_off(struct phy *p)
>> +{
>> +	/* dummy function to allow host to proceed */
>> +	return 0;
>> +}
> 
> dummy functions are not required.

Okay will remove them. Thanks.

>> +
>> +static const struct phy_ops sr_pcie_phy_ops = {
>> +	.init = sr_pcie_phy_init,
>> +	.exit = sr_pcie_phy_exit,
>> +	.power_on = sr_pcie_phy_power_on,
>> +	.power_off = sr_pcie_phy_power_off,
>> +};
>> +
>> +static const struct phy_ops sr_paxc_phy_ops = {
>> +	.init = sr_paxc_phy_init,
>> +	.exit = sr_pcie_phy_exit,
>> +	.power_on = sr_pcie_phy_power_on,
>> +	.power_off = sr_pcie_phy_power_off,
>> +};
> 
> phy_ops should have .owner.

Will add that. Thanks!

> 
> Thanks
> Kishon
> 

Thanks,

Ray
