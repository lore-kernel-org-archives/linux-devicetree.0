From: "Wiebe, Wladislav (Nokia - DE/Ulm)" <wladislav.wiebe@nokia.com>
Subject: [PATCH 1/2] dt-bindings: edac: ARM Cortex A15 L2 asynchronous error
 detection
Date: Tue, 8 Jan 2019 08:10:39 +0000
Message-ID: <AM6PR0702MB3799A0BC3B07541CDBC4027EFA8A0@AM6PR0702MB3799.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "davem@davemloft.net" <davem@davemloft.net>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "arnd@arndb.de" <arnd@arndb.de>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "bp@alien8.de" <bp@alien8.de>, "mchehab@kernel.org" <mchehab@kernel.org>"akpm@linux-foundation.org" <akpm@linux-foundation.org>"nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>"arnd@arndb.de" <arnd@arndb.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add property description + example for using the
Cortex A15 L2 asynchronous error detection driver.

Signed-off-by: Wladislav Wiebe <wladislav.wiebe@nokia.com>
---
 .../bindings/edac/cortex_a15_l2_async_edac.txt     | 22 ++++++++++++++++++=
++++
 MAINTAINERS                                        |  7 +++++++
 2 files changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/cortex_a15_l2_as=
ync_edac.txt

diff --git a/Documentation/devicetree/bindings/edac/cortex_a15_l2_async_eda=
c.txt b/Documentation/devicetree/bindings/edac/cortex_a15_l2_async_edac.txt
new file mode 100644
index 000000000000..9ad8c2497e70
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/cortex_a15_l2_async_edac.txt
@@ -0,0 +1,22 @@
+* ARM Cortex A15 L2 internal asynchronous error detection driver
+
+Support for L2 internal asynchronous error detection caused by L2 RAM
+double-bit ECC error or illegal writes to the Interrupt Controller
+memory-map region on the Cortex A15.
+
+Required properties:
+	- compatible: "arm,cortex-a15-l2-async-edac"
+	- interrupts: INTERRIRQ per CPU cluster
+
+Example:
+
+cortex-a15-l2-async-edac {
+	compatible =3D "arm,cortex-a15-l2-async-edac";
+	interrupts =3D <0 182 4>,
+		     <0 183 4>,
+		     <0 184 4>,
+		     <0 185 4>;
+};
+
+Reference:
+Cortex-A15 Technical Reference Manual, 7.7. Asynchronous errors
diff --git a/MAINTAINERS b/MAINTAINERS
index b755a89fa325..0796ad6e6490 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1094,6 +1094,13 @@ F:	arch/arm/include/asm/arch_timer.h
 F:	arch/arm64/include/asm/arch_timer.h
 F:	drivers/clocksource/arm_arch_timer.c
=20
+ARM CORTEX A15 L2 INTERNAL ASYNCHRONOUS ERROR DETECTION DRIVER
+M:	Wladislav Wiebe <wladislav.wiebe@nokia.com>
+L:	linux-edac@vger.kernel.org
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Supported
+F:	Documentation/devicetree/bindings/edac/cortex_a15_l2_async_edac.txt
+
 ARM INTEGRATOR, VERSATILE AND REALVIEW SUPPORT
 M:	Linus Walleij <linus.walleij@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
--=20
2.16.1
