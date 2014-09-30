From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [RFC 1/7] soc: qcom: Add device tree binding for SMEM
Date: Mon, 29 Sep 2014 17:34:45 -0700
Message-ID: <1412037291-16880-2-git-send-email-bjorn.andersson@sonymobile.com>
References: <1412037291-16880-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1412037291-16880-1-git-send-email-bjorn.andersson@sonymobile.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add device tree binding documentation for the Qualcom Shared Memory
manager.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---

Exposed by this node is a set of items of different sizes. For many things a
standard of_xlate method of referencing the individual nodes would be
preferable, so a #something-cells would make sense. We do however also needs
access to these items without explicitly stating the references in devicetree
(e.g. SMD references 257 of these). I haven't found any good example of how to
implement this, so suggestions are welcome.

Note that the hwspinlock reference is not yet supported in the mainline, but
this will likely need a few iterations so I wanted to get this out.

 .../devicetree/bindings/soc/qcom/qcom,smem.txt     |   34 ++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
new file mode 100644
index 0000000..ddd58c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
@@ -0,0 +1,34 @@
+Qualcomm Shared Memory binding
+
+This binding describes the Qualcomm Shared Memory, used to share data between
+various subsystems and OSes in Qualcomm platforms.
+
+- compatible:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be:
+		    "qcom,smem"
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: base address and size pair for each area representing the
+		    shared memory. The first pair will must represent the "main"
+		    area, where the shared memory header and table-of-content
+		    can be found.
+
+- hwspinlocks:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: reference to a hwspinlock used to protect allocations from
+		    the shared memory
+
+= EXAMPLE
+
+        smem: smem@fa00000 {
+                compatible = "qcom,smem";
+                reg = <0x0fa00000 0x200000>,
+                      <0xfc428000 0x4000>;
+
+                hwspinlocks = <&tcsr_mutex 3>;
+        };
-- 
1.7.9.5
