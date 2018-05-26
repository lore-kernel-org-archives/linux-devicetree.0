From: Alexander Kurz <akurz@blala.de>
Subject: [PATCH 3/3] ARM: dts: imx6dl-riotboard: fix OTG regulator polarity
Date: Sat, 26 May 2018 18:30:53 +0000
Message-ID: <20180526183053.14029-4-akurz@blala.de>
References: <20180526183053.14029-1-akurz@blala.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180526183053.14029-1-akurz@blala.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, Alexander Kurz <akurz@blala.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

USB OTG power is switched on when the GPIO is pulled low.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 arch/arm/boot/dts/imx6dl-riotboard.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6dl-riotboard.dts b/arch/arm/boot/dts/imx6dl-riotboard.dts
index a52e05934e3a..ef3b270c15e5 100644
--- a/arch/arm/boot/dts/imx6dl-riotboard.dts
+++ b/arch/arm/boot/dts/imx6dl-riotboard.dts
@@ -70,8 +70,7 @@
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 0>;
-		enable-active-high;
+		gpio = <&gpio3 22 GPIO_ACTIVE_LOW>;
 	};
 };
 
-- 
2.11.0
