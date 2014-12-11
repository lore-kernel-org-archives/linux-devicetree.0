From: Yunzhi Li <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v6 1/5] phy: add a driver for the Rockchip SoC internal
 USB2.0 PHY
Date: Thu, 11 Dec 2014 21:45:11 +0800
Message-ID: <54899FE7.7050808@rock-chips.com>
References: <1418291722-25448-1-git-send-email-lyz@rock-chips.com> <1418291722-25448-2-git-send-email-lyz@rock-chips.com> <548971AF.1020506@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <548971AF.1020506-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kishon:

On 2014/12/11 18:27, Kishon Vijay Abraham I wrote:
> Hi,
>
> On Thursday 11 December 2014 03:25 PM, Yunzhi Li wrote:
>> +
>> +static struct phy *rockchip_usb_phy_xlate(struct device *dev,
>> +					struct of_phandle_args *args)
>> +{
>> +	struct rockchip_usb_phy_priv *priv = dev_get_drvdata(dev);
>> +	unsigned int phy_id = args->args[0];
>> +
>> +	if (WARN_ON(phy_id < 0 || phy_id >= priv->nphys))
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	return priv->phys[phy_id].phy;
> I didn't mean that. You can get rid of this entire xlate stuff if you use
> something like below
>
> phy@xxx {
> 	compatible = "";
> 	phy1:usb_phy {
> 	}
> 	phy2:usb_phy {
> 	};
> };
>
>
> usb@xx {
> 	compatible = "";
> 	phys = <&phy1>; //doesn't need xlate
> 	/* this needs xlate
> 	   phys = <&phy 1>;
> 	*/
> 	phy-names = "phy";
> };

Thank you so much for your suggestion, but still have a question:
I have to add the #phy-cells property in each phy sub-node, otherwise 
devm_get_phy() will fail and I get log info like
"/usb@ff500000: could not get #phy-cells for /phy/usbp-phy1". So can the 
#phy-cells property defines in patent node
also valid for it's child nodes like #address-cells ?

---
Yunzhi Li @ rockchip


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
