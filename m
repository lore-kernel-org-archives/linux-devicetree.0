From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 0/4] ARM: dts: meson: set pinmux bias
Date: Thu, 15 Nov 2018 12:22:41 -0800
Message-ID: <7hbm6qdram.fsf@eze.i-did-not-set--mail-host-address--so-tickle-me>
References: <20181109140445.17795-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181109140445.17795-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Amlogic chipsets, the bias set through pinconf applies to the pad
> itself, not only the GPIO function. This means that even when we change
> the function of the pad from GPIO to anything else, the bias previously
> set still applies.
>
> While trying to boot from SPI, I noticed the eMMC was not working anymore.
> Even if the related eMMC pad are not used by the SPI, the ROM code sets a
> pull-down on the eMMC pad and leaves it that way. This breaks the eMMC
> later on, in both u-boot and Linux.
>
> The underlying issue is that we inherit whatever was left by previous user
> of the pad (pinconf, u-boot or the ROM code). As a consequence, the actual
> setup we get is undefined.
>
> There is nothing mentioned in the documentation about pad bias and pinmux
> function, however leaving it undefined is not an option.
>
> This patchset consistently disable the pad bias for every pinmux functions.
> It seems to work well, we can only assume that the necessary bias (if any)
> is already provided by the pin function itself.
>
> I can't really test every pinmux configuration and it is fairly possible
> I missed something so it would be nice if more people could confirm if
> nothing (new) is broken after applying this series.

I'll queue this up for v4.21/dt64 branch for a bit broader testing.

> One things could be the i2c. Usually the i2c pull-ups are physically
> present on the board but, if they are missing on platform, we may define
> a special pinmux setting with pull-up enabled.
>
> One last gotcha, I recently posted fixups around bias setting to pinctrl
> which have been merged: [0] [1]. These must be applied before applying this
> series, otherwise when requesting 'bias-disable' you'll probably get a
> pull-down instead.

OK, I'll include pinctrl/for-next branch in my 'integ' branch.

Kevin
