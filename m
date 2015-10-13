From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH] ARM: socfpga: dts: add fpga manager
Date: Tue, 13 Oct 2015 11:58:12 -0700
Message-ID: <CAAtXAHcOBa-RaMVX4KjUVFFuUso=CwkcneFYmW9mXaJ7KJSSrQ@mail.gmail.com>
References: <1444760900-1373-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444760900-1373-1-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <atull@opensource.altera.com>
Cc: "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Alan Tull <delicious.quinoa@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 13, 2015 at 11:28 AM,  <atull@opensource.altera.com> wrote:
> From: Alan Tull <atull@opensource.altera.com>
>
> Add FPGA manager to device tree for SoCFPGA.
>
> Signed-off-by: Alan Tull <atull@opensource.altera.com>
Reviewed-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>  arch/arm/boot/dts/socfpga.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
> index 314e589..e37ba11 100644
> --- a/arch/arm/boot/dts/socfpga.dtsi
> +++ b/arch/arm/boot/dts/socfpga.dtsi
> @@ -834,5 +834,12 @@
>                         compatible = "altr,sys-mgr", "syscon";
>                         reg = <0xffd08000 0x4000>;
>                 };
> +
> +               hps_0_fpgamgr: fpgamgr@0xff706000 {
> +                       compatible = "altr,socfpga-fpga-mgr";
> +                       reg = <0xFF706000 0x1000
> +                              0xFFB90000 0x1000>;
> +                       interrupts = <0 175 4>;
> +               };
>         };
>  };
> --
> 1.9.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
