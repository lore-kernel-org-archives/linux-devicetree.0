From: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v4 6/7] ARM: dts: bcm283x: add pinctrl group to &sdhci,
 drop pins from &gpio
Date: Mon, 19 Sep 2016 10:43:22 +0200
Message-ID: <1474274603-24215-7-git-send-email-kraxel@redhat.com>
References: <1474274603-24215-1-git-send-email-kraxel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1474274603-24215-1-git-send-email-kraxel@redhat.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, swarren@wwwdotorg.org, Ray Jui <rjui@broadcom.com>, Lee Jones <lee@kernel.org>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, eric@anholt.net, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Gerd Hoffmann <kraxel@redhat.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 arch/arm/boot/dts/bcm2835-rpi.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index 8688204..3f0ce61 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -43,7 +43,7 @@
 	};
 
 	alt3: alt3 {
-		brcm,pins = <48 49 50 51 52 53>;
+		brcm,pins = <>;
 		brcm,function = <BCM2835_FSEL_ALT3>;
 	};
 };
@@ -67,6 +67,8 @@
 };
 
 &sdhci {
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_gpio48>;
 	status = "okay";
 	bus-width = <4>;
 };
-- 
1.8.3.1
