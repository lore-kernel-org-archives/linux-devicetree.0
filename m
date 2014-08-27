From: Bo Shen <voice.shen@atmel.com>
Subject: [PATCH] dtb: at91: sam9n12ek: ohci: add port and vbus property
Date: Wed, 27 Aug 2014 17:52:49 +0800
Message-ID: <1409133169-26741-1-git-send-email-voice.shen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: nicolas.ferre@atmel.com
Cc: devicetree@vger.kernel.org, Bo Shen <voice.shen@atmel.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the port number and vbus property for ohci port, or else if
bootloader won't configure the vbus pin, the 5v supply is not
power on, so can not work with usb devices.

Signed-off-by: Bo Shen <voice.shen@atmel.com>
---

 arch/arm/boot/dts/at91sam9n12ek.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/at91sam9n12ek.dts b/arch/arm/boot/dts/at91sam9n12ek.dts
index 83d7237..13bb24e 100644
--- a/arch/arm/boot/dts/at91sam9n12ek.dts
+++ b/arch/arm/boot/dts/at91sam9n12ek.dts
@@ -136,6 +136,8 @@
 		};
 
 		usb0: ohci@00500000 {
+			num-ports = <1>;
+			atmel,vbus-gpio = <&pioB 7 GPIO_ACTIVE_LOW>;
 			status = "okay";
 		};
 	};
-- 
1.8.5.2
