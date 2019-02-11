From: Seiya Wang <seiya.wang@mediatek.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: mt8173: add pmu nodes for mt8173
Date: Mon, 11 Feb 2019 13:20:03 +0800
Message-ID: <1549862403.22817.11.camel@mtksdccf07>
References: <20190109082143.26468-1-seiya.wang@mediatek.com>
         <38a56fc1-09fa-a35a-fcef-e265f1608b83@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <38a56fc1-09fa-a35a-fcef-e265f1608b83@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Fri, 2019-02-08 at 16:04 +0100, Matthias Brugger wrote:
> 
> On 09/01/2019 09:21, Seiya Wang wrote:
> > This patch adds the device nodes of ARM Performance Monitor Uint
> > for mt8173.
> > 
> > Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > index 412ffd4d426b..44374c506a1c 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > @@ -216,6 +216,20 @@
> >  		};
> >  	};
> >  
> > +	pmu_a53 {
> > +		compatible = "arm,cortex-a53-pmu";
> > +		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_SPI 9 IRQ_TYPE_LEVEL_LOW>;
> > +		interrupt-affinity = <&cpu0>, <&cpu1>;
> > +	};
> > +
> > +	pmu_a72 {
> > +		compatible = "arm,cortex-a72-pmu";
> > +		interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_SPI 13 IRQ_TYPE_LEVEL_LOW>;
> > +		interrupt-affinity = <&cpu2>, <&cpu3>;
> > +	};
> 
> There is no a72 but a a57 CPU present.
> Typo?
> 
> Regards,
> Matthias

MT8173 is actually using a72, not a57.
I will submit another patch for fixing it.

Thanks.

> > +
> >  	psci {
> >  		compatible = "arm,psci-1.0", "arm,psci-0.2", "arm,psci";
> >  		method = "smc";
> > 
