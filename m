From: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: BCM5301X: Add CPU thermal sensor and zone
Date: Mon, 17 Apr 2017 10:54:32 -0400
Message-ID: <CAC3K-4pQNnezT7gk45DoyW5hmZ1Vqshcx-tx-bS6mOVRNUooog@mail.gmail.com>
References: <20170414214228.32521-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170414214228.32521-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 14, 2017 at 5:42 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>
> This uses CPU thermal sensor available on every Northstar chipset to
> monitor temperature. We don't have any cooling or throttling so only a
> critical trip was added.

Haha!  You beat me to it (as I had a similar patch queued).

This looks good to me.

Acked-by: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---
>  arch/arm/boot/dts/bcm5301x.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x=
.dtsi
> index 6a2afe7880ae..bbf39deb89f3 100644
> --- a/arch/arm/boot/dts/bcm5301x.dtsi
> +++ b/arch/arm/boot/dts/bcm5301x.dtsi
> @@ -356,6 +356,12 @@
>                                      "sata2";
>         };
>
> +       thermal: thermal@1800c2c0 {
> +               compatible =3D "brcm,ns-thermal";
> +               reg =3D <0x1800c2c0 0x10>;
> +               #thermal-sensor-cells =3D <0>;
> +       };
> +
>         srab: srab@18007000 {
>                 compatible =3D "brcm,bcm5301x-srab";
>                 reg =3D <0x18007000 0x1000>;
> @@ -419,4 +425,24 @@
>                         status =3D "disabled";
>                 };
>         };
> +
> +       thermal-zones {
> +               cpu_thermal: cpu-thermal {
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <1000>;
> +                       coefficients =3D <(-556) 418000>;
> +                       thermal-sensors =3D <&thermal>;
> +
> +                       trips {
> +                               cpu-crit {
> +                                       temperature     =3D <125000>;
> +                                       hysteresis      =3D <0>;
> +                                       type            =3D "critical";
> +                               };
> +                       };
> +
> +                       cooling-maps {
> +                       };
> +               };
> +       };
>  };
> --
> 2.11.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
