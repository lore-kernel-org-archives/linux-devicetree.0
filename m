From: "Imre Kaloz" <kaloz@openwrt.org>
Subject: Re: [PATCH] ARM: BCM5301X: Set GPIO enabling USB power on Netgear
 R7000
Date: Tue, 21 Jun 2016 14:22:05 +0200
Message-ID: <op.yjepy3mr2s3iss@ecaz>
References: <1466509358-25498-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466509358-25498-1-git-send-email-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Hauke Mehrtens <hauke@hauke-m.de>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "open list:BROADCOM BCM5301X ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Kumar Gala <galak@codeaurora.org>, "open list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Is there any reason you are not handling this properly as a regulator w=
ith =20
usb-nop-xceiv?


Imre

On Tue, 21 Jun 2016 13:42:38 +0200, Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:

> There is one GPIO controlling power for both USB ports.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
>  arch/arm/boot/dts/bcm4709-netgear-r7000.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/bcm4709-netgear-r7000.dts =20
> b/arch/arm/boot/dts/bcm4709-netgear-r7000.dts
> index a22ed14..a76486b 100644
> --- a/arch/arm/boot/dts/bcm4709-netgear-r7000.dts
> +++ b/arch/arm/boot/dts/bcm4709-netgear-r7000.dts
> @@ -104,3 +104,11 @@
>  &uart0 {
>  	status =3D "okay";
>  };
> +
> +&usb2 {
> +	vcc-gpio =3D <&chipcommon 0 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&usb3 {
> +	vcc-gpio =3D <&chipcommon 0 GPIO_ACTIVE_HIGH>;
> +};
