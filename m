From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 14/15] dt-bindings: mips: img,boston: Document img,boston binding
Date: Wed, 3 Feb 2016 11:30:44 +0000
Message-ID: <1454499045-5020-15-git-send-email-paul.burton@imgtec.com>
References: <1454499045-5020-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454499045-5020-1-git-send-email-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Joe Perches <joe@perches.com>, Kalle Valo <kvalo@codeaurora.org>, Jiri Slaby <jslaby@suse.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Pawel Moll <pawel.moll@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add documentation for the simple img,boston devicetree binding & the
boot protocol used to pass the devicetree to the kernel.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

Changes in v2: None

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
index 301bc429..ed27a53 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5517,6 +5517,11 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git
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
2.7.0
