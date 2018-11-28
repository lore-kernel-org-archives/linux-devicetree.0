From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx: Add Y Soft IOTA Draco, Hydra and Ursa
 boards
Date: Wed, 28 Nov 2018 10:39:01 +0800
Message-ID: <20181128023859.GB20643@dragon>
References: <1541086962-52626-1-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541086962-52626-1-git-send-email-michal.vokac@ysoft.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?Vm9rw6HEjQ==?= Michal <Michal.Vokac@ysoft.com>
Cc: Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 01, 2018 at 03:43:26PM +0000, Vokáč Michal wrote:
...
> +&usdhc3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	bus-width = <4>;
> +	cd-gpios = <&gpio7 8 GPIO_ACTIVE_LOW>;
> +	wp-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
> +	no-1-8-v;
> +	keep-power-in-suspend;
> +	enable-sdio-wakeup;

This property is deprecated.  Please use "wakeup-source" instead.

Shawn

> +	vmmc-supply = <&sw2_reg>;
> +	status = "disabled";
> +};
