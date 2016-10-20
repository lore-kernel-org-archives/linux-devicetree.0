From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: Add SX150X GPIO Extender Pinctrl Driver
Date: Fri, 21 Oct 2016 00:08:01 +0200
Message-ID: <CACRpkdbZfLMGndsMvueXA6jvsX62tyKjikz1FzpKW+yL=weoXA@mail.gmail.com>
References: <1474991325-1754-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1474991325-1754-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Peter Rosin <peda@axentia.se>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Wei Chen <Wei.Chen@csr.com>, Roland Stigge <stigge@antcom.de>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 27, 2016 at 5:48 PM, Neil Armstrong <narmstrong@baylibre.com> wrote:

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

I think we're ready to apply this to the GPIO and pinctrl trees.
Could you:

- Rebase on top of v4.9-rc1 (fails to apply for me)
- Add the collected ACKs
- See if Andrey can provide an additional Test tag
- Resend

Also please look at Andreys patches to see if there is some good
inspiration for further cleanups.

Yours,
Linus Walleij
