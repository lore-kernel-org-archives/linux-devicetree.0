From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v3 0/4] net: phy: add Amlogic g12a support
Date: Sat, 06 Apr 2019 18:17:12 -0700 (PDT)
Message-ID: <20190406.181712.1121608163259706596.davem@davemloft.net>
References: <20190404131147.31156-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404131147.31156-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jbrunet@baylibre.com
Cc: andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, khilman@baylibre.com, netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu,  4 Apr 2019 15:11:43 +0200

> This patchset adds the necessary bits to support network on the Amlogic
> g12a SoC family.
> 
> Only the internal PHY and related MDIO mux needed to be addressed.
> The GMAC remains compatible with axg SoC family
> 
> This series has been tested on the u200 (S905D2) with both the internal
> and external (Realtek) PHYs.
> 
> Change since v2 [1]:
> * Change 'clk part' Reviewed-by as suggested
> * Remove default callback from phy drivers
> * Use exact match PHY macros
> * Default MDIO g12a as module if ARCH_MESON is enabled
> * Don't print error on probe defer in the g12a mdio mux
> 
> Change since v1 [0]:
> * drop '_' from function name unrelated to locking
> * fix peripheral clock disable on error
> * fix variable declaration reverse Xmas trees
> * fix Kconfig dependency on CCF
>   (Actually needed for 'struct clk_hw', Thx Andrew !)
> * Minor fix in the DT exemple as reported by Rob
> 
> [0] https://lkml.kernel.org/r/20190314140135.19184-1-jbrunet@baylibre.com
> [1] https://lkml.kernel.org/r/20190329141512.29867-1-jbrunet@baylibre.com

Series applied, thanks.
