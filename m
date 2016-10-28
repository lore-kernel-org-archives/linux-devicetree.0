From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 0/4] drivers: base: cacheinfo: fixes/updates
Date: Fri, 28 Oct 2016 09:45:27 +0100
Message-ID: <1477644331-25559-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Greg,

Since the couple of fixes here are not too severe, I am considering as
updates only.

Now the x86 allow CONFIG_OF to be enabled and ACPI on arm64, we have
couple of minor bugs in those configurations. The first 2 patches fixes
them. The 3rd patch is cosmetic update to help identify the logs easily.

The last patch adds the basic support for overriding cache properties
using the device tree.

Regards,
Sudeep

Sudeep Holla (4):
  drivers: base: cacheinfo: fix x86 with CONFIG_OF enabled
  drivers: base: cacheinfo: fix boot error message when acpi is enabled
  drivers: base: cacheinfo: add pr_fmt logging
  drivers: base: cacheinfo: support DT overrides for cache properties

 arch/x86/kernel/cpu/intel_cacheinfo.c |   2 +
 drivers/base/cacheinfo.c              | 138 +++++++++++++++++++++++++++++++++-
 include/linux/cacheinfo.h             |   1 +
 3 files changed, 137 insertions(+), 4 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
