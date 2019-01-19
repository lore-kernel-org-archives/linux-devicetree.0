From: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [v2,3/3] mtd: spi-nor: mtk-quadspi: rename config to a common one
Date: Sat, 19 Jan 2019 16:42:35 +0100
Message-ID: <20190119154235.3665-1-bbrezillon@kernel.org>
References: <761c9a0a482795dbc48949e982ab46987b737e08.1547538621.git.ryder.lee@mediatek.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <761c9a0a482795dbc48949e982ab46987b737e08.1547538621.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>, Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, devicetree@vger.kernel.org, Weijie Gao <weijie.gao@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 2019-01-16 at 02:12:05 UTC, Ryder Lee wrote:
> The quadspi is a generic communication interface which could be shared
> with other MediaTek SoCs. Hence rename it to a common one.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to http://git.infradead.org/linux-mtd.git spi-nor/next, thanks.

Boris
