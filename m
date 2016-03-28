From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 2/5 v5] drm: Add DT bindings documentation for ARC PGU display
 controller
Date: Mon, 28 Mar 2016 14:36:36 +0300
Message-ID: <1459164999-11850-3-git-send-email-abrodkin@synopsys.com>
References: <1459164999-11850-1-git-send-email-abrodkin@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <1459164999-11850-1-git-send-email-abrodkin@synopsys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-snps-arc@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This add DT bindings documentation for ARC PGU display controller.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org
Acked-by: Rob Herring <robh@kernel.org>
---

Changes v4 -> v5: (addressing Rob's comment)
 * Added Rob's acked-by
 * Remove "encoder-slave" from the example as well.
   Now only "pgu" node is mentioned in the example.

Changes v3 -> v4: (addressing Rob's comments)
 * Removed "encoder-slave" from required properties
 * Removed "0x" from node names

Changes v2 -> v3:
 * Reverted back to initial larger version of example
   with minor fixes (thanks Rob for spotting those).

Changes v1 -> v2:
 * Removed everything except PGU node itself.

 .../devicetree/bindings/display/snps,arcpgu.txt    | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/snps,arcpgu.txt

diff --git a/Documentation/devicetree/bindings/display/snps,arcpgu.txt b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
new file mode 100644
index 0000000..c5c7dfd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
@@ -0,0 +1,35 @@
+ARC PGU
+
+This is a display controller found on several development boards produced
+by Synopsys. The ARC PGU is an RGB streamer that reads the data from a
+framebuffer and sends it to a single digital encoder (usually HDMI).
+
+Required properties:
+  - compatible: "snps,arcpgu"
+  - reg: Physical base address and length of the controller's registers.
+  - clocks: A list of phandle + clock-specifier pairs, one for each
+    entry in 'clock-names'.
+  - clock-names: A list of clock names. For ARC PGU it should contain:
+      - "pxlclk" for the clock feeding the output PLL of the controller.
+
+Required sub-nodes:
+  - port: The PGU connection to an encoder chip.
+
+Example:
+
+/ {
+	...
+
+	pgu@XXXXXXXX {
+		compatible = "snps,arcpgu";
+		reg = <0xXXXXXXXX 0x400>;
+		clocks = <&clock_node>;
+		clock-names = "pxlclk";
+
+		port {
+			pgu_output: endpoint {
+				remote-endpoint = <&hdmi_enc_input>;
+			};
+		};
+	};
+};
-- 
2.5.0
