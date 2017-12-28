From: zhuoweizhang@yahoo.com
Subject: [PATCH] arm64: dts: angler: add pstore-ramoops support
Date: Thu, 28 Dec 2017 02:38:29 -0500
Message-ID: <1514446709-19347-1-git-send-email-zhuoweizhang@yahoo.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-soc@vger.kernel.org, Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-msm@vger.kernel.org, Anton Vorontsov <anton@enomsg.org>, jeremymc@redhat.com, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Colin Cross <ccross@android.com>, Andy Gross <andy.gross@linaro.org>, Zhuowei Zhang <zhuoweizhang@yahoo.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Zhuowei Zhang <zhuoweizhang@yahoo.com>

Support pstore-ramoops for retrieving kernel oops and panics after reboot.

The address and configs are taken from the downstream kernel's device tree.

Signed-off-by: Zhuowei Zhang <zhuoweizhang@yahoo.com>
---
 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
index dfa08f5..9ce3a6e 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
@@ -37,4 +37,19 @@
 			pinctrl-1 = <&blsp1_uart2_sleep>;
 		};
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ramoops@1fe00000 {
+			compatible = "ramoops";
+			reg = <0 0x1fe00000 0 0x00200000>;
+			console-size = <0x100000>;
+			record-size = <0x10000>;
+			ftrace-size = <0x10000>;
+			pmsg-size = <0x80000>;
+		};
+	};
 };
-- 
1.9.1
