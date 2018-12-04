From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson-axg: remove alternate xtal
Date: Tue, 04 Dec 2018 15:36:22 -0800
Message-ID: <7h5zw8dfux.fsf@baylibre.com>
References: <20181129165451.21446-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181129165451.21446-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> There is actually no alternate xtal on any of the axg board I have
> seen so far. The 32k is actually generated internally, deriving from
> the 24MHz main xtal.
>
> Amlogic SoC also have the option to provide the 32k reference externally,
> through one of the AO pads, but no platform is using this ATM.
>
> Fixes: 5e395e146667 ("ARM64: dts: meson-axg: add an 32K alt aoclk")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queued for v4.21 (branch: v4.21/dt64)

Thanks,

Kevin
