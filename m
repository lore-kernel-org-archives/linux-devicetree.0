From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 1/3] clk: loongson1: add configuration option for loongson1 clks
Date: Wed, 06 Feb 2019 11:18:34 -0800
Message-ID: <154948071478.115909.15205970894327083365@swboyd.mtv.corp.google.com>
References: <20190128152052.3047-1-jiaxun.yang@flygoat.com> <20190201063540.19636-1-jiaxun.yang@flygoat.com> <20190201063540.19636-2-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201063540.19636-2-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-Id: devicetree@vger.kernel.org

Quoting Jiaxun Yang (2019-01-31 22:35:38)
> diff --git a/drivers/clk/loongson1/Kconfig b/drivers/clk/loongson1/Kconfig
> new file mode 100644
> index 000000000000..e2220332d797
> --- /dev/null
> +++ b/drivers/clk/loongson1/Kconfig
> @@ -0,0 +1,27 @@
> +menu "Loongson-1 Clock drivers"
> +       depends on MACH_LOONGSON32
> +
> +config LOONGSON1_CLOCK_COMMON
> +       bool
> +
> +config LOONGSON1_CLOCK_LS1B
> +       bool "Loongson 1B driver"
> +       default y

Should be default CONFIG_LOONGSON1_LS1B?
> +       select LOONGSON1_CLOCK_COMMON

Drop the selects and have the menuconfig make the "COMMON" config option
enabled then?

> +       help
> +         Support the clocks provided by the clock hardware on Loongson-1B
> +         and compatible SoCs.
> +
> +         If building for a Loongson-1B SoC, you want to say Y here.
> +
> +config LOONGSON1_CLOCK_LS1C
> +       bool "Loongson 1C driver"
> +       default y

And default CONFIG_LOONGSON1_LS1C?

> +       select LOONGSON1_CLOCK_COMMON
> +       help
> +         Support the clocks provided by the clock hardware on Loongson-1C
> +         and compatible SoCs.
> +
> +         If building for a Loongson-1C SoC, you want to say Y here.
> +
> +endmenu
