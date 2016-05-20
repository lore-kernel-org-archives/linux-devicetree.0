From: Shawn Lin <shawn.lin@kernel-upstream.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: rockchip: fixes the spi compatible for
 rk3036
Date: Fri, 20 May 2016 20:35:53 +0800
Message-ID: <8f662b3b-e359-efdf-72e5-c4f862dd1cf6@kernel-upstream.org>
References: <1463702182-5188-1-git-send-email-wxt@rock-chips.com>
 <1463702182-5188-3-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463702182-5188-3-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Caesar Wang <wxt@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Mark Brown <broonie@kernel.org>
Cc: shawn.lin@rock-chips.com, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2016/5/20 7:56, Caesar Wang =E5=86=99=E9=81=93:
> That's seem the incorrect string to match the spi driver.
>

Will it break the backward compatibility for some dtb if not
falling back to "rockchip,rockchip-spi" ?

> Fixes commit f629fcfab2cd
> ("ARM: dts: rockchip: support the spi for rk3036")
>
> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: linux-rockchip@lists.infradead.org
>
> ---
>
> Changes in v2: None
>
>  arch/arm/boot/dts/rk3036.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036=
=2Edtsi
> index d0f4bb7..a30700a 100644
> --- a/arch/arm/boot/dts/rk3036.dtsi
> +++ b/arch/arm/boot/dts/rk3036.dtsi
> @@ -431,7 +431,7 @@
>  	};
>
>  	spi: spi@20074000 {
> -		compatible =3D "rockchip,rockchip-spi";
> +		compatible =3D "rockchip,rk3036-spi";
>  		reg =3D <0x20074000 0x1000>;
>  		interrupts =3D <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks =3D<&cru PCLK_SPI>, <&cru SCLK_SPI>;
>
