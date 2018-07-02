From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 0/5] mtd: rawnand: denali: add new clocks and improve
 setup_data_interface
Date: Mon, 2 Jul 2018 14:28:40 +0200
Message-ID: <20180702142840.42801396@xps13>
References: <1529683598-25783-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529683598-25783-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Masahiro,

Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Sat, 23 Jun
2018 01:06:33 +0900:

> The ->setup_data_interface() hook needs to know the clock frequency.
> In fact, this IP needs three clocks, but the current driver does not
> represent it.  Thus, it is hard to understand what is the correct
> clock frequency.
> (at least, clock property is not described in the DT-binding at all.)
> 
> This series adds more clocks based on the IP datasheet, and document
> it in the DT binding.
> In the new binding, three clocks are required: core clock, bus interface
> clock, ECC engine clock.
> 
> 1/5 is a backport candidate to fix SOCFPGA.
> 
> 
> Masahiro Yamada (5):
>   mtd: rawnand: denali_dt: set clk_x_rate to 200 MHz unconditionally
>   mtd: rawnand: denali_dt: use dev as a shorthand of &pdev->dev
>   dt-binding: mtd: denali_dt: document clock property
>   mtd: rawnand: denali_dt: add more clocks based on IP datasheet
>   mtd: rawnand: denali: optimize timing parameters for data interface

Applied patches 2-5/5 to nand/next on top of v4-18.rc3 (to have the fix
1/5).

Thanks,
Miquèl
