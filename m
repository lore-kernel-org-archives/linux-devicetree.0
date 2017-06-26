From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/3] remoteproc/keystone: Add a remoteproc driver for
 Keystone 2 DSPs
Date: Mon, 26 Jun 2017 14:19:57 -0700
Message-ID: <20170626211957.GH18666@tuxbook>
References: <20170613234513.7624-1-s-anna@ti.com>
 <20170613234513.7624-3-s-anna@ti.com>
 <20170625201545.GA26155@builder>
 <1ccd9273-0fde-4241-6d99-1d03be2f5b57@ti.com>
 <20170626200608.GG18666@tuxbook>
 <1f8d65fc-0acc-499e-a98e-953dce60750f@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1f8d65fc-0acc-499e-a98e-953dce60750f-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Cc: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>, Sam Nelson <sam.nelson-l0cyMroinI0@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon 26 Jun 13:20 PDT 2017, Suman Anna wrote:

> On 06/26/2017 03:06 PM, Bjorn Andersson wrote:
> > On Mon 26 Jun 08:54 PDT 2017, Suman Anna wrote:
> >> On 06/25/2017 03:15 PM, Bjorn Andersson wrote:
[..]
> > I still would like to have resources allocated at probe() time, so I
> > would appreciate a follow up patch moving the request_irq()s to probe,
> > per above comment (but we can take that after v4.13).
> 
> OK thanks. This is a common theme across all the remoteproc drivers
> supporting rpmsg, and I definitely need to disable them in probe since
> the boot or the virtio/rpmsg devices are not guaranteed to be present in
> the probe.
> 

We have a consistent struct rproc after rproc_alloc(). So before the
virtio device (rpmsg in your case) calls virtio_find_vqs() rvring->vq
will be NULL and rproc_vq_interrupt() is a nop.

So AFAICT it should be fine to register this at probe time and leave it
enabled...but there's a lot of moving parts involved here, so it's
possible that I'm missing something.


But in for both interrupts it's important to disable them before calling
rproc_free(), as this will free the memory passed to the interrupt
handler.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
