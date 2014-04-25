From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 02/18] usb: host: xhci-plat: Add clocks support
Date: Fri, 25 Apr 2014 16:48:54 +0200
Message-ID: <535A75D6.5050500@free-electrons.com>
References: <1398434836-18908-1-git-send-email-gregory.clement@free-electrons.com>	<1398434836-18908-3-git-send-email-gregory.clement@free-electrons.com> <20140425161517.20821c65@skate> <535A74DF.6090106@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <535A74DF.6090106-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 25/04/2014 16:44, Gregory CLEMENT wrote:
> On 25/04/2014 16:15, Thomas Petazzoni wrote:
>> Dear Gregory CLEMENT,
>>
>> On Fri, 25 Apr 2014 16:07:00 +0200, Gregory CLEMENT wrote:
>>> Some platform (such as the Armada 38x ones) can gate the clock of
>>> their USB controller. This patch add the support for the clock, by
>>> enabling them during probe and disabling them on remove.
>>>
>>> As not all platforms have clock support then enabling and disabling
>>> the clocks have been placed in separate functions. Then if the clocks
>>> are not supported we still can use the same calls, and there is no
>>>
>>> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>> ---
>>>  drivers/usb/host/xhci-plat.c | 52 ++++++++++++++++++++++++++++++++++++++++++--
>>>  1 file changed, 50 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
>>> index f5351af4b2c5..bb5d563f729c 100644
>>> --- a/drivers/usb/host/xhci-plat.c
>>> +++ b/drivers/usb/host/xhci-plat.c
>>> @@ -11,6 +11,7 @@
>>>   * version 2 as published by the Free Software Foundation.
>>>   */
>>>  
>>> +#include <linux/clk.h>
>>>  #include <linux/dma-mapping.h>
>>>  #include <linux/module.h>
>>>  #include <linux/of.h>
>>> @@ -85,6 +86,42 @@ static const struct hc_driver xhci_plat_xhci_driver = {
>>>  	.bus_resume =		xhci_bus_resume,
>>>  };
>>>  
>>> +#if defined(CONFIG_HAVE_CLK)
>>> +static int try_enable_clk(struct platform_device *pdev)
>>> +{
>>> +	struct clk *clk = devm_clk_get(&pdev->dev, NULL);
>>> +
>>> +	/* Not all platforms have a clk so it is not an error if the clock
>>> +	   does not exists. */
>>> +	if (!IS_ERR(clk))
>>
>> Instead, do:
>>
>> 	if (IS_ERR(clk))
>> 		return 0;
> 
> As explained in the comment: Not all platforms have a clk so it is not an
> error if the clock does not exists.

Sorry you were right with the return 0. I misread the value

> 
>>
>> 	return clk_prepare_enable(clk);
>>
>>> +		if (clk_prepare_enable(clk))
>>> +			return  -ENODEV;
>>> +	return 0;
>>> +}
>>> +
>>> +static int try_disable_clk(struct platform_device *pdev)
>>> +{
>>> +	struct clk *clk = devm_clk_get(&pdev->dev, NULL);
>>
>> No, this isn't correct: you shouldn't be getting the clock to
>> disable/unprepare it, otherwise you have an unbalanced number of
>> get()/put() calls on the clocks.
>>
>> Thomas
>>
> 
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
