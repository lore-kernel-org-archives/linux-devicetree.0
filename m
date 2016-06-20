From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 2/2] phy: add a driver for the Rockchip SoC internal
 PCIe PHY
Date: Mon, 20 Jun 2016 12:06:02 +0530
Message-ID: <57678ED2.9000707@ti.com>
References: <1466040179-30973-1-git-send-email-shawn.lin@rock-chips.com>
 <5763F665.6070403@ti.com>
 <c88eb16f-e976-ad52-02fb-5ec7b6e261b9@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <c88eb16f-e976-ad52-02fb-5ec7b6e261b9-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Monday 20 June 2016 06:28 AM, Shawn Lin wrote:
> Hi Kishon,
> 
> On 2016/6/17 21:08, Kishon Vijay Abraham I wrote:
>> Hi,
>>
>> On Thursday 16 June 2016 06:52 AM, Shawn Lin wrote:
>>> This patch to add a generic PHY driver for rockchip PCIe PHY.
>>> Access the PHY via registers provided by GRF (general register
>>> files) module.
>>>
>>> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>> ---
>>>
>>> Changes in v3: None
>>> Changes in v2: None
>>>
>>>  drivers/phy/Kconfig             |   7 +
>>>  drivers/phy/Makefile            |   1 +
>>>  drivers/phy/phy-rockchip-pcie.c | 378 ++++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 386 insertions(+)
>>>  create mode 100644 drivers/phy/phy-rockchip-pcie.c
>>>
>>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>>> index b869b98..d4fc293 100644
>>> --- a/drivers/phy/Kconfig
>>> +++ b/drivers/phy/Kconfig
>>> @@ -361,6 +361,13 @@ config PHY_ROCKCHIP_DP
>>>      help
>>>        Enable this to support the Rockchip Display Port PHY.
>>>
>>> +config PHY_ROCKCHIP_PCIE
>>> +    tristate "Rockchip PCIe PHY Driver"
>>> +    depends on ARCH_ROCKCHIP && OF
>>> +    select GENERIC_PHY
>>> +    help
>>> +      Enable this to support the Rockchip PCIe PHY.
>>> +
>>>  config PHY_ST_SPEAR1310_MIPHY
>>>      tristate "ST SPEAR1310-MIPHY driver"
>>>      select GENERIC_PHY
>>> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
>>> index 9c3e73c..725e55d 100644
>>> --- a/drivers/phy/Makefile
>>> +++ b/drivers/phy/Makefile
>>> @@ -39,6 +39,7 @@ obj-$(CONFIG_PHY_EXYNOS5_USBDRD)    += phy-exynos5-usbdrd.o
>>>  obj-$(CONFIG_PHY_QCOM_APQ8064_SATA)    += phy-qcom-apq8064-sata.o
>>>  obj-$(CONFIG_PHY_ROCKCHIP_USB) += phy-rockchip-usb.o
>>>  obj-$(CONFIG_PHY_ROCKCHIP_EMMC) += phy-rockchip-emmc.o
>>> +obj-$(CONFIG_PHY_ROCKCHIP_PCIE) += phy-rockchip-pcie.o
>>>  obj-$(CONFIG_PHY_ROCKCHIP_DP)        += phy-rockchip-dp.o
>>>  obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)    += phy-qcom-ipq806x-sata.o
>>>  obj-$(CONFIG_PHY_ST_SPEAR1310_MIPHY)    += phy-spear1310-miphy.o
>>> diff --git a/drivers/phy/phy-rockchip-pcie.c b/drivers/phy/phy-rockchip-pcie.c
>>> new file mode 100644
>>> index 0000000..bc6cd17
>>> --- /dev/null
>>> +++ b/drivers/phy/phy-rockchip-pcie.c
>>> @@ -0,0 +1,378 @@
>>> +/*
>>> + * Rockchip PCIe PHY driver
>>> + *
>>> + * Copyright (C) 2016 Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>> + * Copyright (C) 2016 ROCKCHIP, Inc.
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License as published by
>>> + * the Free Software Foundation; either version 2 of the License.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/io.h>
>>> +#include <linux/mfd/syscon.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_address.h>
>>> +#include <linux/of_platform.h>
>>> +#include <linux/phy/phy.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/reset.h>
>>> +
>>> +/*
>>> + * The higher 16-bit of this register is used for write protection
>>> + * only if BIT(x + 16) set to 1 the BIT(x) can be written.
>>> + */
>>> +#define HIWORD_UPDATE(val, mask, shift) \
>>> +        ((val) << (shift) | (mask) << ((shift) + 16))
>>> +
>>> +#define PHY_MAX_LANE_NUM      4
>>> +#define PHY_CFG_DATA_SHIFT    7
>>> +#define PHY_CFG_ADDR_SHIFT    1
>>> +#define PHY_CFG_DATA_MASK     0xf
>>> +#define PHY_CFG_ADDR_MASK     0x3f
>>> +#define PHY_CFG_RD_MASK       0x3ff
>>> +#define PHY_CFG_WR_ENABLE     1
>>> +#define PHY_CFG_WR_DISABLE    1
>>> +#define PHY_CFG_WR_SHIFT      0
>>> +#define PHY_CFG_WR_MASK       1
>>> +#define PHY_CFG_PLL_LOCK      0x10
>>> +#define PHY_CFG_CLK_TEST      0x10
>>> +#define PHY_CFG_CLK_SCC       0x12
>>> +#define PHY_CFG_SEPE_RATE     BIT(3)
>>> +#define PHY_CFG_PLL_100M      BIT(3)
>>> +#define PHY_PLL_LOCKED        BIT(9)
>>> +#define PHY_PLL_OUTPUT        BIT(10)
>>> +#define PHY_LANE_A_STATUS     0x30
>>> +#define PHY_LANE_B_STATUS     0x31
>>> +#define PHY_LANE_C_STATUS     0x32
>>> +#define PHY_LANE_D_STATUS     0x33
>>> +#define PHY_LANE_RX_DET_SHIFT 11
>>> +#define PHY_LANE_RX_DET_TH    0x1
>>> +#define PHY_LANE_IDLE_OFF     0x1
>>> +#define PHY_LANE_IDLE_MASK    0x1
>>> +#define PHY_LANE_IDLE_A_SHIFT 3
>>> +#define PHY_LANE_IDLE_B_SHIFT 4
>>> +#define PHY_LANE_IDLE_C_SHIFT 5
>>> +#define PHY_LANE_IDLE_D_SHIFT 6
>>> +
>>> +struct rockchip_pcie_data {
>>> +    unsigned int pcie_conf;
>>> +    unsigned int pcie_status;
>>> +    unsigned int pcie_laneoff;
>>> +};
>>> +
>>> +struct rockchip_pcie_phy {
>>> +    struct rockchip_pcie_data *phy_data;
>>> +    struct regmap *reg_base;
>>> +    struct reset_control *phy_rst;
>>> +    struct clk *clk_pciephy_ref;
>>> +};
>>> +
>>> +static inline void phy_wr_cfg(struct rockchip_pcie_phy *rk_phy,
>>> +                  u32 addr, u32 data)
>>> +{
>>> +    regmap_write(rk_phy->reg_base, rk_phy->phy_data->pcie_conf,
>>> +             HIWORD_UPDATE(data,
>>> +                   PHY_CFG_DATA_MASK,
>>> +                   PHY_CFG_DATA_SHIFT) |
>>> +             HIWORD_UPDATE(addr,
>>> +                   PHY_CFG_ADDR_MASK,
>>> +                   PHY_CFG_ADDR_SHIFT));
>>> +    udelay(1);
>>> +    regmap_write(rk_phy->reg_base, rk_phy->phy_data->pcie_conf,
>>> +             HIWORD_UPDATE(PHY_CFG_WR_ENABLE,
>>> +                   PHY_CFG_WR_MASK,
>>> +                   PHY_CFG_WR_SHIFT));
>>> +    udelay(1);
>>> +    regmap_write(rk_phy->reg_base, rk_phy->phy_data->pcie_conf,
>>> +             HIWORD_UPDATE(PHY_CFG_WR_DISABLE,
>>> +                   PHY_CFG_WR_MASK,
>>> +                   PHY_CFG_WR_SHIFT));
>>> +}
>>> +
>>> +static inline u32 phy_rd_cfg(struct rockchip_pcie_phy *rk_phy,
>>> +                 u32 addr)
>>> +{
>>> +    u32 val;
>>> +
>>> +    regmap_write(rk_phy->reg_base, rk_phy->phy_data->pcie_conf,
>>> +             HIWORD_UPDATE(addr,
>>> +                   PHY_CFG_RD_MASK,
>>> +                   PHY_CFG_ADDR_SHIFT));
>>> +    regmap_read(rk_phy->reg_base,
>>> +            rk_phy->phy_data->pcie_status,
>>> +            &val);
>>> +    return val;
>>> +}
>>> +
>>> +void rockchip_pcie_phy_laneoff(struct phy *phy)
>>> +{
>>> +    u32 status;
>>> +    struct rockchip_pcie_phy *rk_phy = phy_get_drvdata(phy);
>>> +    int i;
>>> +
>>> +    for (i = 0; i < PHY_MAX_LANE_NUM; i++) {
>>> +        status = phy_rd_cfg(rk_phy, PHY_LANE_A_STATUS + i);
>>> +        if (!((status >> PHY_LANE_RX_DET_SHIFT) &
>>> +               PHY_LANE_RX_DET_TH))
>>> +            pr_debug("lane %d is used\n", i);
>>> +        else
>>> +            regmap_write(rk_phy->reg_base,
>>> +                     rk_phy->phy_data->pcie_laneoff,
>>> +                     HIWORD_UPDATE(PHY_LANE_IDLE_OFF,
>>> +                           PHY_LANE_IDLE_MASK,
>>> +                           PHY_LANE_IDLE_A_SHIFT + i));
>>> +    }
>>> +}
>>> +EXPORT_SYMBOL_GPL(rockchip_pcie_phy_laneoff);
>>
>> Er.. don't use export symbols from phy driver. I think it would be nice if you
>> can model the driver in such a way that the PCIe driver can control individual
>> phy's.
>>
> 
> Yes, I was trying to look for a way not to export symbols from
> phy... But I failed to find it as there at least need three
> interaction between controller and phy which made me believe we
> at least need to export one symbol without adding new API for phy.

That can be managed by implementing a small state machine within the PHY driver.
> 
> And I found lots of phy drivers export symbols the same way as mine.
> Does it sound okay for me to do the same thing here? :)

That's not a good reason. I'll try to avoid having export symbols inside phy
driver.

Thanks
Kishon
