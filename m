From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: zynq: DT: Add CAN node
Date: Wed, 23 Jul 2014 09:07:02 -0700
Message-ID: <0a68731a-e0f0-4e19-b9a4-57cec4c8de3b@BN1BFFO11FD048.protection.gbl>
References: <52d799e17cd3539713625c6f6a6666620f52d692.1406120732.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52d799e17cd3539713625c6f6a6666620f52d692.1406120732.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Josh Cartwright <josh.cartwright-acOepvfBmUk@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2014-07-23 at 03:05PM +0200, Michal Simek wrote:
> Add node describing Zynq's CAN controller.
>=20
> Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>=20
>  arch/arm/boot/dts/zynq-7000.dtsi | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zyn=
q-7000.dtsi
> index 366ca6434f54..2287d9b4ed1a 100644
> --- a/arch/arm/boot/dts/zynq-7000.dtsi
> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> @@ -71,7 +71,18 @@
>  			interrupts =3D <0 7 4>;
>  			interrupt-parent =3D <&intc>;
>  			clocks =3D <&clkc 12>;
> -		};
> +		};
> +
> +		can0: can@e0008000 {
> +			compatible =3D "xlnx,zynq-can-1.0";
> +			clocks =3D <&clkc 19>, <&clkc 36>;
> +			clock-names =3D "can_clk", "pclk";
> +			reg =3D <0xe0008000 0x1000>;
> +			interrupts =3D <0 28 4>;
> +			interrupt-parent =3D <&intc>;
> +			tx-fifo-depth =3D <0x40>;
> +			rx-fifo-depth =3D <0x40>;
> +		};

What about the second CAN core? You also probably want to add
'status =3D "disabled"' in the dtsi.

	S=C3=B6ren

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
