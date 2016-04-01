From: Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v9 1/4] dt/bindings: add bindings for optee
Date: Fri,  1 Apr 2016 12:46:45 +0200
Message-ID: <1459507608-26582-2-git-send-email-jens.wiklander@linaro.org>
References: <1459507608-26582-1-git-send-email-jens.wiklander@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1459507608-26582-1-git-send-email-jens.wiklander@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: valentin.manea@huawei.com, Mark Rutland <mark.rutland@arm.com>, javier@javigon.com, emmanuel.michel@st.com, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon <will.deacon@arm.com>, Michal Simek <michal.simek@xilinx.com>, jean-michel.delorme@st.com, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Rob Herring <robh+dt@kernel.org>, Al Viro <viro@ZenIV.linux.org.uk>, Jens Wiklander <jens.wiklander@linaro.org>, Andreas Dannenberg <dannenberg@ti.com>
List-Id: devicetree@vger.kernel.org

Introduces linaro prefix and adds bindings for ARM TrustZone based OP-TEE
implementation.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 .../bindings/arm/firmware/linaro,optee-tz.txt      | 31 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.txt

diff --git a/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.txt b/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.txt
new file mode 100644
index 0000000..d38834c
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.txt
@@ -0,0 +1,31 @@
+OP-TEE Device Tree Bindings
+
+OP-TEE is a piece of software using hardware features to provide a Trusted
+Execution Environment. The security can be provided with ARM TrustZone, but
+also by virtualization or a separate chip.
+
+We're using "linaro" as the first part of the compatible property for
+the reference implementation maintained by Linaro.
+
+* OP-TEE based on ARM TrustZone required properties:
+
+- compatible     : should contain "linaro,optee-tz"
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
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 86740d4..0372fd7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -136,6 +136,7 @@ lacie	LaCie
 lantiq	Lantiq Semiconductor
 lenovo	Lenovo Group Ltd.
 lg	LG Corporation
+linaro	Linaro Limited
 linux	Linux-specific binding
 lsi	LSI Corp. (LSI Logic)
 lltc	Linear Technology Corporation
-- 
1.9.1
