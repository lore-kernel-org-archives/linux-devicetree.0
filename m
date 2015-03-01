From: Roman Volkov <rvolkov@v1ros.org>
Subject: [PATCH v3 2/2] dts: vt8500: Fix errors in SDHC node for WM8505
Date: Sun,  1 Mar 2015 19:06:47 +0300
Message-ID: <1425226007-2757-3-git-send-email-rvolkov@v1ros.org>
References: <1423130878-3894-1-git-send-email-v1ron@v1ros.org>
 <1425226007-2757-1-git-send-email-rvolkov@v1ros.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1425226007-2757-1-git-send-email-rvolkov@v1ros.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Roman Volkov <rvolkov@v1ros.org>
List-Id: devicetree@vger.kernel.org

According to datasheet, the registers space of SDHC controller is 1Kb,
not '0x1000', the correct value should be '0x400'. Bracket interrupt
numbers individually per recommendations.

Signed-off-by: Roman Volkov <rvolkov@v1ros.org>
---
 arch/arm/boot/dts/wm8505.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/wm8505.dtsi b/arch/arm/boot/dts/wm8505.dtsi
index a1a854b..e9ef539 100644
--- a/arch/arm/boot/dts/wm8505.dtsi
+++ b/arch/arm/boot/dts/wm8505.dtsi
@@ -281,8 +281,8 @@
 
 		sdhc@d800a000 {
 			compatible = "wm,wm8505-sdhc";
-			reg = <0xd800a000 0x1000>;
-			interrupts = <20 21>;
+			reg = <0xd800a000 0x400>;
+			interrupts = <20>, <21>;
 			clocks = <&clksdhc>;
 			bus-width = <4>;
 		};
-- 
2.3.1
