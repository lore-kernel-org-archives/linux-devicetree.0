From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v2 0/7] Renesas RZ/A1 pin and gpio controller
Date: Wed, 22 Mar 2017 18:10:26 +0000
Message-ID: <SG2PR06MB1165AB3D48DA3450FC27EA3D8A3C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1490026491-21742-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1490026491-21742-1-git-send-email-jacopo+renesas@jmondi.org>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

On Monday, March 20, 2017, Jacopo Mondi wrote:
> Chris: it would be great if you could give this another spin on RSK board=
.


I tested these patches on an RZ/A1H RSK board after modifying the DT for
the RSK vs the GENMAI board.

The following worked fine:
 * SCIF
 * I2C
 * SDHI
 * Ethernet

I see Geert has already responded with mostly text (grammar) changes.
As for the "API" of the driver from a user perspective, I think it should
cover all the use cases of the peripherals.


For your reference, here was my pin config for the RSK board testing. Once
this driver is (hopefully) accepted, I will update the upstream rskrza1 DT.=
=20


--- RSK BOARD PIN SETUP ---

&pinctrl {

	scif2_pins: serial2 {
		/* P3_0 as TxD2; P3_2 as RxD2 */
		renesas,pins =3D <PIN(3, 0) 6>,
			       <PIN(3, 2) 4>;
	};

	/* RIIC Ch 3 */
	i2c3_pins: i2c3 {
		/* RIIC3: P1_6 as SCL, P1_7 as SDA */
		renesas,pins =3D <PIN(1, 6) (1 | BI_DIR)>,
			       <PIN(1, 7) (1 | BI_DIR)>;
	};

	/* SHDI ch1 on CN1 */
	sdhi1_pins: sdhi1 {
		/* SHDI ch1 on Port 3 */
		renesas,pins =3D <PIN(3, 8) (7)>,		/* SDHI1 CD */
				<PIN(3, 9) (7)>,		/* SDHI1 WP */
				<PIN(3, 10) (7 | BI_DIR)>,	/* SDHI1 DAT1 */
				<PIN(3, 11) (7 | BI_DIR)>,	/* SDHI1 DAT0 */
				<PIN(3, 12) (7)>,		/* SDHI1 CLK */
				<PIN(3, 13) (7 | BI_DIR)>,	/* SDHI1 CMD */
				<PIN(3, 14) (7 | BI_DIR)>,	/* SDHI1 DAT3 */
				<PIN(3, 15) (7 | BI_DIR)>;	/* SDHI1 DAT2 */
	};

	/* Ethernet */
	ether_pins: ether {
		/* Ethernet on Ports 1,2,3,5 */
		renesas,pins =3D <PIN(1, 14) (4)>, /* P1_14 =3D ET_COL */
			<PIN(5, 9) (2)>,	/* P5_9 =3D ET_MDC */
			<PIN(3, 3) (2 | BI_DIR)>,	/* P3_3 =3D ET_MDIO (bi dir) */
			<PIN(3, 4) (2)>,	/* P3_4 =3D ET_RXCLK */
			<PIN(3, 5) (2)>,	/* P3_5 =3D ET_RXER */
			<PIN(3, 6) (2)>,	/* P3_6 =3D ET_RXDV */
			<PIN(2, 0) (2)>,	/* P2_0 =3D ET_TXCLK */
			<PIN(2, 1) (2)>,	/* P2_1 =3D ET_TXER */
			<PIN(2, 2) (2)>,	/* P2_2 =3D ET_TXEN */
			<PIN(2, 3) (2)>,	/* P2_3 =3D ET_CRS */
			<PIN(2, 4) (2)>,	/* P2_4 =3D ET_TXD0 */
			<PIN(2, 5) (2)>,	/* P2_5 =3D ET_TXD1 */
			<PIN(2, 6) (2)>,	/* P2_6 =3D ET_TXD2 */
			<PIN(2, 7) (2)>,	/* P2_7 =3D ET_TXD3 */
			<PIN(2, 8) (2)>,	/* P2_8 =3D ET_RXD0 */
			<PIN(2, 9) (2)>,	/* P2_9 =3D ET_RXD1 */
			<PIN(2, 10) (2)>, /* P2_10 =3D ET_RXD2 */
			<PIN(2, 11) (2)>; /* P2_11 =3D ET_RXD3 */
	};
};

&i2c3 {
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&i2c3_pins>;
};

&scif2 {
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&scif2_pins>;
};

&sdhi1 {
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&sdhi1_pins>;
};

&ether {
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&ether_pins>;
};

/ {
	leds {
		status =3D "okay";
		compatible =3D "gpio-leds";

		led1 {
			gpios =3D <&port7 1 GPIO_ACTIVE_LOW>;
		};
	};
};



Thank you,
Chris
