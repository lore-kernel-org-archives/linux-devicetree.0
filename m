From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v3 3/3] ARM: dts: aspeed: Enable BT IPMI BMC device
Date: Tue, 20 Sep 2016 16:52:36 +0930
Message-ID: <CACPK8XdTTuFSTEn7TkNfOBSMgNK-OYxXuS5Mc+CSN749Hb2GXw@mail.gmail.com>
References: <1474354900-5618-1-git-send-email-clg@kaod.org> <1474354900-5618-4-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1474354900-5618-4-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Cc: Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 20, 2016 at 4:31 PM, C=C3=A9dric Le Goater <clg-Bxea+6Xhats@public.gmane.org> wrote=
:
> Signed-off-by: C=C3=A9dric Le Goater <clg-Bxea+6Xhats@public.gmane.org>

Acked-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

I'll put this in my tree to send to Arnd.

Cheers,

Joel

> ---
>
>  Changes since v1:
>
>  - added the soc name ast2400 in the compatible cell
>
>  arch/arm/boot/dts/aspeed-g4.dtsi | 6 ++++++
>  arch/arm/boot/dts/aspeed-g5.dtsi | 6 ++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index 22dee5937d5c..7bb00b6f13d8 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -82,6 +82,12 @@
>                                 clocks =3D <&clk_apb>;
>                         };
>
> +                       ibt: ibt@1e789140 {
> +                               compatible =3D "aspeed,ast2400-bt-bmc";
> +                               reg =3D <0x1e789140 0x18>;
> +                               interrupts =3D <8>;
> +                       };
> +
>                         wdt1: wdt@1e785000 {
>                                 compatible =3D "aspeed,wdt";
>                                 reg =3D <0x1e785000 0x1c>;
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index dd94d9361fda..1d8f81b548b3 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -86,6 +86,12 @@
>                                 clocks =3D <&clk_apb>;
>                         };
>
> +                       ibt: ibt@1e789140 {
> +                               compatible =3D "aspeed,ast2400-bt-bmc";
> +                               reg =3D <0x1e789140 0x18>;
> +                               interrupts =3D <8>;
> +                       };
> +
>                         wdt1: wdt@1e785000 {
>                                 compatible =3D "aspeed,wdt";
>                                 reg =3D <0x1e785000 0x1c>;
> --
> 2.7.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
