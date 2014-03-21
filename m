From: Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>
Subject: [PATCH v3 0/2] dt: platform driver: Fill the resources before probe and defer if needed
Date: Fri, 21 Mar 2014 15:46:23 +0100
Message-ID: <1395413185-29763-1-git-send-email-jjhiblot@traphandler.com>
References: <20140320161118.B7075C4067A@trevor.secretlab.ca>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140320161118.B7075C4067A-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

This is the 3rd version of the patch. It's been reworked to screen the devices
not created by of_device_alloc() and check the reason why an OF IRQ description
can't be translated into a resource.

Jean-Jacques

Changes since V2:
 * only fill the resources for devices created by of_device_alloc(). Note:
   this is done by adding a new flag in struct device {}.
 * use deferred probing only if the IRQ domain cannot be found. 
  
Jean-Jacques Hiblot (2):
  of: irq: Added of_find_irq_domain() to get the domain of an irq
  dt: platform driver: Fill the resources before probe and defer if
    needed

 drivers/base/platform.c     |   5 ++
 drivers/of/irq.c            |  20 ++++++++
 drivers/of/platform.c       | 114 ++++++++++++++++++++++++++++++++++----------
 include/linux/device.h      |   1 +
 include/linux/of_irq.h      |   2 +
 include/linux/of_platform.h |  10 ++++
 6 files changed, 127 insertions(+), 25 deletions(-)

-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
