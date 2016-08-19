From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v4 4/6] media: rc: meson-ir: Add support for newer versions of the IR decoder
Date: Fri, 19 Aug 2016 15:28:22 -0700
Message-ID: <7hy43s5r7d.fsf@baylibre.com>
References: <20160628191802.21227-1-martin.blumenstingl@googlemail.com>
        <20160819215547.20063-1-martin.blumenstingl@googlemail.com>
        <20160819215547.20063-5-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160819215547.20063-5-martin.blumenstingl@googlemail.com>
        (Martin Blumenstingl's message of "Fri, 19 Aug 2016 23:55:45 +0200")
Sender: linux-gpio-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, narmstrong@baylibre.com, carlo@caione.org, linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, mchehab@kernel.org, will.deacon@arm.com, catalin.marinas@arm.com, mark.rutland@arm.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> From: Neil Armstrong <narmstrong@baylibre.com>
>
> Newer SoCs (Meson 8b and GXBB) are using REG2 (offset 0x20) instead of
> REG1 to configure the decoder mode. This makes it necessary to
> introduce new bindings so the driver knows which register has to be
> used.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

Mauro, are you the one to pick up new media/rc drivers?  Or if you
prefer, with your ack, I'll take this along with the DT and submit via
arm-soc.

Thanks,

Kevin
