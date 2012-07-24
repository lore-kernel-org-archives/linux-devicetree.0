From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH 4/6] Document: devicetree: add OF documents for lantiq falcon
 pinctrl
Date: Tue, 24 Jul 2012 08:50:58 +0200
Message-ID: <1343112660-12245-4-git-send-email-blogic@openwrt.org>
References: <1343112660-12245-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1343112660-12245-1-git-send-email-blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Thomas Langer <thomas.langer-th3ZBGNqt+7QT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Signed-off-by: Thomas Langer <thomas.langer-th3ZBGNqt+7QT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 .../bindings/pinctrl/lantiq,falcon-pinumx.txt      |   83 ++++++++++++++++++++
 1 files changed, 83 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/lantiq,falcon-pinumx.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/lantiq,falcon-pinumx.txt b/Documentation/devicetree/bindings/pinctrl/lantiq,falcon-pinumx.txt
new file mode 100644
index 0000000..daa7689
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/lantiq,falcon-pinumx.txt
@@ -0,0 +1,83 @@
+Lantiq FALCON pinmux controller
+
+Required properties:
+- compatible: "lantiq,pinctrl-falcon"
+- reg: Should contain the physical address and length of the gpio/pinmux
+  register range
+
+Please refer to pinctrl-bindings.txt in this directory for details of the
+common pinctrl bindings used by client devices, including the meaning of the
+phrase "pin configuration node".
+
+Lantiq's pin configuration nodes act as a container for an abitrary number of
+subnodes. Each of these subnodes represents some desired configuration for a
+pin, a group, or a list of pins or groups. This configuration can include the
+mux function to select on those group(s), and two pin configuration parameters:
+pull-up and open-drain
+
+The name of each subnode is not important as long as it is unique; all subnodes
+should be enumerated and processed purely based on their content.
+
+Each subnode only affects those parameters that are explicitly listed. In
+other words, a subnode that lists a mux function but no pin configuration
+parameters implies no information about any pin configuration parameters.
+Similarly, a pin subnode that describes a pullup parameter implies no
+information about e.g. the mux function.
+
+We support 2 types of nodes.
+
+Definition of mux function groups:
+
+Required subnode-properties:
+- lantiq,groups : An array of strings. Each string contains the name of a group.
+  Valid values for these names are listed below.
+- lantiq,function: A string containing the name of the function to mux to the
+  group. Valid values for function names are listed below.
+
+Valid values for group and function names:
+
+  mux groups:
+    por, ntr, ntr8k, hrst, mdio, bootled, asc0, spi, spi cs0, spi cs1, i2c,
+    jtag, slic, pcm, asc1
+
+  functions:
+    rst, ntr, mdio, led, asc, spi, i2c, jtag, slic, pcm
+
+
+Definition of pin configurations:
+
+Required subnode-properties:
+- lantiq,pins : An array of strings. Each string contains the name of a pin.
+  Valid values for these names are listed below.
+
+Optional subnode-properties:
+- lantiq,pull: Integer, representing the pull-down/up to apply to the pin.
+    0: none, 1: down
+- lantiq,drive-current: Boolean, enables drive-current
+- lantiq,slew-rate: Boolean, enables slew-rate
+
+Example:
+	pinmux0 {
+		compatible = "lantiq,pinctrl-falcon";
+		pinctrl-names = "default";
+		pinctrl-0 = <&state_default>;
+
+		state_default: pinmux {
+			asc0 {
+				lantiq,groups = "asc0";
+				lantiq,function = "asc";
+			};
+			ntr {
+				lantiq,groups = "ntr8k";
+				lantiq,function = "ntr";
+			};
+			i2c {
+				lantiq,groups = "i2c";
+				lantiq,function = "i2c";
+			};
+			hrst {
+				lantiq,groups = "hrst";
+				lantiq,function = "rst";
+			};
+		};
+	};
-- 
1.7.9.1
