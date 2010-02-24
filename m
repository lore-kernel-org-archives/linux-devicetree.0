From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: dtc: Audit and fix valgrind errors
Date: Wed, 24 Feb 2010 22:29:19 +1100
Message-ID: <20100224112919.GA31576@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The somewhat embarrasing bug in the first version of my previous patch
would have been detected by valgrind.  Thus reminded, I've run the
testsuite under valgrind and fixed any errors I found.  This turned
out to be just some uninitialized buffers in test programs.  The
fragments of uninitialized data aren't particularly important, but we
might as well squash the valgrind warnings, so that future valgrind
errors will stand out.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/tests/mangle-layout.c
===================================================================
--- dtc.orig/tests/mangle-layout.c	2010-02-24 20:53:14.863068216 +1100
+++ dtc/tests/mangle-layout.c	2010-02-24 21:42:10.543068162 +1100
@@ -65,7 +65,7 @@ static void new_header(struct bufstate *
 
 static void add_block(struct bufstate *buf, int version, char block, const void *fdt)
 {
-	int align, size;
+	int align, size, oldsize;
 	const void *src;
 	int offset;
 
@@ -95,9 +95,10 @@ static void add_block(struct bufstate *b
 		CONFIG("Bad block '%c'", block);
 	}
 
-	offset = ALIGN(buf->size, align);
-
+	oldsize = buf->size;
+	offset = ALIGN(oldsize, align);
 	expand_buf(buf, offset+size);
+	memset(buf->buf + oldsize, 0, offset - oldsize);
 
 	memcpy(buf->buf + offset, src, size);
 
Index: dtc/tests/open_pack.c
===================================================================
--- dtc.orig/tests/open_pack.c	2010-02-24 20:53:14.847091045 +1100
+++ dtc/tests/open_pack.c	2010-02-24 21:42:10.543068162 +1100
@@ -48,6 +48,8 @@ int main(int argc, char *argv[])
 	bufsize = oldsize * 2;
 
 	buf = xmalloc(bufsize);
+	/* don't leak uninitialized memory into our output */
+	memset(buf, 0, bufsize);
 
 	fdt1 = buf;
 	err = fdt_open_into(fdt, fdt1, bufsize);

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
