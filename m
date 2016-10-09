From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] pinctrl: Add SX150X GPIO Extender Pinctrl Driver
Date: Sat, 8 Oct 2016 20:29:48 -0500
Message-ID: <20161009012948.GZ18158@rob-hp-laptop>
References: <1474991325-1754-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1474991325-1754-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linus.walleij@linaro.org, peda@axentia.se, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Wei.Chen@csr.com, stigge@antcom.de, vladimir_zapolskiy@mentor.com
List-Id: devicetree@vger.kernel.org

On Tue, Sep 27, 2016 at 05:48:45PM +0200, Neil Armstrong wrote:
> Since the I2C sx150x GPIO expander driver uses platform_data to manage
> the pins configurations, rewrite the driver as a pinctrl driver using
> pinconf to get/set pin configurations from DT or debugfs.
> 
> The pinctrl driver is functionnally equivalent as the gpio-only driver
> and can use DT for pinconf. The platform_data confirmation is dropped.
> 
> This patchset removed the gpio-only driver and selects the Pinctrl driver
> config instead. This patchset also migrates the gpio dt-bindings to pinctrl
> and add the pinctrl optional properties.
> 
> The driver was tested with a SX1509 device on a BeagleBone black with
> interrupt support and on an X86_64 machine over an I2C to USB converter.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> This is a fixed version that builds and runs on non-OF platforms and on
> arm based OF. The GPIO version is removed and the bindings are also moved
> to the pinctrl bindings.
> 
> One remaining question, should i2c_driver remove be implemented ?
> It would be quite hard to implement due to the interrupt controller.
> 
> Changes since v1 at http://lkml.kernel.org/r/1473166599-29266-1-git-send-email-narmstrong@baylibre.com:
>  - Fix Kconfig descriptions on pinctrl and gpio
>  - Fix Kconfig dependency
>  - Remove oscio support for non-789 devices
>  - correct typo in dt bindings
>  - remove probe reset for non-789 devices
> 
> Changes since RFC at http://lkml.kernel.org/r/1472130692-14404-1-git-send-email-narmstrong@baylibre.com:
>  - Put #ifdef CONFIG_OF/CONFIG_OF_GPIO to remove OF code for non-of platforms
>  - No more rely on OF_GPIO config
>  - Moved and enhanced bindings to pinctrl bindings
>  - Removed gpio-sx150x.c
>  - Temporary select PINCTRL_SX150X when GPIO_SX150X
>  - Temporary mark GPIO_SX150X as deprecated
> 
> 
>  .../gpio-sx150x.txt => pinctrl/pinctrl-sx150x.txt} |   46 +-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/gpio/Kconfig                               |   13 +-
>  drivers/gpio/Makefile                              |    1 -
>  drivers/pinctrl/Kconfig                            |   14 +
>  drivers/pinctrl/Makefile                           |    1 +
>  .../gpio-sx150x.c => pinctrl/pinctrl-sx150x.c}     | 1179 ++++++++++++--------
>  6 files changed, 782 insertions(+), 472 deletions(-)
>  rename Documentation/devicetree/bindings/{gpio/gpio-sx150x.txt => pinctrl/pinctrl-sx150x.txt} (40%)
>  rename drivers/{gpio/gpio-sx150x.c => pinctrl/pinctrl-sx150x.c} (24%)
