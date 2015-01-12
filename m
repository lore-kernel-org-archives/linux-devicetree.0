From: Eddie Huang <eddie.huang@mediatek.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: Add mediatek MT8173 SoC and
 evaluation board dts and Makefile
Date: Mon, 12 Jan 2015 13:39:22 +0800
Message-ID: <1421041162.2792.2.camel@mtksdaap41>
References: <1419582417-4448-1-git-send-email-eddie.huang@mediatek.com>
 <1419582417-4448-4-git-send-email-eddie.huang@mediatek.com>
 <CABuKBe+=uTVFKCdpr7an-7jOZdQ91ERu0ObjfiW9fKv1CO1oAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABuKBe+=uTVFKCdpr7an-7jOZdQ91ERu0ObjfiW9fKv1CO1oAg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@linaro.org>, Will Deacon <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Robert Richter <rrichter@cavium.com>, srv_heupstream <srv_heupstream@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, "Joe.C" <yingjoe.chen@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>, peter.maydell@linaro.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>YH Chen =?UTF-8?Q?=28=E9=99=B3=E6=98=B1=E8=B1=AA=29?= <y>
List-Id: devicetree@vger.kernel.org

Hi Matthias,

Thanks your review, I will modify in next version.


On Sun, 2015-01-11 at 21:12 +0100, Matthias Brugger wrote:
> 2014-12-26 9:26 GMT+01:00 Eddie Huang <eddie.huang@mediatek.com>:
> > Add device tree support for MT8173 SoC and evaluation board based on it.
> >
> > Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/Makefile                |   1 +
> >  arch/arm64/boot/dts/mediatek/Makefile       |   5 +
> >  arch/arm64/boot/dts/mediatek/mt8173-evb.dts |  34 ++++++
> >  arch/arm64/boot/dts/mediatek/mt8173.dtsi    | 159 ++++++++++++++++++++++++++++
> >  4 files changed, 199 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/Makefile
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8173.dtsi
> >
> > +
> > +       soc {
> > +               #address-cells = <2>;
> > +               #size-cells = <2>;
> > +               compatible = "simple-bus";
> > +               ranges;
> > +
> > +               sysirq: intpol-controller@10200620 {
> > +                       compatible = "mediatek,mt8173-sysirq", "mediatek,mt6577-sysirq";
> 
> Please update the dts bindings for sysirq and add mediatek,mt8173-sysirq.
> Also check that the lines in this patch does not exceed the 80 character limit.
> 
> > +
> > +               uart0: serial@11002000 {
> > +                       compatible = "mediatek,mt8173-uart","mediatek,mt6577-uart";
> 
> Please update the dts binding documentation.
> 
> > +                       reg = <0 0x11002000 0 0x400>;
> > +                       interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>;
> > +                       clocks = <&uart_clk>;
> > +               };
> 
> Please disable the uart ports in the dtsi and enable the one used by
> the board in the dts.
> See [0] and [1] on how to do this.
> 
> Apart from that, the series looks fine to me.
> 
> Thanks,
> Matthias
> 
> [0] https://github.com/mbgg/linux-mediatek/commit/0714947369cdb2b9b8cc24aa07264d4b61ea4fd9
> [1] https://github.com/mbgg/linux-mediatek/commit/ac00aa4dcd085e4cf01761095ec1e2a141f86f38
> 
