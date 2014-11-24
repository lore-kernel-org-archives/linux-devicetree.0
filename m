From: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Subject: [PATCH v2 2/4] powerpc/mpc85xx: Create dts components for the FSL QorIQ DPAA QMan
Date: Mon, 24 Nov 2014 05:07:21 -0600
Message-ID: <1416827243-16396-3-git-send-email-Emilian.Medve@Freescale.com>
References: <1416827243-16396-1-git-send-email-Emilian.Medve@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416827243-16396-1-git-send-email-Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: scottwood-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Geoff Thorpe <Geoff.Thorpe-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>, Hai-Ying Wang <Haiying.Wang-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>, Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>

Change-Id: I16e63db731e55a3d60d4e147573c1af8718082d3
Signed-off-by: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Signed-off-by: Geoff Thorpe <Geoff.Thorpe-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Hai-Ying Wang <Haiying.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
[Emil Medve: Sync with the upstream binding]
Signed-off-by: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
---
 arch/powerpc/boot/dts/fsl/qoriq-qman1-portals.dtsi | 101 +++++++++++++++++++++
 arch/powerpc/boot/dts/fsl/qoriq-qman1.dtsi         |  41 +++++++++
 arch/powerpc/boot/dts/fsl/qoriq-qman3.dtsi         |  41 +++++++++
 3 files changed, 183 insertions(+)
 create mode 100644 arch/powerpc/boot/dts/fsl/qoriq-qman1-portals.dtsi
 create mode 100644 arch/powerpc/boot/dts/fsl/qoriq-qman1.dtsi
 create mode 100644 arch/powerpc/boot/dts/fsl/qoriq-qman3.dtsi

