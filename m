From: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH 0/3] LPC4337 CIAA-NXP DTS changes
Date: Wed, 25 Nov 2015 09:27:15 -0300
Message-ID: <5655A923.7050601@vanguardiasur.com.ar>
References: <1448282225-2635-1-git-send-email-ariel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448282225-2635-1-git-send-email-ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

(+To: Joachim)

El 23/11/15 a las 09:37, Ariel D'Alessandro escribi=F3:
> Hi,
>=20
> This patch set includes some DTS changes for LPC4337 CIAA-NXP board.
> It is based on tag next-20151120 of the linux-next repository. It has
> been successfully tested on a LPC4337 CIAA-NXP Board.
>=20
> Ariel D'Alessandro (3):
>   ARM: dts: lpc4337-ciaa: enable EEPROM memory
>   ARM: dts: lpc4337-ciaa: enable SCT-PWM
>   ARM: dts: lpc4337-ciaa: add i2c0 and devices
>=20
>  arch/arm/boot/dts/lpc4337-ciaa.dts | 38 ++++++++++++++++++++++++++++=
++++++++++
>  1 file changed, 38 insertions(+)
>=20

--=20
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
