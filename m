From: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/6] xhci: probe phy before add usb_hcd
Date: Mon, 01 Jun 2015 18:17:04 +0300
Message-ID: <556C7770.70506@intel.com>
References: <1432727283-20303-1-git-send-email-chunfeng.yun@mediatek.com>	 <1432727283-20303-4-git-send-email-chunfeng.yun@mediatek.com>	 <20150527121843.GA8611@saruman.tx.rr.com> <1433170337.12128.18.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433170337.12128.18.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org
Cc: chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01.06.2015 17:52, Yingjoe Chen wrote:
> On Wed, 2015-05-27 at 07:18 -0500, Felipe Balbi wrote:
>> On Wed, May 27, 2015 at 07:48:00PM +0800, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
>>> From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>>
>>> find the phy driver before add primary usb_hcd to avoid acessing
>>> xHCI register which may hangup the system when the phy is not loaded
>>> yet and the related powers or clocks put in phy driver are not
>>> enabled.
>>
>> it seems like the same clock is needed by PHY and XHCI. This patch looks
>> incorrect.
> 
> 
> Hi,
> 
> I agree that the driver should enable clock it used by itself and not
> depends on init order. This should be fixed.
> 
> But in general, I think it make sense to only add hcd after all required
> resource are ready. At least it remove unnecessary calls to
> usb_add_hcd/usb_remove_hcd. Is it better if the commit message is
> changed to something like the below?
> 
> Currently xhci_plat_probe() call usb_add_hcd before trying to init the
> phy. However if the phy is not ready at the moment, it have to remove
> the hcd and probe again later 
> 
> Change the init order so we only add hcd when all required resource are
> ready.
> 
Hi

Rogers Quadros patchseries that changes how HCDs are created and added for
xhci-plat was just sent forward. It first creates both HCDs, then adds them.

Doesn't usb_add_hcd() as it's first task take care of the PHYs? 
I'm hoping to remove that part completely from xhci-plat.c but haven't
looked into it properly yet.

-Mathias
 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
