From: Jisheng Zhang <jszhang@marvell.com>
Subject: Re: [PATCH 1/2] arm64: dts: berlin4ct: add I2C nodes for BG4CT
Date: Mon, 23 Nov 2015 10:43:30 +0800
Message-ID: <20151123104330.6b9e649c@xhacker>
References: <1448012821-7413-1-git-send-email-jszhang@marvell.com>
	<1448012821-7413-2-git-send-email-jszhang@marvell.com>
	<564F8EF3.5010508@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <564F8EF3.5010508@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 20 Nov 2015 22:21:55 +0100
Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com> wrote:

> On 20.11.2015 10:47, Jisheng Zhang wrote:
> > The Marvell Berlin BG4CT SoC has 4 TWSI which are compatible with the
> > Synopsys DesignWare I2C driver. Add the corresponding nodes.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
> > ---
> >  arch/arm64/boot/dts/marvell/berlin4ct.dtsi | 52 ++++++++++++++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> > index cca4c41..39d0676 100644
> > --- a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> > +++ b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
> > @@ -232,6 +232,32 @@
> >  				};
> >  			};
> >  
> > +			i2c0: i2c@1400 {
> > +				compatible = "snps,designware-i2c";
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +				reg = <0x1400 0x100>;
> > +				clocks = <&clk CLK_APBCORE>;  
> 
> This patch looks fine to me, except that clock node naming and
> clock indices may change. We should really postpone this series
> until we worked out clock.

Indeed. This is just to sent out for review early, so that we can merge
the i2c support once clk is ready.

Thanks for review,
Jisheng

> 
> Sebastian
> 
> > +				i2c-sda-hold-time-ns = <35>;
> > +				i2c-sda-falling-time-ns = <425>;
> > +				i2c-scl-falling-time-ns = <205>;
> > +				interrupts = <4>;
> > +				status = "disabled";
> > +			};
> > +
> > +			i2c1: i2c@1800 {
> > +				compatible = "snps,designware-i2c";
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +				reg = <0x1800 0x100>;
> > +				clocks = <&clk CLK_APBCORE>;
> > +				i2c-sda-hold-time-ns = <35>;
> > +				i2c-sda-falling-time-ns = <425>;
> > +				i2c-scl-falling-time-ns = <205>;
> > +				interrupts = <5>;
> > +				status = "disabled";
> > +			};
> > +
> >  			aic: interrupt-controller@3800 {
> >  				compatible = "snps,dw-apb-ictl";
> >  				reg = <0x3800 0x30>;
> > @@ -319,6 +345,32 @@
> >  				};
> >  			};
> >  
> > +			i2c2: i2c@b000 {
> > +				compatible = "snps,designware-i2c";
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +				reg = <0xb000 0x100>;
> > +				clocks = <&osc>;
> > +				i2c-sda-hold-time-ns = <140>;
> > +				i2c-sda-falling-time-ns = <500>;
> > +				i2c-scl-falling-time-ns = <220>;
> > +				interrupts = <6>;
> > +				status = "disabled";
> > +			};
> > +
> > +			i2c3: i2c@c000 {
> > +				compatible = "snps,designware-i2c";
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +				reg = <0xc000 0x100>;
> > +				clocks = <&osc>;
> > +				i2c-sda-hold-time-ns = <140>;
> > +				i2c-sda-falling-time-ns = <500>;
> > +				i2c-scl-falling-time-ns = <220>;
> > +				interrupts = <7>;
> > +				status = "disabled";
> > +			};
> > +
> >  			uart0: uart@d000 {
> >  				compatible = "snps,dw-apb-uart";
> >  				reg = <0xd000 0x100>;
> >   
> 
