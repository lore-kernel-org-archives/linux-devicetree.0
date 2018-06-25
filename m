From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 3/5] dt-binding: mtd: denali_dt: document clock
 property
Date: Mon, 25 Jun 2018 09:59:59 -0600
Message-ID: <20180625155959.GA2820@rob-hp-laptop>
References: <1529683598-25783-1-git-send-email-yamada.masahiro@socionext.com>
 <1529683598-25783-4-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1529683598-25783-4-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Sat, Jun 23, 2018 at 01:06:36AM +0900, Masahiro Yamada wrote:
> Commit 30f9f2fb7ba0 ("mtd: denali: add a DT driver") supported the
> clock enablement, but did not document it in the DT binding.
> 
> In addition to the existing clock, this commit adds more clocks based
> on the IP specification.
> 
> According to the Denali User's Guide, this IP needs three clocks:
> 
>  - clk: controller core clock
> 
>  - clk_x: bus interface clock
> 
>  - ecc_clk: clock at which ECC circuitry is run
> 
> The driver should accept the current single clock for the backward
> compatibility, but the DT binding should represent the real hardware,
> and future platforms must follow this.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v4:
>   - split into a separate patch
> 
> 
>  Documentation/devicetree/bindings/mtd/denali-nand.txt | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
