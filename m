From: Loc Ho <lho@apm.com>
Subject: [PATCH v2 3/3] arm64: Update the APM X-Gene EDAC node with the RB
 register resource
Date: Tue, 19 Jan 2016 17:46:52 -0700
Message-ID: <1453250812-15097-4-git-send-email-lho@apm.com>
References: <1453250812-15097-1-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1453250812-15097-1-git-send-email-lho@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: bp@alien8.de, dougthompson@xmission.com, mchehab@osg.samsung.com, arnd@arndb.de
Cc: devicetree@vger.kernel.org, patches@apm.com, Loc Ho <lho@apm.com>, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the RB register resource as requires with the updated driver.

Signed-off-by: Loc Ho <lho@apm.com>
---
 arch/arm64/boot/dts/apm/apm-storm.dtsi |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index fe30f76..3e40bd4 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -493,6 +493,11 @@
 			reg = <0x0 0x1054a000 0x0 0x20>;
 		};
 
+		rb: rb@7e000000 {
+			compatible = "apm,xgene-rb", "syscon";
+			reg = <0x0 0x7e000000 0x0 0x10>;
+		};
+
 		edac@78800000 {
 			compatible = "apm,xgene-edac";
 			#address-cells = <2>;
@@ -502,6 +507,7 @@
 			regmap-mcba = <&mcba>;
 			regmap-mcbb = <&mcbb>;
 			regmap-efuse = <&efuse>;
+			regmap-rb = <&rb>;
 			reg = <0x0 0x78800000 0x0 0x100>;
 			interrupts = <0x0 0x20 0x4>,
 				     <0x0 0x21 0x4>,
-- 
1.7.1
