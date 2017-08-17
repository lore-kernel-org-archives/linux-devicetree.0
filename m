From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0
 clock selector PHY
Date: Thu, 17 Aug 2017 09:23:40 +0200
Message-ID: <CAMuHMdVypfK4n720SyTAkOZJx3gbA6_gaUA0RhXKGhVEB=54ig@mail.gmail.com>
References: <1500963987-4627-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1500963987-4627-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-clk-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 25, 2017 at 8:26 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> R-Car USB 2.0 controller can change the clock source from an oscillator
> to an external clock via a register. So, this patch adds support
> the clock source selector as a clock driver.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  This patch is based on the renesas-drivers.git /
> renesas-drivers-2017-07-18-v4.13-rc1 tag.
>
>  Changes from v2:
>   - Fix the example of device tree doc.
>   - Replace some 8 spaces to a tab in the device tree doc.
>   - Add Rob's Acked-by for the doc.
>   - Drop CLK_IS_BASIC on init.flag.
>   - Use of_clk_add_hw_provider() instead of of_clk_add_provider().
>   - Use builtin_platform_driver() instead of syscall_init_sync().
>   - Use pm_runtime APIs instead of clk APIs for "ehci_ohci" clk.
>
>  Changes from v1:
>   - Change this driver as a clock driver from a generic phy driver.
>     https://patchwork.kernel.org/patch/9788697/
>   - Remove "RFC" tag.

Thank you, queued v3 + the fix from Julia in clk-renesas-for-4.14.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
