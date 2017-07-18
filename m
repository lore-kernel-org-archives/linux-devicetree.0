From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 3/7] phy: rockcip-pcie: reconstruct driver to support
 per-lane PHYs
Date: Tue, 18 Jul 2017 09:30:07 +0800
Message-ID: <dd3a4491-9b4b-2610-5e64-217851c0a8c9@rock-chips.com>
References: <1500276982-208439-1-git-send-email-shawn.lin@rock-chips.com>
 <1500276982-208439-4-git-send-email-shawn.lin@rock-chips.com>
 <20170717183920.GA6856@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170717183920.GA6856-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Brian,

On 2017/7/18 2:39, Brian Norris wrote:
> Hi Shawn,
> 
> On Mon, Jul 17, 2017 at 03:36:18PM +0800, Shawn Lin wrote:
>> This patch reconstructs the whole driver to support per-lane
>> PHYs. Note that we could also support the legacy PHY if you
>> don't provide argument to our of_xlate.
>>
>> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>
>>   drivers/phy/rockchip/phy-rockchip-pcie.c | 126 +++++++++++++++++++++++++++----
>>   1 file changed, 112 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
>> index 6904633..f48b188 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-pcie.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
>> @@ -70,13 +70,46 @@ struct rockchip_pcie_data {
>>   	unsigned int pcie_laneoff;
>>   };
>>   
>> +struct phy_pcie_instance;
> 
> Is this forward declaration actually needed? You have it defined just a
> few lines below.
> 

I will remove this one.

>> +
>> +/* internal lock for multiple phys */
>> +DEFINE_MUTEX(pcie_mutex);
> 
> Put this inside struct rockchip_pcie_phy. It shouldn't be a global lock;
> it's just for coordinating the 4 lanes within a single
> "rockchip_pcie_phy".
> 

okay.

>> +
>>   struct rockchip_pcie_phy {
>>   	struct rockchip_pcie_data *phy_data;
>>   	struct regmap *reg_base;
>> +	struct phy_pcie_instance {
>> +		struct phy *phy;
>> +		u32 index;
>> +	} phys[PHY_MAX_LANE_NUM];
>>   	struct reset_control *phy_rst;
>>   	struct clk *clk_pciephy_ref;
>> +	int pwr_cnt;
>> +	int init_cnt;
>>   };
>>   
>> +static inline
>> +struct rockchip_pcie_phy *to_pcie_phy(struct phy_pcie_instance *inst)
>> +{
>> +	return container_of(inst, struct rockchip_pcie_phy,
>> +					phys[inst->index]);
>> +}
>> +
>> +static struct phy *rockchip_pcie_phy_of_xlate(struct device *dev,
>> +					      struct of_phandle_args *args)
>> +{
>> +	struct rockchip_pcie_phy *rk_phy = dev_get_drvdata(dev);
>> +
>> +	if (args->args_count == 0)
>> +		return rk_phy->phys[0].phy;
>> +
>> +	if (WARN_ON(args->args[0] > PHY_MAX_LANE_NUM))
> 
> This should be ">=", not ">" (an index of PHY_MAX_LANE_NUM would be out
> of bounds).

will fix.

> 
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	return rk_phy->phys[args->args[0]].phy;
>> +}
>> +
>> +
>>   static inline void phy_wr_cfg(struct rockchip_pcie_phy *rk_phy,
>>   			      u32 addr, u32 data)

[...]

>>   }
>>   
>>   static int rockchip_pcie_phy_power_on(struct phy *phy)
>>   {
>> -	struct rockchip_pcie_phy *rk_phy = phy_get_drvdata(phy);
>> +	struct phy_pcie_instance *inst = phy_get_drvdata(phy);
>> +	struct rockchip_pcie_phy *rk_phy = to_pcie_phy(inst);
>>   	int err = 0;
>>   	u32 status;
>>   	unsigned long timeout;
>>   
>> +	mutex_lock(&pcie_mutex);
>> +
>> +	regmap_write(rk_phy->reg_base,
>> +		     rk_phy->phy_data->pcie_laneoff,
>> +		     HIWORD_UPDATE(!PHY_LANE_IDLE_OFF,
>> +				   PHY_LANE_IDLE_MASK,
>> +				   PHY_LANE_IDLE_A_SHIFT + inst->index));
> 
> It seems a little weird to do this before deasserting the reset, but
> only on the first lane to powered on. Should this actually be the last
> step in this function? Or does it really not matter?

It doesn't matter that we do this before deasserting the reset. I could
move this after the deasserting. However it shouldn't be the last setp.
If you only use lane 0 for your devcice, and it will be idle when doing
unbind since we call phy_power_off. Then bind will be failed as you
leave 4 lanes inactive finally which makes the phy fail to lock the PLL
internally. In other words, we should at least keep one active lane
when re-init the phy.


> 
> Brian
> 



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
