From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v4] MAINTAINERS: Add file patterns for mailbox device tree bindings
Date: Fri, 22 Jun 2018 12:08:15 +0200
Message-ID: <20180622100815.29271-1-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v3:
  - Update for next-20180622,

v2:
  - No changes.

Impact on "scripts/get_maintainer.pl -f Documentation/devicetree/bindings/mailbox/":

-Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS,commit_signer:10/10=100%)
+Jassi Brar <jassisinghbrar@gmail.com> (maintainer:MAILBOX API)
+Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 Mark Rutland <mark.rutland@arm.com> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
-Jassi Brar <jaswinder.singh@linaro.org> (commit_signer:5/10=50%)
-Bjorn Andersson <bjorn.andersson@linaro.org> (commit_signer:3/10=30%,authored:1/10=10%)
-Georgi Djakov <georgi.djakov@linaro.org> (commit_signer:1/10=10%,authored:1/10=10%)
-Sudeep Holla <sudeep.holla@arm.com> (commit_signer:1/10=10%,authored:1/10=10%)
-Mathieu Malaterre <malat@debian.org> (authored:1/10=10%)
-Marco Franchi <marco.franchi@nxp.com> (authored:1/10=10%)
+linux-kernel@vger.kernel.org (open list:MAILBOX API)
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
-linux-kernel@vger.kernel.org (open list)
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 321fbaa7e7d273a2..3bb8ce891719ed21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8551,6 +8551,7 @@ MAILBOX API
 M:	Jassi Brar <jassisinghbrar@gmail.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/mailbox/
 F:	drivers/mailbox/
 F:	include/linux/mailbox_client.h
 F:	include/linux/mailbox_controller.h
-- 
2.17.1
