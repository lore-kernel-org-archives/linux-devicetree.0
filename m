From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 12/12] ARM: dtsi: axp81x: set pinmux for
 GPIO0/1 when used as LDOs
Date: Tue, 3 Oct 2017 16:43:28 +0200
Message-ID: <20171003144328.wgk57lmda52djcl5@flea>
References: <20171002120854.5212-1-quentin.schulz@free-electrons.com>
 <20171002120854.5212-13-quentin.schulz@free-electrons.com>
 <20171002204235.25d4437a2p5qzrrj@flea>
 <CAGb2v67ZV0oZ41WS1Borrz0fDYiXV5B1DTKnPzRQVcodMOOLzQ@mail.gmail.com>
 <20171003091837.GK20805@n2100.armlinux.org.uk>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b25ylnst75befymh"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBE6EZ3HAKGQEMSB7N4Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20171003091837.GK20805-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--b25ylnst75befymh
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Oct 03, 2017 at 09:18:37AM +0000, Russell King - ARM Linux wrote:
> On Tue, Oct 03, 2017 at 10:06:29AM +0800, Chen-Yu Tsai wrote:
> > On Tue, Oct 3, 2017 at 4:42 AM, Maxime Ripard
> > <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > > On Mon, Oct 02, 2017 at 12:08:54PM +0000, Quentin Schulz wrote:
> > >> On AXP813/818, GPIO0 and GPIO1 can be used as LDO as (respectively)
> > >> ldo_io0 and ldo_io1.
> > >>
> > >> Let's add the pinctrl properties to the said regulators.
> > >>
> > >> Signed-off-by: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > >> ---
> > >>  arch/arm/boot/dts/axp81x.dtsi | 14 ++++++++++++++
> > >>  1 file changed, 14 insertions(+)
> > >>
> > >> diff --git a/arch/arm/boot/dts/axp81x.dtsi b/arch/arm/boot/dts/axp81x.dtsi
> > >> index f90f257130d5..099b0ddc1bbb 100644
> > >> --- a/arch/arm/boot/dts/axp81x.dtsi
> > >> +++ b/arch/arm/boot/dts/axp81x.dtsi
> > >> @@ -52,6 +52,16 @@
> > >>               compatible = "x-powers,axp813-gpio";
> > >>               gpio-controller;
> > >>               #gpio-cells = <2>;
> > >> +
> > >> +             gpio0_ldo: gpio0_ldo {
> > >> +                     pins = "GPIO0";
> > >> +                     function = "ldo";
> > >> +             };
> > >> +
> > >> +             gpio1_ldo: gpio1_ldo {
> > >> +                     pins = "GPIO1";
> > >> +                     function = "ldo";
> > >> +             };
> > >
> > > The node names are not supposed to contain any hyphens.
> > 
> > Hmm, I was under the impression that hyphens were preferred in
> > node names, and a warning would be added to dtc later on.
> > I might be wrong though.
> 
> I think there's a terminology issue here.
> 
> "-" is a hyphen or minus sign.
> "_" is an underscore.
> 
> Underscores are not supposed to be used for node names, instead hyphens
> are preferred.  I think Maxime means "underscore".
> 
> Here's the list from dtc/checks.c:
> 
> #define LOWERCASE       "abcdefghijklmnopqrstuvwxyz"
> #define UPPERCASE       "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
> #define DIGITS          "0123456789"
> #define PROPNODECHARS   LOWERCASE UPPERCASE DIGITS ",._+*#?-"
> #define PROPNODECHARSSTRICT     LOWERCASE UPPERCASE DIGITS ",-"
> 
> If strict mode is enabled, use of any of "._+#?" in the node name will
> produce a warning.

Right, sorry, I meant underscores..

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--b25ylnst75befymh--
