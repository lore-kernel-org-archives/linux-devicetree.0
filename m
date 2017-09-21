From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: enable gpio for pin groups
Date: Thu, 21 Sep 2017 08:28:08 +0200
Message-ID: <20170921062808.fde5bpvn3wfau67h@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

Hello,

on an i.MX25 machine on my desk a UART RX line is guarded by a transistor
like this:

	,------------------------.
	| ,---------.            |
	| |  imx25  o--RX----◁---o---
	| |         o--GPIO--'   |
	| `---------'            |
	`------------------------'

The reason is that the reset default setting of the pin in question
(MX25_PAD_LBA) is driving the line. So after switching the pad to its
UART function the gpio must be driven to make the transistor
transparent.

My first idea was to make this a property of the UART and added a
enable-gpios property for it[1]. But now I wonder if this is better
abstracted as an enable-gpios property in the pinctrl node. Something
like:

	pinctrl_uart5: uart5 {
		fsl,pins = <
			MX25_PAD_ECB__UART5_TXD                 0x00002080 /* TXD */
			MX25_PAD_LBA__UART5_RXD                 0x00000000 /* RXD */
			MX25_PAD_CS4__UART5_CTS                 0x00002001 /* RTS */
			MX25_PAD_CS5__GPIO_3_21                 0x00002001 /* #RXD_EN */
		>;
		enable-gpios = <&gpio3 21 GPIO_ACTIVE_LOW>;
	};

Would this make sense? Maybe with a more intuitive name?

Best regards
Uwe

[1] http://patchwork.ozlabs.org/patch/647787/

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
