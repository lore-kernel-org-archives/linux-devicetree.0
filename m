From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] of/selftest: add testcase for nodes with same name
 and address
Date: Thu, 08 May 2014 21:28:10 -0700
Message-ID: <536C595A.2090401@gmail.com>
References: <1399499298-8830-1-git-send-email-robherring2@gmail.com> <1399499298-8830-2-git-send-email-robherring2@gmail.com> <536AF13F.6000502@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <536AF13F.6000502-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 5/7/2014 7:51 PM, Frank Rowand wrote:
> On 5/7/2014 2:48 PM, Rob Herring wrote:
>> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> Add a test case for nodes which have the same name and same
>> non-translatable unit address.
> 
> If I apply patch 1 and 2 without applying 3 and 4 then console
> warnings are printed, but from a different area of code than
> the original problem reported.  This probably is not a big deal,
> but I'm trying to figure out if I can modify the test to also
> show the original problem.

If you want to add a test that triggers the same stack trace as
the orginally reported problem, a patch is below.  It would apply
between your original patch 1 and patch 2.

> 
> The test case also properly reports the failure.
> 
> Once all 4 patches are applied, then the test case passes.
> 
> Thus:
> 
>    Tested-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> 
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>>  drivers/of/selftest.c                        | 23 ++++++++++++++++++
>>  drivers/of/testcase-data/testcases.dtsi      |  1 +
>>  drivers/of/testcase-data/tests-platform.dtsi | 35 ++++++++++++++++++++++++++++
>>  3 files changed, 59 insertions(+)
>>  create mode 100644 drivers/of/testcase-data/tests-platform.dtsi
>>
> 
> < snip >
> 
> 




From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Add another test case to of_selftest_platform_populate().  This case
triggers the same stack trace from of_platform_populate() to sysfs_warn_dup()
as seen in the case reported by https://lkml.org/lkml/2014/4/23/312.

Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 drivers/of/selftest.c                        |   27 ++++++++++++++++++++++
 drivers/of/testcase-data/tests-platform.dtsi |   33 +++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

Index: b/drivers/of/testcase-data/tests-platform.dtsi
===================================================================
--- a/drivers/of/testcase-data/tests-platform.dtsi
+++ b/drivers/of/testcase-data/tests-platform.dtsi
@@ -31,5 +31,38 @@
 				};
 			};
 		};
+
+		test-master {
+			compatible = "test-master";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			test-device@0 {
+				compatible = "test-device";
+				reg = <0x0>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sub-dev@100 {
+					compatible = "test-sub-device";
+					reg = <0x100>;
+				};
+			};
+
+			test-device@1 {
+				compatible = "test-device";
+				reg = <0x1>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sub-dev@100 {
+					compatible = "test-sub-device";
+					reg = <0x100>;
+				};
+			};
+		};
 	};
 };
+
Index: b/drivers/of/selftest.c
===================================================================
--- a/drivers/of/selftest.c
+++ b/drivers/of/selftest.c
@@ -436,6 +436,7 @@ static void __init of_selftest_platform_
 		{ .compatible = "test-device", },
 		{}
 	};
+	struct platform_device *pdev;
 
 	np = of_find_node_by_path("/testcase-data/platform-tests");
 	if (!np) {
@@ -447,6 +448,32 @@ static void __init of_selftest_platform_
 		rc = of_platform_populate(child, match, NULL, NULL);
 		selftest(!rc, "Could not create device for node '%s'\n", child->name);
 	}
+
+	np = of_find_node_by_path("/testcase-data/test-master");
+	if (!np) {
+		pr_err("No /testcase-data/test-master node in device tree\n");
+		return;
+	}
+
+	for_each_child_of_node(np, child) {
+		pdev = of_device_alloc(child, NULL, NULL);
+		if (pdev) {
+			pdev->dev.bus = &platform_bus_type;
+			if (of_device_add(pdev) != 0) {
+				platform_device_put(pdev);
+				pdev = NULL;
+			}
+		}
+		selftest(pdev, "Could not allocate device for node '%s'\n",
+			 child->full_name);
+
+		if (pdev) {
+			rc = of_platform_populate(child, NULL, NULL, &pdev->dev);
+			selftest(!rc, "Could not populate node '%s'\n",
+				 child->full_name);
+		}
+	}
+
 }
 
 static int __init of_selftest(void)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
