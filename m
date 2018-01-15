From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Subject: [PATCH 1/6] resource: Extend the PPC32 reserved memory hack
Date: Mon, 15 Jan 2018 04:13:56 +0100
Message-ID: <20180115031401.19577-2-j.neuschaefer@gmx.net>
References: <20180115031401.19577-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180115031401.19577-1-j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>, Brijesh Singh <brijesh.singh-5C7GfCeVMHo@public.gmane.org>, Tom Lendacky <thomas.lendacky-5C7GfCeVMHo@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On the Nintendo Wii, there are two ranges of physical memory, and MMIO
in between, but Linux on ppc32 doesn't support discontiguous memory.
Therefore a hack was introduced in commit c5df7f775148 ("powerpc: allow
ioremap within reserved memory regions") and commit de32400dd26e ("wii:
use both mem1 and mem2 as ram"):

 - Treat the area from the start of the first memory area (MEM1) to the
   end of the second (MEM2) as one big memory area, but mark the part
   that doesn't belong to MEM1 or MEM2 as reserved.
 - Only on the Wii, allow ioremap to be used on reserved memory.

This hack, however, doesn't account for the "resource"-based API in
kernel/resource.c, because __request_region performs its own checks.

Extend the hack to kernel/resource.c, to allow more drivers to allocate
their MMIO regions on the Wii.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
---
 kernel/resource.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/kernel/resource.c b/kernel/resource.c
index 54ba6de3757c..bb3d329329da 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -1134,6 +1134,24 @@ resource_size_t resource_alignment(struct resource *res)
 
 static DECLARE_WAIT_QUEUE_HEAD(muxed_resource_wait);
 
+/*
+ * On some ppc32 platforms (Nintendo Wii), reserved memory is used to work
+ * around the fact that Linux doesn't support discontiguous memory (all memory
+ * is treated as one large area with holes punched in it), and reserved memory
+ * is allowed to be allocated.
+ */
+#ifdef CONFIG_PPC32
+static bool conflict_ignored(struct resource *conflict)
+{
+	extern int __allow_ioremap_reserved;
+
+	return __allow_ioremap_reserved &&
+		(conflict->flags & IORESOURCE_SYSRAM);
+}
+#else
+static bool conflict_ignored(struct resource *conflict) { return false; }
+#endif
+
 /**
  * __request_region - create a new busy resource region
  * @parent: parent resource descriptor
@@ -1166,8 +1184,9 @@ struct resource * __request_region(struct resource *parent,
 		res->desc = parent->desc;
 
 		conflict = __request_resource(parent, res);
-		if (!conflict)
+		if (!conflict || conflict_ignored(conflict))
 			break;
+
 		if (conflict != parent) {
 			if (!(conflict->flags & IORESOURCE_BUSY)) {
 				parent = conflict;
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
