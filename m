From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] edac: xgene: fix cpuid abuse
Date: Mon, 01 Jun 2015 20:09:55 +0200
Message-ID: <1702535.joP9YpVrU1@wuerfel>
References: <1432337580-3750-1-git-send-email-lho@apm.com> <4966310.Xu4URPyl4o@wuerfel> <CAPw-ZT=591MT3HZcZ7TsfD_13mEJQ5swsw3kV2BoVxYUaYADCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPw-ZT=591MT3HZcZ7TsfD_13mEJQ5swsw3kV2BoVxYUaYADCA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org" <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org" <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, "dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org" <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, "linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 01 June 2015 10:04:51 Loc Ho wrote:
> Hi Arnd,
> 
> Thanks for the changes, some minor change requested below.
> 
> > The new x-gene EDAC driver incorrectly tried to figure out the version of
> > one of its IP blocks by looking at the version of the CPU core, which is
> > only vagely related.
> >
> > This removes the incorrect code and instead uses the version of the IP
> > block in the compatible string where it belongs.
> >
> > Found using build testing on x86, which does not provide the arm64
> > cpuid interface.
> >
> > Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > ---
> >
> > How about this one? We should make sure this gets fixed before the binding
> > gets set in stone with a kernel release.
> >
> > Loc, do you know if some of the other blocks might also have versions
> > associated with them? Normally we try to use more specific product names,
> > but in case of APM there don't seem to be any more specific names
> > than X-Gene and  X-Gene2 any more.
> >
> 
> I already asked the designer. There is no version register in the PMD block.

Ok.

> > diff --git a/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt b/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
> > index 480911c38ff9..e31b696ba939 100644
> > --- a/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
> > +++ b/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
> > @@ -25,7 +25,7 @@ Required properties for memory controller subnode:
> >  - memory-controller    : Instance number of the memory controller.
> >
> >  Required properties for PMD subnode:
> > -- compatible           : Shall be "apm,xgene-edac-pmd".
> > +- compatible           : Shall be "apm,xgene-edac-pmd" or "apm,xgene-v2-edac-pmd"
> 
> Can we change to "apm,xgene-edac-pmd-v2". I would like to associate
> with the PMD instead with the family name. The PMD (processor module)
> might be re-use in future chip as is such as Gen3, Gen4, and etc.

Makes sense.

> > +                       xgene_edac_pmd_add(edac, child, 1);
> > +               if (of_device_is_compatible(child, "apm,xgene-v2-edac-pmd"))
> 
> Change to "apm,xgene-edac-pmd-v2"
> 
> 
> > +                       xgene_edac_pmd_add(edac, child, 2);
> >         }
> >
> >         return 0;
> 
> Again... Thanks for the changes.

Can you send a fixed version of the patch?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
