From: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: [PATCH V2] ARM: dts: bcm283x: Reserve first page for firmware
Date: Tue, 9 May 2017 10:04:30 +0100
Message-ID: <b6aef857-1454-7931-2c60-6d7b55b7a0a8@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Raspberry Pi startup stub files for multi-core BCM27XX processors
make the secondary CPUs spin until the corresponding mailbox is
written. These stubs are loaded at physical address 0x00000xxx (as seen
by the ARMs), but this page will be reused by the kernel unless it is
explicitly reserved, causing the waiting cores to execute random code.

Use the /memreserve/ Device Tree directive to mark the first page as
off-limits to the kernel.

See: https://github.com/raspberrypi/linux/issues/1989

Signed-off-by: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
---

Changes in V2:
- Rebase against linux-next
- Drop downstream-only patch

 arch/arm/boot/dts/bcm283x.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index a3106aa..6d12c3e8 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -3,6 +3,8 @@
 #include <dt-bindings/clock/bcm2835-aux.h>
 #include <dt-bindings/gpio/gpio.h>
 
+/memreserve/ 0x00000000 0x00001000;
+
 /* This include file covers the common peripherals and configuration between
  * bcm2835 and bcm2836 implementations, leaving the CPU configuration to
  * bcm2835.dtsi and bcm2836.dtsi.
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
