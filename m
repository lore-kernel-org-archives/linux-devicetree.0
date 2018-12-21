From: Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH 2/3] Documentation: DT: Add entry for DPAA2 console
Date: Fri, 21 Dec 2018 15:31:11 +0000
Message-ID: <1545406240-3061-3-git-send-email-ioana.ciornei@nxp.com>
References: <1545406240-3061-1-git-send-email-ioana.ciornei@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545406240-3061-1-git-send-email-ioana.ciornei@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Li <leoyang.li@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Roy Pledge <roy.pledge@nxp.com>, Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch adds a devicetree binding documentation for
FSL's DPAA2 console.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 Documentation/devicetree/bindings/misc/dpaa2-console.txt | 11 +++++++++++
 MAINTAINERS                                              |  1 +
 2 files changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/dpaa2-console.tx=
t

diff --git a/Documentation/devicetree/bindings/misc/dpaa2-console.txt b/Doc=
umentation/devicetree/bindings/misc/dpaa2-console.txt
new file mode 100644
index 0000000..f4e16b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/dpaa2-console.txt
@@ -0,0 +1,11 @@
+DPAA2 console support
+
+Required properties:
+
+    - compatible
+        Value type: <string>
+        Definition: Must be "dpaa2-console".
+    - reg
+        Value type: <prop-encoded-array>
+        Definition: A standard property.  Specifies the region where the M=
CFBA
+                    (MC firmware base address) register can be found.
diff --git a/MAINTAINERS b/MAINTAINERS
index 7b76a80..229d4fb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5969,6 +5969,7 @@ M:	Li Yang <leoyang.li@nxp.com>
 L:	linuxppc-dev@lists.ozlabs.org
 L:	linux-arm-kernel@lists.infradead.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/misc/dpaa2-console.txt
 F:	Documentation/devicetree/bindings/soc/fsl/
 F:	drivers/soc/fsl/
 F:	include/linux/fsl/
--=20
1.9.1
