From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [v6, 2/2] mtd: spi-nor: cadence-quadspi: Add support for Octal SPI controller
Date: Thu, 14 Feb 2019 14:00:03 +0100
Message-ID: <20190214130003.29783-1-boris.brezillon@collabora.com>
References: <20190212083809.6534-3-vigneshr@ti.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212083809.6534-3-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>, Tudor.Ambarus@microchip.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Boris Brezillon <bbrezillon@kernel.org>

On Tue, 2019-02-12 at 08:38:09 UTC, Vignesh R wrote:
> Cadence OSPI controller IP supports Octal IO (x8 IO lines),
> It also has an integrated PHY. IP register layout is very
> similar to existing QSPI IP except for additional bits to support Octal
> and Octal DDR mode. Therefore, extend current driver to support Octal
> mode. Only Octal SDR read (1-1-8)mode is supported for now.
> 
> Tested with mt35xu512aba Octal flash on TI's AM654 EVM.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to http://git.infradead.org/linux-mtd.git spi-nor/next, thanks.

Boris
