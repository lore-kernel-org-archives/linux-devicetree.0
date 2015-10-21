From: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 2/2] ARM: dts: bcm5301x: Add BCM SVK DT files
Date: Wed, 21 Oct 2015 18:46:04 -0400
Message-ID: <1445467564-30024-3-git-send-email-jonmason@broadcom.com>
References: <1445467564-30024-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445467564-30024-1-git-send-email-jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add device tree files for Broadcom Northstar based SVKs.  Since the
bcm5301x.dtsi already exists, all that is necessary is the dts files to
enable the UARTs.  With these files, the SVKs are able to boot to shell.

Signed-off-by: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/Makefile       |  5 +++-
 arch/arm/boot/dts/bcm94708.dts   | 56 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/bcm94709.dts   | 56 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/bcm953012k.dts | 63 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 179 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/bcm94708.dts
 create mode 100644 arch/arm/boot/dts/bcm94709.dts
 create mode 100644 arch/arm/boot/dts/bcm953012k.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 233159d..96a1b58 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -72,7 +72,10 @@ dtb-$(CONFIG_ARCH_BCM_5301X) += \
 	bcm47081-buffalo-wzr-900dhp.dtb \
 	bcm4709-asus-rt-ac87u.dtb \
 	bcm4709-buffalo-wxr-1900dhp.dtb \
-	bcm4709-netgear-r8000.dtb
+	bcm4709-netgear-r8000.dtb \
+	bcm94708.dtb \
+	bcm94709.dtb \
+	bcm953012k.dtb
 dtb-$(CONFIG_ARCH_BCM_63XX) += \
 	bcm963138dvt.dtb
 dtb-$(CONFIG_ARCH_BCM_CYGNUS) += \
diff --git a/arch/arm/boot/dts/bcm94708.dts b/arch/arm/boot/dts/bcm94708.dts
new file mode 100644
index 0000000..251a486
--- /dev/null
+++ b/arch/arm/boot/dts/bcm94708.dts
@@ -0,0 +1,56 @@
+/*
+ *  BSD LICENSE
+ *
+ *  Copyright(c) 2015 Broadcom Corporation.  All rights reserved.
+ *
+ *  Redistribution and use in source and binary forms, with or without
+ *  modification, are permitted provided that the following conditions
+ *  are met:
+ *
+ *    * Redistributions of source code must retain the above copyright
+ *      notice, this list of conditions and the following disclaimer.
+ *    * Redistributions in binary form must reproduce the above copyright
+ *      notice, this list of conditions and the following disclaimer in
+ *      the documentation and/or other materials provided with the
+ *      distribution.
+ *    * Neither the name of Broadcom Corporation nor the names of its
+ *      contributors may be used to endorse or promote products derived
+ *      from this software without specific prior written permission.
+ *
+ *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+/dts-v1/;
+
+#include "bcm4708.dtsi"
+
+/ {
+	model = "NorthStar SVK (BCM94708)";
+	compatible = "brcm,bcm94708", "brcm,bcm4708";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory {
+		reg = <0x00000000 0x08000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/bcm94709.dts b/arch/arm/boot/dts/bcm94709.dts
new file mode 100644
index 0000000..b16cac9
--- /dev/null
+++ b/arch/arm/boot/dts/bcm94709.dts
@@ -0,0 +1,56 @@
+/*
+ *  BSD LICENSE
+ *
+ *  Copyright(c) 2015 Broadcom Corporation.  All rights reserved.
+ *
+ *  Redistribution and use in source and binary forms, with or without
+ *  modification, are permitted provided that the following conditions
+ *  are met:
+ *
+ *    * Redistributions of source code must retain the above copyright
+ *      notice, this list of conditions and the following disclaimer.
+ *    * Redistributions in binary form must reproduce the above copyright
+ *      notice, this list of conditions and the following disclaimer in
+ *      the documentation and/or other materials provided with the
+ *      distribution.
+ *    * Neither the name of Broadcom Corporation nor the names of its
+ *      contributors may be used to endorse or promote products derived
+ *      from this software without specific prior written permission.
+ *
+ *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+/dts-v1/;
+
+#include "bcm4708.dtsi"
+
+/ {
+	model = "NorthStar SVK (BCM94709)";
+	compatible = "brcm,bcm94709", "brcm,bcm4709", "brcm,bcm4708";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory {
+		reg = <0x00000000 0x08000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/bcm953012k.dts b/arch/arm/boot/dts/bcm953012k.dts
new file mode 100644
index 0000000..05a985a
--- /dev/null
+++ b/arch/arm/boot/dts/bcm953012k.dts
@@ -0,0 +1,63 @@
+/*
+ *  BSD LICENSE
+ *
+ *  Copyright(c) 2015 Broadcom Corporation.  All rights reserved.
+ *
+ *  Redistribution and use in source and binary forms, with or without
+ *  modification, are permitted provided that the following conditions
+ *  are met:
+ *
+ *    * Redistributions of source code must retain the above copyright
+ *      notice, this list of conditions and the following disclaimer.
+ *    * Redistributions in binary form must reproduce the above copyright
+ *      notice, this list of conditions and the following disclaimer in
+ *      the documentation and/or other materials provided with the
+ *      distribution.
+ *    * Neither the name of Broadcom Corporation nor the names of its
+ *      contributors may be used to endorse or promote products derived
+ *      from this software without specific prior written permission.
+ *
+ *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+/dts-v1/;
+
+#include "bcm4708.dtsi"
+
+/ {
+	model = "NorthStar SVK (BCM953012K)";
+	compatible = "brcm,bcm953012k", "brcm,brcm53012", "brcm,bcm4708";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory {
+		reg = <0x00000000 0x10000000>;
+	};
+};
+
+&uart0 {
+	clock-frequency = <62499840>;
+	status = "okay";
+};
+
+&uart1 {
+	clock-frequency = <62499840>;
+	status = "okay";
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
