From: Julia Cartwright <julia@ni.com>
Subject: Re: [PATCH 2/2] ARM: zynq: Fix W=1 dtc 1.4 warnings
Date: Tue, 15 Nov 2016 09:46:08 -0600
Message-ID: <20161115154608.GH30999@jcartwri.amer.corp.natinst.com>
References: <2d42e25d7dd03e562e12e71fd037837737115940.1479218844.git.michal.simek@xilinx.com>
 <90eca8dfcdcef68ce5fe39f2329c4b61d2662598.1479218844.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <90eca8dfcdcef68ce5fe39f2329c4b61d2662598.1479218844.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org, S?ren Brinkmann <soren.brinkmann@xilinx.com>, devicetree@vger.kernel.org, monstr@monstr.eu, Steffen Trumtrar <s.trumtrar@pengutronix.de>, linux-kernel@vger.kernel.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 15, 2016 at 03:07:27PM +0100, Michal Simek wrote:
> The patch removes these warnings reported by dtc 1.4:
> Warning (unit_address_vs_reg): Node /pmu has a reg or ranges property,
> but no unit name
> Warning (unit_address_vs_reg): Node /fixedregulator@0 has a unit name,
> but no reg property
> Warning (unit_address_vs_reg): Node /memory has a reg or ranges
> property, but no unit name
> 
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Reviewed-by: Julia Cartwright <julia@ni.com>
>
> ---
> 
>  arch/arm/boot/dts/zynq-7000.dtsi      | 4 ++--
>  arch/arm/boot/dts/zynq-parallella.dts | 2 +-
>  arch/arm/boot/dts/zynq-zc702.dts      | 2 +-
>  arch/arm/boot/dts/zynq-zc706.dts      | 2 +-
>  arch/arm/boot/dts/zynq-zed.dts        | 2 +-
>  arch/arm/boot/dts/zynq-zybo.dts       | 2 +-
>  6 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
> index f47a6c1cc752..402b5bbe3b5b 100644
> --- a/arch/arm/boot/dts/zynq-7000.dtsi
> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> @@ -42,14 +42,14 @@
>  		};
>  	};
>  
> -	pmu {
> +	pmu@f8891000 {
>  		compatible = "arm,cortex-a9-pmu";
>  		interrupts = <0 5 4>, <0 6 4>;
>  		interrupt-parent = <&intc>;
>  		reg = < 0xf8891000 0x1000 0xf8893000 0x1000 >;

Style nit: we should drop the space before/after '<' and '>'; and,
perhaps separate the entries to be a bit more readable:

   reg = <0xf8891000 0x1000>,
         <0xf8893000 0x1000>;

Thanks,

   Julia
