From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] ARM64: dts: meson-gxbb: p20x: add card regulator settle times
Date: Tue, 01 Aug 2017 12:49:09 -0700
Message-ID: <7h1sovysp6.fsf@baylibre.com>
References: <20170801152224.15754-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170801152224.15754-1-jbrunet@baylibre.com> (Jerome Brunet's
        message of "Tue, 1 Aug 2017 17:22:24 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Changing the card voltage on the p200 is not instantaneous, especially
> when switching from 3.3v to 1.8v.
>
> I take at least 70ms for the regulator to go from 3.3v to 1.8v. Add
> margin to that to make sure we don't upset the sdcard during the voltage
> switch
>
> Fixes: ef8d2ffedf18 ("ARM64: dts: meson-gxbb: add MMC support")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied to v4.14/dt64,

Thanks,

Kevin
