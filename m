From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 11/16] ARM: mmp: add support for MMP3 SoC
Date: Fri, 06 Sep 2019 16:48:18 -0700
Message-ID: <20190906234818.EC0DA20842@mail.kernel.org>
References: <20190830220743.439670-1-lkundrak@v3.sk> <20190830220743.439670-12-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830220743.439670-12-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: "To : Olof Johansson" <olof@lixom.net>
Cc: "Cc : Rob Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

Quoting Lubomir Rintel (2019-08-30 15:07:38)
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 801fa1cd03217..8bb2ac83a1fcc 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -301,6 +301,11 @@ config COMMON_CLK_STM32H7
>         ---help---
>           Support for stm32h7 SoC family clocks
> =20
> +config COMMON_CLK_MMP2
> +       def_bool COMMON_CLK && (MACH_MMP2_DT || MACH_MMP3_DT)

Does it need to depend on COMMON_CLK? I thought that by being part of
the menuconfig (even if it's a hidden symbol) mean that it wouldn't be
evaulated unless the COMMON_CLK define is =3DY.

> +       help
> +         Support for Marvell MMP2 and MMP3 SoC clocks
> +
>  config COMMON_CLK_BD718XX
>         tristate "Clock driver for ROHM BD718x7 PMIC"
>         depends on MFD_ROHM_BD718XX || MFD_ROHM_BD70528
