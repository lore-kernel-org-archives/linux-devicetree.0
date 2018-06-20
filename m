From: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] arm: dts: socfpga: denali needs nand_x_clk too
Date: Wed, 20 Jun 2018 07:27:27 +0200
Message-ID: <1846662.BtIxBD6EoV@blindfold>
References: <20180619120719.26921-1-richard@nod.at> <ba7b5ee8-c9f0-45a1-67ec-3d1f510f6c24@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ba7b5ee8-c9f0-45a1-67ec-3d1f510f6c24@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, computersforpeace@gmail.com, dwmw2@infradead.org, miquel.raynal@bootlin.com, boris.brezillon@bootlin.com, yamada.masahiro@socionext.com, "See, Chin Liang" <chin.liang.see@intel.com>
List-Id: devicetree@vger.kernel.org

Marek,

Am Mittwoch, 20. Juni 2018, 06:52:09 CEST schrieb Marek Vasut:
> On 06/19/2018 02:07 PM, Richard Weinberger wrote:
> > The denali NAND flash controller needs at least two clocks to operate,
> > nand_clk and nand_x_clk.
> > Since 1bb88666775e ("mtd: nand: denali: handle timing parameters by
> > setup_data_interface()") nand_x_clk is used to derive timing settings.
> > 
> > Signed-off-by: Richard Weinberger <richard@nod.at>
> > ---
> > Strictly speaking denali needs a ecc_clk too, but AFAIK such a clock
> > is not present on this SoC.
> > But my SoCFPGA knowledge is very limited.
> > 
> > Thanks,
> > //richard
> 
> It looks sane, but I cannot test it right now, since I'm on vacation.
> I hope Dinh/Chin can jump in.

The patch was tested by me. So, at least it is not completely untested.
BTW: I forgot to mention that it depends on Masahiro's Denali fixes.

Thanks,
//richard
