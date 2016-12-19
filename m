From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 6/6] watchdog: ts4600: add driver for TS-4600 watchdog
Date: Mon, 19 Dec 2016 16:13:36 -0600
Message-ID: <20161219221336.cnvcxin34hdasndp@rob-hp-laptop>
References: <20161214231237.17496-1-sebastien.bourdelin@savoirfairelinux.com>
 <20161214231237.17496-7-sebastien.bourdelin@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161214231237.17496-7-sebastien.bourdelin@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Cc: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, kernel@savoirfairelinux.com, mark@embeddedarm.com, kris@embeddedarm.com, horms+renesas@verge.net.au, treding@nvidia.com, jonathanh@nvidia.com, f.fainelli@gmail.com, fabio.estevam@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org, linux@armlinux.org.uk, linux@roeck-us.net, wim@iguana.be, mark.rutland@arm.com, damien.riegel@savoirfairelinux.com, lucile.quirion@savoirfairelinux.com, olof@lixom.net, arnd@arndb.de, suzuki.poulose@arm.com, linus.walleij@linaro.org, will.deacon@arm.com, yamada.masahiro@socionext.com
List-Id: devicetree@vger.kernel.org

On Wed, Dec 14, 2016 at 06:12:36PM -0500, Sebastien Bourdelin wrote:
> This watchdog is instantiated in a FPGA and can only be access using a
> GPIOs bit-banged bus, called the NBUS by Technologic Systems.
> The watchdog is made of only one register, called the feed register.
> Writing to this register will re-arm the watchdog for a given time (and
> enable it if it was disable). It can be disabled by writing a special
> value into it.
> 
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
> ---
>  .../devicetree/bindings/watchdog/ts4600-wdt.txt    |  16 ++
>  arch/arm/boot/dts/imx28-ts4600-common.dtsi         |   5 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/watchdog/Kconfig                           |  10 +
>  drivers/watchdog/Makefile                          |   1 +
>  drivers/watchdog/ts4600_wdt.c                      | 213 +++++++++++++++++++++
>  5 files changed, 245 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/ts4600-wdt.txt
>  create mode 100644 drivers/watchdog/ts4600_wdt.c
