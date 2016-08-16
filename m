From: "William.wu" <William.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v10 5/5] usb: dwc3: add rockchip specific glue layer
Date: Tue, 16 Aug 2016 18:24:12 +0800
Message-ID: <de9ede71-82a5-0aec-4bcc-8cb1dca15a6d@rock-chips.com>
References: <1471251031-17084-1-git-send-email-william.wu@rock-chips.com>
 <1471251284-1804-1-git-send-email-william.wu@rock-chips.com>
 <87y43x89l3.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87y43x89l3.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Balbi，


On 2016/8/16 15:19, Felipe Balbi wrote:
> Hi,
>
> William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org> writes:
>> Add rockchip specific glue layer to support USB3 Peripheral mode
>> and Host mode on rockchip platforms (e.g. rk3399).
>>
>> The DesignWare USB3 integrated in rockchip SoCs is a configurable
>> IP Core which can be instantiated as Dual-Role Device (DRD), Host
>> Only (XHCI) and Peripheral Only configurations.
>>
>> We use extcon notifier to manage usb cable detection and mode switch.
>> Enable DWC3 PM runtime auto suspend to allow core enter runtime_suspend
>> if USB cable is dettached. For host mode, it requires to keep whole
>> DWC3 controller in reset state to hold pipe power state in P2 before
>> initializing PHY. And it need to reconfigure USB PHY interface of DWC3
>> core after deassert DWC3 controller reset.
>>
>> The current driver supports Host only and Peripheral Only well, for
>> now, we will add support for OTG after we have it all stabilized.
>>
>> Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>> Changes in v10:
>> - fix building error
>>
>> Changes in v9:
>> - Add a new dwc3-rockchip.c driver for rk3399, rather than use dwc3-of-simple.c
>>
>>   drivers/usb/dwc3/Kconfig         |   9 +
>>   drivers/usb/dwc3/Makefile        |   1 +
>>   drivers/usb/dwc3/core.c          |   2 +-
>>   drivers/usb/dwc3/core.h          |   1 +
>>   drivers/usb/dwc3/dwc3-rockchip.c | 441 +++++++++++++++++++++++++++++++++++++++
> William, if you need to touch core dwc3 to introduce a glue layer,
> you're doing it wrong.

Sorry， I realized that it's not better to touch core dwc3 in a specific 
glue layer.
I touched dwc3 in glue layer, because I want to support dual-role mode， and
according to our dwc3 IP and usb3 PHY IP design， it need to reinit dwc3 
core
whenever  usb cable attached.

Anyway, it's wrong to do that.:-[

>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index e887b38..3da6215 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -405,7 +405,7 @@ static void dwc3_cache_hwparams(struct dwc3 *dwc)
>>    * initialized. The PHY interfaces and the PHYs get initialized together with
>>    * the core in dwc3_core_init.
>>    */
>> -static int dwc3_phy_setup(struct dwc3 *dwc)
>> +int dwc3_phy_setup(struct dwc3 *dwc)
> there's no way I'll let this slip through the cracks :-)

Why I need  dwc3_phy_setup in  glue layer is because usb3 IP design
in rockchip platform. If dwc3 works on host mode, it requires to put
dwc3 controller in reset state before usb3 phy initializing，and after
deassert reset,  we need to reconfigure UTMI+ PHY interface because
our dwc3 core can't configure PHY interface correctly.

Thank you for give me a chance to explain it.:-)

