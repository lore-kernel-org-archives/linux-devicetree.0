From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/3] ARM: dts: sun8i: Add Allwinner A83T dtsi
Date: Tue, 1 Dec 2015 09:59:40 +0100
Message-ID: <20151201085940.GC29263@lukather>
References: <1445557577-27383-1-git-send-email-vishnupatekar0510@gmail.com>
 <1445557577-27383-3-git-send-email-vishnupatekar0510@gmail.com>
 <20151025202012.GT10947@lukather>
 <CAEzqOZsiwbaKwH4J5CjaHoX6rdgj6kq3opvBUXiGJRfum_Se8Q@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nmemrqcdn5VTmUEE"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB7WC6WZAKGQEZ6LIZ6A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAEzqOZsiwbaKwH4J5CjaHoX6rdgj6kq3opvBUXiGJRfum_Se8Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--nmemrqcdn5VTmUEE
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi!

On Mon, Nov 30, 2015 at 02:09:14AM +0800, Vishnu Patekar wrote:
> >> +                     reg = <0x01c20800 0x400>;
> >> +                     clocks = <&osc24M>;
> >> +                     gpio-controller;
> >> +                     interrupt-controller;
> >> +                     #interrupt-cells = <3>;
> >> +                     #gpio-cells = <3>;
> >> +
> >> +                     i2c0_pins_a: i2c0@0 {
> >> +                             allwinner,pins = "PH0", "PH1";
> >> +                             allwinner,function = "i2c0";
> >> +                             allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> >> +                             allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> >> +                     };
> >> +
> >> +                     i2c1_pins_a: i2c1@0 {
> >> +                             allwinner,pins = "PH2", "PH3";
> >> +                             allwinner,function = "i2c1";
> >> +                             allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> >> +                             allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> >> +                     };
> >> +
> >> +                     i2c2_pins_a: i2c2@0 {
> >> +                             allwinner,pins = "PH4", "PH5";
> >> +                             allwinner,function = "i2c2";
> >> +                             allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> >> +                             allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> >> +                     };
> >> +
> >> +                     mmc0_pins_a: mmc0@0 {
> >> +                             allwinner,pins = "PF0", "PF1", "PF2",
> >> +                                              "PF3", "PF4", "PF5";
> >> +                             allwinner,function = "mmc0";
> >> +                             allwinner,drive = <SUN4I_PINCTRL_30_MA>;
> >> +                             allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> >> +                     };
> >> +
> >> +                     mmc1_pins_a: mmc1@0 {
> >> +                             allwinner,pins = "PG0", "PG1", "PG2",
> >> +                                              "PG3", "PG4", "PG5";
> >> +                             allwinner,function = "mmc1";
> >> +                             allwinner,drive = <SUN4I_PINCTRL_30_MA>;
> >> +                             allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> >> +                     };
> >> +
> >> +                     mmc2_8bit_pins: mmc2_8bit {
> >> +                             allwinner,pins = "PC5", "PC6", "PC8",
> >> +                                              "PC9", "PC10", "PC11",
> >> +                                              "PC12", "PC13", "PC14",
> >> +                                              "PC15";
> >> +                             allwinner,function = "mmc2";
> >> +                             allwinner,drive = <SUN4I_PINCTRL_30_MA>;
> >> +                             allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> >> +                     };
> >> +
> >> +                     uart0_pins_a: uart0@0 {
> >> +                             allwinner,pins = "PF2", "PF4";
> >> +                             allwinner,function = "uart0";
> >> +                             allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> >> +                             allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> >> +                     };
> >> +
> >> +                     uart0_pins_b: uart0@1 {
> >> +                             allwinner,pins = "PB9", "PB10";
> >> +                             allwinner,function = "uart0";
> >> +                             allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> >> +                             allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> >> +                     };
> >
> > Are you going to use all these options?
>
> Not, only uart0_pins_a and uart0_pins_b and mmc0_pins_a will be used for now.
> As, these are not enabled, I don't see any harm in keeping those here.

It bloats the DT for no particular reason.

> Let me know in case you want to remove, I'll do it.

Yes, please.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--nmemrqcdn5VTmUEE--
