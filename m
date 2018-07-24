From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 06/15] MIPS: dts: img: pistachio_marduk: Add 6Lowpan node
Date: Mon, 23 Jul 2018 17:06:47 -0700
Message-ID: <20180724000647.okbjmghv4w66bl7u@pburton-laptop>
References: <20180722212010.3979-1-afaerber@suse.de>
 <20180722212010.3979-7-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180722212010.3979-7-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org, Rahul Bedarkar <rahulbedarkar89@gmail.com>, James Hartley <james.hartley@sondrel.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Harry Morris <h.morris@cascoda.com>, Stefan Schmidt <stefan@osg.samsung.com>, Marcel Holtmann <marcel@holtmann.org>, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

Hi Andreas,

On Sun, Jul 22, 2018 at 11:20:01PM +0200, Andreas Färber wrote:
> diff --git a/arch/mips/boot/dts/img/pistachio_marduk.dts b/arch/mips/boot/dts/img/pistachio_marduk.dts
> index d723b68084c9..b0b6b534a41f 100644
> --- a/arch/mips/boot/dts/img/pistachio_marduk.dts
> +++ b/arch/mips/boot/dts/img/pistachio_marduk.dts
> @@ -158,6 +158,20 @@
>  		   <&gpio1 12 GPIO_ACTIVE_HIGH>,
>  		   <&gpio1 13 GPIO_ACTIVE_HIGH>,
>  		   <&gpio1 14 GPIO_ACTIVE_HIGH>;
> +
> +	ca8210: sixlowpan@4 {
> +		compatible = "cascoda,ca8210";
> +		reg = <4>;
> +		spi-max-frequency = <3000000>;
> +		spi-cpol;
> +		reset-gpio = <&gpio0 12 GPIO_ACTIVE_HIGH>;
> +		irq-gpio = <&gpio2 12 GPIO_ACTIVE_HIGH>;
> +
> +		extclock-enable;
> +		extclock-freq = <16000000>;
> +		extclock-gpio = <2>; /* spiuart_clk */
> +		#clock-cells = <0>;
> +	};

dtc complains about the extclock-gpio property because it expects a
property named *-gpio to contain a gpio-list:

    DTC     arch/mips/boot/dts/img/pistachio_marduk.dtb
  arch/mips/boot/dts/img/pistachio_marduk.dtb: Warning (gpios_property):
    /spi@18100f00/sixlowpan@4: Missing property '#gpio-cells' in node
    /clk@18144000 or bad phandle (referred from extclock-gpio[0])

Rob, perhaps this should be added as a second false-positive case in
dtc's prop_is_gpio()?

Thanks,
    Paul
