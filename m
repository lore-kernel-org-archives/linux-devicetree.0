From: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 3/4] ARM: pinctrl: Add Broadcom Capri pinctrl driver
Date: Fri, 17 Jan 2014 21:56:00 -0500
Message-ID: <20140118025600.GS31049@beef>
References: <1386787041-6035-1-git-send-email-syin@broadcom.com>
 <1387592016-13740-1-git-send-email-syin@broadcom.com>
 <1387592016-13740-4-git-send-email-syin@broadcom.com>
 <CACRpkdaPZrR=kEknr3YKDWLd_E+o22Yn19ei7iT6cdbYdbeZ2w@mail.gmail.com>
 <52D98B99.5050604@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52D98B99.5050604-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 17, 2014 at 11:59:21AM -0800, Sherman Yin wrote:
> On 14-01-16 05:19 AM, Linus Walleij wrote:
> >On Sat, Dec 21, 2013 at 3:13 AM, Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> >
> >'> Adds pinctrl driver for Broadcom Capri (BCM281xx) SoCs.
> >>
> >>Signed-off-by: Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> >>Reviewed-by: Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>
> >>Reviewed-by: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>---
> >>v4: - PINCTRL selected in Kconfig, PINCTRL_CAPRI selected in bcm_defconfig
> >>     - make use of regmap
> >>     - change CAPRI_PIN_UPDATE from macro to inline function.
> >>     - Handle pull-up strength arg in Ohm instead of enum
> >
> >Patch applied. It is really good now! It's late before the merge
> >window, but you've done a tremendous work on this driver and
> >I don't want to delay its deployment further.
> 
> Great, thanks for the support and reviews!

Very nice! Now after having completely missing something fundamental on
my reviews, I feel compelled to bring it up at the 11^H^H12th hour.

That is, this is the *only* BCM281xx driver to be named Capri, both in
the filename and driver code, but also in the binding compatible. We
didn't do that on anything else that's gone upstream to date. This
really introduces an unfortunate inconsistency as it obscures which
SoC family this binding and driver belong with.

I wonder if Linus would accept a rename at this point (too late for 3.14
presumably, but for 3.15) of s/capri/bcm281xx throughout, bcm11351 for
the compatible string, as we have for the machine compatible, and also
BCM281XX for the Kconfig option. If not, I'll survive, but it pains me
to see one thing completely different out of this entire family. If
nothing else, it would be great to address the compatible string before
this hits the 3.14 release.

Linus?

-Matt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
