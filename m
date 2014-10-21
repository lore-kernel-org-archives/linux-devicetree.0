From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCHv2 1/2] ARM: dts: socfpga: Fix SD card detect
Date: Tue, 21 Oct 2014 10:07:20 +0100
Message-ID: <20141021090720.GA15293@leverpostej>
References: <1413819079-17120-1-git-send-email-dinguyen@opensource.altera.com>
 <1413819079-17120-2-git-send-email-dinguyen@opensource.altera.com>
 <20141020184139.GA23062@leverpostej>
 <CAD=FV=Xw2zAL-7s2XJk6fawMGUuMapGfqYGC6ntwG-TCi8GgkA@mail.gmail.com>
 <20141020224147.GA13670@leverpostej>
 <CAD=FV=WoGQU+toQ8LM6K1B=tGe_sdLF6OVZ5uVCOtah7P8wvmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=WoGQU+toQ8LM6K1B=tGe_sdLF6OVZ5uVCOtah7P8wvmw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org" <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org" <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 21, 2014 at 01:02:28AM +0100, Doug Anderson wrote:
> Mark,
> 
> On Mon, Oct 20, 2014 at 3:41 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> > On Mon, Oct 20, 2014 at 08:26:55PM +0100, Doug Anderson wrote:
> >> Mark,
> >>
> >> On Mon, Oct 20, 2014 at 11:41 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> >> > On Mon, Oct 20, 2014 at 04:31:18PM +0100, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> >> >> From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> >> >>
> >> >> Without this patch, the booting the SOCFPGA platform would hang at the
> >> >> SDMMC driver loading. There were 2 patches that caused this to happen:
> >> >>
> >> >> - Patch 9795a846e10 "mmc: dw_mmc: remove dw_mci_of_cd_gpio/wp_gpio()" removed
> >> >>   looking for "cd-gpios", since mmc_of_parse was getting called.
> >> >> - Patch 3cf890fc42b "mmc: dw_mmc: Pass back errors from mmc_of_parse()" would
> >> >>   hang the system at the SDMMC driver loading.
> >> >
> >> > Regardless of which patches caused the issue, the existing DTB should
> >> > continue to function. This is a kernel bug, not a DTB bug.
> >>
> >> Right.  The kernel bug is that there is no "dtb fixup" stage of the
> >> kernel to fix up old dtbs with this dtb bug.
> >>
> >> Said another way:
> >>
> >> 1. The old dtb was (possibly) not specifying the cd-gpio properly.
> >>
> >> 2. The kernel had a bug where it was ignoring that error.  Things may
> >> have been working because of some other side effect (maybe polling was
> >> working).
> >>
> >> 3. If we fix the kernel bug, what should we do?  The only sensible
> >> thing (if we need to support old DTB with no changes) is to add a DTB
> >> fixup stage.
> >>
> >> ...or did someone add that stage and I missed it?
> >
> > Unfortunately, we have no generic DTB fixup stage currently.
> 
> Right.  ...and that's the bug.
> 
> I think we may need to modify the general inclination to respond to
> dts change requests with "the DTS can't have a bug in it".  DTS files
> can indeed have bugs in it.  In this case the dts file was claiming
> that the card detect GPIO was a GPIO on a controller that the same dts
> claimed was "disabled".  If that's not a bug in the DTS I'm not sure
> what it is.

While it's unusual, it's not necessarily a bug in general-- the link
might be true (i.e. that particular GPIO might be attached to the CD
line), but for some reason the GPIO controller is unusable on a
particular board. Perhaps we need to distinguish not ready yet from will
never be ready -- at least for provider nodes with status = "disabled"
that should be obvious.

That said, this was not an intentional property of this DTB.

> There are all sorts of broken ways that we could work around this in
> the driver.  We could pretend that EPROBE_DEFER really meant "I'm all
> good".  We could add a special case for this particular board in
> dw_mmc (do we check the overall device tree compatible string?).  We
> could do all sorts of hacks.  None of them are right.  The "right"
> behavior if we really care about maintaining compatbility with old DTB
> files is to add a fixup stage for this particular broken board.

While a DTB fixup stage is something which we are likely to need at some
point, it comes with its own (rather large) cost. I disagree that DTB
fixup is the one and only way of handling this kind of issue.

> Given that no such fixup stage exists, if someone really wants old DTB
> files to work then we should add one.

Perhaps. In this case I guess this comes down to whether socfpga users
are happy to update their DTBs.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
