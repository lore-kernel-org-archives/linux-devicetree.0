From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/4] ARM: dts: add rk3288 dwc2 controller support
Date: Wed, 30 Jul 2014 19:18:28 +0400
Message-ID: <53D90CC4.9070009@cogentembedded.com>
References: <1406683873-18194-1-git-send-email-kever.yang@rock-chips.com> <1406684075-18271-1-git-send-email-kever.yang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406684075-18271-1-git-send-email-kever.yang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kever Yang <kever.yang@rock-chips.com>, heiko@sntech.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, linux@arm.linux.org.uk, paulz@synopsys.com, gregkh@linuxfoundation.org, mporter@linaro.org, kishon@ti.com, balbi@ti.com
Cc: swarren@wwwdotorg.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, addy.ke@rock-chips.com, xjq@rock-chips.com, cf@rock-chips.com, lyz@rock-chips.com, wulf@rock-chips.com, dianders@chromium.org, olof@lixom.net, sonnyrao@chromium.org
List-Id: devicetree@vger.kernel.org

Hello.

On 07/30/2014 05:34 AM, Kever Yang wrote:

> rk3288 has two kind of usb controller, this add the dwc2 controller
> for otg and host1.

> Controller can works with usb PHY default setting and Vbus on.

> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
>   arch/arm/boot/dts/rk3288.dtsi |   20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)

> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288=
=2Edtsi
> index abc51f5..4309c4f 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -646,5 +646,25 @@
>   			clock-names =3D "baudclk", "apb_pclk";
>   			status =3D "disabled";
>   		};
> +
> +		usb_otg: dwc2@ff580000 {

    The ePAPR standard [1] says:

The name of a node should be somewhat generic, reflecting the function =
of the=20
device and not its precise programming model. If appropriate, the name =
should=20
be one of the following choices:

[...]
    =95 usb

> +			compatible =3D "rockchip,rk3288-usb", "rockchip,rk3066-usb",
> +					"snps,dwc2";
> +			reg =3D <0xff580000 0x40000>;
> +			interrupts =3D <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cru HCLK_OTG0>;
> +			clock-names =3D "otg";
> +			status =3D "disabled";
> +		};
> +
> +		usb_host1: dwc2@ff540000 {

    Same here.

WBR, Sergei
