From: Rob Herring <robh@kernel.org>
Subject: [PATCH] arm64: dts: juno: fix missing Coresight STM graph connection
Date: Tue,  8 May 2018 10:09:50 -0500
Message-ID: <20180508150952.24562-2-robh@kernel.org>
References: <20180508150952.24562-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180508150952.24562-1-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Mike Leach <mike.leach@linaro.org>
List-Id: devicetree@vger.kernel.org

OF graph endpoint connections must be bidirectional. Fix 2 missing
connections to the STM output port:

arch/arm64/boot/dts/arm/juno-r1.dtb: Warning (graph_endpoint): /stm@20100000/port/endpoint: graph connection to node '/funnel@20130000/ports/port@1/endpoint' is not bidirectional
arch/arm64/boot/dts/arm/juno-r2.dtb: Warning (graph_endpoint): /stm@20100000/port/endpoint: graph connection to node '/funnel@20130000/ports/port@1/endpoint' is not bidirectional

Fixes: cde6f9ab10c6 ("arm64: dts: juno: add missing CoreSight STM component")
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm64/boot/dts/arm/juno-r1.dts | 4 ++++
 arch/arm64/boot/dts/arm/juno-r2.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/dts/arm/juno-r1.dts
index aed6389468c4..c52c5c40dede 100644
--- a/arch/arm64/boot/dts/arm/juno-r1.dts
+++ b/arch/arm64/boot/dts/arm/juno-r1.dts
@@ -278,6 +278,10 @@
 	remote-endpoint = <&csys2_funnel_out_port>;
 };
 
+&csys1_funnel_in_port0 {
+	remote-endpoint = <&stm_out_port>;
+};
+
 &stm_out_port {
 	remote-endpoint = <&csys1_funnel_in_port0>;
 };
diff --git a/arch/arm64/boot/dts/arm/juno-r2.dts b/arch/arm64/boot/dts/arm/juno-r2.dts
index b39b6d6ec5aa..a90982ceda35 100644
--- a/arch/arm64/boot/dts/arm/juno-r2.dts
+++ b/arch/arm64/boot/dts/arm/juno-r2.dts
@@ -278,6 +278,10 @@
 	remote-endpoint = <&csys2_funnel_out_port>;
 };
 
+&csys1_funnel_in_port0 {
+	remote-endpoint = <&stm_out_port>;
+};
+
 &stm_out_port {
 	remote-endpoint = <&csys1_funnel_in_port0>;
 };
-- 
2.17.0
