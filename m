From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/8] drivers: pinctrl: add driver for Allwinner A64 SoC
Date: Thu, 18 Feb 2016 08:35:43 -0600
Message-ID: <20160218143543.GC9654@rob-hp-laptop>
References: <1455709440-8668-1-git-send-email-andre.przywara@arm.com>
 <1455709440-8668-3-git-send-email-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455709440-8668-3-git-send-email-andre.przywara@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-gpio@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 17, 2016 at 11:43:54AM +0000, Andre Przywara wrote:
> Based on the Allwinner A64 user manual and on the previous sunxi
> pinctrl drivers this introduces the pin multiplex assignments for
> the ARMv8 Allwinner A64 SoC.
> Port A is apparently used for the fixed function DRAM controller, so
> the ports start at B here (the manual mentions "n from 1 to 7", so
> not starting at 0).
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   1 +

Acked-by: Rob Herring <robh@kernel.org>

>  arch/arm64/Kconfig.platforms                       |   1 +
>  drivers/pinctrl/sunxi/Kconfig                      |   4 +
>  drivers/pinctrl/sunxi/Makefile                     |   1 +
>  drivers/pinctrl/sunxi/pinctrl-sun50i-a64.c         | 606 +++++++++++++++++++++
>  5 files changed, 613 insertions(+)
>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-a64.c
