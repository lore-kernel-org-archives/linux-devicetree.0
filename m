Return-Path: <SRS0=MYDa=M6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:44105 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725735AbeJSFNv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 19 Oct 2018 01:13:51 -0400
Date: Thu, 18 Oct 2018 23:10:46 +0200
From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: Add RZ/A2 pinctrl and GPIO
Message-ID: <20181018211035.GA16601@w540>
References: <20181005150951.22129-1-chris.brandt@renesas.com>
 <20181005150951.22129-3-chris.brandt@renesas.com>
 <20181016224700.GA26385@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline
In-Reply-To: <20181016224700.GA26385@bogus>
Sender: devicetree-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Chris,

On Tue, Oct 16, 2018 at 05:47:00PM -0500, Rob Herring wrote:
> On Fri, Oct 05, 2018 at 10:09:51AM -0500, Chris Brandt wrote:
> > Add device tree binding documentation and header file for Renesas R7S9210
> > (RZ/A2) SoCs.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > ---
> >  .../bindings/pinctrl/renesas,rza2-pinctrl.txt      | 76 ++++++++++++++++++++++
> >  include/dt-bindings/pinctrl/r7s9210-pinctrl.h      | 47 +++++++++++++
> >  2 files changed, 123 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
> >  create mode 100644 include/dt-bindings/pinctrl/r7s9210-pinctrl.h
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
> > new file mode 100644
> > index 000000000000..5f338054f493
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
> > @@ -0,0 +1,76 @@
> > +Renesas RZ/A2 combined Pin and GPIO controller
> > +
> > +The Renesas SoCs of the RZ/A2 series feature a combined Pin and GPIO controller.
> > +Pin multiplexing and GPIO configuration is performed on a per-pin basis.
> > +Each port features up to 8 pins, each of them configurable for GPIO
> > +function (port mode) or in alternate function mode.
> > +Up to 8 different alternate function modes exist for each single pin.
> > +
> > +Pin controller node
> > +-------------------
> > +
> > +Required properties:
> > +  - compatible: should be:
> > +    - "renesas,r7s9210-pinctrl": for RZ/A2M
> > +
> > +  - reg
> > +    address base and length of the memory area where the pin controller
> > +    hardware is mapped to.
> > +
> > +Optional properties:
> > +  - gpio-controller
> > +    Include this in order to enable GPIO functionality. When included, both
> > +    gpio_cells and gpio_ranges are then required.
> > +  - #gpio-cells
> > +    Must be 2
> > +  - gpio-ranges
> > +    Expresses the total number GPIO ports/pins in this SoC
>
> Are these really optional? I guess in theory a board could use no GPIOs,
> but that seems unlikely.

Here you define bindings that allows you to have only one
gpio-controller node for the whole system.
With RZ/A1 we have a gpio-controller sub-node for each port. It's
true though that you have a lot of ports and few pins per port, but
to refer to a gpio you have to index the gpio in the whole pin space
with RZA1_PIN_ID():

	gpios = <&pinctrl RZA2_PIN_ID(P6, 0) GPIO_ACTIVE_HIGH>;

While I think this is nicer:
        gpios = <&port6 0 GPIO_ACTIVE_HIGH>;

Having gpio-controller sub-nodes also allows you
to specify a 'ngpios' property for each port (or do all ports have 8
pins? If I read Table 51.1 right they don't..), and when RZ/A2x will
come and has different pins per port it's
easy for developers to identify the differences (but this
depends on the package too, so it's not that easy as I'm putting it
here probably)

What do you think?

Thanks
   j

> > +
> > +
> > +Example: Pin controller node for RZ/A2M SoC (r7s9210)
> > +
> > +	pinctrl: pin-controller@fcffe000 {
> > +		compatible = "renesas,r7s9210-pinctrl";
> > +		reg = <0xfcffe000 0x9D1>;
> > +
> > +		gpio-controller;
> > +		#gpio-cells = <2>;
> > +		gpio-ranges = <&pinctrl 0 0 176>;
> > +	};
> > +
> > +Sub-nodes
> > +---------
> > +
> > +The child nodes of the pin controller node describe a pin multiplexing
> > +function or a GPIO controller alternatively.
>
> But the parent is already a GPIO controller. This needs to be fully
> defined.
>
> > +
> > +- Pin multiplexing sub-nodes:
> > +  A pin multiplexing sub-node describes how to configure a set of
> > +  (or a single) pin in some desired alternate function mode.
> > +  The values for the pinmux properties are a combination of port name, pin
> > +  number and the desired function index. Use the RZA2_PINMUX macro located
> > +  in include/dt-bindings/pinctrl/r7s9210-pinctrl.h to easily define these.
> > +  For assigning GPIO pins, use the macro RZA2_PIN_ID also in r7s9210-pinctrl.h
> > +  to express the desired port pin.
> > +
> > +  Example: Board specific pins configuration
> > +
> > +	&pinctrl {
> > +		/* Serial Console */
> > +		scif4_pins: serial4 {
> > +			pinmux = <RZA2_PINMUX(P9, 0, 4)>,	/* TxD4 */
> > +				 <RZA2_PINMUX(P9, 1, 4)>;	/* RxD4 */
> > +		};
> > +	};
> > +
> > +  Example: Assigning a GPIO:
> > +
> > +	leds {
> > +		status = "okay";
> > +		compatible = "gpio-leds";
> > +
> > +		led0 {
> > +			/* P6_0 */
> > +			gpios = <&pinctrl RZA2_PIN_ID(P6, 0) GPIO_ACTIVE_HIGH>;
> > +		};
> > +	};

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbyPbWAAoJEHI0Bo8WoVY8bswP/RrDlLBEXlJHsgBiV5GcoG/o
Be+75dbXDFzJuvLFxtUFpZBt+Kl8FHpf/JaJu9gn+EMa/u35Fe48qoNM14W9akqS
d/ppGXcCieBZjcFoVHX5oGdl0OImaMdgO/4bTm4oUROOzT4l94XhIR6C6+MIYqa1
sKB6bZpUZKDsRWct7aL9DLGMjML7ZDkc4pIXGWPo57N71cYVxcme6BHQd/WQ1tY6
Dr12fkD30XpeTqGlkD7nvnnEhoV+8km7sP/lNF7owz29uMr8xFnM98kjq/yikJ/F
wZy0af9uXZEkngtXv5xzZzfzcqguJSomO0eUmMFfgrkeBClyJevUvpFAtl45vlVH
xWRt2mz5zWL8NNOhJTs2JNbWzGZv20/RtSLc8aYy8VdVIn18AFg0Z+RKCPUxPpz/
LL2TzpgFhemTKorpnR3m6zwycrk8R+WiJo+F+aZiX9BjntQNhKWLGcA8CrMwcxLk
Y1K4DQsA3PIpwN24nl96aROE8Bb7SrCG0T8vaovXTSbRdJPZfRS+E+uf6Eo+uYYe
wrOXnWvLELgxKQmjumRuOw30jqICk6yFItP43y31eCHGr6xai4YZ3jD7FWL4WTmt
KBZ1L+An35E3WCXtabQi3SPE8kmW8JeRN0hYbGljS9O4v5uASNuPta5QaRS3Hi+Y
Qg9pSdKu0fDirU3HsFzO
=4X7s
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
