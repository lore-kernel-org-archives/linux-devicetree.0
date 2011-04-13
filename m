From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 2/2] ARM: vexpress: add basic dts DT source
Date: Wed, 13 Apr 2011 19:02:21 +0100
Message-ID: <1302717741-18753-3-git-send-email-lorenzo.pieralisi@arm.com>
References: <1302717741-18753-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1302717741-18753-1-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch provides a simple device tree source for the Versatile
Express board. It just defines memory layout and assigns a compatible string
to the board.

Compiled blob tested on Versatile Express, passed to the kernel
through u-boot. 'chosen' node defined within u-boot to avoid cluttering
the default dts configuration.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/boot/dts/vexpress.dts |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/vexpress.dts

diff --git a/arch/arm/boot/dts/vexpress.dts b/arch/arm/boot/dts/vexpress.dts
new file mode 100644
index 0000000..bea2a18
--- /dev/null
+++ b/arch/arm/boot/dts/vexpress.dts
@@ -0,0 +1,18 @@
+/dts-v1/;
+
+/ {
+	model = "ARM Versatile Express";
+	compatible = "arm,vexpress";
+
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	aliases { };
+
+	chosen { };
+
+	memory {
+		device_type = "memory";
+		reg = <0x60000000 0x40000000>;
+	};
+};
-- 
1.7.4.4
