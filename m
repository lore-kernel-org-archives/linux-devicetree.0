From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V7 2/7] ARM: dts: imx6sx-sabreauto: add max7322 IO expander
 support
Date: Sun,  6 May 2018 14:28:08 +0800
Message-ID: <1525588093-29994-2-git-send-email-Anson.Huang@nxp.com>
References: <1525588093-29994-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1525588093-29994-1-git-send-email-Anson.Huang@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, fugang.duan@nxp.com, haibo.chen@nxp.com, yibin.gong@nxp.com, aisheng.dong@nxp.com
Cc: devicetree@vger.kernel.org, Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add MAX7322 IO expander support.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
changes since V6:
	remove unnecessary sign-off.
 arch/arm/boot/dts/imx6sx-sabreauto.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sx-sabreauto.dts b/arch/arm/boot/dts/imx6sx-sabreauto.dts
index 1d8cf0f..ae253af 100644
--- a/arch/arm/boot/dts/imx6sx-sabreauto.dts
+++ b/arch/arm/boot/dts/imx6sx-sabreauto.dts
@@ -254,4 +254,11 @@
 			};
 		};
 	};
+
+	max7322: gpio@68 {
+		compatible = "maxim,max7322";
+		reg = <0x68>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
 };
-- 
2.7.4
