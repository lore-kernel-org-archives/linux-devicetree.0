From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCH 3/5] mtd: brcmnand: Optional DT flag to reset IPROC NAND
 controller
Date: Fri, 16 Oct 2015 06:46:22 +0000
Message-ID: <39063E8F96E11742B35A201CC5D095B7AECD4D@SJEXCHMB10.corp.ad.broadcom.com>
References: <1443808606-21203-1-git-send-email-anup.patel@broadcom.com>
 <1443808606-21203-4-git-send-email-anup.patel@broadcom.com>
 <20151004214943.GA28904@localhost>
 <39063E8F96E11742B35A201CC5D095B7AD54C1@SJEXCHMB10.corp.ad.broadcom.com>
 <20151006134119.GB26818@localhost> <56144A62.70300@broadcom.com>
 <5614574C.2060701@gmail.com>
 <39063E8F96E11742B35A201CC5D095B7AD8ADD@SJEXCHMB10.corp.ad.broadcom.com>
 <20151012212742.GQ107187@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151012212742.GQ107187-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pramod Kumar <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Vikram Prakash <vikramp-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sandeep Tripathy <tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rafal
List-Id: devicetree@vger.kernel.org

Hi Brian,

> -----Original Message-----
> From: Brian Norris [mailto:computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> Sent: 13 October 2015 02:58
> To: Anup Patel
> Cc: Florian Fainelli; Scott Branden; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; Rob
> Herring; Pawel Moll; Mark Rutland; Ian Campbell; Kumar Gala; Catalin Marinas;
> Will Deacon; David Woodhouse; Ray Jui; Pramod Kumar; Vikram Prakash;
> Sandeep Tripathy; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; bcm-kernel-feedback-list; Rafal Milecki
> Subject: Re: [PATCH 3/5] mtd: brcmnand: Optional DT flag to reset IPROC NAND
> controller
> 
> Hi Anup,
> 
> On Wed, Oct 07, 2015 at 03:33:50AM +0000, Anup Patel wrote:
> > > -----Original Message-----
> > > From: Florian Fainelli [mailto:f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> > >
> > > On 06/10/15 15:25, Scott Branden wrote:
> > >
> > > Then instead of adding a "reset flag" to Device Tree, another
> > > approach could be to put the desired or currently configured
> > > exhaustive list of NAND timings in Device Tree, and based on that you could
> have this:
> > >
> > > - the NAND controller driver finds that these timings match the
> > > current configuration, you are good to go
> > >
> > > - the NAND controller drivers finds a difference in how current
> > > timings are configured vs. desired timings, and issues a controller
> > > reset, prior to applying new timing configuration
> >
> > To add to this ...
> >
> > The mechanism to reset is BRCM NAND controller is SOC specific so the
> > SoC independent BRCM NAND driver (i.e. brcmnand.c) does not know how
> > to reset the NAND controller.
> >
> > For iProc SoC family, the NAND controller reset is through IDM
> > register space which is only iomap'ed by iproc_nand.c.
> >
> > We might end-up having one more SoC specific callback which will be
> > Provided by iproc_nand.c to brcmnand.c.
> >
> > >
> > > - no timings are configured, reset the controller and use existing
> > > auto-detection capabilities like ONFI modes
> > >
> > > Typically you would put the desired timings instead of the currently
> > > configured timings though..
> >
> > Overall, it would good to support timing parameters through DT or ONFI
> > but for now have we can rely on reset and auto-devid configuration.
> 
> I don't want to support a DT property that is only used as a workaround for the
> right solution. That means the property may quickly become obsolete, yet we
> have to support it forever.
> 
> 
> > > >>     compatible = "brcm,iproc-nand-ns2", ...;
> > > >>
> > > > As described above - the option is not SoC specific.  It is system
> > > > specific.  In some systems we may wish to reset the NAND
> > > > controller in linux.  In some we may wish to rely on
> > > > initialization that has already been done to speed up boot times.
> > >
> > > It seems to me like having this property is fine as long as you are
> > > describing that the controller *needs* a reset to operate properly,
> > > it does not strike me as a particularly well suited property if its
> > > side effect and main usage is to keep or wipe-out existing NAND timings.
> >
> > IMHO, having SoC specific compatible string for NS2 is like saying
> > NAND controller on NS2 is different from other iProc SoCs whereas
> > Having optional DT flags for quirks/work-arounds (e.g. NAND controller
> > reset) is like saying NAND controller on NS2 same as other iProc SoCs
> > but some additional programming is required.
> 
> OK... so what is the reason that you have to reset the controller on NS2 and not
> Cygnus? Is it a SoC difference (i.e., compatible string)?
> Firmware/bootloader difference? So far, all statements have been non-specific,
> AFAICT.
> 

On NS2 SVK, we have 16bit NAND chip whereas on all Cygnus SVKs we mostly
have 8bit NAND chip.

The bootloader on NS2 touches NAND controller and configures it to 16bit mode.
When we reach BRCMNAND driver probing on NS2, the BRCMNAND controller is
already in 16bit mode so NAND READID command does not work. On Cygnus,
we mostly have 8bit NAND chip so BRCMNAND controller is always in 8bit mode
so we don't see any issue with NAND READID command.

We really don't require to reset BRCNNAND controller on NS2 to get NAND
READID command working. Instead, we can simply force 8bit mode before
we do nand_scan_ident() for each CS. This will be a much simpler fix for all
versions of BRCMNAND because NAND READID command will only work
in 8bit mode irrespective to BRCMNAND version (NAND controllers from
other vendors might also have similar issue with NAND READID command).

I will send a revised patchset which will fix brcmnand_init_cs() as-per above.

Best Regards,
Anup
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
