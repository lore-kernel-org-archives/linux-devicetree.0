From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/5] usb: host: xhci-plat: add optional PHY support
Date: Fri, 23 May 2014 23:39:14 +0200
Message-ID: <537FC002.6080701@free-electrons.com>
References: <1400257376-13251-1-git-send-email-gregory.clement@free-electrons.com> <1400257376-13251-4-git-send-email-gregory.clement@free-electrons.com> <537F14D4.1090705@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <537F14D4.1090705-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 23/05/2014 11:28, Kishon Vijay Abraham I wrote:
> Hi,
> 
> On Friday 16 May 2014 09:52 PM, Gregory CLEMENT wrote:
>> This commit extends the xhci-plat so that it can optionally be passed
>> a reference to a PHY through the Device Tree. It will be useful for
>> the Armada 375 SoCs. If no PHY is provided then the behavior of the
>> driver is unchanged.
>>
>> As for the clock, to achieve this, it adds a 'struct phy *' member in
>> xhci_hcd. While only used for now in xhci-plat, here again, it might
>> be used by other drivers in the future.
>>
>> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> ---
>>  drivers/usb/host/xhci-plat.c | 29 ++++++++++++++++++++++++++++-
>>  drivers/usb/host/xhci.h      |  2 ++
>>  2 files changed, 30 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
>> index 0f5f4c8f5bf6..34239b582621 100644
>> --- a/drivers/usb/host/xhci-plat.c
>> +++ b/drivers/usb/host/xhci-plat.c
>> @@ -15,6 +15,7 @@
>>  #include <linux/dma-mapping.h>
>>  #include <linux/module.h>
>>  #include <linux/of.h>
>> +#include <linux/phy/phy.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/slab.h>
>>  
>> @@ -94,6 +95,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
>>  	struct resource         *res;
>>  	struct usb_hcd		*hcd;
>>  	struct clk              *clk;
>> +	struct phy              *phy;
>>  	int			ret;
>>  	int			irq;
>>  
>> @@ -160,9 +162,23 @@ static int xhci_plat_probe(struct platform_device *pdev)
>>  			goto unmap_registers;
>>  	}
>>  
>> +	phy = devm_phy_optional_get(&pdev->dev, "usb");
>> +	if (IS_ERR(phy)) {
>> +		ret = PTR_ERR(phy);
>> +		goto disable_clk;
>> +	} else {
>> +		ret = phy_init(phy);
>> +		if (ret)
>> +			goto disable_phy;
> s
> I think you meant disable_clk here?

yes indeed!


>> +
>> +		ret = phy_power_on(phy);
>> +		if (ret)
>> +			goto disable_phy;
>> +	}
>> +
>>  	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
>>  	if (ret)
>> -		goto disable_clk;
>> +		goto power_off_phy;
>>  
>>  	device_wakeup_enable(hcd->self.controller);
>>  
>> @@ -198,6 +214,12 @@ put_usb3_hcd:
>>  dealloc_usb2_hcd:
>>  	usb_remove_hcd(hcd);
>>  
>> +power_off_phy:
>> +	if (!IS_ERR(phy))
> 
> This check is unnecessary here since you do power_off only if PHY is not error.

Good catch again!


>> +		phy_power_off(phy);
>> +disable_phy:
>> +	if (!IS_ERR(phy))
> 
> same here..

I agree

>> +		phy_exit(phy);
>>  disable_clk:
>>  	if (!IS_ERR(clk))
>>  		clk_disable_unprepare(clk);
>> @@ -219,6 +241,7 @@ static int xhci_plat_remove(struct platform_device *dev)
>>  	struct usb_hcd	*hcd = platform_get_drvdata(dev);
>>  	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
>>  	struct clk *clk = xhci->clk;
>> +	struct phy *phy = xhci->phy;
>>  
>>  	usb_remove_hcd(xhci->shared_hcd);
>>  	usb_put_hcd(xhci->shared_hcd);
>> @@ -226,6 +249,10 @@ static int xhci_plat_remove(struct platform_device *dev)
>>  	usb_remove_hcd(hcd);
>>  	if (!IS_ERR(clk))
>>  		clk_disable_unprepare(clk);
>> +	if (!IS_ERR(phy)) {
> 
> same here..

I agree too

Thanks for you review,

Gregory

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
