From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: BCM5301X: Enable UART0 for SmartRG SR-400AC
Date: Sun, 28 Jun 2015 00:08:05 +0200
Message-ID: <CACna6rzJE8Gzrwvj+nCw=qCRho=6nZ+k1h_tFQLhNZvf5zWTDg@mail.gmail.com>
References: <1435103504-28592-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435103504-28592-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 24 June 2015 at 01:51, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
> Enable the use of UART0 by overriding its default status property.
>
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts b/arch/arm=
/boot/dts/bcm4708-smartrg-sr400ac.dts
> index d6a033b97c70..64a5e8ab65e0 100644
> --- a/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
> +++ b/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
> @@ -118,3 +118,7 @@
>                 };
>         };
>  };
> +
> +&uart0 {
> +       status =3D "okay";
> +};

We have many more changes like this in OpenWrt, I just didn't upstream
them because of current chipcommonA state.

It was added before we got "brcm,bus-axi" and I believe Hauke wanted
move it to the "correct" place at some point. Since UART is part of
ChipCommon device and ChipCommon is part of "brcm,bus-axi",.I guess we
should add UARTs as a ChipCommon device subnodes. We already have
chipcommon: chipcommon@0 {
        reg =3D <0x00000000 0x1000>;

        gpio-controller;
        #gpio-cells =3D <2>;
};
, is it possible to move UARTs there?

I'm not sure if this UART cleanup should block your change. I guess it
depends on the way it'll finally look like.

I'm also wondering: is there any preference between overwriting status
with something like
&uart0 { };
and
chipcommonA {
    uart0: serial@0300 { };
};
? I don't know DT that well, just asking.

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
