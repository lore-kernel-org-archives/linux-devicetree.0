From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 1/3] power: reset: read priority from device tree
Date: Mon, 1 Dec 2014 09:51:34 -0800
Message-ID: <20141201175134.GC24692@roeck-us.net>
References: <1417453389-1588-1-git-send-email-stefan@agner.ch>
 <1417453389-1588-2-git-send-email-stefan@agner.ch>
 <20141201171126.GB22708@leverpostej>
 <e5c5a44c84b95c4e48ed01c4dcffd35a@agner.ch>
 <20141201174100.GC22708@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141201174100.GC22708@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "fkan-qTEPVZfXA3Y@public.gmane.org" <fkan-qTEPVZfXA3Y@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 01, 2014 at 05:41:00PM +0000, Mark Rutland wrote:
> On Mon, Dec 01, 2014 at 05:24:37PM +0000, Stefan Agner wrote:
> > On 2014-12-01 18:11, Mark Rutland wrote:
> > > On Mon, Dec 01, 2014 at 05:03:07PM +0000, Stefan Agner wrote:
> > >> This patch adds an optional property which allows to specify the
> > >> reset source priority. This priority is used by the kernel restart
> > >> handler call chain to sort out the proper reset/restart method.
> > >> Depending on the power design of a board or other machine/board
> > >> specific peculiarity, it is not possible to pick a generic priority.
> > >>
> > >> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> > >> ---
> > >>  Documentation/devicetree/bindings/power/reset/syscon-reboot.txt | 3 +++
> > >>  drivers/power/reset/syscon-reboot.c                             | 5 ++++-
> > >>  2 files changed, 7 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot.txt b/Documentation/devicetree/bindings/power/reset/syscon-reboot.txt
> > >> index 1190631..ee41d9c 100644
> > >> --- a/Documentation/devicetree/bindings/power/reset/syscon-reboot.txt
> > >> +++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot.txt
> > >> @@ -11,6 +11,9 @@ Required properties:
> > >>  - offset: offset in the register map for the reboot register (in bytes)
> > >>  - mask: the reset value written to the reboot register (32 bit access)
> > >>
> > >> +Optional properties:
> > >> +- priority: define the priority of the reset (0-255, defaults to 128)
> > >> +
> > > 
> > > NAK. This is a leak of Linux-internal details.
> > > 
> > > What is this necessary for?
> > > 
> > > Mark.
> > 
> > Hi Mark,
> > 
> > In my case, it is necessary to be called ahead of the watchdog, which
> > has a priority of 128. This syscon-reboot driver currently has a default
> > priority of 128 too. I could live with a higher default priority for the
> > syscon-reboot driver, in fact I proposed that in the discussion of v1 of
> > that patch:
> > https://lkml.org/lkml/2014/11/28/484
> 
> Thanks for the link.
> 
> > IMHO, this priority might make sense for most cases, I guess that
> > dedicated "syscon" capabilities are usually better suited as a reboot
> > source than watchdog.
> 
> I would think likewise.
> 
> > If dt, then the question which arises: If there are different
> > capabilities to reset/reboot a whole system, how do we reflect which is
> > the best suited one in dt?
> 
> I'm not sure, but I don't think that exposing a priority variable in
> this way is the best, because it implicitly relies on what the kernel
> may have selected for other devices and/or FW interfaces, which may not
> have been described in DT.
> 
> So if we can get away with a fixed priority for now, then I would prefer
> that.
> 
> Otherwise, I would imagine that most systems have a single preferred
> mechanism with some possible fallback(s), for which a single
> preferred-poweroff property might suffice, and has better interaction
> w.r.t. priority (in that it should _always_ be tried first). Even that's
> difficult to reconcile with FW bindings though, especially EFI (which we
> sometimes must use in preference for variable storage and capsule
> updates).
> 
Hi mark,

reboot, not poweroff, but I like that idea; it is system independent,
and I agree that there should be only one "preferred-reboot" mechanism.
If we need more we can always add something like "fallback-reboot".

Not sure I understand the reference to EFI. Does EFI install a means
to restart the system ? Also, doesn't the proprity question apply even
if there is no dt property to establish the preference ?

Thanks,
Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
