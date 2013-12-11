From: Sherman Yin <syin@broadcom.com>
Subject: [PATCH v3 6/6] pinctrl: Enable pinctrl for Broadcom Capri SoCs
Date: Wed, 11 Dec 2013 10:37:21 -0800
Message-ID: <1386787041-6035-7-git-send-email-syin@broadcom.com>
References: <1381174108-25168-1-git-send-email-syin@broadcom.com>
 <1386787041-6035-1-git-send-email-syin@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1386787041-6035-1-git-send-email-syin@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <rob.herring@calxeda.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Christian Daudt <bcm@fixthebug.org>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Matt Porter <matt.porter@linaro.org>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Sherman Yin <syin@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Enable pinctrl for Broadcom Capri (BCM281xx) SoCs.

Signed-off-by: Sherman Yin <syin@broadcom.com>
Reviewed-by: Christian Daudt <bcm@fixthebug.org>
Reviewed-by: Matt Porter <matt.porter@linaro.org>
---
v3: no change
v2: no change
---
 arch/arm/boot/dts/bcm11351.dtsi |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/bcm11351.dtsi b/arch/arm/boot/dts/bcm11351.dtsi
index b0c0610..dd8e878 100644
--- a/arch/arm/boot/dts/bcm11351.dtsi
+++ b/arch/arm/boot/dts/bcm11351.dtsi
@@ -142,4 +142,8 @@
 		status = "disabled";
 	};
 
+	pinctrl@35004800 {
+		compatible = "brcm,capri-pinctrl";
+		reg = <0x35004800 0x430>;
+	};
 };
-- 
1.7.9.5
