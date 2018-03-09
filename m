From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 3/3] ARM: dts: bcm2835-rpi: Enable OTP access for
 Raspberry Pi
Date: Fri,  9 Mar 2018 14:32:08 +0100
Message-ID: <1520602328-28972-4-git-send-email-stefan.wahren@i2se.com>
References: <1520602328-28972-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1520602328-28972-1-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Phil Elwell <phil@raspberrypi.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch enables OTP access for all Raspberry Pi variants.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/bcm2835-rpi.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index 0198bd4..19a1027 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -22,6 +22,12 @@
 			#address-cells = <0>;
 			#size-cells = <0>;
 			mboxes = <&mailbox>;
+
+			customer_otp: otp {
+				compatible = "raspberrypi,bcm2835-customer-otp";
+				#address-cells = <1>;
+				#size-cells = <1>;
+			};
 		};
 
 		power: power {
-- 
2.7.4
