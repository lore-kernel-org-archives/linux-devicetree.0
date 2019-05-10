From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 5/5] arm64: dts: meson: sei510: add network support
Date: Fri, 10 May 2019 15:45:16 -0700
Message-ID: <7ho94ac4jn.fsf@baylibre.com>
References: <20190510164940.13496-1-jbrunet@baylibre.com> <20190510164940.13496-6-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190510164940.13496-6-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Enable the network interface of the SEI510 which use the internal PHY.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

I tried testing this series on SEI510, but I must still be missing some
defconfig options, as the default defconfig doesn't lead to a working
interface.


I tried adding this kconfig fragment[1], and the dwmac probes/inits but
I must still be missing something, as the dwmac is still failing to find
a PHY.  Boot log: https://termbin.com/ivf3

I have the same result testing on the u200.

Kevin

[1] amlogic network kconfig fragment
CONFIG_STMMAC_ETH=y

# following are needed, but automatically enabled if above is set
#CONFIG_STMMAC_PLATFORM=m
#CONFIG_DWMAC_MESON=m

CONFIG_PHYLIB=y
CONFIG_MICREL_PHY=y
CONFIG_REALTEK_PHY=y

CONFIG_MDIO_BUS_MUX_MESON_G12A=y
CONFIG_MESON_GXL_PHY=y
