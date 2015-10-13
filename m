From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: consolidate interrupt controller bindings
Date: Tue, 13 Oct 2015 15:56:32 -0500
Message-ID: <1444769792-14790-1-git-send-email-robh@kernel.org>
References: <1443737554-10352-1-git-send-email-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443737554-10352-1-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Move various interrupt controller bindings into the
interrupt-controller/ directory.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org
---
One more patch for my DT binding restructuring series[1].

Rob

[1] https://lkml.org/lkml/2015/10/1/906


 .../bindings/{arm/gic-v3.txt => interrupt-controller/arm,gic-v3.txt}      | 0
 .../devicetree/bindings/{arm/gic.txt => interrupt-controller/arm,gic.txt} | 0
 .../arm,versatile-fpga-irq.txt}                                           | 0
 .../devicetree/bindings/{arm/vic.txt => interrupt-controller/arm,vic.txt} | 0
 .../{cris/interrupts.txt => interrupt-controller/axis,crisv32-intc.txt}   | 0
 .../{metag/meta-intc.txt => interrupt-controller/img,meta-intc.txt}       | 0
 .../{metag/pdc-intc.txt => interrupt-controller/img,pdc-intc.txt}         | 0
 .../{x86/interrupt.txt => interrupt-controller/intel,ce4100-ioapic.txt}   | 0
 .../bindings/{arm/mediatek => interrupt-controller}/mediatek,sysirq.txt   | 0
 .../bindings/{arm/mrvl/intc.txt => interrupt-controller/mrvl,intc.txt}    | 0
 .../{arm/lpc32xx-mic.txt => interrupt-controller/nxp,lpc3220-mic.txt}     | 0
 .../samsung,exynos4210-combiner.txt}                                      | 0
 .../{arc/interrupts.txt => interrupt-controller/snps,arc700-intc.txt}     | 0
 .../archs-idu-intc.txt => interrupt-controller/snps,archs-idu-intc.txt}   | 0
 .../{arc/archs-intc.txt => interrupt-controller/snps,archs-intc.txt}      | 0
 .../{arm/spear/shirq.txt => interrupt-controller/st,spear3xx-shirq.txt}   | 0
 .../{c6x/interrupt.txt => interrupt-controller/ti,c64x+megamod-pic.txt}   | 0
 .../{arm/davinci/cp-intc.txt => interrupt-controller/ti,cp-intc.txt}      | 0
 .../{arm/omap/intc.txt => interrupt-controller/ti,omap2-intc.txt}         | 0
 .../bindings/{arm/vt8500 => interrupt-controller}/via,vt8500-intc.txt     | 0
 20 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{arm/gic-v3.txt => interrupt-controller/arm,gic-v3.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/gic.txt => interrupt-controller/arm,gic.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/versatile-fpga-irq.txt => interrupt-controller/arm,versatile-fpga-irq.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/vic.txt => interrupt-controller/arm,vic.txt} (100%)
 rename Documentation/devicetree/bindings/{cris/interrupts.txt => interrupt-controller/axis,crisv32-intc.txt} (100%)
 rename Documentation/devicetree/bindings/{metag/meta-intc.txt => interrupt-controller/img,meta-intc.txt} (100%)
 rename Documentation/devicetree/bindings/{metag/pdc-intc.txt => interrupt-controller/img,pdc-intc.txt} (100%)
 rename Documentation/devicetree/bindings/{x86/interrupt.txt => interrupt-controller/intel,ce4100-ioapic.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/mediatek => interrupt-controller}/mediatek,sysirq.txt (100%)
 rename Documentation/devicetree/bindings/{arm/mrvl/intc.txt => interrupt-controller/mrvl,intc.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/lpc32xx-mic.txt => interrupt-controller/nxp,lpc3220-mic.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/samsung/interrupt-combiner.txt => interrupt-controller/samsung,exynos4210-combiner.txt} (100%)
 rename Documentation/devicetree/bindings/{arc/interrupts.txt => interrupt-controller/snps,arc700-intc.txt} (100%)
 rename Documentation/devicetree/bindings/{arc/archs-idu-intc.txt => interrupt-controller/snps,archs-idu-intc.txt} (100%)
 rename Documentation/devicetree/bindings/{arc/archs-intc.txt => interrupt-controller/snps,archs-intc.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/spear/shirq.txt => interrupt-controller/st,spear3xx-shirq.txt} (100%)
 rename Documentation/devicetree/bindings/{c6x/interrupt.txt => interrupt-controller/ti,c64x+megamod-pic.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/davinci/cp-intc.txt => interrupt-controller/ti,cp-intc.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/omap/intc.txt => interrupt-controller/ti,omap2-intc.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/vt8500 => interrupt-controller}/via,vt8500-intc.txt (100%)

