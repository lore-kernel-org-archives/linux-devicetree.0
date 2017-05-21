From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH 1/4] ARM: dts: bcm283x: Add dtsi for OTG mode
Date: Sun, 21 May 2017 18:44:36 +0200
Message-ID: <1495385079-3697-2-git-send-email-stefan.wahren@i2se.com>
References: <1495385079-3697-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1495385079-3697-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Raspberry Pi Zero also supports OTG mode. So provide a dtsi file
to configure the USB interface accordingly. The fifo sizes are optimized
for device endpoint 6 and 7 with the maximum of 768.

Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
---
 arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi

diff --git a/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi b/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi
new file mode 100644
index 0000000..e7d217c
--- /dev/null
+++ b/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi
@@ -0,0 +1,10 @@
+&usb {
+	dr_mode = "otg";
+	g-rx-fifo-size = <256>;
+	g-np-tx-fifo-size = <32>;
+	/*
+	 * According to dwc2 the sum of all device EP
+	 * fifo sizes shouldn't exceed 3776 bytes.
+	 */
+	g-tx-fifo-size = <256 256 512 512 512 768 768>;
+};
-- 
2.7.4
