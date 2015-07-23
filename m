From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Use stdout-path in STM32F429 Discovery board
Date: Thu, 23 Jul 2015 13:40:18 +0200
Message-ID: <55B0D2A2.9080604@suse.de>
References: <1437628173-9447-1-git-send-email-mcoquelin.stm32@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437628173-9447-1-git-send-email-mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kamil Lulko <rev13-5tc4TXWwyLM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 23.07.2015 um 07:09 schrieb Maxime Coquelin:
> This patch replaces use of linux,stdout-path by stdout-path as per

s/by/with/

> "chosen" DT bindings documentation.
>=20
> Doing that, the "console" argument is no more needed in kernel comman=
d
> line.
>=20
> Reported-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> Signed-off-by: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/stm32f429-disco.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Other than that,

Reviewed-by: Andreas F=E4rber <afaerber-l3A5Bk7waGM@public.gmane.org>

Regards,
Andreas

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
