From: Stefan Schaeckeler <schaecsn@gmx.net>
Subject: [PATCH 2/2] dt-bindings: edac: Aspeed AST2500
Date: Sun, 16 Dec 2018 22:01:57 -0800
Message-ID: <1545026517-64069-3-git-send-email-schaecsn@gmx.net>
References: <1545026517-64069-1-git-send-email-schaecsn@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1545026517-64069-1-git-send-email-schaecsn@gmx.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-edac@vger.kernel.org
Cc: Stefan M Schaeckeler <sschaeck@cisco.com>
List-Id: devicetree@vger.kernel.org

From: Stefan M Schaeckeler <sschaeck@cisco.com>

Add support for the Aspeed AST2500 SoC EDAC driver.

Signed-off-by: Stefan M Schaeckeler <sschaeck@cisco.com>
---
 .../bindings/edac/aspeed-sdram-edac.txt       | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/aspeed-sdram-edac.txt

diff --git a/Documentation/devicetree/bindings/edac/aspeed-sdram-edac.txt b/Documentation/devicetree/bindings/edac/aspeed-sdram-edac.txt
new file mode 100644
index 000000000000..57ba852883c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/aspeed-sdram-edac.txt
@@ -0,0 +1,34 @@
+Aspeed AST2500 SoC EDAC device driver
+
+The Aspeed AST2500 SoC supports DDR3 and DDR4 memory with and without ECC (error
+correction check).
+
+The memory controller supports SECDED (single bit error correction, double bit
+error detection) and single bit error auto scrubbing by reserving 8 bits for
+every 64 bit word (effectively reducing available memory to 8/9).
+
+First, ECC must be configured in u-boot. Then, this driver will expose error
+counters via the edac kernel framework.
+
+A note on memory organization in ECC mode: every 512 bytes are followed by 64
+bytes of ECC codes. The address remapping is done in hardware and is fully
+transparent to firmware and software. Because of this, ECC mode must be
+configured in u-boot as part of the memory initialization as one can not switch
+from one mode to another when executing in memory.
+
+
+
+Required properties:
+- compatible: should be "aspeed,ast2500-sdram-edac"
+- reg:        sdram controller register set should be <0x1e6e0000 0x174>
+- interrupts: should be AVIC interrupt #0
+
+
+Example:
+
+	edac: sdram@1e6e0000 {
+		compatible = "aspeed,ast2500-sdram-edac";
+		reg = <0x1e6e0000 0x174>;
+		interrupts = <0>;
+		status = "okay";
+	};
-- 
2.19.1
