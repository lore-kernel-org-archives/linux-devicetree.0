Return-Path: <SRS0=u60/=R5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr50056.outbound.protection.outlook.com ([40.107.5.56]:51362
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726266AbfCZTXf (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Mar 2019 15:23:35 -0400
From: Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH 2/2] Documentation: DT: Add entry for DPAA2 console
Date: Tue, 26 Mar 2019 19:23:31 +0000
Message-ID: <1553628194-25119-3-git-send-email-ioana.ciornei@nxp.com>
References: <1553628194-25119-1-git-send-email-ioana.ciornei@nxp.com>
In-Reply-To: <1553628194-25119-1-git-send-email-ioana.ciornei@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: Leo Li <leoyang.li@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds a devicetree binding documentation for
FSL's DPAA2 console.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt | 11 ++++++++=
+++
 MAINTAINERS                                                  |  1 +
 2 files changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/fsl,dpaa2-consol=
e.txt

diff --git a/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt b=
/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt
new file mode 100644
index 000000000000..1442ba5d2d98
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt
@@ -0,0 +1,11 @@
+DPAA2 console support
+
+Required properties:
+
+    - compatible
+        Value type: <string>
+        Definition: Must be "fsl,dpaa2-console".
+    - reg
+        Value type: <prop-encoded-array>
+        Definition: A standard property.  Specifies the region where the M=
CFBA
+                    (MC firmware base address) register can be found.
diff --git a/MAINTAINERS b/MAINTAINERS
index 32d444476a90..aed85fc7c783 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6127,6 +6127,7 @@ M:	Li Yang <leoyang.li@nxp.com>
 L:	linuxppc-dev@lists.ozlabs.org
 L:	linux-arm-kernel@lists.infradead.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt
 F:	Documentation/devicetree/bindings/soc/fsl/
 F:	drivers/soc/fsl/
 F:	include/linux/fsl/
--=20
1.9.1
