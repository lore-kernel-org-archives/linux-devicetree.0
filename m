From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: cadence-qspi:add support for
 Intel lgm-qspi
Date: Mon, 02 Sep 2019 14:39:17 +0100
Message-ID: <5d6d1b85.1c69fb81.96938.0315@mx.google.com>
References: <20190827035827.21024-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190827035827.21024-2-vadivel.muruganx.ramuthevar@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190827035827.21024-2-vadivel.muruganx.ramuthevar@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at, jwboyer@gmail.com, boris.brezillon@free-electrons.com, cyrille.pitchen@atmel.com, david.oberhollenzer@sigma-star.at, miquel.raynal@bootlin.com, tudor.ambarus@gmail.com, vigneshr@ti.com, andriy.shevchenko@intel.com, cheol.yong.kim@intel.com, qi-ming.wu@intel.com, Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Tue, 27 Aug 2019 11:58:25 +0800, "Ramuthevar,Vadivel MuruganX"          wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Add new vendor specific compatible string to check Intel's Lightning
> Mountain(LGM) QSPI features enablement in cadence-quadspi driver.
> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
