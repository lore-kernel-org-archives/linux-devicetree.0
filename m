From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2] ARM: dts: sun6i: hummingbird: Add aliases for rtc devices
Date: Thu,  1 Oct 2015 20:48:29 +0800
Message-ID: <1443703709-24835-1-git-send-email-wens@csie.org>
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
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Hans de Goede <hdegoede@redhat.com>
List-Id: devicetree@vger.kernel.org

The hummingbird A31 has 2 rtc devices available: one in the SoC,
and a pcf8563 external rtc on i2c2.

For some unknown reason, the onboard backup battery alone can not
supply enough power to the internal rtc. When external power is
removed, the internal rtc would reset. Hence we want to use the
external one by default.

Add aliases for the rtc devices with the external one as rtc0.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---

Changes since v1:

  - Cleared up commit message

---
 arch/arm/boot/dts/sun6i-a31-hummingbird.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/sun6i-a31-hummingbird.dts b/arch/arm/boot/dts/sun6i-a31-hummingbird.dts
index 06d9391ca30e..358781113582 100644
--- a/arch/arm/boot/dts/sun6i-a31-hummingbird.dts
+++ b/arch/arm/boot/dts/sun6i-a31-hummingbird.dts
@@ -55,6 +55,8 @@
 
 	aliases {
 		serial0 = &uart0;
+		rtc0 = &pcf8563;
+		rtc1 = &rtc;
 	};
 
 	chosen {
-- 
2.5.3
