From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 03/10] clk: sunxi-ng: sun50i: Mark the msgbox clock as critical
Date: Fri, 01 Mar 2019 09:31:23 -0800
Message-ID: <155146148359.16805.78863244252924530@swboyd.mtv.corp.google.com>
References: <20190301052947.32032-1-samuel@sholland.org> <20190301052947.32032-4-samuel@sholland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190301052947.32032-4-samuel@sholland.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>, Jassi Brar <jassisinghbrar@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Samuel Holland <samuel@sholland.org>
List-Id: devicetree@vger.kernel.org

Quoting Samuel Holland (2019-02-28 21:29:40)
> The msgbox clock is critical because the hardware is shared between
> Linux and system firmware. The message box may be used by the EL3 secure
> monitor's PSCI implementation. On 64-bit sunxi SoCs, this is provided by
> ARM TF-A; 32-bit SoCs use a different implementation. The secure monitor
> uses the message box to forward requests to power management firmware
> running on a separate CPU.
>=20
> It is not enough for the secure monitor to enable the clock each time
> Linux performs a SMC into EL3, as both the firmware and Linux can run
> concurrently on separate CPUs. So it is never safe for Linux to turn
> this clock off, and it should be marked as critical.
>=20
> At this time, such power management firmware only exists for the A64.
> However, it makes sense to take care of all CCU drivers now for
> consistency, and to ease the transition in the future, once firmware is
> ported to the other SoCs.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 2 +-
>  drivers/clk/sunxi-ng/ccu-sun50i-h6.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng=
/ccu-sun50i-a64.c
> index 932836d26e2b..7780e855c56f 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> @@ -350,7 +350,7 @@ static SUNXI_CCU_GATE(bus_de_clk,   "bus-de",       "=
ahb1",
>  static SUNXI_CCU_GATE(bus_gpu_clk,     "bus-gpu",      "ahb1",
>                       0x064, BIT(20), 0);
>  static SUNXI_CCU_GATE(bus_msgbox_clk,  "bus-msgbox",   "ahb1",
> -                     0x064, BIT(21), 0);
> +                     0x064, BIT(21), CLK_IS_CRITICAL);

Please add a comment explaining why CLK_IS_CRITICAL is used. It helps us
remember years from now without having to dig in the git history.
