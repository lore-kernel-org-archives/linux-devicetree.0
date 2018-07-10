From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 1/2] ARM: dts: arria10: update NAND clocking
Date: Tue, 10 Jul 2018 10:31:14 +0900
Message-ID: <CAK7LNARAVSK5VY=_RfO2PXJCAnXJN3sXoAY=ijSwVojeo=c66w@mail.gmail.com>
References: <1531176063-30140-1-git-send-email-dinguyen@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1531176063-30140-1-git-send-email-dinguyen@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Marek Vasut <marex@denx.de>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

2018-07-10 7:41 GMT+09:00 Dinh Nguyen <dinguyen@kernel.org>:
> The NAND IP needs 2 clocks(nand_x_clk and nand_clk). This patch adds a
> nand_x_clk, which is derived from the nand_clk, but has a fixed divider
> of 4.
>
> Update the NAND node to use the additional clock.
>
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
>  arch/arm/boot/dts/socfpga_arria10.dtsi | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
> index a4dcb68..558b5ea 100644
> --- a/arch/arm/boot/dts/socfpga_arria10.dtsi
> +++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
> @@ -377,13 +377,21 @@
>                                                 clk-gate = <0xC8 11>;
>                                         };
>
> -                                       nand_clk: nand_clk {
> +                                       nand_x_clk: nand_x_clk {
>                                                 #clock-cells = <0>;
>                                                 compatible = "altr,socfpga-a10-gate-clk";
>                                                 clocks = <&l4_mp_clk>;
>                                                 clk-gate = <0xC8 10>;
>                                         };
>
> +                                       nand_clk: nand_clk {
> +                                               #clock-cells = <0>;
> +                                               compatible = "altr,socfpga-a10-gate-clk";
> +                                               clocks = <&nand_x_clk>;
> +                                               fixed-divider = <4>;
> +                                               clk-gate = <0xC8 10>;
> +                                       };
> +
>                                         spi_m_clk: spi_m_clk {
>                                                 #clock-cells = <0>;
>                                                 compatible = "altr,socfpga-a10-gate-clk";
> @@ -650,7 +658,8 @@
>                         reg-names = "nand_data", "denali_reg";
>                         interrupts = <0 99 4>;
>                         dma-mask = <0xffffffff>;
> -                       clocks = <&nand_clk>;
> +                       clocks = <&nand_clk>, <&nand_x_clk>;
> +                       clock-names = "nand", "nand_x";


Doesn't SOCFPGA really need the ECC clock?

SOCFPGA has HW ECC engine.


I suggested to add ECC clock, and Richard agreed.
https://lkml.org/lkml/2018/6/22/573





>                         status = "disabled";
>                 };
>
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
