From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 12/12] ARM: dtsi: axp81x: set pinmux for GPIO0/1 when
 used as LDOs
Date: Tue, 3 Oct 2017 10:18:37 +0100
Message-ID: <20171003091837.GK20805@n2100.armlinux.org.uk>
References: <20171002120854.5212-1-quentin.schulz@free-electrons.com>
 <20171002120854.5212-13-quentin.schulz@free-electrons.com>
 <20171002204235.25d4437a2p5qzrrj@flea>
 <CAGb2v67ZV0oZ41WS1Borrz0fDYiXV5B1DTKnPzRQVcodMOOLzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v67ZV0oZ41WS1Borrz0fDYiXV5B1DTKnPzRQVcodMOOLzQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Quentin Schulz <quentin.schulz@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 03, 2017 at 10:06:29AM +0800, Chen-Yu Tsai wrote:
> On Tue, Oct 3, 2017 at 4:42 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Mon, Oct 02, 2017 at 12:08:54PM +0000, Quentin Schulz wrote:
> >> On AXP813/818, GPIO0 and GPIO1 can be used as LDO as (respectively)
> >> ldo_io0 and ldo_io1.
> >>
> >> Let's add the pinctrl properties to the said regulators.
> >>
> >> Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
> >> ---
> >>  arch/arm/boot/dts/axp81x.dtsi | 14 ++++++++++++++
> >>  1 file changed, 14 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/axp81x.dtsi b/arch/arm/boot/dts/axp81x.dtsi
> >> index f90f257130d5..099b0ddc1bbb 100644
> >> --- a/arch/arm/boot/dts/axp81x.dtsi
> >> +++ b/arch/arm/boot/dts/axp81x.dtsi
> >> @@ -52,6 +52,16 @@
> >>               compatible = "x-powers,axp813-gpio";
> >>               gpio-controller;
> >>               #gpio-cells = <2>;
> >> +
> >> +             gpio0_ldo: gpio0_ldo {
> >> +                     pins = "GPIO0";
> >> +                     function = "ldo";
> >> +             };
> >> +
> >> +             gpio1_ldo: gpio1_ldo {
> >> +                     pins = "GPIO1";
> >> +                     function = "ldo";
> >> +             };
> >
> > The node names are not supposed to contain any hyphens.
> 
> Hmm, I was under the impression that hyphens were preferred in
> node names, and a warning would be added to dtc later on.
> I might be wrong though.

I think there's a terminology issue here.

"-" is a hyphen or minus sign.
"_" is an underscore.

Underscores are not supposed to be used for node names, instead hyphens
are preferred.  I think Maxime means "underscore".

Here's the list from dtc/checks.c:

#define LOWERCASE       "abcdefghijklmnopqrstuvwxyz"
#define UPPERCASE       "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
#define DIGITS          "0123456789"
#define PROPNODECHARS   LOWERCASE UPPERCASE DIGITS ",._+*#?-"
#define PROPNODECHARSSTRICT     LOWERCASE UPPERCASE DIGITS ",-"

If strict mode is enabled, use of any of "._+#?" in the node name will
produce a warning.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
