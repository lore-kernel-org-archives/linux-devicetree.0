From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: amlogic: Add basic support for Amlogic S905X
Date: Sun, 3 Jul 2016 17:57:00 +0200
Message-ID: <577935CC.80001@suse.de>
References: <1467399478-7183-1-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467399478-7183-1-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 01.07.2016 um 20:57 schrieb Carlo Caione:
> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>=20
> This patch introduces the basic support for the Amlogic S905X (Meson
> GXL) and for the Amlogic evaluation board P212.
> No documentation has been released yet for this SoC, so for now only =
the
> bare minimum has been added in the DT.
>=20
> Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.txt |   5 +
>  arch/arm64/boot/dts/amlogic/Makefile              |   1 +
>  arch/arm64/boot/dts/amlogic/meson-gxl-p212.dts    |  70 +++++++++
>  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 179 ++++++++++++=
++++++++++
>  4 files changed, 255 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-p212.dts
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi

I don't have documentation either, but looks sane to me.

Reviewed-by: Andreas F=E4rber <afaerber-l3A5Bk7waGM@public.gmane.org>

With the recent driver progress have you checked whether /memory@0
actually works or whether U-Boot gives us a /memory node that Linux is
using instead?

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N=FCrnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
