From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 4/7] arm: dts: r7s72100: Add pin controller node
Date: Thu, 2 Mar 2017 20:17:26 +0000
Message-ID: <SG2PR06MB1165DCCA724AD6A8325862668A280@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
 <1487610788-6939-5-git-send-email-jacopo+renesas@jmondi.org>
 <3dd69ef5-e8a4-b69c-b4fa-1be6ba777cfa@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <3dd69ef5-e8a4-b69c-b4fa-1be6ba777cfa@jmondi.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: jacopo mondi <jacopo@jmondi.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

On Tuesday, February 21, 2017, jacopo mondi wrote:
> > +			gpio-controller;
> > +			#gpio-cells =3D <2>;
> > +			gpio-ranges =3D <&pinctrl 0 0 16>;
>=20
> Not all ports have 16 pins available.
> This is one of the differences between different RZ/A1 SoC versions
> (RZ/A1H, RZ/A1L etc)
>=20
> I'll change the number of pins to the actual available ones on each port
> for r7s72100 (RZ/A1H)

But wait, what if someone wants to use a RZ/A1L???

I don't want to make a separate dtsi file for RZ/A1L.

Is it possible to change the number of port pins in the board dts file?
For example:
  RZ/A1H: P5_0 - P5_10
  RZ/A1L: P5_0 - P5_16

So, in a rza1l-board.dts file I would put:

&port5 {
	gpio-ranges =3D <&pinctrl 0 80 16>;
}

Will this work?


Chris

