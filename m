From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/8] pinctrl: sh-pfc: Initial R8A77995 PFC support
Date: Wed, 16 Aug 2017 11:20:33 +0200
Message-ID: <CAMuHMdVge3KTsbw=A94TgH7goQFzvPBD7+zUezk0HCn5okP+qw@mail.gmail.com>
References: <1502281187-24068-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1502281187-24068-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1502281187-24068-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 9, 2017 at 2:19 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds initial pinctrl driver to support for the R8A77995 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Looks good, i.e. will queue in sh-pfc-for-v4.14 with some whitespace fixes
reported by checkpatch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
