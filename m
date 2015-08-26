From: Nathan Sullivan <nathan.sullivan@ni.com>
Subject: [PATCH 2/2] Documentation: bindings: add doc for zynq USB
Date: Wed, 26 Aug 2015 10:27:45 -0500
Message-ID: <1440602865-30468-2-git-send-email-nathan.sullivan@ni.com>
References: <1440602865-30468-1-git-send-email-nathan.sullivan@ni.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440602865-30468-1-git-send-email-nathan.sullivan@ni.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter.Chen@freescale.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Nathan Sullivan <nathan.sullivan@ni.com>
List-Id: devicetree@vger.kernel.org

Document the binding for the zynq specific chipidea UDC binding.

Signed-off-by: Nathan Sullivan <nathan.sullivan@ni.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index 553e2fa..29ec09e 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -6,6 +6,7 @@ Required properties:
 	"lsi,zevio-usb"
 	"qcom,ci-hdrc"
 	"chipidea,usb2"
+	"xlnx,zynq-usb-2.20a"
 - reg: base address and length of the registers
 - interrupts: interrupt for the USB controller
 
-- 
1.7.10.4
