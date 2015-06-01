From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v11 4/5] edac: Add APM X-Gene SoC EDAC driver
Date: Mon, 1 Jun 2015 16:11:31 +0100
Message-ID: <20150601151131.GD14192@e104818-lin.cambridge.arm.com>
References: <1432337580-3750-1-git-send-email-lho@apm.com>
 <1432337580-3750-4-git-send-email-lho@apm.com>
 <1432337580-3750-5-git-send-email-lho@apm.com>
 <3195065.IK73o60xya@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3195065.IK73o60xya@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 01, 2015 at 04:42:58PM +0200, Arnd Bergmann wrote:
> On Friday 22 May 2015 17:32:59 Loc Ho wrote:
> > +static bool xgene_edac_pmd_l2c_version1(void)
> > +{
> > +       /* Check all chips with PMD L2C version 1 HW */
> > +       #define REVIDR_MINOR_REV(revidr)        ((revidr) & 0x00000007)
> > +
> > +       switch (MIDR_VARIANT(read_cpuid_id())) {
> > +       case 0:
> > +               switch (MIDR_REVISION(read_cpuid_id())) {
> > +               case 0:
> > +
> > +                       switch (REVIDR_MINOR_REV(read_cpuid(REVIDR_EL1))) {
> > +                       case 1:
> > +                       case 2:
> > +                               return true;
> > +                       };
> > +                       break;
> > +               case 1:
> > +                       if (REVIDR_MINOR_REV(read_cpuid(REVIDR_EL1)) == 1)
> > +                               return true;
> > +                       break;
> > +               }
> > +               break;
> > +       case 1:
> > +               switch (MIDR_REVISION(read_cpuid_id())) {
> > +               case 0:
> > +                       switch (REVIDR_MINOR_REV(read_cpuid(REVIDR_EL1))) {
> > +                       case 1:
> > +                               return true;
> > +                       };
> > +                       break;
> > +               case 1:
> > +                       switch (REVIDR_MINOR_REV(read_cpuid(REVIDR_EL1))) {
> > +                       case 1:
> > +                       case 0:
> > +                               return true;
> > +                       };
> > +                       break;
> > +               }
> > +               break;
> > +       }
> > +
> 
> As this is causing build errors on other architectures with COMPILE_TEST
> now, I'd suggest removing the function completely.
> 
> Please use different compatible strings for IP blocks that are different
> and undetectable, instead of reading the ID of another IP block.

I fully agree, the MIDR_* macros shouldn't be used by anything under
drivers/.

-- 
Catalin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
