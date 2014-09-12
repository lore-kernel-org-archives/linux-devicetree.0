From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/6] ARM: shmobile: kzm9d: sort dts file by address
Date: Fri, 12 Sep 2014 10:58:37 +0200
Message-ID: <CAMuHMdXY70_aWsVjYSZUPCcbTgJ6CnwHEziwr1PBDyS6RLjj2w@mail.gmail.com>
References: <1410511876-9235-1-git-send-email-ulrich.hecht+renesas@gmail.com>
	<1410511876-9235-4-git-send-email-ulrich.hecht+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1410511876-9235-4-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Simon Horman <horms@verge.net.au>, Olof Johansson <olof@lixom.net>, Linux-sh list <linux-sh@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Ulrich,

I know this is not your fault, but...

On Fri, Sep 12, 2014 at 10:51 AM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> +       reg_1p8v: regulator@0 {

As there is no "reg" property, the "@0" must not be present.
However, in the absence of a unit-address, the node name must be unique.

> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-1.8V";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               regulator-always-on;
> +               regulator-boot-on;
> +       };
> +
> +       reg_3p3v: regulator@1 {

Likewise.

> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-3.3V";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-always-on;
> +               regulator-boot-on;
> +       };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
