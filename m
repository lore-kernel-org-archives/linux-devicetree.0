From: Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] ARM: dts: sun8i: sun8i-a83t-bananapi-m3: enhance vcc-pd to
 3.3v
Date: Mon,  9 Jul 2018 19:51:54 +0000
Message-ID: <1531165914-29760-1-git-send-email-clabbe@baylibre.com>
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
To: linux@armlinux.org.uk, mark.rutland@arm.com, maxime.ripard@free-electrons.com, robh+dt@kernel.org, wens@csie.org
Cc: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Corentin Labbe <clabbe@baylibre.com>
List-Id: devicetree@vger.kernel.org

Since commit d7c5f6863550 ("ARM: dts: sun8i: a83t: bananapi-m3: Add AXP813 regulator nodes")
my BPIM3 no longer works at gigabit speed.

With the default setting, dldo3 is regulated at 2.9v which seems
sufficient for the PHy but d7c5f6863550 drop it to 2.5 which is insufficient.
Note that this behaviour is random for all BPIM3 (some works with 2.5, some not)

Finnaly, someone from bananapi confirmed that this regulator must be set to 3.3

Fixes: d7c5f6863550 ("ARM: dts: sun8i: a83t: bananapi-m3: Add AXP813 regulator nodes")
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
index c7ce4158d6c8..f250b20af493 100644
--- a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
+++ b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
@@ -309,8 +309,8 @@
 
 &reg_dldo3 {
 	regulator-always-on;
-	regulator-min-microvolt = <2500000>;
-	regulator-max-microvolt = <2500000>;
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
 	regulator-name = "vcc-pd";
 };
 
-- 
2.16.4
