From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] Warn on node name unit-addresses with '0x' or leading 0s
Date: Thu, 11 Feb 2016 14:46:59 -0600
Message-ID: <1455223619-16052-3-git-send-email-robh@kernel.org>
References: <1455223619-16052-1-git-send-email-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455223619-16052-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Node name unit-addresses should never begin with 0x or leading 0s
regardless of whether they have a bus specific address (i.e. one with
commas) or not. Add warnings to check for these cases.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c                       | 10 ++++++++++
 tests/run_tests.sh             |  2 ++
 tests/unit-addr-leading-0s.dts | 10 ++++++++++
 tests/unit-addr-leading-0x.dts | 10 ++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 tests/unit-addr-leading-0s.dts
 create mode 100644 tests/unit-addr-leading-0x.dts

diff --git a/checks.c b/checks.c
index 4001b8c..300ab43 100644
--- a/checks.c
+++ b/checks.c
@@ -310,6 +310,16 @@ static void check_unit_address_vs_reg(struct check *c, struct node *dt,
 		if (!unitname[0])
 			FAIL(c, "Node %s has a reg or ranges property, but no unit name",
 			    node->fullpath);
+
+		if (strstr(unitname, "0x") == unitname) {
+			FAIL(c, "Node %s unit name should not have leading \"0x\"",
+			    node->fullpath);
+			/* skip over 0x for next test */
+			unitname += 2;
+		}
+		if (unitname[0] == '0' && isxdigit(unitname[1]))
+			FAIL(c, "Node %s unit name should not have leading 0s",
+			    node->fullpath);
 	} else {
 		if (unitname[0])
 			FAIL(c, "Node %s has a unit name, but no reg property",
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 4b7a131..502caa6 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -445,6 +445,8 @@ dtc_tests () {
     check_tests obsolete-chosen-interrupt-controller.dts obsolete_chosen_interrupt_controller
     check_tests reg-without-unit-addr.dts unit_address_vs_reg
     check_tests unit-addr-without-reg.dts unit_address_vs_reg
+    check_tests unit-addr-leading-0x.dts unit_address_vs_reg
+    check_tests unit-addr-leading-0s.dts unit_address_vs_reg
     run_sh_test dtc-checkfails.sh node_name_chars -- -I dtb -O dtb bad_node_char.dtb
     run_sh_test dtc-checkfails.sh node_name_format -- -I dtb -O dtb bad_node_format.dtb
     run_sh_test dtc-checkfails.sh prop_name_chars -- -I dtb -O dtb bad_prop_char.dtb
diff --git a/tests/unit-addr-leading-0s.dts b/tests/unit-addr-leading-0s.dts
new file mode 100644
index 0000000..7c8e2ce
--- /dev/null
+++ b/tests/unit-addr-leading-0s.dts
@@ -0,0 +1,10 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	node@001 {
+		reg = <1 0>;
+	};
+};
diff --git a/tests/unit-addr-leading-0x.dts b/tests/unit-addr-leading-0x.dts
new file mode 100644
index 0000000..7ed7254
--- /dev/null
+++ b/tests/unit-addr-leading-0x.dts
@@ -0,0 +1,10 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	node@0x1 {
+		reg = <1 0>;
+	};
+};
-- 
2.5.0
