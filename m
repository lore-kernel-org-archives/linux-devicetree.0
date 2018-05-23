From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 0/4] ARM64: dts: meson-axg: i2c updates
Date: Wed, 23 May 2018 10:06:00 -0700
Message-ID: <7hd0xms3nr.fsf@baylibre.com>
References: <20180517093100.22225-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180517093100.22225-1-jbrunet@baylibre.com> (Jerome Brunet's
        message of "Thu, 17 May 2018 11:30:56 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Carlo Caione <carlo@caione.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset fixes a few problems found in the i2c nodes of
> amlogic's meson-axg platform. It also adds the missing pins for
> AO controller so we can use it on the S400
>
> This series has been tested on the S400 board.
>
> Jerome Brunet (4):
>   ARM64: dts: meson-axg: clean-up i2c nodes
>   ARM64: dts: meson-axg: correct i2c AO clock
>   ARM64: dts: meson-axg: add i2c AO pins
>   ARM64: dts: meson-axg: enable i2c AO on the S400 board

Applied to v4.18/dt64,

Kevin
