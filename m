From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH v2] coccinelle: Check for missing NULL terminators in
 of_device_id tables
Date: Tue, 3 Jun 2014 12:15:18 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1406031208380.2036@localhost6.localdomain6>
References: <1401213858-31950-1-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1401213858-31950-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kernel@vger.kernel.org, Mitchel Humpherys <mitchelh@codeaurora.org>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Failure to terminate an of_device_id table can lead to confusing
failures depending on where the compiler places the array. Add a
check to make sure these tables are terminated. Thanks to Mitchel
Humpherys for coming up with the pattern initially.

Cc: Mitchel Humpherys <mitchelh@codeaurora.org>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Gilles Muller <Gilles.Muller@lip6.fr>
Cc: Nicolas Palix <nicolas.palix@imag.fr>
Cc: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
Acked-by: Grant Likely <grant.likely@linaro.org>
Signed-off-by: Julia Lawall <julia.lawall@lip6.fr>

---

v3: Removed unneeded rule bad_of_table.  Placed * in context rule on the 
closing brace; putting it on the field caused all fields to be marked.

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
