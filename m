From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] ARM: dts: iwg20d-q7-dbcm-ca: Add device trees for
 camera DB
Date: Fri, 6 Oct 2017 09:57:11 +0200
Message-ID: <CAMuHMdU-zOogwOKS_s8-r_fsUfXxu38WKkaoryuuuGGJzmBkSw@mail.gmail.com>
References: <1507108713-10686-1-git-send-email-fabrizio.castro@bp.renesas.com> <1507108713-10686-3-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507108713-10686-3-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Hi Fabrizio,

On Wed, Oct 4, 2017 at 11:18 AM, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds a .dtsi that describes the camera daughter board
> and a .dts to describe the HW made of iWave's RZ/G1M SoM, iWave's
> RZ/G1M/G1N Qseven carrier board, and the camera daughter board.
> The camera daughter board .dtsi adds support for ttySC[14].
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi

> +/ {
> +       aliases {
> +               serial1 = &scif1;
> +               serial4 = &hscif1;

BTW, what's the reason you picked serial4 for the third serial port?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
