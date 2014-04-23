From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] DT irq deferred probe support
Date: Wed, 23 Apr 2014 17:57:39 -0500
Message-ID: <1398293861-7682-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

This is atleast the 4th attempt to fix a long standing issue with DT 
irq resolution needing to support deferred probe when irq parent is not 
yet initialized. This version implements Russell King's suggestion to do 
irq resolution when platform_get_irq is called. 

Tony, I squashed your warning fix (dropping the other part) and stole 
much of your commit message. Let me know if you have any issues with 
that.

Rob

Rob Herring (2):
  of: selftest: add deferred probe interrupt test
  of/irq: do irq resolution in platform_get_irq

 drivers/base/platform.c                        |  7 +++++-
 drivers/of/irq.c                               | 26 +++++++++++++++++++++
 drivers/of/platform.c                          |  4 +++-
 drivers/of/selftest.c                          | 32 ++++++++++++++++++++++++++
 drivers/of/testcase-data/tests-interrupts.dtsi | 12 ++++++++++
 include/linux/of_irq.h                         |  7 +++++-
 6 files changed, 85 insertions(+), 3 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
