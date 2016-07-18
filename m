From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH v2 5/8] Documentation: Update documentation for UIO_MEM_PHYS_CACHE and UIO_MEM_DEVICE
Date: Mon, 18 Jul 2016 14:44:17 +0530
Message-ID: <1468833260-5305-6-git-send-email-anup.patel@broadcom.com>
References: <1468833260-5305-1-git-send-email-anup.patel@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468833260-5305-1-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Hans J. Koch" <hjk@hansjkoch.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Ankit Jindal <thatsjindal@gmail.com>, Jan Viktorin <viktorin@rehivetech.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

From: Ankit Jindal <thatsjindal@gmail.com>

This patch updates UIO documentation for new mem region
types UIO_MEM_PHYS_CACHE and UIO_MEM_DEVICE.

Signed-off-by: Ankit Jindal <thatsjindal@gmail.com>
Signed-off-by: Anup Patel <anup.patel@broadcom.com>
---
 Documentation/DocBook/uio-howto.tmpl | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/DocBook/uio-howto.tmpl b/Documentation/DocBook/uio-howto.tmpl
index cd0e452..de9dafe 100644
--- a/Documentation/DocBook/uio-howto.tmpl
+++ b/Documentation/DocBook/uio-howto.tmpl
@@ -529,8 +529,10 @@ the memory region, it will show up in the corresponding sysfs node.
 <varname>int memtype</varname>: Required if the mapping is used. Set this to
 <varname>UIO_MEM_PHYS</varname> if you you have physical memory on your
 card to be mapped. Use <varname>UIO_MEM_LOGICAL</varname> for logical
-memory (e.g. allocated with <function>kmalloc()</function>). There's also
-<varname>UIO_MEM_VIRTUAL</varname> for virtual memory.
+memory (e.g. allocated with <function>kmalloc()</function>). There are also
+<varname>UIO_MEM_VIRTUAL</varname> for virtual memory,
+<varname>UIO_MEM_PHYS_CACHE</varname> for cacheable physical memory and,
+<varname>UIO_MEM_DEVICE</varname> for memory mapped device registers.
 </para></listitem>
 
 <listitem><para>
-- 
1.9.1
