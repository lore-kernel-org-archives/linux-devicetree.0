From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/3] OF overlay bug-fixes
Date: Tue, 16 Dec 2014 19:45:24 +0200
Message-ID: <1418751927-18088-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

While checking the overlay patches that ended up in mainline, I came
across a number of bugs that needed fixin'

They are related to the way sub-devices are created and the use
of of_platform_populate() in drivers.

Pantelis Antoniou (3):
  of: overlay: Do not generate duplicate nodes
  of: platform: Handle of_populate drivers in notifier
  of: unittest: Overlays with sub-devices tests

 drivers/of/overlay.c                        | 11 ------
 drivers/of/platform.c                       |  9 +++++
 drivers/of/unittest-data/tests-overlay.dtsi | 55 +++++++++++++++++++++++++++++
 drivers/of/unittest.c                       | 46 ++++++++++++++++++++++++
 4 files changed, 110 insertions(+), 11 deletions(-)

-- 
1.7.12

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
