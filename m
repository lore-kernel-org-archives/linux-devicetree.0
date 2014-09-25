From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v6 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Thu, 25 Sep 2014 08:56:43 +0800
Message-ID: <20140925005641.GA3716@peterchendt>
References: <1411468088-5702-1-git-send-email-antoine.tenart@free-electrons.com>
 <2923729.dtX0WmHSV0@wuerfel> <20140924112902.GA23331@peterchendt>
 <2786668.t3YLqX5enD@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2786668.t3YLqX5enD@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 24, 2014 at 02:23:38PM +0200, Arnd Bergmann wrote:
> On Wednesday 24 September 2014 19:29:05 Peter Chen wrote:
> > 
> > So, it is IP CORE LIB (you suggest) vs IP CORE Platform Driver
> > (dwc3, musb, chipidea) you are talking about, right? Except for
> > creating another platform driver as well as related DT node (optional),
> > are there any advantages compared to current IP core driver structure?
> 
> Having a library module usually requires less code, and is more consistent
> with other drivers, which helps new developers understand what the
> driver is doing.

Yes, more consistent is a good reason.

> 
> The most important aspect though is the DT binding: once the structure
> with separate kernel drivers leaks out into the DT format, you can't
> easily change the driver any more, e.g. to make a property that was
> introduced for one glue driver more general so it can get handled by
> the common part. Having a single node lets us convert to the library
> model later, so that would be a strong reason to keep the DT binding
> simple, without child nodes.
> 
> Following that logic, it turns into another reason for using the library
> model to start with, because otherwise the child device does not have
> any DT properties itself and has to rely on the parent device properties,
> which somewhat complicates the driver structure.
> 

Although it is not a problem for chipidea, chipidea core exports API
to handle parent's common DT entries. It is a little inconsistent for
current chipidea core driver, it works as a driver, but exports some
APIs for other drivers use which is like a library. One more benefit I
can see is the platform driver can visit the common struct like io
address if using library, currently, the platform driver isn't suitable
to visit core driver's struct, since they are two drivers.

For chipidea, it doesn't has child device DT node, so it can convert to
core library + platform driver model with moderate effort, I will do
it at next two versions, thanks.

-- 
Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
