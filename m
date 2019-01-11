From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] arm64: dts: marvell: Add device tree for uDPU board
Date: Fri, 11 Jan 2019 18:44:32 +0100
Message-ID: <20190111174432.GH20924@lunn.ch>
References: <20190111172055.30451-1-vladimir.vid@sartura.hr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190111172055.30451-1-vladimir.vid@sartura.hr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vladimir Vid <vladimir.vid@sartura.hr>
Cc: devicetree@vger.kernel.org, Luka Perkov <luka.perkov@sartura.hr>, Paul Arola <paul.arola@telus.com>, Luis Torres <luis.torres@methode.com>, Scott Roberts <scott.roberts@telus.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> +	sfp_eth0: sfp-eth0 {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&i2c0>;
> +		los-gpio = <&gpiosb 2 GPIO_ACTIVE_HIGH>;
> +		mod-def0-gpio = <&gpiosb 3 GPIO_ACTIVE_LOW>;
> +		tx-disable-gpio = <&gpiosb 4 GPIO_ACTIVE_HIGH>;
> +		tx-fault-gpio = <&gpiosb 5 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	sfp_eth1: sfp-eth1 {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&i2c1>;
> +		los-gpio = <&gpiosb 7 GPIO_ACTIVE_HIGH>;
> +		mod-def0-gpio = <&gpiosb 8 GPIO_ACTIVE_LOW>;
> +		tx-disable-gpio = <&gpiosb 9 GPIO_ACTIVE_HIGH>;
> +		tx-fault-gpio = <&gpiosb 10 GPIO_ACTIVE_HIGH>;
> +	};
> +};

> +&i2c0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1_pins>;
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c04";
> +		reg = <0x50>;
> +	};
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_pins>;
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c04";
> +		reg = <0x50>;
> +	};
> +};

The SFP driver will export the 'eeprom' via ethtool --module-info.
Please don't add a standard EEPROM.

       Andrew
