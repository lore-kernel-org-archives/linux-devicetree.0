From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 2/4] ARM: dts: da850: add vpif video display pins
Date: Tue, 28 Feb 2017 17:15:14 +0100
Message-ID: <1488298516-14363-3-git-send-email-bgolaszewski@baylibre.com>
References: <1488298516-14363-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488298516-14363-1-git-send-email-bgolaszewski@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sekhar Nori <nsekhar@ti.com>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Patrick Titiano <ptitiano@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add a new pinctrl sub-node for vpif display pins. Move VP_CLKIN3 and
VP_CLKIN2 to the display node where they actually belong (vide section
36.2.2 of the OMAP-L138 technical reference manual).

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/boot/dts/da850.dtsi | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 92d633d..5150331 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -216,8 +216,21 @@
 					0x3c 0x11111111 0xffffffff
 					/* VP_DIN[8..9] */
 					0x40 0x00000011 0x000000ff
-					/* VP_CLKIN3, VP_CLKIN2 */
-					0x4c 0x00010100 0x000f0f00
+				>;
+			};
+			vpif_display_pins: vpif_display_pins {
+				pinctrl-single,bits = <
+					/* VP_DOUT[2..7] */
+					0x40 0x11111100 0xffffff00
+					/* VP_DOUT[10..15,0..1] */
+					0x44 0x11111111 0xffffffff
+					/*  VP_DOUT[8..9] */
+					0x48 0x00000011 0x000000ff
+					/*
+					 * VP_CLKOUT3, VP_CLKIN3,
+					 * VP_CLKOUT2, VP_CLKIN2
+					 */
+					0x4c 0x00111100 0x00ffff00
 				>;
 			};
 		};
-- 
2.9.3
