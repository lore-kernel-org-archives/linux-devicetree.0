From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: [PATCH v4 05/20] ARM: dts: efm32: Add generic compatible string for
 I2C EEPROM
Date: Mon, 22 May 2017 16:01:53 +0200
Message-ID: <20170522140208.24652-6-javier@dowhile0.org>
References: <20170522140208.24652-1-javier@dowhile0.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170522140208.24652-1-javier@dowhile0.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <kernel@pengutronix.de>, Javier Martinez Canillas <javier@dowhile0.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The at24 driver allows to register I2C EEPROM chips using different vendor
and devices, but the I2C subsystem does not take the vendor into account
when matching using the I2C table since it only has device entries.

But when matching using an OF table, both the vendor and device has to be
taken into account so the driver defines only a set of compatible strings
using the "atmel" vendor as a generic fallback for compatible I2C devices.

So add this generic fallback to the device node compatible string to make
the device to match the driver using the OF device ID table.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>

---

Changes in v4:
- Only use the atmel manufacturer in the compatible string instead of
  keeping the deprecated ones (Rob Herring).

Changes in v3: None
Changes in v2: None

 arch/arm/boot/dts/efm32gg-dk3750.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/efm32gg-dk3750.dts b/arch/arm/boot/dts/efm32gg-dk3750.dts
index 98fc667d22c7..df960b4ba312 100644
--- a/arch/arm/boot/dts/efm32gg-dk3750.dts
+++ b/arch/arm/boot/dts/efm32gg-dk3750.dts
@@ -36,7 +36,7 @@
 			};
 
 			eeprom@50 {
-				compatible = "microchip,24c02";
+				compatible = "atmel,24c02";
 				reg = <0x50>;
 				pagesize = <16>;
 			};
-- 
2.9.3
