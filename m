From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH 0/2] DT match helpers for initcalls and platform devices
Date: Wed, 30 Oct 2013 01:12:49 -0500
Message-ID: <1383113571-13029-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

This series adds a couple of boilerplate helpers to match with DT for
initcalls and platform device creation and probe. The goal here is to 
remove more platform code out of arch/arm and eventually the machine
descriptors.

Rob

Rob Herring (2):
  driver core: introduce module_platform_driver_match_and_probe
  of: add initcall with match boilerplate helpers

 include/linux/of.h              | 12 ++++++++++++
 include/linux/platform_device.h | 23 +++++++++++++++++++++++
 2 files changed, 35 insertions(+)

-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
