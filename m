From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 27/28] dt-bindings: mips: img,boston: Document img,boston binding
Date: Mon, 30 Nov 2015 16:21:52 +0000
Message-ID: <1448900513-20856-28-git-send-email-paul.burton@imgtec.com>
References: <1448900513-20856-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448900513-20856-1-git-send-email-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, Tejun Heo <tj@kernel.org>, Joe Perches <joe@perches.com>, Jiri Slaby <jslaby@suse.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Pawel Moll <pawel.moll@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add documentation for the simple img,boston devicetree binding & the
boot protocol used to pass the devicetree to the kernel.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 Documentation/devicetree/bindings/mips/img/boston.txt | 15 +++++++++++++++
 MAINTAINERS                                           |  5 +++++
 2 files changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/img/boston.txt

diff --git a/Documentation/devicetree/bindings/mips/img/boston.txt b/Documentation/devicetree/bindings/mips/img/boston.txt
new file mode 100644
index 0000000..27b2806
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/img/boston.txt
@@ -0,0 +1,15 @@
+Imagination Technologies Boston Development Board
+=================================================
+
+Required properties:
+--------------------
+ - compatible: Must be "img,boston".
+
+Boot protocol:
+--------------
+In accordance with the MIPS UHI specification[1], the bootloader must pass the
+following arguments to the kernel:
+ - $a0: -2.
+ - $a1: KSEG0 address of the flattened device-tree blob.
+
+[1] http://prplfoundation.org/wiki/MIPS_documentation
diff --git a/MAINTAINERS b/MAINTAINERS
index 2e156b2..a9cd996 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5435,6 +5435,11 @@ L:	linux-security-module@vger.kernel.org
 S:	Supported
 F:	security/integrity/ima/
 
+IMGTEC BOSTON PLATFORM SUPPORT
+M:	Paul Burton <paul.burton@imgtec.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/mips/img/boston.txt
+
 IMGTEC IR DECODER DRIVER
 M:	James Hogan <james.hogan@imgtec.com>
 S:	Maintained
-- 
2.6.2
