From: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
Subject: [PATCH V2 04/12] dtb: amd: Fix typo in SPI device nodes
Date: Mon, 8 Feb 2016 11:59:09 -0600
Message-ID: <1454954357-8395-5-git-send-email-Suravee.Suthikulpanit@amd.com>
References: <1454954357-8395-1-git-send-email-Suravee.Suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1454954357-8395-1-git-send-email-Suravee.Suthikulpanit@amd.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, arnd@arndb.de
Cc: devicetree@vger.kernel.org, brijeshkumar.singh@amd.com, thomas.lendacky@amd.com, linux-kernel@vger.kernel.org, arm@kernel.org, leo.duran@amd.com, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>

Remove invalid entry in the SPI device nodes.

Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
---
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
index 5c73117..c7c759a 100644
--- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
+++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
@@ -91,7 +91,6 @@
 		spi0: ssp@e1020000 {
 			status = "disabled";
 			compatible = "arm,pl022", "arm,primecell";
-			#gpio-cells = <2>;
 			reg = <0 0xe1020000 0 0x1000>;
 			spi-controller;
 			interrupts = <0 330 4>;
@@ -102,7 +101,6 @@
 		spi1: ssp@e1030000 {
 			status = "disabled";
 			compatible = "arm,pl022", "arm,primecell";
-			#gpio-cells = <2>;
 			reg = <0 0xe1030000 0 0x1000>;
 			spi-controller;
 			interrupts = <0 329 4>;
-- 
2.5.0
