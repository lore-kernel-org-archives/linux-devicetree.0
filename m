From: Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v6 2/2] phy: qualcomm: Add Synopsys High-Speed USB PHY
 driver
Date: Fri, 21 Dec 2018 13:43:09 +0530
Message-ID: <f5981b24-b769-2f48-7f93-10fb4f61caec@codeaurora.org>
References: <20181220010112.16824-1-shawn.guo@linaro.org>
 <20181220010112.16824-3-shawn.guo@linaro.org>
 <f106782b6d8e26ebf851f00563c68948@codeaurora.org>
 <20181220110956.GA17416@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181220110956.GA17416@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Sriharsha Allenki <sallenki@codeaurora.org>, Anu Ramanathan <anur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Jack Pham <jackp@codeaurora.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 12/20/2018 4:39 PM, Shawn Guo wrote:
> Hi Manu,
>
> On Thu, Dec 20, 2018 at 09:33:43AM +0530, mgautam@codeaurora.org wrote:
>> Hi Shawn,
>>
>> On 2018-12-20 06:31, Shawn Guo wrote:
>>> It adds Synopsys 28nm Femto High-Speed USB PHY driver support, which
>>> is usually paired with Synopsys DWC3 USB controllers on Qualcomm SoCs.
>>>
>>> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
>>> ---
>>
...
>>> +struct hsphy_priv {
>> nit-pick - indentation for following structure members?
> Hmm, my personal taste says no, because I found that it's hard to keep
> the indentation when adding new members later.
ok
>
>>> +	void __iomem *base;
>>> +	struct clk_bulk_data *clks;
>>> +	int num_clks;
>>> +	struct reset_control *phy_reset;
>>> +	struct reset_control *por_reset;
>>> +	struct regulator_bulk_data vregs[VREG_NUM];
>>> +	unsigned int voltages[VREG_NUM][VOL_NUM];
>>> +	const struct hsphy_data *data;
>>> +	bool cable_connected;
>> You can get cable-connected state from "enum phy_mode mode" which
>> is present in this driver.
>> E.g. cable_connected is false if mode is neither HOST nor DEVICE.
>>
>>
>>> +	struct extcon_dev *vbus_edev;
>>> +	struct notifier_block vbus_notify;
>> extcons not needed if you use "mode" for the same purpose.
> The extcon is there for indicating cable connection status.  I'm not
> sure that phy_mode can be used for that purpose.  For example, what
> value would phy core set phy_mode to, if we disconnect the cable from
> phy_mode being HOST or DEVICE?

it depends how it is used. Looks like it is used to decide whether to turn-off
regulators or not. Unless you plan to add low power support as part of
runtime-suspend of PHY during host mode, there is no reason to not turn-off
regulators on pm_suspend(). Please refer to my comments below.

>
>>
>>> +	enum phy_mode mode;
>>> +};
>>> +
>>
>>> +
>>> +static int qcom_snps_hsphy_vbus_notifier(struct notifier_block *nb,
>>> +					 unsigned long event, void *ptr)
>>> +{
>>> +	struct hsphy_priv *priv = container_of(nb, struct hsphy_priv,
>>> +						    vbus_notify);
>>> +	priv->cable_connected = !!event;
>>> +	return 0;
>>> +}
>>> +
>>> +static int qcom_snps_hsphy_power_on(struct phy *phy)
>> Can you instead merge this power_on function with phy_init?
> I can do that, but what's the gain/advantage from doing that?

dwc3 core calls phy_init() before power_on(). AFAIK, PHY regulators
need to be ON before initializing it.

>
>>> +{
>>> +	struct hsphy_priv *priv = phy_get_drvdata(phy);
>>> +	int ret;
>>> +
>>> +	if (priv->cable_connected) {
>> Why distinguish between cable connected vs not-connected?
> This is based on the vendor driver implementation.  It does a more
> aggressive low power management in case that cable is not connected,
> i.e. turning off regulator and entering retention mode.

I believe 'aggressive low power management' will be triggered on
pm_suspend?
And dwc3 core will in any case perform phy_exit()->phy_init() across
pm_suspend/resume which will reset PHYs. Hence, there is no need to check
for cable connected state here.


>
>>> +		ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
>>> +		if (ret)
>>> +			return ret;
>>> +		qcom_snps_hsphy_disable_hv_interrupts(priv);
>>> +	} else {
>>> +		ret = qcom_snps_hsphy_enable_regulators(priv);
>>> +		if (ret)
>>> +			return ret;
>>> +		ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
>>> +		if (ret)
>>> +			return ret;
>>> +		qcom_snps_hsphy_exit_retention(priv);
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int qcom_snps_hsphy_power_off(struct phy *phy)
>>> +{
>>> +	struct hsphy_priv *priv = phy_get_drvdata(phy);
>>> +
>>> +	if (priv->cable_connected) {
>>> +		qcom_snps_hsphy_enable_hv_interrupts(priv);
>>> +		clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
>>> +	} else {
>>> +		qcom_snps_hsphy_enter_retention(priv);
>>> +		clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
>>> +		qcom_snps_hsphy_disable_regulators(priv);
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>
>>
>> ..
>>> +static const struct phy_ops qcom_snps_hsphy_ops = {
>>> +	.init = qcom_snps_hsphy_init,
>>> +	.power_on = qcom_snps_hsphy_power_on,
>>> +	.power_off = qcom_snps_hsphy_power_off,
>>> +	.set_mode = qcom_snps_hsphy_set_mode,
>> .phy_exit()?
>> I believe that is needed as dwc3 core driver performs
>> phy_exit/phy_init across pm_suspend/resume.
> I just do not see anything that we should be doing in .exit hook right
> now.

After you merge power_on() with phy_init() as per my previous comment,
you can rely on phy_exit() to take care of putting PHY in low power state
and turn off regulators as well.

>
> Shawn
>
>>
>>> +	.owner = THIS_MODULE,
>>> +};
>>> +

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
