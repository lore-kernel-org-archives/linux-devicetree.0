From: Holger Schurig <holgerschurig-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: imx6: add support for Ka-Ro electronics TX6S-8034 module
Date: Wed, 13 Jan 2016 08:35:28 +0100
Message-ID: <87h9iigce7.fsf@gmail.com>
References: <1452621710-15336-1-git-send-email-LW@KARO-electronics.de>
	<1452621710-15336-2-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452621710-15336-2-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
	("Lothar \=\?utf-8\?Q\?Wa\=C3\=9Fmann\=22's\?\= message of "Tue, 12 Jan 2016
 19:01:48 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?utf-8?Q?Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org> writes:

> +/ {
> +	model =3D "Ka-Ro electronics TX6S-8034 Module";
> +	compatible =3D "karo,imx6dl-tx6dl", "fsl,imx6dl";
> +	timestamp =3D __DATE__, __TIME__;

Is this needed or useful?

There's a movement that aims to do "reproducible builds" ...   being
able to recompile an image and verify it against the supplied can be
helpful for security audit purposes.


> +	display: display@di0 {
> +		compatible =3D "fsl,imx-parallel-display";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_disp0_1>;
> +		interface-pix-fmt =3D "rgb24";
> +//		fsl,panel =3D <&lcd0_panel>;

Probably not for upstream inclusion?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
