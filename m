From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] arm: dts: socfpga: denali needs nand_x_clk too
Date: Fri, 22 Jun 2018 23:37:21 +0900
Message-ID: <CAK7LNASgPa4D0Siyo3mvK_AJ2zaECDXGaMEn-iNzQ9PFXFir+w@mail.gmail.com>
References: <20180619120719.26921-1-richard@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619120719.26921-1-richard@nod.at>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Weinberger <richard@nod.at>
Cc: DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon <boris.brezillon@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi Richard,


2018-06-19 21:07 GMT+09:00 Richard Weinberger <richard@nod.at>:
> The denali NAND flash controller needs at least two clocks to operate,
> nand_clk and nand_x_clk.
> Since 1bb88666775e ("mtd: nand: denali: handle timing parameters by
> setup_data_interface()") nand_x_clk is used to derive timing settings.
>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
> Strictly speaking denali needs a ecc_clk too, but AFAIK such a clock
> is not present on this SoC.
> But my SoCFPGA knowledge is very limited.
>
> Thanks,
> //richard
> ---
>  arch/arm/boot/dts/socfpga.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
> index 486d4e7433ed..562f7b375bbd 100644
> --- a/arch/arm/boot/dts/socfpga.dtsi
> +++ b/arch/arm/boot/dts/socfpga.dtsi
> @@ -754,7 +754,8 @@
>                         reg-names = "nand_data", "denali_reg";
>                         interrupts = <0x0 0x90 0x4>;
>                         dma-mask = <0xffffffff>;
> -                       clocks = <&nand_clk>;
> +                       clocks = <&nand_clk>, <&nand_x_clk>;
> +                       clock-names = "nand", "nand_x";


IMHO, this should be

                          clocks = <&nand_clk>, <&nand_x_clk>, <&nand_x_clk>;
                          clock-names = "nand", "nand_x", "ecc";



A clock consumer (Denali in this case) should generally
take the same number of clocks across SoCs.

It is just some SoCs tie clocks together.

It is the case for my UniPhier platform;
"nand_x" and "ecc" are tied up because they are both 200MHz.


SOCFPGA supports HW ECC correction, thus it surely needs ecc clock.


>                         status = "disabled";
>                 };
>
> --
> 2.17.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
