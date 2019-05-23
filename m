From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v13 2/4] arm64: dts: fsl: librem5: Add a device tree for
 the Librem5 devkit
Date: Thu, 23 May 2019 21:19:26 +0200
Message-ID: <20190523191926.GB3803@xo-6d-61-c0.localdomain>
References: <20190520142330.3556-1-angus@akkea.ca>
 <20190520142330.3556-3-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190520142330.3556-3-angus@akkea.ca>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, angus.ainslie@puri.sm, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi!

> - LEDs
> - gyro
> - magnetometer

> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio_leds>;
> +
> +		led1 {
> +			label = "LED 1";

So, what kind of LED do you have, and what color is it? label should probably be something like
notify:green.

> +	charger@6b { /* bq25896 */
> +		compatible = "ti,bq25890";
> +		reg = <0x6b>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_charger>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
> +		ti,battery-regulation-voltage = <4192000>; /* 4.192V */
> +		ti,charge-current = <1600000>; /* 1.6 A */

No space before A, for consistency.

> +		ti,termination-current = <66000>;  /* 66mA */
> +		ti,precharge-current = <1300000>; /* 1.3A */

I thought precharge is usually something low, because you are not yet sure of battery health...?

> +		ti,minimum-sys-voltage = <2750000>; /* 2.75V */

Are you sure? Normally systems shut down at 3.2V, 3V or so. Li-ion batteries don't
really like to be discharged _this_ deep.

										Pavel
