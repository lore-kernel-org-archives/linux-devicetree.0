From: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [v2, 2/3] mtd: spi-nor: mtk-quadspi: add SNOR_HWCAPS_READ to spi_nor_hwcaps mask
Date: Sat, 19 Jan 2019 16:42:48 +0100
Message-ID: <20190119154248.3733-1-bbrezillon@kernel.org>
References: <2afa18c0c898259fc244f15844c5319f71e811df.1547538621.git.ryder.lee@mediatek.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2afa18c0c898259fc244f15844c5319f71e811df.1547538621.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>, Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, devicetree@vger.kernel.org, Guochun Mao <guochun.mao@mediatek.com>, Weijie Gao <weijie.gao@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 2019-01-16 at 02:12:04 UTC, Ryder Lee wrote:
> From: Guochun Mao <guochun.mao@mediatek.com>
> 
> SNOR_HWCAPS_READ should be supported by this controller, so add this
> flag to spi_nor_hwcaps mask.
> 
> Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to http://git.infradead.org/linux-mtd.git spi-nor/next, thanks.

Boris
