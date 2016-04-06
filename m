From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/3] phy: rcar-gen3-usb2: Add vbus-supply to handle VBUS
 on/off
Date: Wed, 6 Apr 2016 18:15:28 +0530
Message-ID: <570504E8.2090201@ti.com>
References: <1456999746-2800-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1456999746-2800-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <5703992F.7090601@ti.com>
 <SG2PR06MB0919DB87061EB528C9211B24D89F0@SG2PR06MB0919.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <SG2PR06MB0919DB87061EB528C9211B24D89F0-ESzmfEwOt/zNQ8RBPPB5A20DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wednesday 06 April 2016 05:55 AM, Yoshihiro Shimoda wrote:
> Hi,
> 
>> From: Kishon Vijay Abraham I
>> Sent: Tuesday, April 05, 2016 7:54 PM
>>
>> Hi,
>>
>> On Thursday 03 March 2016 03:39 PM, Yoshihiro Shimoda wrote:
>>> To handle the VBUS on/off by a regulator driver, this patch adds
>>> regulator APIs calling in the driver and description about vbus-supply
>>> in the rcar-gen3-phy-usb2.txt.
>>>
>>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> ---
>>>  .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  2 ++
>>>  drivers/phy/phy-rcar-gen3-usb2.c                   | 28 ++++++++++++++++++++++
>>>  2 files changed, 30 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
>> b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
>>> index 86826ca..7243b3b 100644
>>> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
>>> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
>>> @@ -21,6 +21,8 @@ To use a USB channel where USB 2.0 Host and HSUSB (USB 2.0 Peripheral) are
>>>  combined, the device tree node should set interrupt properties to use the
>>>  channel as USB OTG:
>>>  - interrupts: interrupt specifier for the PHY.
>>> +- vbus-supply: Phandle to a regulator that provides power to the VBUS. This
>>> +	       regulator will be managed during the PHY power on/off sequence.
>>
>> Why not use phy-supply from the generic PHY binding? It can then be managed by
>> the phy core during power_on/power_off.
> 
> Thank you for the review!
> 
> I'm afraid, I should have added your address as CC when I sent RFC patch set.
> Anyway, Rob had a comment about "phy-supply":
> http://thread.gmane.org/gmane.linux.kernel.renesas-soc/366/focus=406
> 
> I agreed with Rob because the document mentioned the followings:
> 
> Optional Properties:
> phy-supply:	Phandle to a regulator that provides power to the PHY. This
> 		regulator will be managed during the PHY power on/off sequence.
> 
> https://git.kernel.org/cgit/linux/kernel/git/kishon/linux-phy.git/tree/Documentation/devicetree/bindings/phy/phy-bindings.txt?h=next#n13
> 
> And then, I changed the "phy-supply" to "vbus-supply" and this driver managed the "vbus-supply".
> Or, do I misunderstand the document?

All right. Will queue this for 4.7.

Thanks
Kishon

> 
> Best regards,
> Yoshihiro Shimoda
> 
>> Thanks
>> Kishon
>>
>>>
>>>  Example (R-Car H3):
>>>
>>> diff --git a/drivers/phy/phy-rcar-gen3-usb2.c b/drivers/phy/phy-rcar-gen3-usb2.c
>>> index 3c647cd..7b14244 100644
>>> --- a/drivers/phy/phy-rcar-gen3-usb2.c
>>> +++ b/drivers/phy/phy-rcar-gen3-usb2.c
>>> @@ -19,6 +19,7 @@
>>>  #include <linux/of_address.h>
>>>  #include <linux/phy/phy.h>
>>>  #include <linux/platform_device.h>
>>> +#include <linux/regulator/consumer.h>
>>>
>>>  /******* USB2.0 Host registers (original offset is +0x200) *******/
>>>  #define USB2_INT_ENABLE		0x000
>>> @@ -77,6 +78,7 @@
>>>  struct rcar_gen3_chan {
>>>  	void __iomem *base;
>>>  	struct phy *phy;
>>> +	struct regulator *vbus;
>>>  	bool has_otg;
>>>  };
>>>
>>> @@ -210,6 +212,13 @@ static int rcar_gen3_phy_usb2_power_on(struct phy *p)
>>>  	struct rcar_gen3_chan *channel = phy_get_drvdata(p);
>>>  	void __iomem *usb2_base = channel->base;
>>>  	u32 val;
>>> +	int ret;
>>> +
>>> +	if (channel->vbus) {
>>> +		ret = regulator_enable(channel->vbus);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>>
>>>  	val = readl(usb2_base + USB2_USBCTR);
>>>  	val |= USB2_USBCTR_PLL_RST;
>>> @@ -220,10 +229,22 @@ static int rcar_gen3_phy_usb2_power_on(struct phy *p)
>>>  	return 0;
>>>  }
>>>
>>> +static int rcar_gen3_phy_usb2_power_off(struct phy *p)
>>> +{
>>> +	struct rcar_gen3_chan *channel = phy_get_drvdata(p);
>>> +	int ret = 0;
>>> +
>>> +	if (channel->vbus)
>>> +		ret = regulator_disable(channel->vbus);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>>  static struct phy_ops rcar_gen3_phy_usb2_ops = {
>>>  	.init		= rcar_gen3_phy_usb2_init,
>>>  	.exit		= rcar_gen3_phy_usb2_exit,
>>>  	.power_on	= rcar_gen3_phy_usb2_power_on,
>>> +	.power_off	= rcar_gen3_phy_usb2_power_off,
>>>  	.owner		= THIS_MODULE,
>>>  };
>>>
>>> @@ -290,6 +311,13 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>>>  		return PTR_ERR(channel->phy);
>>>  	}
>>>
>>> +	channel->vbus = devm_regulator_get_optional(dev, "vbus");
>>> +	if (IS_ERR(channel->vbus)) {
>>> +		if (PTR_ERR(channel->vbus) == -EPROBE_DEFER)
>>> +			return PTR_ERR(channel->vbus);
>>> +		channel->vbus = NULL;
>>> +	}
>>> +
>>>  	phy_set_drvdata(channel->phy, channel);
>>>
>>>  	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
