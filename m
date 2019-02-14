From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [v6, 1/2] dt-bindings: cadence-quadspi: Add new compatible for AM654 SoC
Date: Thu, 14 Feb 2019 14:00:11 +0100
Message-ID: <20190214130011.29845-1-boris.brezillon@collabora.com>
References: <20190212083809.6534-2-vigneshr@ti.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212083809.6534-2-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>, Tudor.Ambarus@microchip.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Boris Brezillon <bbrezillon@kernel.org>

On Tue, 2019-02-12 at 08:38:08 UTC, Vignesh R wrote:
> AM654 SoC has Cadence Octal SPI controller, which is similar to Cadence
> QSPI controller but supports Octal IO(x8 data lines) and Double Data
> Rate(DDR) mode. Add new compatible to support OSPI controller on TI's
> AM654 SoCs.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to http://git.infradead.org/linux-mtd.git spi-nor/next, thanks.

Boris
