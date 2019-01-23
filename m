From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 3/3] phy: ti: Add a new SERDES driver for TI's AM654x SoC
Date: Wed, 23 Jan 2019 17:49:54 +0530
Message-ID: <79862f2a-22b6-e409-364b-e0939784ab9b@ti.com>
References: <20190121064813.18444-1-kishon@ti.com>
 <20190121064813.18444-4-kishon@ti.com> <5C459549.8090403@ti.com>
 <a44dd3db-367e-684b-a7f1-2f545b5191d7@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a44dd3db-367e-684b-a7f1-2f545b5191d7@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Roger,

On 21/01/19 4:41 PM, Kishon Vijay Abraham I wrote:
> Hi Roger,
> 
> On 21/01/19 3:17 PM, Roger Quadros wrote:
>> Hi Kishon,
>>
>> On 21/01/19 08:48, Kishon Vijay Abraham I wrote:
>>> Add a new SERDES driver for TI's AM654x SoC which configures
>>> the SERDES only for PCIe. Support fo USB3 will be added later.
>>>
>>> SERDES in am654x has three input clocks (left input, externel reference
>>> clock and right input) and two output clocks (left output and right
>>> output) in addition to a PLL mux clock which the SERDES uses for Clock
>>> Multiplier Unit (CMU refclock).
>>>
>>> The PLL mux clock can select from one of the three input clocks.
>>> The right output can select between left input and external reference
>>> clock while the left output can select between the right input and
>>> external reference clock.
>>>
>>> The driver has support to select PLL mux and left/right output mux as
>>> specified in device tree.
>>>
>>> [rogerq@ti.com: Fix boot lockup caused by accessing a structure member
>>> (hw->init) allocated in stack of probe() and accessed in get_parent]
>>> [rogerq@ti.com: Fix "Failed to find the parent" warnings]
>>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>>> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
>>> ---
>>>  drivers/phy/ti/Kconfig            |  11 +
>>>  drivers/phy/ti/Makefile           |   1 +
>>>  drivers/phy/ti/phy-am654-serdes.c | 528 ++++++++++++++++++++++++++++++
>>>  3 files changed, 540 insertions(+)
>>>  create mode 100644 drivers/phy/ti/phy-am654-serdes.c
>>>
>>> diff --git a/drivers/phy/ti/Kconfig b/drivers/phy/ti/Kconfig
>>> index f137e0107764..6357c32de115 100644
>>> --- a/drivers/phy/ti/Kconfig
>>> +++ b/drivers/phy/ti/Kconfig
>>> @@ -20,6 +20,17 @@ config PHY_DM816X_USB
>>>  	help
>>>  	  Enable this for dm816x USB to work.
>>>  
>>> +config PHY_AM654_SERDES
>>> +	tristate "TI AM654 SERDES support"
>>> +	depends on OF && ARCH_K3 || COMPILE_TEST
>>> +	select GENERIC_PHY
>>> +	select MULTIPLEXER
>>> +	select REGMAP_MMIO
>>> +	select MUX_MMIO
>>> +	help
>>> +	  This option enables support for TI AM654 SerDes PHY used for
>>> +	  PCIe.
>>> +
>>>  config OMAP_CONTROL_PHY
>>>  	tristate "OMAP CONTROL PHY Driver"
>>>  	depends on ARCH_OMAP2PLUS || COMPILE_TEST
>>> diff --git a/drivers/phy/ti/Makefile b/drivers/phy/ti/Makefile
>>> index bea8f25a137a..bff901eb0ecc 100644
>>> --- a/drivers/phy/ti/Makefile
>>> +++ b/drivers/phy/ti/Makefile
>>> @@ -6,4 +6,5 @@ obj-$(CONFIG_OMAP_USB2)			+= phy-omap-usb2.o
>>>  obj-$(CONFIG_TI_PIPE3)			+= phy-ti-pipe3.o
>>>  obj-$(CONFIG_PHY_TUSB1210)		+= phy-tusb1210.o
>>>  obj-$(CONFIG_TWL4030_USB)		+= phy-twl4030-usb.o
>>> +obj-$(CONFIG_PHY_AM654_SERDES)		+= phy-am654-serdes.o
>>>  obj-$(CONFIG_PHY_TI_GMII_SEL)		+= phy-gmii-sel.o
>>> diff --git a/drivers/phy/ti/phy-am654-serdes.c b/drivers/phy/ti/phy-am654-serdes.c
>>> new file mode 100644
>>> index 000000000000..fcc0a98fbbd3
>>> --- /dev/null
>>> +++ b/drivers/phy/ti/phy-am654-serdes.c
>>> @@ -0,0 +1,528 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/**
>>> + * PCIe SERDES driver for AM654x SoC
>>> + *
>>> + * Copyright (C) 2018 Texas Instruments
>>> + * Author: Kishon Vijay Abraham I <kishon@ti.com>
>>> + */
>>> +
>>> +#include <dt-bindings/phy/phy.h>
>>> +#include <linux/clk.h>
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/io.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mux/consumer.h>
>>> +#include <linux/of_address.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/phy/phy.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/mfd/syscon.h>
>>> +
>>> +#define CMU_R07C		0x7c
>>> +#define CMU_MASTER_CDN_O	BIT(24)
>>> +
>>> +#define COMLANE_R138		0xb38
>>> +#define CONFIG_VERSION_REG_MASK	GENMASK(23, 16)
>>> +#define CONFIG_VERSION_REG_SHIFT 16
>>> +#define VERSION			0x70
>>> +
>>> +#define COMLANE_R190		0xb90
>>> +#define L1_MASTER_CDN_O		BIT(9)
>>> +
>>> +#define COMLANE_R194		0xb94
>>> +#define CMU_OK_I_0		BIT(19)
>>> +
>>> +#define SERDES_CTRL		0x1fd0
>>> +#define POR_EN			BIT(29)
>>> +
>>> +#define WIZ_LANEXCTL_STS	0x1fe0
>>> +#define TX0_ENABLE_OVL		BIT(31)
>>> +#define TX0_ENABLE_MASK		GENMASK(30, 29)
>>> +#define TX0_ENABLE_SHIFT	29
>>> +#define TX0_DISABLE_STATE	0x0
>>> +#define TX0_SLEEP_STATE		0x1
>>> +#define TX0_SNOOZE_STATE	0x2
>>> +#define TX0_ENABLE_STATE	0x3
>>> +#define RX0_ENABLE_OVL		BIT(15)
>>> +#define RX0_ENABLE_MASK		GENMASK(14, 13)
>>> +#define RX0_ENABLE_SHIFT	13
>>> +#define RX0_DISABLE_STATE	0x0
>>> +#define RX0_SLEEP_STATE		0x1
>>> +#define RX0_SNOOZE_STATE	0x2
>>> +#define RX0_ENABLE_STATE	0x3
>>> +
>>> +#define WIZ_PLL_CTRL		0x1ff4
>>> +#define PLL_ENABLE_OVL		BIT(31)
>>> +#define PLL_ENABLE_MASK		GENMASK(30, 29)
>>> +#define PLL_ENABLE_SHIFT	29
>>> +#define PLL_DISABLE_STATE	0x0
>>> +#define PLL_SLEEP_STATE		0x1
>>> +#define PLL_SNOOZE_STATE	0x2
>>> +#define PLL_ENABLE_STATE	0x3
>>> +#define PLL_OK			BIT(28)
>>> +
>>> +#define PLL_LOCK_TIME		100000	/* in microseconds */
>>> +#define SLEEP_TIME		100	/* in microseconds */
>>> +
>>> +#define LANE_USB3		0x0
>>> +#define LANE_PCIE0_LANE0	0x1
>>> +
>>> +#define LANE_PCIE1_LANE0	0x0
>>> +#define LANE_PCIE0_LANE1	0x1
>>> +
>>> +#define SERDES_NUM_CLOCKS	3
>>> +
>>> +struct serdes_am654_clk_mux {
>>> +	struct clk_hw	hw;
>>> +	struct regmap	*regmap;
>>> +	unsigned int	reg;
>>> +	int		*table;
>>> +	u32		mask;
>>> +	u8		shift;
>>> +	struct clk_init_data clk_data;
>>> +};
>>> +
>>> +#define to_serdes_am654_clk_mux(_hw)	\
>>> +		container_of(_hw, struct serdes_am654_clk_mux, hw)
>>> +
>>> +static struct regmap_config serdes_am654_regmap_config = {
>>> +	.reg_bits = 32,
>>> +	.val_bits = 32,
>>> +	.reg_stride = 4,
>>> +	.fast_io = true,
>>> +};
>>> +
>>> +struct serdes_am654 {
>>> +	struct regmap		*regmap;
>>> +	struct device		*dev;
>>> +	struct mux_control	*control;
>>> +	bool			busy;
>>> +	u32			type;
>>> +	struct device_node	*of_node;
>>> +	struct clk_onecell_data	clk_data;
>>> +	struct clk		*clks[SERDES_NUM_CLOCKS];
>>> +};
>>> +
>>> +static int serdes_am654_enable_pll(struct serdes_am654 *phy)
>>> +{
>>> +	u32 mask = PLL_ENABLE_OVL | PLL_ENABLE_MASK;
>>> +	u32 val = PLL_ENABLE_OVL | (PLL_ENABLE_STATE << PLL_ENABLE_SHIFT);
>>> +
>>> +	regmap_update_bits(phy->regmap, WIZ_PLL_CTRL, mask, val);
>>> +
>>> +	return regmap_read_poll_timeout(phy->regmap, WIZ_PLL_CTRL, val,
>>> +					val & PLL_OK, 1000, PLL_LOCK_TIME);
>>> +}
>>> +
>>> +static void serdes_am654_disable_pll(struct serdes_am654 *phy)
>>> +{
>>> +	u32 mask = PLL_ENABLE_OVL | PLL_ENABLE_MASK;
>>> +
>>> +	regmap_update_bits(phy->regmap, WIZ_PLL_CTRL, mask, 0);
>>
>> Shouldn't PLL_ENABLE_OVL be left set otherwise override mechanism won't work?
> 
> I have to check this.

You are right, PLL_ENABLE_OVL should be set.

Thanks
Kishon

>>
>> So,
>>
>> 	regmap_update_bits(phy->regmap, WIZ_PLL_CTRL, mask, PLL_ENABLE_OVL);
>>
>>> +}
>>> +
>>> +static int serdes_am654_enable_txrx(struct serdes_am654 *phy)
>>> +{
>>> +	u32 mask;
>>> +	u32 val;
>>> +
>>> +	/* Enable TX */
>>> +	mask = TX0_ENABLE_OVL | TX0_ENABLE_MASK;
>>> +	val = TX0_ENABLE_OVL | (TX0_ENABLE_STATE << TX0_ENABLE_SHIFT);
>>> +	regmap_update_bits(phy->regmap, WIZ_LANEXCTL_STS, mask, val);
>>> +
>>> +	/* Enable RX */
>>> +	mask = RX0_ENABLE_OVL | RX0_ENABLE_MASK;
>>> +	val = RX0_ENABLE_OVL | (RX0_ENABLE_STATE << RX0_ENABLE_SHIFT);
>>> +	regmap_update_bits(phy->regmap, WIZ_LANEXCTL_STS, mask, val);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int serdes_am654_disable_txrx(struct serdes_am654 *phy)
>>> +{
>>> +	u32 mask;
>>> +
>>> +	/* Disable TX */
>>> +	mask = TX0_ENABLE_OVL | TX0_ENABLE_MASK;
>>> +	regmap_update_bits(phy->regmap, WIZ_LANEXCTL_STS, mask, 0);
>>
>> Here too.
>>> +
>>> +	/* Disable RX */
>>> +	mask = RX0_ENABLE_OVL | RX0_ENABLE_MASK;
>>> +	regmap_update_bits(phy->regmap, WIZ_LANEXCTL_STS, mask, 0);
>>
>> Here as well.
>>
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int serdes_am654_power_on(struct phy *x)
>>> +{
>>> +	struct serdes_am654 *phy = phy_get_drvdata(x);
>>> +	struct device *dev = phy->dev;
>>> +	int ret;
>>> +	u32 val;
>>> +
>>> +	ret = serdes_am654_enable_pll(phy);
>>> +	if (ret) {
>>> +		dev_err(dev, "Failed to enable PLL\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	ret = serdes_am654_enable_txrx(phy);
>>> +	if (ret) {
>>> +		dev_err(dev, "Failed to enable TX RX\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	return regmap_read_poll_timeout(phy->regmap, COMLANE_R194, val,
>>> +					val & CMU_OK_I_0, SLEEP_TIME,
>>> +					PLL_LOCK_TIME);
>>> +}
>>> +
>>> +static int serdes_am654_power_off(struct phy *x)
>>> +{
>>> +	struct serdes_am654 *phy = phy_get_drvdata(x);
>>> +
>>> +	serdes_am654_disable_txrx(phy);
>>> +	serdes_am654_disable_pll(phy);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int serdes_am654_init(struct phy *x)
>>> +{
>>> +	struct serdes_am654 *phy = phy_get_drvdata(x);
>>> +	u32 mask;
>>> +	u32 val;
>>> +
>>> +	mask = CONFIG_VERSION_REG_MASK;
>>> +	val = VERSION << CONFIG_VERSION_REG_SHIFT;
>>> +	regmap_update_bits(phy->regmap, COMLANE_R138, mask, val);
>>> +
>>> +	val = CMU_MASTER_CDN_O;
>>> +	regmap_update_bits(phy->regmap, CMU_R07C, val, val);
>>> +
>>> +	val = L1_MASTER_CDN_O;
>>> +	regmap_update_bits(phy->regmap, COMLANE_R190, val, val);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int serdes_am654_reset(struct phy *x)
>>> +{
>>> +	struct serdes_am654 *phy = phy_get_drvdata(x);
>>> +	u32 val;
>>> +
>>> +	val = POR_EN;
>>> +	regmap_update_bits(phy->regmap, SERDES_CTRL, val, val);
>>> +	mdelay(1);
>>> +	regmap_update_bits(phy->regmap, SERDES_CTRL, val, 0);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +struct phy *serdes_am654_xlate(struct device *dev, struct of_phandle_args
>>> +				 *args)
>>> +{
>>> +	struct serdes_am654 *am654_phy;
>>> +	struct phy *phy;
>>> +	int ret;
>>> +
>>> +	phy = of_phy_simple_xlate(dev, args);
>>> +	if (IS_ERR(phy))
>>> +		return phy;
>>> +
>>> +	am654_phy = phy_get_drvdata(phy);
>>> +	if (am654_phy->type != args->args[0] && am654_phy->busy)
>>> +		return ERR_PTR(-EBUSY);
>>
>> You set the busy flag in this function but it is never cleared.
>> This means the second phy_get() will always fail. We might get into this
>> situation for example if the driver doing the phy_get() had to bail out
>> due to some reason (e.g. -EPROBE_DEFER), and gets probed again and does
>> a phy_get() a second time for the same PHY and lane.
>>
>> Can we clear the busy flag and call mux_control_deselect() on phy_put()?
> 
> Good point. Right now, the PHY framework doesn't have a callback to the PHY
> drivers on phy_put. Looks like we might have to add it for this scenario.
> 
> Thanks
> Kishon
> 
