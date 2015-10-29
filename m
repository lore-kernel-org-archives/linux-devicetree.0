From: Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 3/6] dt/bindings: add bindings for optee
Date: Thu, 29 Oct 2015 09:21:25 +0100
Message-ID: <1446106888-8983-4-git-send-email-jens.wiklander@linaro.org>
References: <1446106888-8983-1-git-send-email-jens.wiklander@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446106888-8983-1-git-send-email-jens.wiklander@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>
Cc: valentin.manea@huawei.com, jean-michel.delorme@st.com, emmanuel.michel@st.com, javier@javigon.com, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Jens Wiklander <jens.wiklander@linaro.org>
List-Id: devicetree@vger.kernel.org

Introduces optee prefix and adds bindings for ARM TrustZone based OP-TEE
implementation.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 .../bindings/arm/firmware/optee,optee-tz.txt       | 29 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/firmware/optee,optee-tz.txt

diff --git a/Documentation/devicetree/bindings/arm/firmware/optee,optee-tz.txt b/Documentation/devicetree/bindings/arm/firmware/optee,optee-tz.txt
new file mode 100644
index 0000000..0a8ed0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/firmware/optee,optee-tz.txt
@@ -0,0 +1,29 @@
+OP-TEE Device Tree Bindings
+
+OP-TEE is a piece of software using hardware features to provide a Trusted
+Execution Environment. The security can be provided with ARM TrustZone, but
+also by virtualization or a separate chip. As there's no single OP-TEE
+vendor we're using "optee" as the first part of compatible property,
+indicating the OP-TEE protocol is used when communicating with the secure
+world.
+
+* OP-TEE based on ARM TrustZone required properties:
+
+- compatible     : should contain "optee,optee-tz"
+
+- method         : The method of calling the OP-TEE Trusted OS. Permitted
+                   values are:
+
+                   "smc" : SMC #0, with the register assignments specified
+		           in drivers/tee/optee/optee_smc.h
+
+                   "hvc" : HVC #0, with the register assignments specified
+		           in drivers/tee/optee/optee_smc.h
+
+
+
+Example:
+	optee {
+		compatible = "optee,optee-tz";
+		method = "smc";
+	};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 82d2ac9..38e632f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -159,6 +159,7 @@ nxp	NXP Semiconductors
 okaya	Okaya Electric America, Inc.
 onnn	ON Semiconductor Corp.
 opencores	OpenCores.org
+optee	OP-TEE, Open Portable Trusted Execution Environment
 option	Option NV
 ortustech	Ortus Technology Co., Ltd.
 ovti	OmniVision Technologies
-- 
1.9.1
