From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [RFC 2/7] soc: qcom: Add device tree binding for SMD
Date: Mon, 29 Sep 2014 17:34:46 -0700
Message-ID: <1412037291-16880-3-git-send-email-bjorn.andersson@sonymobile.com>
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

Add device tree binding documentation for the Qualcomm Shared Memory
Device.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---

I was looking at having one smd node per remote processor - e.g flatten the
first and second level. As all the channels, for all the remote processors are
allocated from the same pool this does however not feel very natural.

 .../devicetree/bindings/soc/qcom/qcom,smd.txt      |   82 ++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd.txt

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smd.txt
new file mode 100644
index 0000000..c56e4fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd.txt
@@ -0,0 +1,82 @@
+Qualcomm Shared Memory Driver (SMD) binding
+
+This binding describes the Qualcomm Shared Memory Driver, a fifo based
+communication channel for sending data between the various subsystems in
+Qualcomm platforms.
+
+- compatible:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "qcom,smd"
+
+- qcom,smem:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: reference to a smem node managing the shared memory items
+		    used for smd
+
+= EDGES
+
+Each subnode of the SMD node represents a remote subsystem, i.e. a remote
+processor of some sort - in SMD language called an "edge". The name of the
+edges are not important.
+
+- interrupts:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: should specify the IRQ used by the remote processor to
+		    signal this processor about communication related updates
+
+- qcom,ipc:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: three entries specifying the outgoing ipc bit used for
+		    signaling the remote processor:
+		    - phandle to a syscon node representing the apcs registers
+		    - u32 representing offset to the register within the syscon
+		    - u32 representing the ipc bit within the register
+
+- qcom,smd-edge:
+	Usage: required
+	Value type: <u32>
+	Definition: an identifier representing the remote processor
+
+= SMD DEVICES
+
+In turn, subnodes of the "edges" represent devices tied to SMD channels on that
+"edge". The names of the devices are not important. The properties of these
+nodes are defined by the individual bindings for the SMD devices - but must
+contain the following property:
+
+- qcom,smd-channels:
+	Usage: required
+	Value type: <stringlist>
+	Definition: a list of channels tied to this device, used for matching
+		    the device to channels
+
+= EXAMPLE
+
+The following example represents a smd node, with one edge representing the
+"rpm" subsystem. For the "rpm" subsystem we have a device tied to the
+"rpm_request" channel.
+
+        smd {
+                compatible = "qcom,smd";
+                qcom,smem = <&smem>;
+
+                rpm {
+                        interrupts = <0 168 1>;
+                        qcom,ipc = <&apcs 8 0>;
+                        qcom,smd-edge = <15>;
+
+                        rpm_requests {
+                                compatible = "qcom,rpm-msm8974";
+                                qcom,smd-channels = "rpm_requests";
+
+                                #address-cells = <1>;
+                                #size-cells = <0>;
+
+				...
+			};
+		};
+	};
-- 
1.7.9.5
