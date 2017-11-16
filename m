From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] of: unittest: disable interrupts_property warning
Date: Thu, 16 Nov 2017 12:05:45 -0600
Message-ID: <20171116180545.12322-2-robh@kernel.org>
References: <20171116180545.12322-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171116180545.12322-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The testcases.dts has purposely bad data which now generates a dtc warning:

drivers/of/unittest-data/testcases.dtb: Warning (interrupts_property): interrupts size is (4), expected multiple of 8 in /testcase-data/testcase-device2

Disable this warning for now. The proper solution is to split the unit
tests into good and bad data.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/of/unittest-data/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
index 2d135fba94c1..84b3bc44c0b4 100644
--- a/drivers/of/unittest-data/Makefile
+++ b/drivers/of/unittest-data/Makefile
@@ -1,3 +1,4 @@
+DTC_FLAGS_testcases := -Wno-interrupts_property
 obj-y += testcases.dtb.o
 
 targets += testcases.dtb testcases.dtb.S
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
