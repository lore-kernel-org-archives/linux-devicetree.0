From: Jeremy McNicoll <jeremymc@redhat.com>
Subject: [PATCH] arm64: dts: msm8992: add pstore-ramoops support
Date: Mon, 12 Mar 2018 01:36:57 -0700
Message-ID: <1520843817-9667-1-git-send-email-jeremymc@redhat.com>
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
To: devicetree@vger.kernel.org
Cc: keescook@chromium.org, linux-arm-msm@vger.kernel.org, jeremymc@redhat.com, dianders@chromium.org, robh+dt@kernel.org, zhuoweizhang@yahoo.com, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

With the addition of this ramoops node it enables post mortem
analysis if a debug cable is not attached and/or not available.

All addresses and values were extracted from CAF AOSP marshmallow
DR 1.6.

Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
---
 arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
index 4542133..d1b62ef 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
@@ -38,4 +38,19 @@
 			pinctrl-1 = <&blsp1_uart2_sleep>;
 		};
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ramoops@1ff00000 {
+			compatible = "ramoops";
+			reg = <0x0 0x1ff00000 0x0 0x40000>;
+			console-size = <0x10000>;
+			record-size = <0x10000>;
+			ftrace-size = <0x10000>;
+			pmsg-size = <0x20000>;
+		};
+	};
 };
-- 
2.6.1
