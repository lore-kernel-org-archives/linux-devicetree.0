From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v3] PWM: PXA: add device tree support to PWM driver
Date: Mon, 16 Sep 2013 17:10:15 +0200
Message-ID: <201309161710.15800.marex@denx.de>
References: <1379091281-23662-1-git-send-email-mikedunn@newsguy.com> <201309151607.04244.marex@denx.de> <523718D3.4050003@newsguy.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <523718D3.4050003-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Dunn <mikedunn-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org>
Cc: linux-pwm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chao Xie <chao.xie-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Mike Dunn,

> On 09/15/2013 07:07 AM, Marek Vasut wrote:
> > Dear Mike Dunn,
> > 
> >> This patch adds device tree support to the PXA's PWM driver.  Only an OF
> >> match table is added; nothing needs to be extracted from the device tree
> >> node.  The existing ID table is reused for the match table data.
> >> 
> >> Tested on a Palm Treo 680 (both platform data and DT cases).
> >> 
> >> Signed-off-by: Mike Dunn <mikedunn-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org>
> >> ---
> >> Changle log:
> >> v3:
> >> - remove support for the polarity flag
> >> - remove per-chip pwm index cell; define custom of_xlate()
> >> 
> >>    (now #pwm-cells = <1>)
> >> 
> >> - "compatible" strings for all devices added to OF match table
> >> - various stylistic changes recommended by reviewers
> >> 
> >> v2:
> >> - of_match_table contains only the "pxa250-pwm" compatible string;
> >> require one device instance per pwm
> >> - add Documentation/devicetree/bindings/pwm/pxa-pwm.txt
> >> - add support for polarity flag in DT and implement set_polarity()
> >> method
> >> 
> >>   (the treo 680 inverts the signal between pwm out and backlight)
> >> 
> >> - return -EINVAL instead of -ENODEV if platform data or DT node not
> >> found - output dev_info string if platform data missing
> >> - expanded CC list of patch
> >> 
> >>  Documentation/devicetree/bindings/pwm/pxa-pwm.txt | 31 ++++++++++++
> >>  arch/arm/boot/dts/pxa27x.dtsi                     | 24 +++++++++
> >>  drivers/pwm/pwm-pxa.c                             | 62
> >> 
> >> +++++++++++++++++++++++ 3 files changed, 117 insertions(+)
> >> 
> >>  create mode 100644 Documentation/devicetree/bindings/pwm/pxa-pwm.txt
> >> 
> >> diff --git a/Documentation/devicetree/bindings/pwm/pxa-pwm.txt
> >> b/Documentation/devicetree/bindings/pwm/pxa-pwm.txt new file mode 100644
> >> index 0000000..6fcf90c
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/pwm/pxa-pwm.txt
> >> @@ -0,0 +1,31 @@
> >> +Marvell PWM controller
> >> +
> >> +Required properties:
> >> +- compatible: should be one of:
> >> +  - "marvell,pxa250-pwm"
> >> +  - "marvell,pxa270-pwm"
> >> +  - "marvell,pxa168-pwm"
> >> +  - "marvell,pxa910-pwm"
> > 
> > This really is something I dont quite understand. Why should the driver
> > list _every_ _single_ existing CPU that contains such PWM block? Is
> > there any agreement about that? For me, it'd make much more sense to
> > list only the CPUs where the IP block actually changed in some way, so
> > that the differences can be discerned that way.
> 
> I believe that this was Stephen's suggestion.
> 
> I actually don't object myself.  For the price of a few strings, it
> - clearly shows which SoCs the driver supports
> - ensures that any future differences are handled cleanly (e.g., if a hw
> bug in one is discovered and a work-around is implemented)
> - keeps thngs clean if support for another processor which does have pwm hw
> differences is added
> 
> Especially the third point... otherwise, you have the case of a somewhat
> confusing many-to-one mapping of processors to compatible strings.

OK, to push it ad-absurdum, shall we not start listing every single revision of 
the CPU as well ? Like pxa250a0 250a1 etc ? Yes , this many-to-one mapping is 
something I don't quite understand, that's why I'd love to see a good reasoning 
from Stephen.

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
