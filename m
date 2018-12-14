From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 6/7] [stable-4.19] ARM: dts: qcom-apq8064-arrow-sd-600eval fix graph_endpoint warning
Date: Fri, 14 Dec 2018 23:10:11 +0100
Message-ID: <20181214221023.3878670-7-arnd@arndb.de>
References: <20181214221023.3878670-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20181214221023.3878670-1-arnd@arndb.de>
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Upstream commit 972910948fb6 ("ARM: dts: qcom: Remove Arrow SD600
eval board") removed this file because there are no known users,
but in linux-4.19.y, we still get a compile-time warnign for it:

arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dtb: Warning (graph_endpoint): /soc/mdp@5100000/ports/port@3/endpoint: graph connection to node '/soc/hdmi-tx@4a00000/ports/port@0/endpoint' is not bidirectional

Address the warning by adding the remote endpoint that makes the link
bidirectional. This is the same property that other boards use.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts b/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts
index 76b56eafaab9..f714a20649d7 100644
--- a/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts
@@ -387,6 +387,11 @@
 			hpd-gpio = <&tlmm_pinmux 72 GPIO_ACTIVE_HIGH>;
 
 			ports {
+				port@0 {
+					endpoint {
+						remote-endpoint = <&mdp_dtv_out>;
+					};
+				};
 				port@1 {
 					endpoint {
 						remote-endpoint = <&hdmi_con>;
-- 
2.20.0
