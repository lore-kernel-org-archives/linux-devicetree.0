From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] pinctrl: sh-pfc: r8a7794: add R8A7745 support
Date: Fri, 5 May 2017 14:56:19 -0500
Message-ID: <20170505195619.he7tpdtrkkb3oafq@rob-hp-laptop>
References: <20170428185245.428747882@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170428185245.428747882@cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 28, 2017 at 09:52:35PM +0300, Sergei Shtylyov wrote:
> Renesas RZ/G1E (R8A7745) is pin compatible with R-Car E2 (R8A7794),
> however it doesn't have several automotive specific peripherals.
> Annotate all the items that only exist on the R-Car SoCs...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is  against the 'devel' branch of Linus Walleij's 'linux-pinctrl.git'
> repo plus 3 R8A7794 PFC driver fixes/cleanups posted today and  the R8A7743 PFC
> support patch posted last week...
> 
> Changes in version 3:
> - resolved rejects atop of the new R8A7794 driver patches renaming the IIC0/1
>   signals and removing reserved groups/signals;
> - undid splitting of 'pinmux_{groups|functions}' arrays into the common and
>   R8A7794 specfic parts, updated the patch description accordingly;
> - kill double spaces in the patch description.
> 
> Changes in version 2:
> - fixed indentation to use tabs instead of spaces;
> - updated the PFC bindings.
> 
>  Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt |    1 

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/sh-pfc/Kconfig                                    |    5 
>  drivers/pinctrl/sh-pfc/Makefile                                   |    1 
>  drivers/pinctrl/sh-pfc/core.c                                     |    6 
>  drivers/pinctrl/sh-pfc/pfc-r8a7794.c                              |  640 +++++-----
>  drivers/pinctrl/sh-pfc/sh_pfc.h                                   |    1 
>  6 files changed, 369 insertions(+), 285 deletions(-)
