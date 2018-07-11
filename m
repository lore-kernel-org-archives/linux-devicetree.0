From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] ARM: dts: imx: Add ZII SCU3 ESB
Date: Wed, 11 Jul 2018 16:57:13 +0200
Message-ID: <20180711145713.GB14155@lunn.ch>
References: <20180711050704.11492-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180711050704.11492-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Andrey Gusakov <andrey.gusakov@cogentembedded.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Fabio Estevam <fabio.estevam@nxp.com>, cphealy@gmail.com, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 10, 2018 at 10:07:04PM -0700, Andrey Smirnov wrote:
> +		switch@0 {
> +			compatible = "marvell,mv88e6085";
> +			reg = <0>;
> +			dsa,member = <0 0>;
> +			eeprom-length = <512>;
> +			interrupt-parent = <&gpio4>;
> +			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;

Hi Andrey

I don't see a pinmux for this GPIO. Is one needed?

    Andrew
