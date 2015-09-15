From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/3] ARM: brcmstb: Bus Interface Unit support
Date: Tue, 15 Sep 2015 11:14:57 -0700
Message-ID: <1442340900-15320-1-git-send-email-f.fainelli@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This patch series adds support for early boot time Bus Interface Unit control
register setup which is required to occur before SMP is brought-up, but needs
to remap registers, so init_irq() is chosen for that.

This builds on top of the 'soc/next' branch at github.com/Broadcom/stblinux

Major changes in v2:

- updated Device Tree documentation based on Rob's feedback
- added a better pr_fmt format for pr_* calls in biuctrl.c

Florian Fainelli (3):
  Documentation: bindings: brcmstb: Document write-pairing
  soc: brcmstb: Add Bus Interface Unit control setup
  ARM: brcmstb: Setup BIU control registers during boot

 .../devicetree/bindings/arm/bcm/brcm,brcmstb.txt   |  20 ++++
 arch/arm/mach-bcm/brcmstb.c                        |   9 ++
 drivers/soc/brcmstb/Makefile                       |   2 +-
 drivers/soc/brcmstb/biuctrl.c                      | 119 +++++++++++++++++++++
 include/linux/soc/brcmstb/brcmstb.h                |  10 ++
 5 files changed, 159 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/brcmstb/biuctrl.c
 create mode 100644 include/linux/soc/brcmstb/brcmstb.h

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
