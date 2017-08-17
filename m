From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/5] mtd: spi-nor: cadence-quadspi: Add new binding to
 enable loop-back circuit
Date: Thu, 17 Aug 2017 17:00:56 -0500
Message-ID: <20170817220056.q572ix5kzjawf2gf@rob-hp-laptop>
References: <20170816045053.15492-1-vigneshr@ti.com>
 <20170816045053.15492-4-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170816045053.15492-4-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 16, 2017 at 10:20:51AM +0530, Vignesh R wrote:
> Cadence QSPI IP has a adapted loop-back circuit which can be enabled by
> setting BYPASS field to 0 in READCAPTURE register. It enables use of
> QSPI return clock to latch the data rather than the internal QSPI
> reference clock. For high speed operations, adapted loop-back circuit
> using QSPI return clock helps to increase data valid window.
> 
> Add DT parameter cdns,rclk-en to help enable adapted loop-back circuit
> for boards which do have QSPI return clock provided. Update binding
> documentation for the same.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
> ---
>  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
