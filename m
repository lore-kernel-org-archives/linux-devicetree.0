From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/2] ARM: dts: meson8b: add the internal clock measurer
Date: Sat,  9 Feb 2019 01:26:41 +0100
Message-ID: <20190209002641.9105-3-martin.blumenstingl@googlemail.com>
References: <20190209002641.9105-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190209002641.9105-1-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Amlogic Meson8b SoC has an internal clock measurer IP which allows
measuring frequencies of various clock paths.
Enable it on meson8b.dtsi so we can use it.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 7cec76158856..e7d5512c0608 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -294,6 +294,11 @@
 		status = "disabled";
 	};
 
+	clock-measure@8758 {
+		compatible = "amlogic,meson8b-clk-measure";
+		reg = <0x8758 0x1c>;
+	};
+
 	pinctrl_cbus: pinctrl@9880 {
 		compatible = "amlogic,meson8b-cbus-pinctrl";
 		reg = <0x9880 0x10>;
-- 
2.20.1
