From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 3/8] ARM: dts: iwg22m: Enable SDHI1 controller
Date: Wed, 20 Sep 2017 13:16:58 +0200
Message-ID: <CAMuHMdVLXauMA_cbFJafHNdX_XHVGccO00vm6mdvgB7-7xh3RA@mail.gmail.com>
References: <1505322341-9480-1-git-send-email-chris.paterson2@renesas.com>
 <1505322341-9480-4-git-send-email-chris.paterson2@renesas.com> <20170915081144.GI3924@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170915081144.GI3924-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 15, 2017 at 10:11 AM, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org> wrote:
> On Wed, Sep 13, 2017 at 06:05:36PM +0100, Chris Paterson wrote:
>> From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
>>
>> Enable the SDHI1 controller on iWave RZ/G1E SoM.
>>
>> Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
>> Signed-off-by: Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

>> --- a/arch/arm/boot/dts/r8a7745-iwg22m.dtsi
>> +++ b/arch/arm/boot/dts/r8a7745-iwg22m.dtsi

>> @@ -54,6 +61,16 @@
>>       status =3D "okay";
>>  };
>>
>> +&sdhi1 {
>> +     pinctrl-0 =3D <&sdhi1_pins>;
>> +     pinctrl-names =3D "default";
>> +
>> +     vmmc-supply =3D <&reg_3p3v>;
>> +     vqmmc-supply =3D <&reg_3p3v>;
>> +     cd-gpios =3D <&gpio3 31 GPIO_ACTIVE_LOW>;
>
> No wp-gpios property means this is a =C2=B5SD slot, right?

Correct.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
