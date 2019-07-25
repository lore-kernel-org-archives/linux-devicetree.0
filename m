From: Kevin Brodsky <kevin.brodsky@arm.com>
Subject: [PATCH v2] arm64: dts: fast models: Remove clcd's max-memory-bandwidth
Date: Thu, 25 Jul 2019 18:12:14 +0100
Message-ID: <20190725171215.71801-1-kevin.brodsky@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ruben Ayrapetyan <ruben.ayrapetyan@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Brodsky <kevin.brodsky@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, Sudeep Holla <sudeep.holla@arm.com>, Robin Murphy <robin.murphy@arm.com>, Brian Starkey <brian.starkey@arm.com>
List-Id: devicetree@vger.kernel.org

It is unclear why max-memory-bandwidth should be set for CLCD on the
fast model. Removing that property allows allocating and using 32bpp
buffers, which may be desirable on certain platforms such as
Android.

Reported-by: Ruben Ayrapetyan <ruben.ayrapetyan@arm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---

Changes in v2:
- Remove the attribute completely instead of increasing its value. It is
  optional and there is no clear reason why it should be set at all.

 arch/arm64/boot/dts/arm/fvp-base-revc.dts        | 8 --------
 arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi | 2 --
 2 files changed, 10 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
index 687707020ec1..62ab0d54ff71 100644
--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
@@ -265,13 +265,5 @@
 				<0 0 42 &gic 0 0 GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
 				<0 0 43 &gic 0 0 GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
 				<0 0 44 &gic 0 0 GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
-
-		motherboard {
-			iofpga@3,00000000 {
-				clcd@1f0000 {
-					max-memory-bandwidth = <130000000>; /* 16bpp @ 63.5MHz */
-				};
-			};
-		};
 	};
 };
diff --git a/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi b/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi
index 454cf6c44c49..03a7bf079c8f 100644
--- a/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi
+++ b/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi
@@ -188,8 +188,6 @@
 					interrupts = <14>;
 					clocks = <&v2m_oscclk1>, <&v2m_clk24mhz>;
 					clock-names = "clcdclk", "apb_pclk";
-					/* 800x600 16bpp @36MHz works fine */
-					max-memory-bandwidth = <54000000>;
 					memory-region = <&vram>;
 
 					port {
-- 
2.22.0
