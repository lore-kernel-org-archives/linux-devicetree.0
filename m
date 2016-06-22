From: Bruno Herrera <bruherrera@gmail.com>
Subject: [PATCH 3/3] dt-bindings: Document the STM32 USB OTG DWC2 core binding
Date: Tue, 21 Jun 2016 23:25:49 -0300
Message-ID: <1466562349-5043-3-git-send-email-bruherrera@gmail.com>
References: <1466562349-5043-1-git-send-email-bruherrera@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1466562349-5043-1-git-send-email-bruherrera@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org
Cc: mark.rutland@arm.com, balbi@kernel.org, linux-usb@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, johnyoun@synopsys.com, gregkh@linuxfoundation.org, a.seppala@gmail.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mcoquelin.stm32@gmail.com, galak@codeaurora.org, zhangfei.gao@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Bruno Herrera <bruherrera@gmail.com>
---
 Documentation/devicetree/bindings/usb/dwc2.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index 20a68bf..79e5370 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -11,6 +11,7 @@ Required properties:
   - "lantiq,arx100-usb": The DWC2 USB controller instance in Lantiq ARX SoCs;
   - "lantiq,xrx200-usb": The DWC2 USB controller instance in Lantiq XRX SoCs;
   - snps,dwc2: A generic DWC2 USB controller with default parameters.
+  - st,stm32-fsotg: The DWC2 USB controller instance in STM32F4 SoCs in FS mode;
 - reg : Should contain 1 register range (address and length)
 - interrupts : Should contain 1 interrupt
 - clocks: clock provider specifier
-- 
2.7.4 (Apple Git-66)
