From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: at91: sama5d4ek: enable audio support
Date: Wed, 4 Mar 2015 15:15:08 +0100
Message-ID: <54F7136C.5040307@atmel.com>
References: <1422859907-14881-1-git-send-email-voice.shen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422859907-14881-1-git-send-email-voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 02/02/2015 07:51, Bo Shen a =E9crit :
> This patch set enable audio support on sama5d4ek.
> It depends the patch [1] (ASoC: atmel-pcm-dma: won't check direction
> when configure dma)
> [1] https://patchwork.kernel.org/patch/5759441/
>=20
>=20
> Bo Shen (4):
>   ARM: at91: dt: sama5d4: add ssc nodes
>   ARM: at91: dt: sama5d4ek: enable ssc0
>   ARM: at91: dt: sama5d4ek: add and enable wm8904
>   ARM: at91: dt: sama5d4ek: enable audio

Whole series stacked on top of at91-4.1-dt.

Thanks, bye.


>  arch/arm/boot/dts/at91-sama5d4ek.dts | 31 ++++++++++++++++
>  arch/arm/boot/dts/sama5d4.dtsi       | 70 ++++++++++++++++++++++++++=
++++++++++
>  2 files changed, 101 insertions(+)
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
