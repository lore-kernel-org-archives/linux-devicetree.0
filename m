From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/4] Versatile Express DT support
Date: Mon, 28 Nov 2011 15:14:28 +0000
Message-ID: <20111128151428.GD2465@localhost.localdomain>
References: <1322060508-11298-1-git-send-email-pawel.moll@arm.com>
 <4ED399C8.9080908@gmail.com>
 <20111128145700.GC2465@localhost.localdomain>
 <1322492947.3164.44.camel@hornet.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1322492947.3164.44.camel-okZbbLrgpR/YkXV2EHHjLW3o5bpOHsLO@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 28, 2011 at 03:09:07PM +0000, Pawel Moll wrote:
> On Mon, 2011-11-28 at 14:57 +0000, Dave Martin wrote:
> > Oh, btw, git am reports a few whitespace errors on the last full post of
> > the series (v2).
> > 
> > Can you shove the series through checkpatch.pl and/or git am and fix any
> > minor issues, now that the series is relatively stable?
> 
> I did, actually:
> 
> 8<--------------------------------------------------------------------
> $ scripts/checkpatch.pl 0001-ARM-vexpress-Get-rid-of-MMIO_P2V.patch 
> total: 0 errors, 0 warnings, 363 lines checked
> 
> 0001-ARM-vexpress-Get-rid-of-MMIO_P2V.patch has no obvious style problems and is ready for submission.
> $ scripts/checkpatch.pl 0002-ARM-vexpress-Add-DT-support-in-v2m.patch 
> total: 0 errors, 0 warnings, 505 lines checked
> 
> 0002-ARM-vexpress-Add-DT-support-in-v2m.patch has no obvious style problems and is ready for submission.
> $ scripts/checkpatch.pl 0003-ARM-vexpress-Initial-RS1-memory-map-support.patch 
> WARNING: Use of volatile is usually wrong: see Documentation/volatile-considered-harmful.txt
> #308: FILE: arch/arm/mach-vexpress/include/mach/uncompress.h:25:
> +#define AMBA_PERIPH_ID0(base)	(*(volatile unsigned char *)((base) + 0xfe0))
> 
> total: 0 errors, 1 warnings, 368 lines checked
> 
> 0003-ARM-vexpress-Initial-RS1-memory-map-support.patch has style problems, please review.
> 
> If any of these errors are false positives, please report
> them to the maintainer, see CHECKPATCH in MAINTAINERS.
> $ scripts/checkpatch.pl 0004-ARM-vexpress-DT-based-support-for-CoreTiles-Express-.patch 
> total: 0 errors, 0 warnings, 424 lines checked
> 
> 0004-ARM-vexpress-DT-based-support-for-CoreTiles-Express-.patch has no obvious style problems and is ready for submission.
> 8<--------------------------------------------------------------------
> 
> 
> In the past I noticed that same - sometimes git am is complaining when
> chechpatch is clean. I never was determined to figure out why, though...

Maybe those whitespace issues are only being reported by git am.
We can still fix them though, no?

Cheers
---Dave
