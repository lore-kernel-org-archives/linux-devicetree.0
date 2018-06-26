From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] arm: dts: socfpga: denali needs nand_x_clk too
Date: Tue, 26 Jun 2018 20:09:28 +0200
Message-ID: <20180626200928.29aca979@xps13>
References: <20180619120719.26921-1-richard@nod.at>
        <CAK7LNASgPa4D0Siyo3mvK_AJ2zaECDXGaMEn-iNzQ9PFXFir+w@mail.gmail.com>
        <3320422.EJ8D6C0VHL@blindfold>
        <d4fdcd1d-db20-1837-a037-0982a042d357@kernel.org>
        <20180625165506.484e025f@bbrezillon>
        <CAK7LNATyo+7gauyQcRmNfCs8CagU1XdpHHgREMeTvf4rqxpeNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNATyo+7gauyQcRmNfCs8CagU1XdpHHgREMeTvf4rqxpeNQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Dinh Nguyen <dinguyen@kernel.org>, Richard Weinberger <richard@nod.at>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek =?UTF-8?B?VmHFoXV0?= <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Masahiro,

On Tue, 26 Jun 2018 11:38:21 +0900, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> 2018-06-25 23:55 GMT+09:00 Boris Brezillon <boris.brezillon@bootlin.com>:
> > On Mon, 25 Jun 2018 09:50:18 -0500
> > Dinh Nguyen <dinguyen@kernel.org> wrote:
> >  
> >> On 06/22/2018 10:58 AM, Richard Weinberger wrote:  
> >> > Masahiro,
> >> >
> >> > Am Freitag, 22. Juni 2018, 16:37:21 CEST schrieb Masahiro Yamada:  
> >> >> Hi Richard,
> >> >>
> >> >>
> >> >> 2018-06-19 21:07 GMT+09:00 Richard Weinberger <richard@nod.at>:  
> >> >>> The denali NAND flash controller needs at least two clocks to operate,
> >> >>> nand_clk and nand_x_clk.
> >> >>> Since 1bb88666775e ("mtd: nand: denali: handle timing parameters by
> >> >>> setup_data_interface()") nand_x_clk is used to derive timing settings.
> >> >>>
> >> >>> Signed-off-by: Richard Weinberger <richard@nod.at>
> >> >>> ---
> >> >>> Strictly speaking denali needs a ecc_clk too, but AFAIK such a clock
> >> >>> is not present on this SoC.
> >> >>> But my SoCFPGA knowledge is very limited.
> >> >>>
> >> >>> Thanks,
> >> >>> //richard
> >> >>> ---
> >> >>>  arch/arm/boot/dts/socfpga.dtsi | 3 ++-
> >> >>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >> >>>
> >> >>> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
> >> >>> index 486d4e7433ed..562f7b375bbd 100644
> >> >>> --- a/arch/arm/boot/dts/socfpga.dtsi
> >> >>> +++ b/arch/arm/boot/dts/socfpga.dtsi
> >> >>> @@ -754,7 +754,8 @@
> >> >>>                         reg-names = "nand_data", "denali_reg";
> >> >>>                         interrupts = <0x0 0x90 0x4>;
> >> >>>                         dma-mask = <0xffffffff>;
> >> >>> -                       clocks = <&nand_clk>;
> >> >>> +                       clocks = <&nand_clk>, <&nand_x_clk>;
> >> >>> +                       clock-names = "nand", "nand_x";  
> >> >>
> >> >>
> >> >> IMHO, this should be
> >> >>
> >> >>                           clocks = <&nand_clk>, <&nand_x_clk>, <&nand_x_clk>;
> >> >>                           clock-names = "nand", "nand_x", "ecc";  
> >>
> >> No, it should be just the nand_x and ecc.
> >>
> >> There's already a patch to use the nand_x_clk and not the nand_clk.  
> 
> 
> Different people try to fix the problem in different ways.
> 
> I think it is due to miscommunication across sub-systems.

Is the series named

        mtd: rawnand: denali: add new clocks and improve
    	                      setup_data_interface

still valid?

I am about to apply it (patches 2/5 to 5/5) but it looks like the
discussion is still ongoing.

Thanks,
Miquèl
