From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v3 4/7] arm: dts: r7s72100: Add pin controller node
Date: Mon, 27 Mar 2017 17:12:04 +0000
Message-ID: <SG2PR06MB11651E209BC332719059CC3F8A330@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1490368934-12494-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490368934-12494-5-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490368934-12494-5-git-send-email-jacopo+renesas@jmondi.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jacopo,


On Friday, March 24, 2017, Jacopo Mondi
> +	pinctrl: pinctrl@fcfe3000 {
> +		compatible =3D "renesas,r7s72100-ports";
> +
> +		#pinctrl-cells =3D <1>;
> +
> +		reg =3D <0xfcfe3000 0x42C0>;

Out of curiosity, why did you change this from 0x4248 to 0x42C0?

In your update for renesas,rza1-pinctrl.txt, for the 'Example', you changed=
 it from 0x4248 to 0x4230 (which Geert pointed out makes more sense), but t=
hen in the actual DT file you changed it to 0x42C0. Typo?


Chris
