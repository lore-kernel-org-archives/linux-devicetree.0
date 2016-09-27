From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v2] pinctrl: Add SX150X GPIO Extender Pinctrl Driver
Date: Tue, 27 Sep 2016 18:18:20 +0200
Message-ID: <83197184-4138-5b21-13e8-3b64787abe46@axentia.se>
References: <1474991325-1754-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1474991325-1754-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Wei.Chen@csr.com, stigge@antcom.de, vladimir_zapolskiy@mentor.com
List-Id: devicetree@vger.kernel.org

On 2016-09-27 17:48, Neil Armstrong wrote:
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

Works here for sx1502 (without interrupts) on a custom arm board (SAMA5D3).

Tested-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

