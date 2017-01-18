From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 2/2] ARM64: dts: meson-gx: add the missing uart_AO_B
Date: Wed, 18 Jan 2017 13:43:35 -0800
Message-ID: <m2shogyrg8.fsf@baylibre.com>
References: <20170115222029.8271-1-martin.blumenstingl@googlemail.com>
        <20170115222029.8271-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170115222029.8271-3-martin.blumenstingl@googlemail.com>
        (Martin Blumenstingl's message of "Sun, 15 Jan 2017 23:20:29 +0100")
Sender: linux-gpio-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, carlo@caione.org, will.deacon@arm.com, catalin.marinas@arm.com, mark.rutland@arm.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> This adds the missing node for the uart_AO_B port to the meson-gx.dtsi
> (as this is supported by GXBB, GXL and GXM) along with the required
> pinctrl pins. This is required as some boards are using it (the boards
> from the Khadas VIM series for example have it exposed on the pin
> headers).
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied to v4.11/dt64.

Kevin
