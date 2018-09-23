From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 6/7] ARM: dts: rockchip: add qos nodes found on rk3066 and
 rk3188
Date: Sun, 23 Sep 2018 17:23:55 +0200
Message-ID: <20180923152356.30154-7-heiko@sntech.de>
References: <20180923152356.30154-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180923152356.30154-1-heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-rockchip@lists.infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, chauveau.julien@gmail.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QoS nodes keep information about priorites etc on the interconnect
and loose state when the power-domain gets disabled. Therefore the
power-domain driver stores the settings of available qos nodes and
restores them when the power-domain gets enabled again.

So add the qos nodes found on the Cortex-A9 socs from Rockchip, so
that they can then be connected to the power-domains.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/boot/dts/rk3xxx.dtsi | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
index d752dc611fd7..97307a405e60 100644
--- a/arch/arm/boot/dts/rk3xxx.dtsi
+++ b/arch/arm/boot/dts/rk3xxx.dtsi
@@ -147,6 +147,46 @@
 		status = "disabled";
 	};
 
+	qos_gpu: qos@1012d000 {
+		compatible = "syscon";
+		reg = <0x1012d000 0x20>;
+	};
+
+	qos_vpu: qos@1012e000 {
+		compatible = "syscon";
+		reg = <0x1012e000 0x20>;
+	};
+
+	qos_lcdc0: qos@1012f000 {
+		compatible = "syscon";
+		reg = <0x1012f000 0x20>;
+	};
+
+	qos_cif0: qos@1012f080 {
+		compatible = "syscon";
+		reg = <0x1012f080 0x20>;
+	};
+
+	qos_ipp: qos@1012f100 {
+		compatible = "syscon";
+		reg = <0x1012f100 0x20>;
+	};
+
+	qos_lcdc1: qos@1012f180 {
+		compatible = "syscon";
+		reg = <0x1012f180 0x20>;
+	};
+
+	qos_cif1: qos@1012f200 {
+		compatible = "syscon";
+		reg = <0x1012f200 0x20>;
+	};
+
+	qos_rga: qos@1012f280 {
+		compatible = "syscon";
+		reg = <0x1012f280 0x20>;
+	};
+
 	usb_otg: usb@10180000 {
 		compatible = "rockchip,rk3066-usb", "snps,dwc2";
 		reg = <0x10180000 0x40000>;
-- 
2.18.0
