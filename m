From: Michael Neuling <mikey@neuling.org>
Subject: Re: [PATCH v2] drivers/of: Constify device_node->name and ->path_component_name
Date: Wed, 28 Nov 2012 10:46:04 +1100
Message-ID: <23435.1354059964@neuling.org>
References: <1353075625-7755-1-git-send-email-grant.likely@secretlab.ca>
Return-path: <linux-next-owner@vger.kernel.org>
In-reply-to: <1353075625-7755-1-git-send-email-grant.likely@secretlab.ca>
Sender: linux-next-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Jimi Xenidis <jimix@pobox.com>, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, sparclinux@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "David S. Miller" <davem@davemloft.net>, Julian Calaby <julian.calaby@gmail.com>
List-Id: devicetree@vger.kernel.org

> Neither of these should ever be changed once set. Make them const and
> fix up the users that try to modify it in-place. In one case
> kmalloc+memcpy is replaced with kstrdup() to avoid modifying the string.
> 
> Build tested with defconfigs on ARM, PowerPC, Sparc, MIPS, x86 among
> others.

Grant,

This breaks powerpc chroma_defconfig in next-20121127 with:

arch/powerpc/sysdev/scom.c:160:17: error: assignment discards 'const' qualifier from pointer target type [-Werror]

The following fixes it.  The change is to generic code, so I'm not sure
it's the right fix as it may break other configs/archs.

diff --git a/include/linux/debugfs.h b/include/linux/debugfs.h
index 66c434f..77f64e4 100644
--- a/include/linux/debugfs.h
+++ b/include/linux/debugfs.h
@@ -23,7 +23,7 @@
 struct file_operations;
 
 struct debugfs_blob_wrapper {
-	void *data;
+	const void *data;
 	unsigned long size;
 };
