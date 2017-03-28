From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 0/8] pinctrl: meson: add audio output pins
Date: Tue, 28 Mar 2017 12:33:53 -0700
Message-ID: <m2inmt9owu.fsf@baylibre.com>
References: <20170326171923.19269-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170326171923.19269-1-jbrunet@baylibre.com> (Jerome Brunet's
        message of "Sun, 26 Mar 2017 19:19:15 +0200")
Sender: linux-gpio-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Carlo Caione <carlo@caione.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset adds the pinctrl definition and the related device-tree
> bindings of the i2s output and spdif output pins on the meson gxbb and
> gxl SoCs.
>
> This is part of the ongoing work to bring audio output support on the
> meson family. It was tested on the gxbb p200 and gxl p230.
>
> Changes since v1: [0]
> * add a few comments in the changelog
> * patched rebased on pinctrl/for-next + Neil patch on missing pins [1]
>
> [0]: https://marc.info/?i=20170323165101.29262-1-jbrunet%40baylibre.com
> [1]: https://marc.info/?i=20170323104112.16558-2-narmstrong%40baylibre.com
>
> Jerome Brunet (8):
>   pinctrl: meson: gxbb: add i2s output pins
>   pinctrl: meson: gxbb: add spdif output pins
>   pinctrl: meson: gxl: add i2s output pins
>   pinctrl: meson: gxl: add spdif output pins
>   ARM64: dts: meson-gxbb: add i2s output pins
>   ARM64: dts: meson-gxbb: add spdif output pins
>   ARM64: dts: meson-gxl: add i2s output pins
>   ARM64: dts: meson-gxl: add spdif output pins

DT patches applied to amlogic v4.12/dt64 branch,

Thanks for the respin,

Kevin
