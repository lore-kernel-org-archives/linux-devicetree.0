From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 1/4] clk: sunxi-ng: Enable DE2_CCU for SUN8I and SUN50I
Date: Wed, 24 Oct 2018 01:52:14 -0700
Message-ID: <154037113470.53599.9820023879508838050@swboyd.mtv.corp.google.com>
References: <20181023155727.9383-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181023155727.9383-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Michael Trimarchi <michael@amarulasolutions.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc: Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Quoting Jagan Teki (2018-10-23 08:57:24)
> Allwinner SoC like SUN8I and SUN50I has DE2 CCU so enable them
> as default.
> =

> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v5:
> - remove DRM dependency =

> Changes for v4, v3:
> - none
> Changes for v2:
> - Enable for MACH_SUN8I
> =

>  drivers/clk/sunxi-ng/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
> index 826674d090fd..99cf8103474c 100644
> --- a/drivers/clk/sunxi-ng/Kconfig
> +++ b/drivers/clk/sunxi-ng/Kconfig
> @@ -63,6 +63,8 @@ config SUN8I_V3S_CCU
>  =

>  config SUN8I_DE2_CCU
>         bool "Support for the Allwinner SoCs DE2 CCU"
> +       default MACH_SUN8I || (ARM64 && ARCH_SUNXI)
> +       depends on MACH_SUN8I || (ARM64 && ARCH_SUNXI)

Why do we need 'depends on'? That isn't described in the commit text.
