From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 7/7] gpio: ingenic: Remove driver
Date: Fri, 17 Aug 2018 09:09:57 -0600
Message-ID: <20180817150957.GE20845@rob-hp-laptop>
References: <20180816163544.9072-1-paul@crapouillou.net>
 <20180816163544.9072-7-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180816163544.9072-7-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Hi, this email is from Rob's (experimental) review bot. I found a couple
of common problems with your patch. Please see below.

On Thu, 16 Aug 2018 18:35:44 +0200, Paul Cercueil wrote:
> The pinctrl-ingenic driver is now handling the GPIO chips directly.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

The preferred subject prefix is "dt-bindings: <binding dir>: ...".

> ---
>  .../devicetree/bindings/gpio/ingenic,gpio.txt      |  46 ---
>  drivers/gpio/Kconfig                               |  11 -
>  drivers/gpio/Makefile                              |   1 -
>  drivers/gpio/gpio-ingenic.c                        | 392 ---------------------
>  4 files changed, 450 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/ingenic,gpio.txt
>  delete mode 100644 drivers/gpio/gpio-ingenic.c
> 

DT bindings (including binding headers) should be a separate patch. See
Documentation/devicetree/bindings/submitting-patches.txt.
