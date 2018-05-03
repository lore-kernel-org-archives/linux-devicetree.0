From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 3/3] arm64: dts: renesas: ulcb: Add PMIC DDR Backup Power
 config
Date: Thu,  3 May 2018 14:30:51 +0200
Message-ID: <1525350651-12471-4-git-send-email-geert+renesas@glider.be>
References: <1525350651-12471-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1525350651-12471-1-git-send-email-geert+renesas@glider.be>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On the R-Car Starter Kit Premier/Pro, all of the DDR0, DDR1, DDR0C, and
DDR1C power rails need to be kept powered when backup mode is enabled.
Reflect this in the "rohm,ddr-backup-power" property for the BD9571MWV
PMIC node.

The accessory power switch (SW8) is a momentary switch, hense specify
"rohm,rstbmode-pulse".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Use a hex value for the bit mask,

v2:
  - New.
---
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index bb21ae335e8b8489..432a4e9752f2b923 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -256,6 +256,8 @@
 		#interrupt-cells = <2>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		rohm,ddr-backup-power = <0xf>;
+		rohm,rstbmode-pulse;
 
 		regulators {
 			dvfs: dvfs {
-- 
2.7.4
