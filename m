From: Sagar Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH 3/3] riscv: dts: Add DT node for SiFive FU540 Ethernet
 controller driver
Date: Fri, 19 Jul 2019 17:23:45 +0530
Message-ID: <CAARK3H=D1N8gO0Z82_MCtgr5DtT1=E0wzYbn-y451ASgxV-qBg@mail.gmail.com>
References: <1563534631-15897-1-git-send-email-yash.shah@sifive.com> <1563534631-15897-3-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1563534631-15897-3-git-send-email-yash.shah@sifive.com>
Sender: netdev-owner@vger.kernel.org
To: Yash Shah <yash.shah@sifive.com>
Cc: davem@davemloft.net, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>, nicolas.ferre@microchip.com, Sachin Ghadi <sachin.ghadi@sifive.com>, ynezz@true.cz
List-Id: devicetree@vger.kernel.org

The series looks good to me.

Reviewed-by: Sagar Kadam <sagar.kadam@sifive.com>

On Fri, Jul 19, 2019 at 4:41 PM Yash Shah <yash.shah@sifive.com> wrote:
>
> DT node for SiFive FU540-C000 GEMGXL Ethernet controller driver added
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi          | 15 +++++++++++++++
>  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts |  9 +++++++++
>  2 files changed, 24 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> index cc73522..588669f0 100644
> --- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> @@ -231,5 +231,20 @@
>                         #size-cells = <0>;
>                         status = "disabled";
>                 };
> +               eth0: ethernet@10090000 {
> +                       compatible = "sifive,fu540-c000-gem";
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <53>;
> +                       reg = <0x0 0x10090000 0x0 0x2000
> +                              0x0 0x100a0000 0x0 0x1000>;
> +                       local-mac-address = [00 00 00 00 00 00];
> +                       clock-names = "pclk", "hclk";
> +                       clocks = <&prci PRCI_CLK_GEMGXLPLL>,
> +                                <&prci PRCI_CLK_GEMGXLPLL>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +
>         };
>  };
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> index 0b55c53..85c17a7 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> @@ -76,3 +76,12 @@
>                 disable-wp;
>         };
>  };
> +
> +&eth0 {
> +       status = "okay";
> +       phy-mode = "gmii";
> +       phy-handle = <&phy1>;
> +       phy1: ethernet-phy@0 {
> +               reg = <0>;
> +       };
> +};
> --
> 1.9.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
