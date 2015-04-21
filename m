From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v5 07/11] ARM: imx: add msl support for imx7d
Date: Tue, 21 Apr 2015 18:31:10 +0100
Message-ID: <20150421173110.GG10164@leverpostej>
References: <1429628007-8892-1-git-send-email-Frank.Li@freescale.com>
 <1429628007-8892-8-git-send-email-Frank.Li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1429628007-8892-8-git-send-email-Frank.Li@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Frank.Li@freescale.com" <Frank.Li@freescale.com>
Cc: "lznuaa@gmail.com" <lznuaa@gmail.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Anson Huang <b20788@freescale.com>
List-Id: devicetree@vger.kernel.org

> +static void __init imx_ca7_smp_init_cpus(void)
> +{
> +       int i, ncores;
> +       unsigned long val;
> +
> +       asm volatile("mrc p15, 1, %0, c9, c0, 2" : "=r" (val));
> +       ncores = ((val >> 24) & 0x3) + 1;
> +       if (setup_max_cpus < ncores)
> +               ncores = (setup_max_cpus) ? setup_max_cpus : 1;
> +
> +       for (i = ncores; i < NR_CPUS; i++)
> +               set_cpu_possible(i, false);
> +}

NAK.

The set of available CPUs should come from the DT, as with other
platforms.

Mark.
