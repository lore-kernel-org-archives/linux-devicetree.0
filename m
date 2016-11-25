From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 2/2] ARM: dts: add support for Turris Omnia
Date: Fri, 25 Nov 2016 17:16:38 +0100
Message-ID: <87lgw7ilg9.fsf@free-electrons.com>
References: <20161125142658.21690-1-uwe@kleine-koenig.org>
        <20161125142658.21690-3-uwe@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161125142658.21690-3-uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org> ("Uwe
        =?utf-8?Q?Kleine-K=C3=B6nig=22's?= message of "Fri, 25 Nov 2016 15:26:58
 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tomas Hlavacek <tomas.hlavacek-x+rMaJPWets@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?utf-8?Q?Bed=C5=99icha_Ko=C5=A1a?= =?utf-8?Q?tu?= <bedrich.kosata-x+rMaJPWets@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Uwe,
 
 On ven., nov. 25 2016, Uwe Kleine-König <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org> wrote:

> This machine is an open hardware router by cz.nic driven by a
> Marvell Armada 385.
>
> Signed-off-by: Uwe Kleine-König <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>

Applied on mvebu/dt with few changes:

First I added the SoB from Thomas Hlavacek you initially planed to add
as seen on IRC.

The other change I did are mentioned inline.

Thanks,

Gregory


[...]

> +&spi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi0_pins &spi0cs0_pins>;
> +	status = "okay";
> +
> +	spi-nor@0 {
> +		compatible = "spansion,s25fl164k", "jedec,spi-nor";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0>;
> +		spi-max-frequency = <40000000>;
> +

+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
it is mandatory since v4.4 to use this pattern for partitions.


> +		partition@0 {
> +			reg = <0x0 0x00100000>;
> +			label = "U-Boot";
> +		};
> +
> +		partition@1 {
                         @0x100000
We should use the reg value here ^

> +			reg = <0x00100000 0x00700000>;
> +			label = "Rescue system";
> +		};

+ };


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
