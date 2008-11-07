From: David Gibson <david@gibson.dropbear.id.au>
Subject: dtc: Check return value from fwrite()
Date: Fri, 7 Nov 2008 11:41:11 +1100
Message-ID: <20081107004111.GG6692@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: Jon Loeliger <jdl@freescale.com>
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org
List-Id: devicetree@vger.kernel.org

There's one place in flattree.c where we currently ignore the return
value from fwrite().  On some gcc/glibc versions, where fwrite() is
declared with attribute warn_unused_result, this causes a warning.

This patch fixes the warning, by checking the fwrite() result.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Index: dtc/flattree.c
===================================================================
--- dtc.orig/flattree.c	2008-11-07 11:40:02.000000000 +1100
+++ dtc/flattree.c	2008-11-07 11:40:30.000000000 +1100
@@ -413,10 +413,13 @@ void dt_to_blob(FILE *f, struct boot_inf
 	if (padlen > 0)
 		blob = data_append_zeroes(blob, padlen);
 
-	fwrite(blob.val, blob.len, 1, f);
-
-	if (ferror(f))
-		die("Error writing device tree blob: %s\n", strerror(errno));
+	if (fwrite(blob.val, blob.len, 1, f) != 1) {
+		if (ferror(f))
+			die("Error writing device tree blob: %s\n",
+			    strerror(errno));
+		else
+			die("Short write on device tree blob\n");
+	}
 
 	/*
 	 * data_merge() frees the right-hand element so only the blob

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
