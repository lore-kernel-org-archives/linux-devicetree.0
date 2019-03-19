From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 6/6] arm64: dts: allwinner: h6: Add Video
 Engine node
Date: Tue, 19 Mar 2019 09:50:24 +0100
Message-ID: <83d5db0b3e40cbd541ed8084d8a8052ce95887b7.camel@bootlin.com>
References: <20190128205504.11225-1-jernej.skrabec@siol.net>
	 <20190128205504.11225-7-jernej.skrabec@siol.net>
Reply-To: paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCOO3QWNR4KRBU62YLSAKGQEWDHVDOA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190128205504.11225-7-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org, maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Le lundi 28 janvier 2019 =C3=A0 21:55 +0100, Jernej Skrabec a =C3=A9crit :
> This adds the Video engine node for H6. It can use whole DRAM range so
> there is no need for reserved memory node.

Looks like the patch adding SRAM support made it through but this one
didn't. It looks ready to be picked up though.

Reviewed-by: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>

Cheers,

Paul

> Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/bo=
ot/dts/allwinner/sun50i-h6.dtsi
> index 247dc0a5ce89..de4b7a1f1012 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -146,6 +146,17 @@
>  			};
>  		};
> =20
> +		video-codec@1c0e000 {
> +			compatible =3D "allwinner,sun50i-h6-video-engine";
> +			reg =3D <0x01c0e000 0x2000>;
> +			clocks =3D <&ccu CLK_BUS_VE>, <&ccu CLK_VE>,
> +				 <&ccu CLK_MBUS_VE>;
> +			clock-names =3D "ahb", "mod", "ram";
> +			resets =3D <&ccu RST_BUS_VE>;
> +			interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> +			allwinner,sram =3D <&ve_sram 1>;
> +		};
> +
>  		syscon: syscon@3000000 {
>  			compatible =3D "allwinner,sun50i-h6-system-control",
>  				     "allwinner,sun50i-a64-system-control";
> --=20
> 2.20.1
>=20
--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
