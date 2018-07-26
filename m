From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: add Cortex-A53 PMU support
Date: Thu, 26 Jul 2018 15:53:29 +0200
Message-ID: <20180726135328.zmqanet4dns4vk5m@verge.net.au>
References: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
 <d8e355fd-46f5-3798-fe43-811471a75ab6@cogentembedded.com>
 <CAMuHMdXPYwC5pmY+HmT0TYTXpmy152pVtdanSPCZMX1xp0r76g@mail.gmail.com>
 <CAMuHMdV-6s+NizKhszaY8f2=L2QS8KgCBcKEjR_qvyrrV04uXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdV-6s+NizKhszaY8f2=L2QS8KgCBcKEjR_qvyrrV04uXw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 26, 2018 at 02:33:55PM +0200, Geert Uytterhoeven wrote:
> On Wed, Jul 25, 2018 at 7:34 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, Jul 25, 2018 at 6:44 PM Sergei Shtylyov
> > <sergei.shtylyov@cogentembedded.com> wrote:
> > > Describe the performance monitor unit (PMU) for the Cortex-A53 cores in
> > > the R8A77970 SoC's device tree.
> >
> > 8?
> 
> With that fixes:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have applied the following for v4.20.

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] arm64: dts: renesas: r8a77980: add Cortex-A53 PMU support

Describe the performance monitor unit (PMU) for the Cortex-A53 cores in
the R8A77980 SoC's device tree.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index d3532fd4c94a..1013da3e2ec4 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -98,6 +98,15 @@
 		clock-frequency = <0>;
 	};
 
+	pmu_a53 {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts-extended = <&gic GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&a53_0>, <&a53_1>, <&a53_2>, <&a53_3>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0", "arm,psci-0.2";
 		method = "smc";
-- 
2.11.0
