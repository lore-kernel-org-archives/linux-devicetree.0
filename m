From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH v2] coccinelle: Check for missing NULL terminators in
 of_device_id tables
Date: Tue, 3 Jun 2014 20:25:27 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1406032022540.2009@localhost6.localdomain6>
References: <1401213858-31950-1-git-send-email-sboyd@codeaurora.org> <alpine.DEB.2.02.1406031208380.2036@localhost6.localdomain6> <538E09C1.30200@codeaurora.org> <alpine.DEB.2.02.1406032013150.2009@localhost6.localdomain6> <538E119D.8010304@codeaurora.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <538E119D.8010304-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mitchel Humpherys <mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gilles Muller <Gilles.Muller-L2FTfq7BK8M@public.gmane.org>, Nicolas Palix <nicolas.palix-wMUr/XMoy4A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Failure to terminate an of_device_id table can lead to confusing
failures depending on where the compiler places the array. Add a
check to make sure these tables are terminated. Thanks to Mitchel
Humpherys for coming up with the pattern initially.

Cc: Mitchel Humpherys <mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: Gilles Muller <Gilles.Muller-L2FTfq7BK8M@public.gmane.org>
Cc: Nicolas Palix <nicolas.palix-wMUr/XMoy4A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Acked-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>

---

v3: Removed unneeded rule bad_of_table.  Placed * in context rule on the 
closing brace; putting it on the field caused all fields to be marked.

v4: corrected authorship

 scripts/coccinelle/misc/of_table.cocci |   62 +++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/scripts/coccinelle/misc/of_table.cocci b/scripts/coccinelle/misc/of_table.cocci
new file mode 100644
index 0000000..3c93404
--- /dev/null
+++ b/scripts/coccinelle/misc/of_table.cocci
@@ -0,0 +1,62 @@
+/// Make sure of_device_id tables are NULL terminated
+//
+// Keywords: of_table
+// Confidence: Medium
+// Options: --include-headers
+
+virtual patch
+virtual context
+virtual org
+virtual report
+
+@depends on context@
+identifier var, arr;
+expression E;
+@@
+struct of_device_id arr[] = {
+	...,
+	{
+	.var = E,
+*	}
+};
+
+@depends on patch@
+identifier var, arr;
+expression E;
+@@
+struct of_device_id arr[] = {
+	...,
+	{
+	.var = E,
+-	}
++	},
++	{ }
+};
+
+@r depends on org || report@
+position p1;
+identifier var, arr;
+expression E;
+@@
+struct of_device_id arr[] = {
+	...,
+	{
+	.var = E,
+	}
+	@p1
+};
+
+@script:python depends on org@
+p1 << r.p1;
+arr << r.arr;
+@@
+
+cocci.print_main(arr,p1)
+
+@script:python depends on report@
+p1 << r.p1;
+arr << r.arr;
+@@
+
+msg = "%s is not NULL terminated at line %s" % (arr, p1[0].line)
+coccilib.report.print_report(p1[0],msg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
