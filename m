From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 5/6] ARM: shmobile: ape6evm: sort dts file by address
Date: Fri, 12 Sep 2014 11:04:05 +0200
Message-ID: <CAMuHMdWmBo8-_3-3=TcTfW1NZHTGrkwXBAFtugZQZFa=6y2qkA@mail.gmail.com>
References: <1410511876-9235-1-git-send-email-ulrich.hecht+renesas@gmail.com>
	<1410511876-9235-6-git-send-email-ulrich.hecht+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1410511876-9235-6-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Simon Horman <horms@verge.net.au>, Olof Johansson <olof@lixom.net>, Linux-sh list <linux-sh@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Ulrich,

I know this is not your fault, but...

On Fri, Sep 12, 2014 at 10:51 AM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> +       ape6evm_fixed_3v3: fixedregulator@0 {

As there is no "reg" property, the "@0" must not be present.

> +               compatible = "regulator-fixed";
> +               regulator-name = "3V3";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-always-on;
> +       };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
