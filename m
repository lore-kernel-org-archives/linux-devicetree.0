From: Julien CHAUVEAU <julien.chauveau@neo-technologies.fr>
Subject: [PATCH] ARM: dts: rockchip: enable DMA on SPI for rk3066 and rk3188
Date: Fri, 10 Oct 2014 10:04:13 +0200
Message-ID: <1412928253-5119-1-git-send-email-julien.chauveau@neo-technologies.fr>
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
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM/Rockchip SoC..." <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Julien CHAUVEAU <julien.chauveau@neo-technologies.fr>
List-Id: devicetree@vger.kernel.org

According to the RK3066 and RK3188 TRM, the two SPI controllers support DMA
handshake interface. Add the DMA properties so they can be used when needed.

Signed-off-by: Julien CHAUVEAU <julien.chauveau@neo-technologies.fr>
---
 arch/arm/boot/dts/rk3xxx.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
index 499468d..9ba92de 100644
--- a/arch/arm/boot/dts/rk3xxx.dtsi
+++ b/arch/arm/boot/dts/rk3xxx.dtsi
@@ -367,6 +367,8 @@
 		reg = <0x20070000 0x1000>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		dmas = <&dmac2 10>, <&dmac2 11>;
+		dma-names = "tx", "rx";
 		status = "disabled";
 	};
 
@@ -378,6 +380,8 @@
 		reg = <0x20074000 0x1000>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		dmas = <&dmac2 12>, <&dmac2 13>;
+		dma-names = "tx", "rx";
 		status = "disabled";
 	};
 };
-- 
1.9.1
