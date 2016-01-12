From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH 2/2] ARM: DTS: kirkwood-openrd: fix SD slot default
 configuration
Date: Tue, 12 Jan 2016 22:07:33 +0200
Message-ID: <1452629253-21748-2-git-send-email-aaro.koskinen@iki.fi>
References: <1452629253-21748-1-git-send-email-aaro.koskinen@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1452629253-21748-1-git-send-email-aaro.koskinen@iki.fi>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
List-Id: devicetree@vger.kernel.org

The SD card slot was enabled by default with legacy booting.
It does not work anymore with DT boot. Fix by providing GPIO configuration
that matches the old default.

Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
 arch/arm/boot/dts/kirkwood-openrd.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/kirkwood-openrd.dtsi b/arch/arm/boot/dts/kirkwood-openrd.dtsi
index 2a3dafd..f65b727 100644
--- a/arch/arm/boot/dts/kirkwood-openrd.dtsi
+++ b/arch/arm/boot/dts/kirkwood-openrd.dtsi
@@ -65,6 +65,14 @@
 			status = "okay";
 			cd-gpios = <&gpio0 29 9>;
 		};
+		gpio@10140 {
+			p2 {
+				gpio-hog;
+				gpios = <2 GPIO_ACTIVE_HIGH>;
+				output-high; /* Select SD by default */
+				line-name = "SelUARTorSD";
+			};
+		};
 	};
 };
 
-- 
2.4.0
