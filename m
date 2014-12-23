From: Eddie Huang <eddie.huang@mediatek.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: Add mediatek MT8173 SoC and
 evaluation board dts and Makefile
Date: Tue, 23 Dec 2014 15:30:16 +0800
Message-ID: <1419319816.14341.6.camel@mtksdaap41>
References: <1418825853-10934-1-git-send-email-eddie.huang@mediatek.com>
 <1418825853-10934-4-git-send-email-eddie.huang@mediatek.com>
 <20141217143305.GC8942@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20141217143305.GC8942@leverpostej>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, marc.zyngier@arm.com, Catalin Marinas <Catalin.Marinas@arm.com>, Olof Johansson <olof@lixom.net>, Will Deacon <Will.Deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Robert Richter <rrichter@cavium.com>, "srv_heupstream@mediatek.com" <srv_heupstream@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Joe.C" <yingjoe.chen@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>, Mark Brown <broonie@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2014-12-17 at 14:33 +0000, Mark Rutland wrote:
> On Wed, Dec 17, 2014 at 02:17:32PM +0000, Eddie Huang wrote:
> > Add device tree support for MT8173 SoC and evaluation board based on it.
> > 
> > Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/Makefile       |   1 +
> >  arch/arm64/boot/dts/mt8173-evb.dts |  34 +++++++++
> >  arch/arm64/boot/dts/mt8173.dtsi    | 152 +++++++++++++++++++++++++++++++++++++
> >  3 files changed, 187 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mt8173-evb.dts
> >  create mode 100644 arch/arm64/boot/dts/mt8173.dtsi
> > 
> > +	psci {
> > +		compatible = "arm,psci";
> > +		method = "smc";
> > +		cpu_suspend   = <0x84000001>;
> > +		cpu_off	      = <0x84000002>;
> > +		cpu_on	      = <0x84000003>;
> > +		affinity_info = <0x84000004>;
> > +	};
> 
> There is no AFFINITY_INFO function prior to PSCI 0.2, and
> 'affinity_info' does not exist in the "arm,psci" binding.
> 
> I take it hotplug has been tested for all but CPU0?
> 

Yes, hotplug is ok except CPU0

> > +
> > +		gic: interrupt-controller@10220000 {
> > +			compatible = "arm,gic-400";
> > +			#interrupt-cells = <3>;
> > +			interrupt-parent = <&gic>;
> > +			interrupt-controller;
> > +			reg = <0 0x10221000 0 0x1000>,
> > +			      <0 0x10222000 0 0x1000>,
> > +			      <0 0x10224000 0 0x2000>,
> > +			      <0 0x10226000 0 0x2000>;
> > +			interrupts = <1 9 0xf04>;
> > +		};
> 
> I don't think these reg entries are quite right; GICC should be 8k long.
> 
> Marc?
> 
> Thanks,
> Mark.

Yes, GICC should be 8K long.
