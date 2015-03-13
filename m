From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of: Add vendor prefix for Arasan
Date: Fri, 13 Mar 2015 10:24:25 -0500
Message-ID: <CAL_JsqJSxGL4bxhFX1etBh_g6Ue7ovb0G_gniR-bgh1cQHA8xw@mail.gmail.com>
References: <488161d515944ef059b620ea72bca1166b8da2c5.1423730315.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <488161d515944ef059b620ea72bca1166b8da2c5.1423730315.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek <monstr@monstr.eu>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Hayato Suzuki <hytszk@gmail.com>, Thierry Reding <treding@nvidia.com>, Shawn Guo <shawn.guo@linaro.org>, Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Vaussard <florian.vaussard@epfl.ch>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 12, 2015 at 2:38 AM, Michal Simek <michal.simek@xilinx.com> wrote:
> PATA(pata_arasan_cf.c) and SDHCI(sdhci-of-arasan.c) drivers
> are already using this prefix.
>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Applied for 4.0. Thanks.

Rob

> ---
>
> https://arasan.com/contact/
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index b1df0ad1306c..7da04260a680 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -18,6 +18,7 @@ amlogic       Amlogic, Inc.
>  ams    AMS AG
>  amstaos        AMS-Taos Inc.
>  apm    Applied Micro Circuits Corporation (APM)
> +arasan Arasan Chip Systems
>  arm    ARM Ltd.
>  armadeus       ARMadeus Systems SARL
>  atmel  Atmel Corporation
> --
> 1.8.2.3
>
