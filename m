From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 5/5] arm64: dts: meson: sei510: add network support
Date: Sat, 11 May 2019 17:46:45 +0200
Message-ID: <bf1360ab62a4e7bd3928052ebb6c969e8059f29e.camel@baylibre.com>
References: <20190510164940.13496-1-jbrunet@baylibre.com>
         <20190510164940.13496-6-jbrunet@baylibre.com> <7ho94ac4jn.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7ho94ac4jn.fsf@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2019-05-10 at 15:45 -0700, Kevin Hilman wrote:
> Jerome Brunet <jbrunet@baylibre.com> writes:
> 
> > Enable the network interface of the SEI510 which use the internal PHY.
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> 
> I tried testing this series on SEI510, but I must still be missing some
> defconfig options, as the default defconfig doesn't lead to a working
> interface.

That's weird. AFAICT, the net part has hit Linus's tree.
You should have everything needed by default, the mdio mux has

> default m if ARCH_MESON

> 
> 
> I tried adding this kconfig fragment[1], and the dwmac probes/inits but
> I must still be missing something, as the dwmac is still failing to find
> a PHY.  Boot log: https://termbin.com/ivf3
> 
> I have the same result testing on the u200.

I don't any other patch pending for the network of the g12a.
Maybe I've done something wrong while rebasing. I'll check on monday.

> 
> Kevin
> 
> [1] amlogic network kconfig fragment
> CONFIG_STMMAC_ETH=y
> 
> # following are needed, but automatically enabled if above is set
> #CONFIG_STMMAC_PLATFORM=m
> #CONFIG_DWMAC_MESON=m
> 
> CONFIG_PHYLIB=y
> CONFIG_MICREL_PHY=y
> CONFIG_REALTEK_PHY=y
> 
> CONFIG_MDIO_BUS_MUX_MESON_G12A=y
> CONFIG_MESON_GXL_PHY=y
