From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 5/7] pinctrl: ingenic: Add support for the JZ4725B
Date: Fri, 17 Aug 2018 09:09:56 -0600
Message-ID: <20180817150956.GD20845@rob-hp-laptop>
References: <20180816163544.9072-1-paul@crapouillou.net>
 <20180816163544.9072-5-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180816163544.9072-5-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Hi, this email is from Rob's (experimental) review bot. I found a couple
of common problems with your patch. Please see below.

On Thu, 16 Aug 2018 18:35:42 +0200, Paul Cercueil wrote:
> Add support for the JZ4725B and compatible SoCs from Ingenic.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

The preferred subject prefix is "dt-bindings: <binding dir>: ...".

> ---
>  .../bindings/pinctrl/ingenic,pinctrl.txt           |  2 +
>  drivers/pinctrl/pinctrl-ingenic.c                  | 99 ++++++++++++++++++++++
>  2 files changed, 101 insertions(+)
> 

DT bindings (including binding headers) should be a separate patch. See
Documentation/devicetree/bindings/submitting-patches.txt.
