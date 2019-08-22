From: Mars Cheng <mars.cheng@mediatek.com>
Subject: Re: [PATCH v2 11/11] arm64: dts: add dts nodes for MT6779
Date: Thu, 22 Aug 2019 08:46:04 +0800
Message-ID: <1566434764.14794.2.camel@mtkswgap22>
References: <1566206502-4347-1-git-send-email-mars.cheng@mediatek.com>
         <1566206502-4347-12-git-send-email-mars.cheng@mediatek.com>
         <adec38bf-735b-9131-2b9d-1e427d47f88d@kernel.org>
         <1566214950.17081.3.camel@mtkswgap22>
         <c533371d-efcd-59dc-0172-3f5775221302@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c533371d-efcd-59dc-0172-3f5775221302@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <maz@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>, wsd_upstream@mediatek.com, Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Marc

> >>> +	soc {
> >>> +		#address-cells = <2>;
> >>> +		#size-cells = <2>;
> >>> +		compatible = "simple-bus";
> >>> +		ranges;
> >>> +
> >>> +		gic: interrupt-controller@0c000000 {
> >>> +			compatible = "arm,gic-v3";
> >>> +			#interrupt-cells = <3>;
> >>
> >> You also haven't described the CPU PMUs. Depending on how they are wired
> >> (SPIs or PPIs), you may have to change the interrupt-cells property to
> >> include a cell for the PPI partitioning.
> >>
> > 
> > pmu nodes would be:
> > 
> >         pmu {
> >                 compatible = "arm,armv8-pmuv3";
> >                 interrupt-parent = <&gic>;
> >                 interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> >         };
> > 
> >         dsu-pmu-0 {
> >                 compatible = "arm,dsu-pmu";
> >                 interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> >                 cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
> >                         <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
> >         };
> > 
> > so I think interrupt-cells could be <3>, will add pmu nodes in v3.
> 
> No, that's wrong, at least for the CPU pmu node.
> 
> First, you need two of them (one for the A55s, one for the A75s).
> Then you need to partition the corresponding PPI so that they can be
> described as separate affinity sets.
> Finally, this implies that #interrupt-cells goes up to 4, and all the
> interrupts directly routed to the GIC must be updated.
> 
> You should have something like this:
> 
> 	&gic {
> 		ppi-partitions {
> 			cluster0: interrupt-partition-0 {
> 				affinity = <&cpu0 &cpu1 &cpu2
>                                             &cpu3 &cpu4 &cpu5>;
> 			};
> 
> 			cluster1: interrupt-partition-1 {
> 				affinity = <&cpu6 &cpu7>;
> 			};
> 	};
> 
> 	pmu_a55 {
> 		compatible = "arm,cortex-a55-pmu", "arm,armv8-pmuv3";
> 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &cluster0>;
> 	};
> 
> 	pmu_a75 {
> 		compatible = "arm,cortex-a75-pmu", "arm,armv8-pmuv3";
> 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &cluster1>;
> 	};
> 
> Please see the rk3399 usage of the binding, as it is the canonical example.
> 
> > 

Got the idea. Will check rk3399 and fix our part. Thanks for reviewing.
