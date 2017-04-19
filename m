From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7794: add R8A7745 support
Date: Wed, 19 Apr 2017 17:46:46 -0500
Message-ID: <20170419224646.wwjerpgnidvk4fkh@rob-hp-laptop>
References: <20170413201932.890107963@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170413201932.890107963@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 13, 2017 at 11:19:24PM +0300, Sergei Shtylyov wrote:
> Renesas  RZ/G1E (R8A7745) is pin compatible with R-Car E2 (R8A7794),
> however  it doesn't have several automotive specific peripherals.

Is a single space between words really so hard for you? You've been told 
to write proper sentences multiple times.

Yes, kernel developers suffer from OCD. Sorry.

> Annotate all the items that only exist on the R-Car SoCs and only
> supply the pin groups/functions existing on a given SoC (that required
> splitting  of the AVB function)...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is  against the 'devel' branch of Linus Walleij's 'linux-pinctrl.git'
> repo plus  R8A7794 PFC fix and R8A7743 PFC support patch...
> 
> Changes in version 2:
> - fixed indentation to use tabs instead of spaces;
> - updated the PFC bindings.
> 
>  Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt |    1 

But given it's a one line DT change:

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/sh-pfc/Kconfig                                    |    5 
>  drivers/pinctrl/sh-pfc/Makefile                                   |    1 
>  drivers/pinctrl/sh-pfc/core.c                                     |    6 
>  drivers/pinctrl/sh-pfc/pfc-r8a7794.c                              | 1970 +++++-----
>  drivers/pinctrl/sh-pfc/sh_pfc.h                                   |    1 
>  6 files changed, 1140 insertions(+), 844 deletions(-)
