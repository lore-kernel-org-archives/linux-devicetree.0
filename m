From: Alex Elder <elder@linaro.org>
Subject: [PATCH v4 1/5] devicetree: bindings: document Broadcom CPU enable
 method
Date: Tue, 20 May 2014 12:43:46 -0500
Message-ID: <1400607830-10989-2-git-send-email-elder@linaro.org>
References: <1400607830-10989-1-git-send-email-elder@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1400607830-10989-1-git-send-email-elder@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: mporter@linaro.org, bcm@fixthebug.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, arnd@arndb.de, sboyd@codeaurora.org
Cc: mark.rutland@arm.com, lorenzo.pieralisi@arm.com, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, rjui@broadcom.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, rvaswani@codeaurora.org, robh+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com, rdunlap@infradead.org, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Broadcom mobile SoCs use a ROM-implemented holding pen for
controlled boot of secondary cores.  A special register is
used to communicate to the ROM that a secondary core should
start executing kernel code.  This enable method is currently
used for members of the bcm281xx and bcm21664 SoC families.

The use of an enable method also allows the SMP operation vector to
be assigned as a result of device tree content for these SoCs.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 Documentation/devicetree/bindings/arm/cpus.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index 333f4ae..c6a2411 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -185,6 +185,7 @@ nodes to be present and contain the properties described below.
 			    "qcom,gcc-msm8660"
 			    "qcom,kpss-acc-v1"
 			    "qcom,kpss-acc-v2"
+			    "brcm,bcm11351-cpu-method"
 
 	- cpu-release-addr
 		Usage: required for systems that have an "enable-method"
@@ -209,6 +210,17 @@ nodes to be present and contain the properties described below.
 		Value type: <phandle>
 		Definition: Specifies the ACC[2] node associated with this CPU.
 
+	- secondary-boot-reg
+		Usage:
+			Required for systems that have an "enable-method"
+			property value of "brcm,bcm11351-cpu-method".
+		Value type: <u32>
+		Definition:
+			Specifies the physical address of the register used to
+			request the ROM holding pen code release a secondary
+			CPU.  The value written to the register is formed by
+			encoding the target CPU id into the low bits of the
+			physical start address it should jump to.
 
 Example 1 (dual-cluster big.LITTLE system 32-bit):
 
-- 
1.9.1
