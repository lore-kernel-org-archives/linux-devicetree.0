From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am654: Add Support for MMC/SD
Date: Sat, 8 Dec 2018 09:45:26 -0600
Message-ID: <20181208154526.ivbvwvcx6otg7lvh@akan>
References: <20181207084233.13700-1-faiz_abbas@ti.com>
 <20181207084233.13700-2-faiz_abbas@ti.com>
 <a6aacd53-e1c4-fce0-7712-f276c80bbffc@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a6aacd53-e1c4-fce0-7712-f276c80bbffc@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>
Cc: Faiz Abbas <faiz_abbas@ti.com>, linux-arm-kernel@lists.infradead.org, t-kristo@ti.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, ulf.hansson@linaro.org, adrian.hunter@intel.com, kishon@ti.com, robh+dt@kernel.org, michal.simek@xilinx.com
List-Id: devicetree@vger.kernel.org

On 10:56-20181208, Vignesh R wrote:
> 
> 
> On 07/12/18 2:12 PM, Faiz Abbas wrote:
> > There are two MMC host controller instances present on the TI's
> > Am654 SOCs. Add device tree nodes for the same.
> > 
> > Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
> > ---
> >  arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 28 ++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> > index 916434839603..d07212f16a81 100644
> > --- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> > +++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> > @@ -129,4 +129,32 @@
> >  		clocks = <&k3_clks 113 1>;
> >  		power-domains = <&k3_pds 113>;
> >  	};
> > +
> > +	sdhci0: sdhci@4f80000 {
> > +		compatible = "ti,am654-sdhci-5.1";
> > +		reg = <0x0 0x4f80000 0x0 0x260>, <0x0 0x4f90000 0x0 0x134>;
> > +		power-domains = <&k3_pds 47>;
> > +		clocks = <&k3_clks 47 0>, <&k3_clks 47 1>;
> > +		clock-names = "clk_ahb", "clk_xin";
> > +		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
> > +		sdhci-caps-mask = <0x80000007 0x0>;
> > +		mmc-ddr-1_8v;
> > +		ti,otap-del-sel = <0x2>;
> > +		ti,trm-icp = <0x8>;
> > +		status = "disabled";
> > +	};
> 
> Please drop "status=disabled" from dtsi. Can be disabled as required in
> the board dts.


yes - the standard in k3 is to disable the nodes that are'nt needed in
board.dtsi.

This is different from "disabled by default" approach in DRA7 or OMAP4
for example.

-- 
Regards,
Nishanth Menon
