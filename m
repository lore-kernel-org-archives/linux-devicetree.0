From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Subject: [PATCH 1/3] ARC: [dts] add input clocks for cpu nodes
Date: Fri,  3 Mar 2017 14:30:00 +0300
Message-ID: <1488540602-11438-2-git-send-email-vzakhar@synopsys.com>
References: <1488540602-11438-1-git-send-email-vzakhar@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488540602-11438-1-git-send-email-vzakhar@synopsys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: linux-snps-arc@lists.infradead.org
Cc: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>, devicetree@vger.kernel.org, Vineet Gupta <vgupta@synopys.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

ARC CPU cores are driven by core_clk so we add corresponding "clocks"
property to ARC cpu nodes.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 arch/arc/boot/dts/skeleton.dtsi        | 1 +
 arch/arc/boot/dts/skeleton_hs.dtsi     | 1 +
 arch/arc/boot/dts/skeleton_hs_idu.dtsi | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arc/boot/dts/skeleton.dtsi b/arch/arc/boot/dts/skeleton.dtsi
index 65808fe..2891cb2 100644
--- a/arch/arc/boot/dts/skeleton.dtsi
+++ b/arch/arc/boot/dts/skeleton.dtsi
@@ -26,6 +26,7 @@
 			device_type = "cpu";
 			compatible = "snps,arc770d";
 			reg = <0>;
+			clocks = <&core_clk>;
 		};
 	};
 
diff --git a/arch/arc/boot/dts/skeleton_hs.dtsi b/arch/arc/boot/dts/skeleton_hs.dtsi
index 2dfe803..5e944d3 100644
--- a/arch/arc/boot/dts/skeleton_hs.dtsi
+++ b/arch/arc/boot/dts/skeleton_hs.dtsi
@@ -21,6 +21,7 @@
 			device_type = "cpu";
 			compatible = "snps,archs38";
 			reg = <0>;
+			clocks = <&core_clk>;
 		};
 	};
 
diff --git a/arch/arc/boot/dts/skeleton_hs_idu.dtsi b/arch/arc/boot/dts/skeleton_hs_idu.dtsi
index 4c11079..662c5e0 100644
--- a/arch/arc/boot/dts/skeleton_hs_idu.dtsi
+++ b/arch/arc/boot/dts/skeleton_hs_idu.dtsi
@@ -21,6 +21,7 @@
 			device_type = "cpu";
 			compatible = "snps,archs38xN";
 			reg = <0>;
+			clocks = <&core_clk>;
 		};
 	};
 
-- 
2.7.4
