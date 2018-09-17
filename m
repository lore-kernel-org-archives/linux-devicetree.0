From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH v3 4/4] ARM: dts: bcm283x: Correct mailbox register sizes
Date: Mon, 17 Sep 2018 09:22:24 +0100
Message-ID: <1537172544-104852-5-git-send-email-phil@raspberrypi.org>
References: <1537172544-104852-1-git-send-email-phil@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1537172544-104852-1-git-send-email-phil@raspberrypi.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Phil Elwell <phil@raspberrypi.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, devel@driverdev.osuosl.org
List-Id: devicetree@vger.kernel.org

The size field in a Device Tree "reg" property is encoded in bytes, not
words.

Fixes: 614fa22119d6 ("ARM: dts: bcm2835: Add VCHIQ node to the Raspberry Pi boards. (v3)")
Signed-off-by: Phil Elwell <phil@raspberrypi.org>
Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/bcm2835-rpi.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index 215d8cc..29f970f 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -32,7 +32,7 @@
 
 		vchiq: mailbox@7e00b840 {
 			compatible = "brcm,bcm2835-vchiq";
-			reg = <0x7e00b840 0xf>;
+			reg = <0x7e00b840 0x3c>;
 			interrupts = <0 2>;
 		};
 	};
-- 
2.7.4
