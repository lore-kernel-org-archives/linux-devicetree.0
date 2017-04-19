From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] pinctrl: sh-pfc: r8a7791: add R8A7743 support
Date: Wed, 19 Apr 2017 17:36:20 -0500
Message-ID: <20170419223619.girdiji5igwwa3sy@rob-hp-laptop>
References: <20170413201346.358012116@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170413201346.358012116@cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 13, 2017 at 11:13:32PM +0300, Sergei Shtylyov wrote:
> Renesas RZ/G1M (R8A7743) is pin compatible with R-Car M2-W/N (R8A7791/3),
> however it doesn't have several automotive specific peripherals. Annotate
> all the items that only exist on the R-Car SoCs and only supply  the pin
> groups/functions existing on a given SoC...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'devel' branch of Linus Walleij's 'linux-pinctrl.git'
> repo plus  4  R8A7791 PFC fixes and the "grand I2C rename" patch...
> 
> Changes in version 3:
> - updated the PFC bindings.
> 
> Changes in version 2:
> - switch to supplying exactly the groups/functions existing on a given SoC,
>   update the patch descriptions accordingly;
> - resolved rejects due to the "grand I2C rename" patch being updated.
> 
>  Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt |    1 

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/sh-pfc/Kconfig                                    |    5 
>  drivers/pinctrl/sh-pfc/Makefile                                   |    1 
>  drivers/pinctrl/sh-pfc/core.c                                     |    6 
>  drivers/pinctrl/sh-pfc/pfc-r8a7791.c                              | 1889 +++++-----
>  drivers/pinctrl/sh-pfc/sh_pfc.h                                   |    1 
>  6 files changed, 1023 insertions(+), 880 deletions(-)
