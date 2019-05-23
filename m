Return-Path: <SRS0=56P5=TX=nvidia.com=nkristam@kernel.org>
Subject: Re: [Patch V3 3/8] phy: tegra: xusb: t210: add vbus override support
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-4-git-send-email-nkristam@nvidia.com>
 <20190523100333.GC30331@ulmo>
From: Nagarjuna Kristam <nkristam@nvidia.com>
Message-ID: <aecd9cff-9b1f-9a9d-4345-761788ad438c@nvidia.com>
Date: Thu, 23 May 2019 16:43:28 +0530
MIME-Version: 1.0
In-Reply-To: <20190523100333.GC30331@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 23-05-2019 15:33, Thierry Reding wrote:
> On Thu, May 16, 2019 at 12:09:27PM +0530, Nagarjuna Kristam wrote:
>> Tegra XUSB device control driver needs to control vbus override
>> during its operations, add API for the support.
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> ---
>>  drivers/phy/tegra/xusb-tegra210.c | 59 +++++++++++++++++++++++++++++++++++++++
>>  drivers/phy/tegra/xusb.c          | 22 +++++++++++++++
>>  drivers/phy/tegra/xusb.h          |  2 ++
>>  include/linux/phy/tegra/xusb.h    |  6 ++--
>>  4 files changed, 87 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
>> index 829aca5..363d2aa 100644
>> --- a/drivers/phy/tegra/xusb-tegra210.c
>> +++ b/drivers/phy/tegra/xusb-tegra210.c
>> @@ -73,6 +73,10 @@
>>  #define XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(x) (1 << (1 + (x)))
>>  #define XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(x) (1 << (8 + (x)))
>>  
>> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL0(x) (0x080 + (x) * 0x40)
>> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIP (1 << 18)
>> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIN (1 << 22)
>> +
>>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(x) (0x084 + (x) * 0x40)
>>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT 7
>>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_MASK 0x3
>> @@ -235,6 +239,12 @@
>>  #define XUSB_PADCTL_UPHY_USB3_PADX_ECTL6(x) (0xa74 + (x) * 0x40)
>>  #define XUSB_PADCTL_UPHY_USB3_PAD_ECTL6_RX_EQ_CTRL_H_VAL 0xfcf01368
>>  
>> +#define XUSB_PADCTL_USB2_VBUS_ID 0xc60
>> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON (1 << 14)
>> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT 18
>> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_MASK 0xf
>> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_FLOATING 8
>> +
>>  struct tegra210_xusb_fuse_calibration {
>>  	u32 hs_curr_level[4];
>>  	u32 hs_term_range_adj;
>> @@ -2024,6 +2034,53 @@ static const struct tegra_xusb_port_ops tegra210_usb3_port_ops = {
>>  	.map = tegra210_usb3_port_map,
>>  };
>>  
>> +static int tegra210_xusb_padctl_vbus_override(struct tegra_xusb_padctl *padctl,
>> +					      bool status)
>> +{
>> +	u32 value;
>> +
>> +	dev_dbg(padctl->dev, "%s vbus override\n", status ? "set" : "clear");
>> +
>> +	value = padctl_readl(padctl, XUSB_PADCTL_USB2_VBUS_ID);
>> +
>> +	if (status) {
>> +		value |= XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON;
>> +		value &= ~(XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_MASK <<
>> +			   XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT);
>> +		value |= XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_FLOATING <<
>> +			 XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT;
>> +	} else
>> +		value &= ~XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON;
>> +
>> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_VBUS_ID);
>> +
>> +	return 0;
>> +}
>> +
>> +static int tegra210_utmi_port_reset(struct phy *phy)
>> +{
>> +	struct tegra_xusb_padctl *padctl;
>> +	struct tegra_xusb_lane *lane;
>> +	struct device *dev;
>> +	u32 value;
>> +
>> +	lane = phy_get_drvdata(phy);
>> +	padctl = lane->pad->padctl;
>> +	dev = padctl->dev;
> 
> dev seems unused. Is this debugging leftover?
> 
> Thierry
> 
Yes, will clear this in next series

-Nagarjuna
>> +
>> +	value = padctl_readl(padctl,
>> +			     XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL0(0));
>> +
>> +	if ((value & XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIP) ||
>> +	    (value & XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIN)) {
>> +		tegra210_xusb_padctl_vbus_override(padctl, false);
>> +		tegra210_xusb_padctl_vbus_override(padctl, true);
>> +		return 1;
>> +	}
>> -- 
>> 2.7.4
>>
