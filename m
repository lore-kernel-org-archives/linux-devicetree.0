From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 0/5] arm64: dts: meson: g12a: add ethernet support
Date: Mon, 20 May 2019 10:49:26 -0700
Message-ID: <7himu58195.fsf@baylibre.com>
References: <20190520131401.11804-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520131401.11804-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Add network support to the g12a SoC family
>
> This is series is based on 5.2-rc1 and the patches I already sent last
> week. If this is not convient for you, please let me know, I'll rebase.

Could you apply this on top of the "consistently order nodes" patches
that are already in my v5.3/dt64 branch?

More specifically, if you rebase this onto this commit[1], I'll be able
to easily replace the v1 of this series that's already in v5.3/dt64.

Kevin

[1] 5b9533f6de2a arm64: dts: meson: u200: consistently order nodes

> Also, you will need to get the clk tag "clk-meson-5.3-1-fixes" (to get
> the update MPLL50M id) from clk-meson [0].
>
> Changes since v1: [1]
>  * rebased on v5.2-rc1
>  * s/eth_rmii_pins/eth_pins
>  * fix MPLL50M typo
>
> [0]: git://github.com/BayLibre/clk-meson.git
> [1]: https://lkml.kernel.org/r/20190510164940.13496-1-jbrunet@baylibre.com
>
> Jerome Brunet (5):
>   arm64: dts: meson: g12a: add ethernet mac controller
>   arm64: dts: meson: g12a: add ethernet pinctrl definitions
>   arm64: dts: meson: g12a: add mdio multiplexer
>   arm64: dts: meson: u200: add internal network
>   arm64: dts: meson: sei510: add network support
>
>  .../boot/dts/amlogic/meson-g12a-sei510.dts    |  7 ++
>  .../boot/dts/amlogic/meson-g12a-u200.dts      |  7 ++
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 90 +++++++++++++++++++
>  3 files changed, 104 insertions(+)
>
> -- 
> 2.20.1