diff --git a/Documentation/devicetree/bindings/arm/gic-v3.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/gic-v3.txt
rename to Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
diff --git a/Documentation/devicetree/bindings/arm/gic.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/gic.txt
rename to Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
diff --git a/Documentation/devicetree/bindings/arm/versatile-fpga-irq.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/versatile-fpga-irq.txt
rename to Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
diff --git a/Documentation/devicetree/bindings/arm/vic.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,vic.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/vic.txt
rename to Documentation/devicetree/bindings/interrupt-controller/arm,vic.txt
diff --git a/Documentation/devicetree/bindings/cris/interrupts.txt b/Documentation/devicetree/bindings/interrupt-controller/axis,crisv32-intc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/cris/interrupts.txt
rename to Documentation/devicetree/bindings/interrupt-controller/axis,crisv32-intc.txt
diff --git a/Documentation/devicetree/bindings/metag/meta-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/img,meta-intc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/metag/meta-intc.txt
rename to Documentation/devicetree/bindings/interrupt-controller/img,meta-intc.txt
diff --git a/Documentation/devicetree/bindings/metag/pdc-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/img,pdc-intc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/metag/pdc-intc.txt
rename to Documentation/devicetree/bindings/interrupt-controller/img,pdc-intc.txt
diff --git a/Documentation/devicetree/bindings/x86/interrupt.txt b/Documentation/devicetree/bindings/interrupt-controller/intel,ce4100-ioapic.txt
similarity index 100%
rename from Documentation/devicetree/bindings/x86/interrupt.txt
rename to Documentation/devicetree/bindings/interrupt-controller/intel,ce4100-ioapic.txt
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt
rename to Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
diff --git a/Documentation/devicetree/bindings/arm/mrvl/intc.txt b/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/mrvl/intc.txt
rename to Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.txt
diff --git a/Documentation/devicetree/bindings/arm/lpc32xx-mic.txt b/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/lpc32xx-mic.txt
rename to Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.txt
diff --git a/Documentation/devicetree/bindings/arm/samsung/interrupt-combiner.txt b/Documentation/devicetree/bindings/interrupt-controller/samsung,exynos4210-combiner.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/samsung/interrupt-combiner.txt
rename to Documentation/devicetree/bindings/interrupt-controller/samsung,exynos4210-combiner.txt
diff --git a/Documentation/devicetree/bindings/arc/interrupts.txt b/Documentation/devicetree/bindings/interrupt-controller/snps,arc700-intc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arc/interrupts.txt
rename to Documentation/devicetree/bindings/interrupt-controller/snps,arc700-intc.txt
diff --git a/Documentation/devicetree/bindings/arc/archs-idu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arc/archs-idu-intc.txt
rename to Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
diff --git a/Documentation/devicetree/bindings/arc/archs-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arc/archs-intc.txt
rename to Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.txt
diff --git a/Documentation/devicetree/bindings/arm/spear/shirq.txt b/Documentation/devicetree/bindings/interrupt-controller/st,spear3xx-shirq.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/spear/shirq.txt
rename to Documentation/devicetree/bindings/interrupt-controller/st,spear3xx-shirq.txt
diff --git a/Documentation/devicetree/bindings/c6x/interrupt.txt b/Documentation/devicetree/bindings/interrupt-controller/ti,c64x+megamod-pic.txt
similarity index 100%
rename from Documentation/devicetree/bindings/c6x/interrupt.txt
rename to Documentation/devicetree/bindings/interrupt-controller/ti,c64x+megamod-pic.txt
diff --git a/Documentation/devicetree/bindings/arm/davinci/cp-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ti,cp-intc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/davinci/cp-intc.txt
rename to Documentation/devicetree/bindings/interrupt-controller/ti,cp-intc.txt
diff --git a/Documentation/devicetree/bindings/arm/omap/intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ti,omap2-intc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/omap/intc.txt
rename to Documentation/devicetree/bindings/interrupt-controller/ti,omap2-intc.txt
diff --git a/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/vt8500/via,vt8500-intc.txt
rename to Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.txt
-- 
2.1.4