diff --git a/arch/powerpc/boot/dts/fsl/qoriq-qman1-portals.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-qman1-portals.dtsi
new file mode 100644
index 0000000..05d51ac
--- /dev/null
+++ b/arch/powerpc/boot/dts/fsl/qoriq-qman1-portals.dtsi
@@ -0,0 +1,101 @@
+/*
+ * QorIQ QMan Portal device tree stub for 10 portals & 15 pool channels
+ *
+ * Copyright 2011 - 2014 Freescale Semiconductor Inc.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are met:
+ *     * Redistributions of source code must retain the above copyright
+ *	 notice, this list of conditions and the following disclaimer.
+ *     * Redistributions in binary form must reproduce the above copyright
+ *	 notice, this list of conditions and the following disclaimer in the
+ *	 documentation and/or other materials provided with the distribution.
+ *     * Neither the name of Freescale Semiconductor nor the
+ *	 names of its contributors may be used to endorse or promote products
+ *	 derived from this software without specific prior written permission.
+ *
+ *
+ * ALTERNATIVELY, this software may be distributed under the terms of the
+ * GNU General Public License ("GPL") as published by the Free Software
+ * Foundation, either version 2 of that License or (at your option) any
+ * later version.
+ *
+ * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor ``AS IS'' AND ANY
+ * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+ * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+ * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR ANY
+ * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+ * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+ * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+&qportals {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "simple-bus";
+
+	qportal0: qman-portal@0 {
+		compatible = "fsl,qman-portal";
+		reg = <0x0 0x4000>, <0x100000 0x1000>;
+		interrupts = <104 2 0 0>;
+		fsl,qman-channel-id = <0x0>;
+	};
+	qportal1: qman-portal@4000 {
+		compatible = "fsl,qman-portal";
+		reg = <0x4000 0x4000>, <0x101000 0x1000>;
+		interrupts = <106 2 0 0>;
+		fsl,qman-channel-id = <1>;
+	};
+	qportal2: qman-portal@8000 {
+		compatible = "fsl,qman-portal";
+		reg = <0x8000 0x4000>, <0x102000 0x1000>;
+		interrupts = <108 2 0 0>;
+		fsl,qman-channel-id = <2>;
+	};
+	qportal3: qman-portal@c000 {
+		compatible = "fsl,qman-portal";
+		reg = <0xc000 0x4000>, <0x103000 0x1000>;
+		interrupts = <110 2 0 0>;
+		fsl,qman-channel-id = <3>;
+	};
+	qportal4: qman-portal@10000 {
+		compatible = "fsl,qman-portal";
+		reg = <0x10000 0x4000>, <0x104000 0x1000>;
+		interrupts = <112 2 0 0>;
+		fsl,qman-channel-id = <4>;
+	};
+	qportal5: qman-portal@14000 {
+		compatible = "fsl,qman-portal";
+		reg = <0x14000 0x4000>, <0x105000 0x1000>;
+		interrupts = <114 2 0 0>;
+		fsl,qman-channel-id = <5>;
+	};
+	qportal6: qman-portal@18000 {
+		compatible = "fsl,qman-portal";
+		reg = <0x18000 0x4000>, <0x106000 0x1000>;
+		interrupts = <116 2 0 0>;
+		fsl,qman-channel-id = <6>;
+	};
+
+	qportal7: qman-portal@1c000 {
+		compatible = "fsl,qman-portal";
+		reg = <0x1c000 0x4000>, <0x107000 0x1000>;
+		interrupts = <118 2 0 0>;
+		fsl,qman-channel-id = <7>;
+	};
+	qportal8: qman-portal@20000 {
+		compatible = "fsl,qman-portal";
+		reg = <0x20000 0x4000>, <0x108000 0x1000>;
+		interrupts = <120 2 0 0>;
+		fsl,qman-channel-id = <8>;
+	};
+	qportal9: qman-portal@24000 {
+		compatible = "fsl,qman-portal";
+		reg = <0x24000 0x4000>, <0x109000 0x1000>;
+		interrupts = <122 2 0 0>;
+		fsl,qman-channel-id = <9>;
+	};
+};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-qman1.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-qman1.dtsi
new file mode 100644
index 0000000..5c63b76
--- /dev/null
+++ b/arch/powerpc/boot/dts/fsl/qoriq-qman1.dtsi
@@ -0,0 +1,41 @@
+/*
+ * QorIQ QMan device tree stub [ controller @ offset 0x318000 ]
+ *
+ * Copyright 2011 - 2014 Freescale Semiconductor Inc.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are met:
+ *     * Redistributions of source code must retain the above copyright
+ *	 notice, this list of conditions and the following disclaimer.
+ *     * Redistributions in binary form must reproduce the above copyright
+ *	 notice, this list of conditions and the following disclaimer in the
+ *	 documentation and/or other materials provided with the distribution.
+ *     * Neither the name of Freescale Semiconductor nor the
+ *	 names of its contributors may be used to endorse or promote products
+ *	 derived from this software without specific prior written permission.
+ *
+ *
+ * ALTERNATIVELY, this software may be distributed under the terms of the
+ * GNU General Public License ("GPL") as published by the Free Software
+ * Foundation, either version 2 of that License or (at your option) any
+ * later version.
+ *
+ * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor ``AS IS'' AND ANY
+ * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+ * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+ * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR ANY
+ * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+ * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+ * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+qman: qman@318000 {
+	compatible = "fsl,qman";
+	reg = <0x318000 0x1000>;
+	interrupts = <16 2 1 3>;
+	fsl,qman-portals = &qportals;
+	memory-region = <&qman_fqd &qman_pfdr>;
+};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-qman3.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-qman3.dtsi
new file mode 100644
index 0000000..f3f57c6
--- /dev/null
+++ b/arch/powerpc/boot/dts/fsl/qoriq-qman3.dtsi
@@ -0,0 +1,41 @@
+/*
+ * QorIQ QMan rev3 device tree stub [ controller @ offset 0x318000 ]
+ *
+ * Copyright 2014 Freescale Semiconductor Inc.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are met:
+ *     * Redistributions of source code must retain the above copyright
+ *	 notice, this list of conditions and the following disclaimer.
+ *     * Redistributions in binary form must reproduce the above copyright
+ *	 notice, this list of conditions and the following disclaimer in the
+ *	 documentation and/or other materials provided with the distribution.
+ *     * Neither the name of Freescale Semiconductor nor the
+ *	 names of its contributors may be used to endorse or promote products
+ *	 derived from this software without specific prior written permission.
+ *
+ *
+ * ALTERNATIVELY, this software may be distributed under the terms of the
+ * GNU General Public License ("GPL") as published by the Free Software
+ * Foundation, either version 2 of that License or (at your option) any
+ * later version.
+ *
+ * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor ``AS IS'' AND ANY
+ * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+ * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+ * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR ANY
+ * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+ * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+ * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+qman: qman@318000 {
+	compatible = "fsl,qman";
+	reg = <0x318000 0x2000>;
+	interrupts = <16 2 1 3>;
+	fsl,qman-portals = &qportals;
+	memory-region = <&qman_fqd &qman_pfdr>;
+};
-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
