From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 0/2] net: stmmac: dwmac-meson: 100M phy mode support
 for AXG SoC
Date: Tue, 01 May 2018 11:30:22 -0400 (EDT)
Message-ID: <20180501.113022.616723559128209395.davem@davemloft.net>
References: <20180428102111.18384-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180428102111.18384-1-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yixun.lan@amlogic.com
Cc: netdev@vger.kernel.org, khilman@baylibre.com, carlo@caione.org, robh@kernel.org, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Yixun Lan <yixun.lan@amlogic.com>
Date: Sat, 28 Apr 2018 10:21:09 +0000

> Due to the dwmac glue layer register changed, we need to 
> introduce a new compatible name for the Meson-AXG SoC
> to support for the RMII 100M ethernet PHY.
> 
> Change since v1 at [1]:
>   - implement set_phy_mode() for each SoC
> 
> [1] https://lkml.kernel.org/r/20180426160508.29380-1-yixun.lan@amlogic.com

Series applied, thank you.
