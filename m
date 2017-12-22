From: <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 0/2] PCI: mediatek: Fixups for the IRQ handle routine and MT7622's class code
Date: Fri, 22 Dec 2017 13:39:36 +0800
Message-ID: <1513921178-16148-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org
Cc: honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, hongkun.cao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, xinping.qian-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Two fixups for mediatek's host bridge:
The first patch fixup the IRQ handle routine to avoid IRQ reentry which
may exist for both MT2712 and MT7622.
The second patch fixup class type for MT7622.

Change since v3:
 - Setup the class type and vendor ID at the beginning of startup instead
   of in a quirk.
 - Add mediatek's vendor ID, it could be found in:
   https://pcisig.com/membership/member-companies?combine=&page=4

Change since v2:
 - Move the initialize of the iterate before the loop to fix an
   INTx IRQ issue in the first patch

Change since v1:
 - Add the second patch.
 - Make the first patch's commit message more standard.

Honghui Zhang (2):
  PCI: mediatek: Clear IRQ status after IRQ dispatched to avoid reentry
  PCI: mediatek: Set up class type and vendor ID for MT7622

 drivers/pci/host/pcie-mediatek.c | 23 ++++++++++++++++++-----
 include/linux/pci_ids.h          |  3 +++
 2 files changed, 21 insertions(+), 5 deletions(-)

-- 
2.6.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
