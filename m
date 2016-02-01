From: Caesar Wang <caesar.upstream@gmail.com>
Subject: Re: [PATCH v4 9/9] ARM: dts: rockchip: support the spi for rk3036
Date: Mon, 1 Feb 2016 14:32:59 +0800
Message-ID: <56AEFC1B.60407@gmail.com>
References: <1453970618-4383-1-git-send-email-wxt@rock-chips.com>
 <1453970618-4383-10-git-send-email-wxt@rock-chips.com>
 <3295129.SttO6ack9z@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3295129.SttO6ack9z@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Caesar Wang <wxt@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, hl@rock-chips.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, sonnyrao@chromium.org, jeffy.chen@rock-chips.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, keescook@google.com, cf@rock-chips.com, jay.xu@rock-chips.com, leozwang@google.com
List-Id: devicetree@vger.kernel.org

Heiko,

=E5=9C=A8 2016=E5=B9=B401=E6=9C=8831=E6=97=A5 19:06, Heiko Stuebner =E5=
=86=99=E9=81=93:
> Hi Caesar,
>
> Am Donnerstag, 28. Januar 2016, 16:43:38 schrieb Caesar Wang:

[...]

>
>   	memory {
> @@ -485,6 +486,23 @@
>   		status =3D "disabled";
>   	};
>
> +	spi: spi@20074000 {
> +		compatible =3D "rockchip,rockchip-spi";
> +		reg =3D <0x20074000 0x1000>;
> +		interrupts =3D <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&spi_txd &spi_rxd &spi_clk &spi_cs0 &spi_cs1>;
> Do we really want to enable both chip-selects by default?
>
> On the rk3288 Lin Huang wrote:
>      * It's assumed that most users of the SPI ports are using chip s=
elect
>        0.  Thus the default pinctrl for the ports enables chip select=
 0
>        (but not chip select 1 on ports that have it).  If a board wan=
ts to
>        use chip select 1 or wants a GPIO chip select the board should
>        override the pinctrl (just like boards can override UART pinct=
rl if
>        they have hardware flow control).
>
> Do we expect again mostly a use of cs0 or will in the major cases bot=
h chip-
> selects be needed?

Sound resonable.
In general, every cs and spi devices should be the one match one.

That should be resonable if we want to use chip select 1 or want a GPIO=
 chip select the board should
override the pinctrl.

>> +		num-cs =3D <2>;
>> +		clocks =3D<&cru PCLK_SPI>, <&cru SCLK_SPI>;
>> +		clock-names =3D "apb-pclk","spi_pclk";
>> +		dmas =3D <&pdma 8>, <&pdma 9>;
>> +		#dma-cells =3D <2>;
> What do you need #dma-cells for? This is not a dma-controller :-)

=46ixed.

>
>
>> +		dma-names =3D "tx", "rx";
>> +		status =3D "disabled";
>> +	};
>
> Also I'd suggest an ordering like:
>
> +	spi: spi@20074000 {
> +		compatible =3D "rockchip,rockchip-spi";
> +		reg =3D <0x20074000 0x1000>;
> +		interrupts =3D <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D<&cru PCLK_SPI>, <&cru SCLK_SPI>;
> +		clock-names =3D "apb-pclk","spi_pclk";
> +		dmas =3D <&pdma 8>, <&pdma 9>;
> +		dma-names =3D "tx", "rx";
> +		num-cs =3D <2>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&spi_txd &spi_rxd &spi_clk &spi_cs0 &spi_cs1>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		status =3D "disabled";
> +	};

Okay, I will remove the cs1/num-cs in here.

Thanks.

-
Caesar

>
> Heiko
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


--=20
Thanks,
Caesar
