From: =?windows-1252?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: Zynq: DT: Enable xadc node in zynq-parallella.dts
Date: Tue, 12 May 2015 14:13:20 +0200
Message-ID: <5551EE60.40601@suse.de>
References: <1431037945-40360-1-git-send-email-xander.huff@ni.com> <1431037945-40360-2-git-send-email-xander.huff@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431037945-40360-2-git-send-email-xander.huff-acOepvfBmUk@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xander Huff <xander.huff-acOepvfBmUk@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ben.shelton-acOepvfBmUk@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, joe.hershberger-acOepvfBmUk@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, joshc-acOepvfBmUk@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 08.05.2015 um 00:32 schrieb Xander Huff:
> Now that zynq-7000 disables xadc by default, enable in zynq-parallell=
a
> to retain existing behavior.
>=20
> Signed-off-by: Xander Huff <xander.huff-acOepvfBmUk@public.gmane.org>
> ---
>  arch/arm/boot/dts/zynq-parallella.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/dt=
s/zynq-parallella.dts
> index 1745712..b1a1f7a 100644
> --- a/arch/arm/boot/dts/zynq-parallella.dts
> +++ b/arch/arm/boot/dts/zynq-parallella.dts
> @@ -32,6 +32,12 @@
>  		bootargs =3D "console=3DttyPS0,115200 earlyprintk root=3D/dev/mmcb=
lk0p2 rootfstype=3Dext4 rw rootwait";
>  		linux,stdout-path =3D "/amba/serial@e0001000";
>  	};
> +
> +	amba {
> +		adc: adc@f8007100 {
> +			status =3D "okay";
> +		};
> +	};

You've already discarded this patchset, but please note for the future
that the desired style would've been the one you see below, i.e.

>  };

&adc {
	status =3D "okay";
};

Regards,
Andreas

> =20
>  &clkc {
>=20


--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Dilip Upmanyu, Graham Norton; H=
RB
21284 (AG N=FCrnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
