From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/6] of: overlays: New target methods
Date: Mon,  9 May 2016 21:05:41 +0300
Message-ID: <1462817147-7620-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset implement two new target methods.
A target-indirect method which allows selecting different
targets according to an argument using an extended API and
a target root method that fences the target only
to a specific given root.

Documentation and unit-tests are included.

Pantelis Antoniou (6):
  of: overlay: Implement indirect target support
  of: unittest: Add indirect overlay target test
  doc: dt: Document the indirect overlay method.
  of: overlay: Introduce target root capability.
  of: unittest: Unit-tests for target root overlays.
  doc: dt: Document the target root overlay method

 Documentation/devicetree/overlay-notes.txt  |  21 +++
 drivers/of/overlay.c                        | 219 +++++++++++++++++++---
 drivers/of/unittest-data/testcases.dts      |  14 ++
 drivers/of/unittest-data/tests-overlay.dtsi |  67 +++++++
 drivers/of/unittest.c                       | 272 ++++++++++++++++++++++++++++
 include/linux/of.h                          |  16 ++
 6 files changed, 582 insertions(+), 27 deletions(-)

-- 
1.7.12

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
