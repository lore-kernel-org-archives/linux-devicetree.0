Return-Path: <robherring2@gmail.com>
Date: Fri, 2 Mar 2018 16:20:12 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: add R8A77980 PFC support
Message-ID: <20180302222012.fvpay23bpckczxbh@rob-hp-laptop>
References: <e32c511f-89cd-254b-8a53-face984abe75@cogentembedded.com>
 <00a01c1b-560a-2ea5-0724-53b8a140ec34@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00a01c1b-560a-2ea5-0724-53b8a140ec34@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-ID: <devicetree@vger.kernel.org>

On Sun, Feb 25, 2018 at 09:14:21PM +0300, Sergei Shtylyov wrote:
> Add the PFC support for the R8A77980 SoC including pin groups for some
> on-chip devices such as AVB, CAN-FD, GETHER, [H]SCIF, I2C, INTC-EX, MMC,
> MSIOF, PWM, and VIN...
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt |    1 

Reviewed-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/sh-pfc/Kconfig                                    |    5 
>  drivers/pinctrl/sh-pfc/Makefile                                   |    1 
>  drivers/pinctrl/sh-pfc/core.c                                     |    6 
>  drivers/pinctrl/sh-pfc/pfc-r8a77980.c                             | 2738 ++++++++++
>  drivers/pinctrl/sh-pfc/sh_pfc.h                                   |    1 
>  6 files changed, 2752 insertions(+)
