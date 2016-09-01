From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/3] pci: remove msi_controller registration API
Date: Thu,  1 Sep 2016 17:38:01 +0200
Message-ID: <1472744284-18305-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Victor Gu <xigu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This small patch series aims at removing the small msi_controller
registration API implemented in drivers/of/of_pci.c.

In order to do so, it moves the last two users of this API to the
generic MSI support:

 - The pci-aardvark driver is moved to use the generic MSI
   support. This driver is both the provider of the MSI capability and
   the consumer of this capability.

 - The pci-mvebu driver is cleaned up from using the msi_controller
   registration API. This driver is only consuming MSI capabilies from
   another driver (irq-armada-370-xp) which was migrated to the
   generic MSI support some time ago. Therefore, this patch is simply
   removing dead code.

Finally, the last commit removed the now unused API.

Thanks,

Thomas

Thomas Petazzoni (3):
  pci: pci-aardvark: move to MSI handling using generic MSI support
  pci: pci-mvebu: remove useless MSI enabling code
  of: pci: remove unused MSI controller helpers

 drivers/of/of_pci.c             |  45 -----------
 drivers/pci/host/pci-aardvark.c | 172 ++++++++++++++++------------------------
 drivers/pci/host/pci-mvebu.c    |  17 ----
 include/linux/of_pci.h          |  11 ---
 4 files changed, 67 insertions(+), 178 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
