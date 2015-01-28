From: Rob Herring <robh@kernel.org>
Subject: [PATCH 1/3] dt/bindings: Add binding for Versatile system registers
Date: Wed, 28 Jan 2015 11:56:30 -0600
Message-ID: <1422467792-2065-2-git-send-email-robh@kernel.org>
References: <1422467792-2065-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1422467792-2065-1-git-send-email-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add binding for Versatile board system registers found in the FPGA of the
Versatile/AB and Versatile/PB boards.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/arm/versatile-sysreg.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/versatile-sysreg.txt

diff --git a/Documentation/devicetree/bindings/arm/versatile-sysreg.txt b/Documentation/devicetree/bindings/arm/versatile-sysreg.txt
new file mode 100644
index 0000000..a4f1526
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/versatile-sysreg.txt
@@ -0,0 +1,10 @@
+ARM Versatile system registers
+--------------------------------------
+
+This is a system control registers block, providing multiple low level
+platform functions like board detection and identification, software
+interrupt generation, MMC and NOR Flash control etc.
+
+Required node properties:
+- compatible value : = "arm,versatile-sysreg", "syscon"
+- reg : physical base address and the size of the registers window
-- 
2.1.0
