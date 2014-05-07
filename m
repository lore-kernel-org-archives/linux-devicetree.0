From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] DT platform device name collision fixes
Date: Wed,  7 May 2014 16:48:14 -0500
Message-ID: <1399499298-8830-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

This series fixes the device naming collisions that can occur with 
nultiple devices having the same name and non-translatable unit 
addresses. This issue was raised in this thread[1]. I intend to merge 
this regardless of whether or not some hierarchy in sysfs is created. 
That is really a separate issue independent of these fixes.

I found and fix a couple of other issues in the process of testing the 
fix.

Rob

[1] https://lkml.org/lkml/2014/4/23/312

Rob Herring (4):
  of/selftest: add testcase for nodes with same name and address
  of/platform: return error on of_platform_device_create_pdata failure
  of/platform: fix device naming for non-translatable addresses
  of: kill off of_can_translate_address

 drivers/of/address.c                         | 22 +----------------
 drivers/of/platform.c                        | 20 +++++-----------
 drivers/of/selftest.c                        | 23 ++++++++++++++++++
 drivers/of/testcase-data/testcases.dtsi      |  1 +
 drivers/of/testcase-data/tests-platform.dtsi | 35 ++++++++++++++++++++++++++++
 include/linux/of_address.h                   |  1 -
 6 files changed, 66 insertions(+), 36 deletions(-)
 create mode 100644 drivers/of/testcase-data/tests-platform.dtsi

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
