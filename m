From: Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v4 2/5] dt/bindings: add bindings for optee
Date: Wed,  8 Jul 2015 12:16:29 +0200
Message-ID: <1436350592-7732-3-git-send-email-jens.wiklander@linaro.org>
References: <1436350592-7732-1-git-send-email-jens.wiklander@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1436350592-7732-1-git-send-email-jens.wiklander@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
Cc: valentin.manea@huawei.com, Mark Rutland <mark.rutland@arm.com>, javier@javigon.com, emmanuel.michel@st.com, Herbert Xu <herbert@gondor.apana.org.au>, Michal Simek <michal.simek@xilinx.com>, jean-michel.delorme@st.com, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Jens Wiklander <jens.wiklander@linaro.org>
List-Id: devicetree@vger.kernel.org

Introduces optee prefix and adds bindings for ARM TrustZone based OP-TEE
implementation.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 Documentation/devicetree/bindings/optee/optee.txt     | 17 +++++++++++++++++
 Documentation/devicetree/bindings/vendor-prefixes.txt |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/optee/optee.txt

diff --git a/Documentation/devicetree/bindings/optee/optee.txt b/Documentation/devicetree/bindings/optee/optee.txt
new file mode 100644
index 0000000..4a6ff10
--- /dev/null
+++ b/Documentation/devicetree/bindings/optee/optee.txt
@@ -0,0 +1,17 @@
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
+- compatible="optee,optee-tz"
+
+Example:
+	optee {
+		compatible="optee,optee-tz";
+	};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 8033919..17c2a7e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -141,6 +141,7 @@ nvidia	NVIDIA
 nxp	NXP Semiconductors
 onnn	ON Semiconductor Corp.
 opencores	OpenCores.org
+optee	OP-TEE, Open Portable Trusted Execution Environment
 ortustech	Ortus Technology Co., Ltd.
 ovti	OmniVision Technologies
 panasonic	Panasonic Corporation
-- 
1.9.1
