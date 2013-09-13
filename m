From: Ian Campbell <Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PROPOSAL] ARM/FDT: passing multiple binaries to a kernel
Date: Fri, 13 Sep 2013 12:22:13 +0100
Message-ID: <1379071333.19256.36.camel@kazak.uk.xensource.com>
References: <52260608.2030202@linaro.org>
	 <CAL_JsqK9PjpScRO8561PhcyKkxhuL4pgMTCh2-UG_ubybJTcCw@mail.gmail.com>
	 <1378284256.17510.60.camel@kazak.uk.xensource.com>
	 <CAL_Jsq+82xfNCD3LmNE6VD1mp4Vzbm-hPPaMjwg9+ab3moXP_w@mail.gmail.com>
	 <CACxGe6sOyNNEATsnRdu9=_nPE1q6V4MDaDKvk4QvJiSgq6jXmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6sOyNNEATsnRdu9=_nPE1q6V4MDaDKvk4QvJiSgq6jXmg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "boot-architecture-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <boot-architecture-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Dennis Gilmore <dennis-OMEdqnBlyiw@public.gmane.org>, Julien Grall <julien.grall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andre Przywara <andre.przywara-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "xen-devel-GuqFBffKawuEi8DpZVb4nw@public.gmane.org" <xen-devel-GuqFBffKawuEi8DpZVb4nw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2013-09-13 at 11:13 +0100, Grant Likely wrote:
> On Wed, Sep 4, 2013 at 5:41 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> For u-boot Andre has proposed some syntactic sugar over the "fdt"
> >> command to make boot.scr more trivial to use. We would of course need to
> >> implement support for using it in the relevant distro tools (but they
> >> tend to be very distro/machine specific already, e.g. Debian's
> >> flash-kernel)
> >
> > And being machine specific is a PITA. flash-kernel is certainly not
> > something we want to expand on. There is not much love for boot.scr
> > either. There is work to address what are not really machine
> > differences, but largely vendor u-boot differences:
> >
> > http://www.mail-archive.com/u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org/msg119025.html
> >
> > One option for u-boot which already supports syslinux style menu files
> > is to adopt the syslinux multiboot parsing support:
> >
> > http://www.syslinux.org/wiki/index.php/Doc/mboot
> 
> Even building it into U-Boot is problematic because it leaves older
> machines out in the cold. Leif's port of Grub to U-Boot is far more
> interesting since the distro can now be in control of the code that
> loads the images and jumps into the kernel/hypervisor.

AIUI this is not being developed any further?

> > We need to back-up and consider what this looks like in the end for
> > all the pieces and get input from folks on grub, UEFI, and armv8. The
> > UEFI answer may be this is a grub problem. For armv8, this proposal
> > does match up well as the kernel boot interface for v8 is DT. Despite
> > some claims, ACPI will not completely replace DT because of this.
> 
> Yes, for UEFI it is absolutely an OS loader problem. UEFI provides an
> API and runtime environment. Grub is in general moving towards a boot
> menu system and a tool for loading images. Actual booting however
> should be done by a separate OS loader application. For Linux, this
> will be an in-kernel UEFI Stub.

I'm not sure I follow your distinction between loading the images and
"actual booting". If grub loads the images and Linux stub does the
actual booting how does this stub locate the images which grub loaded?

Or are you saying the stub should load the initramfs itself? How does it
know where to find it? Having the kernel in one config file (grub's) and
the initramfs in another (the Linux UEFI stub's) seems likely to result
in things getting out of sync. Having Linux's stub parse the grub CFG is
even less likely to work well IMHO.

>  For Xen I would recommend taking the
> Linux EFI stub code and doing the same thing. There really isn't a
> need for a multiboot spec when you can rely on a runtime execution
> environment for setting things up exactly as you want them.

If this works for Linux on EFI then I see no reason it could work for
Xen on EFI (assuming my questions above are just a result of my
misunderstanding something)

But... Xen also wants to support non-server and therefore non-EFI
systems i.e. u-boot. We also want to support v7 where EFI is not a given
even for servers AIUI.

Given that I think it is a given that Xen will have some sort of
protocol along these lines, for use in these environments even if it
does the EFI stub thing on EFI systems. The question is shall we make it
more general and useful to others or just go our own way? I'd prefer to
do the former.

> Multiboot only makes sense to me when you need to rely on firmware or
> something else out of your control to load the images in a particular
> way.

I think in some cases do end up needing to rely on that though.

Ian.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
