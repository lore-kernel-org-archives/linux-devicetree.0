From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC PATCH 3/3] MAINTAINERS: oxnas: Add new files definitions
Date: Mon, 17 Oct 2016 14:40:01 +0200
Message-ID: <20161017124001.23820-4-narmstrong@baylibre.com>
References: <20161017124001.23820-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161017124001.23820-1-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-oxnas@lists.tuxfamily.org, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Fix the dts files maintained by the OXNAS platform, add a new board.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 71aa5da..9f4bc60 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1444,8 +1444,9 @@ M:	Neil Armstrong <narmstrong@baylibre.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	arch/arm/mach-oxnas/
-F:	arch/arm/boot/dts/oxnas*
+F:	arch/arm/boot/dts/ox8*.dtsi
 F:	arch/arm/boot/dts/wd-mbwe.dts
+F:	arch/arm/boot/dts/cloudengines-pogoplug-series-3.dts
 N:	oxnas
 
 ARM/Mediatek RTC DRIVER
-- 
2.7.0
