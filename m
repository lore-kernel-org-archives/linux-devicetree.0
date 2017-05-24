From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/5] ARM64: dts: meson-gxl: Add CEC pins nodes
Date: Wed, 24 May 2017 10:28:22 +0200
Message-ID: <1495614505-4437-3-git-send-email-narmstrong@baylibre.com>
References: <1495614505-4437-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1495614505-4437-1-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: khilman@baylibre.com
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add the AO and EE domain CEC pins nodes for the Amlogic Meson GXL SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 3efad5f..478d3b4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -190,6 +190,20 @@
 				function = "spdif_out_ao";
 			};
 		};
+
+		ao_cec_pins: ao_cec {
+			mux {
+				groups = "ao_cec";
+				function = "cec_ao";
+			};
+		};
+
+		ee_cec_pins: ee_cec {
+			mux {
+				groups = "ee_cec";
+				function = "cec_ao";
+			};
+		};
 	};
 };
 
-- 
1.9.1
