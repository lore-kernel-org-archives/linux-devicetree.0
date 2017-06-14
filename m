From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 3/3] tests: Add a test for overlays syntactic sugar
Date: Wed, 14 Jun 2017 17:53:06 +0300
Message-ID: <1497451986-15515-4-git-send-email-pantelis.antoniou@konsulko.com>
References: <1497451986-15515-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497451986-15515-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a single test makeing sure the &foo { }; syntax works.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 tests/run_tests.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index cecc6d2..c8c5bef 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -205,6 +205,12 @@ libfdt_overlay_tests () {
 
     run_test overlay overlay_base_manual_symbols.test.dtb overlay_overlay_manual_fixups.test.dtb
 
+    # test simplified plugin syntax
+    run_dtc_test -@ -I dts -O dtb -o overlay_overlay_simple.dtb overlay_overlay_simple.dts
+
+    # verify non-generation of local fixups
+    run_test check_path overlay_overlay_simple.dtb not-exists "/__local_fixups__"
+
     # Bad fixup tests
     for test in $BAD_FIXUP_TREES; do
 	tree="overlay_bad_fixup_$test"
-- 
2.1.4
