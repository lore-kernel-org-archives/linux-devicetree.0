From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.9 15/74] OF: Prevent unaligned access in of_alias_scan()
Date: Fri, 27 Apr 2018 15:58:05 +0200
Message-ID: <20180427135710.534544535@linuxfoundation.org>
References: <20180427135709.899303463@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180427135709.899303463@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>, Rob Herring <robh@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Amit Pundir <amit.pundir@linaro.org>
List-Id: devicetree@vger.kernel.org

4.9-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Paul Burton <paul.burton@imgtec.com>

commit de96ec2a77c6d06a423c2c495bb4a2f4299f3d9e upstream.

When allocating a struct alias_prop, of_alias_scan() only requested that
it be aligned on a 4 byte boundary. The struct contains pointers which
leads to us attempting 64 bit writes on 64 bit systems, and if the CPU
doesn't support unaligned memory accesses then this causes problems -
for example on some MIPS64r2 CPUs including the "mips64r2-generic" QEMU
emulated CPU it will trigger an address error exception.

Fix this by requesting alignment for the struct alias_prop allocation
matching that which the compiler expects, using the __alignof__ keyword.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Grant Likely <grant.likely@secretlab.ca>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org
Patchwork: https://patchwork.linux-mips.org/patch/14306/
Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
Cc: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/of/base.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2109,7 +2109,7 @@ void of_alias_scan(void * (*dt_alloc)(u6
 			continue;
 
 		/* Allocate an alias_prop with enough space for the stem */
-		ap = dt_alloc(sizeof(*ap) + len + 1, 4);
+		ap = dt_alloc(sizeof(*ap) + len + 1, __alignof__(*ap));
 		if (!ap)
 			continue;
 		memset(ap, 0, sizeof(*ap) + len + 1);
