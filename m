From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: cadence-quadspi: Add new compatible for
 AM654 SoC
Date: Mon, 15 Oct 2018 14:11:12 -0500
Message-ID: <20181015191112.GA6923@bogus>
References: <20181003165603.2579-1-vigneshr@ti.com>
 <20181003165603.2579-3-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181003165603.2579-3-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

On Wed, 3 Oct 2018 22:26:02 +0530, Vignesh R wrote:
> AM654 SoC has Cadence Octal SPI controller, which is similar to Cadence
> QSPI controller but supports Octal IO(x8 data lines) and Double Data
> Rate(DDR) mode. Add new compatible to support OSPI controller on TI's
> AM654 SoCs.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
> ---
>  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