>
>> diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
>> new file mode 100644
>> index 0000000..eeae1a9
>> --- /dev/null
>> +++ b/drivers/usb/dwc3/dwc3-rockchip.c
>> @@ -0,0 +1,441 @@
> [...]
>
>> +static int dwc3_rockchip_probe(struct platform_device *pdev)
>> +{
>> +	struct dwc3_rockchip	*rockchip;
>> +	struct device		*dev = &pdev->dev;
>> +	struct device_node	*np = dev->of_node, *child;
>> +	struct platform_device	*child_pdev;
>> +
>> +	unsigned int		count;
>> +	int			ret;
>> +	int			i;
>> +
>> +	rockchip = devm_kzalloc(dev, sizeof(*rockchip), GFP_KERNEL);
>> +
>> +	if (!rockchip)
>> +		return -ENOMEM;
>> +
>> +	count = of_clk_get_parent_count(np);
>> +	if (!count)
>> +		return -ENOENT;
>> +
>> +	rockchip->num_clocks = count;
>> +
>> +	rockchip->clks = devm_kcalloc(dev, rockchip->num_clocks,
>> +				      sizeof(struct clk *), GFP_KERNEL);
>> +	if (!rockchip->clks)
>> +		return -ENOMEM;
>> +
>> +	platform_set_drvdata(pdev, rockchip);
>> +
>> +	rockchip->dev = dev;
>> +	rockchip->edev = NULL;
>> +
>> +	pm_runtime_set_active(dev);
>> +	pm_runtime_enable(dev);
>> +	ret = pm_runtime_get_sync(dev);
>> +	if (ret < 0) {
>> +		dev_err(dev, "get_sync failed with err %d\n", ret);
>> +		goto err1;
>> +	}
>> +
>> +	for (i = 0; i < rockchip->num_clocks; i++) {
>> +		struct clk	*clk;
>> +
>> +		clk = of_clk_get(np, i);
>> +		if (IS_ERR(clk)) {
>> +			while (--i >= 0)
>> +				clk_put(rockchip->clks[i]);
>> +			ret = PTR_ERR(clk);
>> +
>> +			goto err1;
>> +		}
>> +
>> +		ret = clk_prepare_enable(clk);
>> +		if (ret < 0) {
>> +			while (--i >= 0) {
>> +				clk_disable_unprepare(rockchip->clks[i]);
>> +				clk_put(rockchip->clks[i]);
>> +			}
>> +			clk_put(clk);
>> +
>> +			goto err1;
>> +		}
>> +
>> +		rockchip->clks[i] = clk;
>> +	}
>> +
>> +	rockchip->otg_rst = devm_reset_control_get(dev, "usb3-otg");
>> +	if (IS_ERR(rockchip->otg_rst)) {
>> +		dev_err(dev, "could not get reset controller\n");
>> +		ret = PTR_ERR(rockchip->otg_rst);
>> +		goto err2;
>> +	}
>> +
>> +	ret = dwc3_rockchip_extcon_register(rockchip);
>> +	if (ret < 0)
>> +		goto err2;
>> +
>> +	child = of_get_child_by_name(np, "dwc3");
>> +	if (!child) {
>> +		dev_err(dev, "failed to find dwc3 core node\n");
>> +		ret = -ENODEV;
>> +		goto err3;
>> +	}
>> +
>> +	/* Allocate and initialize the core */
>> +	ret = of_platform_populate(np, NULL, NULL, dev);
>> +	if (ret) {
>> +		dev_err(dev, "failed to create dwc3 core\n");
>> +		goto err3;
>> +	}
>> +
>> +	child_pdev = of_find_device_by_node(child);
>> +	if (!child_pdev) {
>> +		dev_err(dev, "failed to find dwc3 core device\n");
>> +		ret = -ENODEV;
>> +		goto err4;
>> +	}
>> +
>> +	rockchip->dwc = platform_get_drvdata(child_pdev);
> No! You will *NOT* the core struct device. Don't even try to come up
> with tricks like this.
>
> Let's do this: introduce a glue layer that gets peripheral-only
> working. Remove PM for now, too. Start with something simple, get the
> bare minimum working upstream and add more stuff as you go.
>
> Trying to do everything in one patch just makes it much more likely for
> your patch to be NAKed. What you're doing here is bypassing all the
> layering we've built. That won't work very well. The only thing you'll
> get is for your patches to continue to be NAKed.
>
> Avoid the tricks and abuses. Just because you _can_ do it somehow, it
> doesn't mean you _should_ do it :-)
>
> Your best option right now, is to remove PM and dual-role support and a
> minimal glue layer supported.
>
> In fact, all you *really* need is to add a compatible to
> dwc3-of-simple.c. That should be enough to get your dwc3 working. Don't
> do anything more than that. For dual-role and PM, we can add it
> generically to dwc3-of-simple.c when all pieces fall into place.
>
Ah, thanks very much for your kind explanation. I think I just only need
to add a compatible to dwc3-of-simple.c，for now， and I have tested
my dwc3， it worked well on peripheral only mode and host only mode
without PM. Further, if dwc3-of-simple.c adds generic handling of dual-role
and PM, I can improve our dwc3 feature.:-)

Best regards，
         William.wu




--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
