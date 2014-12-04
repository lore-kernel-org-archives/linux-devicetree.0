From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 RESEND 09/11] mtd: st_spi_fsm: Provide documentation for boot device mask property
Date: Thu,  4 Dec 2014 10:21:50 +0000
Message-ID: <1417688512-7644-10-git-send-email-lee.jones@linaro.org>
References: <1417688512-7644-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417688512-7644-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: lee.jones@linaro.org, kernel@stlinux.com, computersforpeace@gmail.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The system configuration registers which display which device the system
booted on are in the same place on all boards which support the FSM.
However, the bits do shift every so slightly.  To combat these we're
adding a new property which supplies the necessary mask used to abstract
the required information.

Cc: devicetree@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 Documentation/devicetree/bindings/mtd/st-fsm.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/st-fsm.txt b/Documentation/devicetree/bindings/mtd/st-fsm.txt
index c248939..2ef9710 100644
--- a/Documentation/devicetree/bindings/mtd/st-fsm.txt
+++ b/Documentation/devicetree/bindings/mtd/st-fsm.txt
@@ -11,6 +11,10 @@ Optional properties:
   - st,syscfg          : Phandle to boot-device system configuration registers
   - st,boot-device-reg : Address of the aforementioned boot-device register(s)
   - st,boot-device-spi : Expected boot-device value if booted via this device
+  - st,boot-device-msk : Mask to use when extracting boot device from the
+			 above system config registers
+  NB: If any of the st,boot-device-* properties are missing, the driver falls
+  back to the default assumption of 'booted from SPI'.
 
 Example:
 	spifsm: spifsm@fe902000{
-- 
1.9.1
