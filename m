From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC v3 02/22] soc: renesas: Add R-Car RST driver
Date: Fri, 10 Jun 2016 09:58:28 +0200
Message-ID: <CAMuHMdUX=iAe=51+8JyaKxMBOUA_jJXGK0BTKxRuTXtug_R1Tw@mail.gmail.com>
References: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
 <1464808880-343-3-git-send-email-geert+renesas@glider.be> <d38d97fb-5b96-0773-abf6-c737b4f2fef1@de.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <d38d97fb-5b96-0773-abf6-c737b4f2fef1@de.bosch.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-renesas-soc@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Dirk,

On Thu, Jun 2, 2016 at 7:42 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> +int __init rcar_rst_read_mode_pins(u32 *mode)
>
> Just a style issue: Is the string 'pins' in the function name still
> relevant? I.e. what's about just 'rcar_rst_read_mode()'?

I feel "mode" is a too generic word for a public API.
It's used a several contexts inside the RST module (secure mode, 64-bit
addressing mode, free-running mode, step-up mode).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
