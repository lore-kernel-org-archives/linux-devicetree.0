From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 6/8] ARM64: dts: amlogic: Add Tronsmart Vega S95 configs
Date: Tue, 1 Mar 2016 00:55:38 +0100
Message-ID: <56D4DA7A.6020805@suse.de>
References: <1456789465-2962-1-git-send-email-afaerber@suse.de>
 <1456789465-2962-7-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456789465-2962-7-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Nicolas Saenz <nicolassaenzj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 01.03.2016 um 00:44 schrieb Andreas F=C3=A4rber:
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/a=
rch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> new file mode 100644
> index 000000000000..f8c78beb4376
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> @@ -0,0 +1,73 @@
[...]
> +#include "meson-gxbb.dtsi"
> +
> +/ {
> +	compatible =3D "tronsmart,vega-s95", "amlogic,meson-gxbb";
> +
> +	aliases {
> +		serial0 =3D &uart_AO;
> +		serial1 =3D &uart_A;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	soc {
> +		uart_A: serial@c11084c0 {
> +			compatible =3D "amlogic,meson-uart";
> +			reg =3D <0x0 0xc11084c0 0x0 0x14>;
> +			interrupts =3D <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
> +			clocks =3D <&xtal>;
> +			status =3D "disabled";
> +		};
> +
> +		uart_AO: serial@c81004c0 {
> +			compatible =3D "amlogic,meson-uart";
> +			reg =3D <0x0 0xc81004c0 0x0 0x14>;
> +			interrupts =3D <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
> +			clocks =3D <&xtal>;
> +		};

Doh. These two nodes and their aliases should probably go into
meson-gxbb.dtsi (3/8).

> +	};
> +};

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG=
 N=C3=BCrnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
