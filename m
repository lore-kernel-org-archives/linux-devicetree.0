From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/5] ARM: meson: enable gpio interrupt controller
Date: Mon, 30 Oct 2017 09:28:28 +0100
Message-ID: <7ho9opujir.fsf@baylibre.com>
References: <20171019120143.20581-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171019120143.20581-1-jbrunet@baylibre.com> (Jerome Brunet's
        message of "Thu, 19 Oct 2017 14:01:38 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Carlo Caione <carlo@caione.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset enables gpio interrupt controller found on the meson SoC
> family. ATM, it supports meson8b, gxbb and gxl. The meson8 has been left
> out because I don't have the documentation of this particular SoC.
>
> The last patch uses the interrupts provided by this controller with the
> external ethernet PHY found on a few platforms.
>
> Jerome Brunet (5):
>   ARM: meson: enable MESON_IRQ_GPIO in Kconfig for meson8b
>   ARM64: meson: enable MESON_IRQ_GPIO in Kconfig
>   ARM: dts: meson8b: enable gpio interrupt controller
>   ARM64: dts: meson-gx: add gpio interrupt controller
>   ARM64: dts: meson-gx: add external PHY interrupt on some platforms

Applied,

Kevin
