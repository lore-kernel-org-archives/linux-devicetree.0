From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/7] pinctrl: ingenic: Merge GPIO functionality
Date: Fri, 17 Aug 2018 09:09:55 -0600
Message-ID: <20180817150955.GC20845@rob-hp-laptop>
References: <20180816163544.9072-1-paul@crapouillou.net>
 <20180816163544.9072-3-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180816163544.9072-3-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Hi, this email is from Rob's (experimental) review bot. I found a couple
of common problems with your patch. Please see below.

On Thu, 16 Aug 2018 18:35:40 +0200, Paul Cercueil wrote:
> Merge the code of the gpio-ingenic driver into the pinctrl-ingenic
> driver.
> 
> The reason behind this, is that the same hardware block handles both pin
> config / muxing and GPIO.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

The preferred subject prefix is "dt-bindings: <binding dir>: ...".

> ---
>  .../bindings/pinctrl/ingenic,pinctrl.txt           |  38 ++-
>  drivers/pinctrl/Kconfig                            |   2 +
>  drivers/pinctrl/pinctrl-ingenic.c                  | 337 ++++++++++++++++++++-
>  3 files changed, 365 insertions(+), 12 deletions(-)
> 

DT bindings (including binding headers) should be a separate patch. See
Documentation/devicetree/bindings/submitting-patches.txt.
