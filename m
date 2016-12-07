From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v13 5/7] overlay: Documentation for the overlay sugar syntax
Date: Wed,  7 Dec 2016 14:48:21 +0200
Message-ID: <1481114903-8197-6-git-send-email-pantelis.antoniou@konsulko.com>
References: <1481114903-8197-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481114903-8197-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There exists a syntactic sugar version of overlays which
make them simpler to write for the trivial case of a single target.

Document it in the device tree object internals.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 Documentation/dt-object-internal.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/dt-object-internal.txt b/Documentation/dt-object-internal.txt
index 51d68ab..624aa43 100644
--- a/Documentation/dt-object-internal.txt
+++ b/Documentation/dt-object-internal.txt
@@ -308,3 +308,20 @@ the run time loader must apply an offset to each phandle in every dynamic
 DT object loaded. The __local_fixups__ node records the offset relative to the
 start of every local reference within that property so that the loader can apply
 the offset.
+
+There is an alternative syntax to the expanded form for overlays with phandle
+targets which makes the format similar to the one using in .dtsi include files.
+
+So for the &ocp target example above one can simply write:
+
+/dts-v1/;
+/plugin/;
+&ocp {
+	/* bar peripheral */
+	bar {
+		compatible = "corp,bar";
+		... /* various properties and child nodes */
+	}
+};
+
+The resulting dtb object is identical.
-- 
2.1.4
