From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/2] watchdog: jz4740: Add DT support
Date: Tue, 27 Jan 2015 15:11:28 +0000
Message-ID: <1422371490-44402-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Here are two simple patches that add DT support to the jz4740 watchdog driver.

Patches are based on 3.19-rc6. Quite disjoint and stay within jz4740
so should apply easily on other trees.

If you would like to have them rebased to a different tree, please tell.

Thank-you

ZubairLK

Zubair Lutfullah Kakakhel (2):
  dt: watchdog: Add DT binding documentation for jz47xx watchdog timer
  watchdog: jz4740: Add DT support

 .../devicetree/bindings/watchdog/ingenic,jz47xx-wdt.txt | 17 +++++++++++++++++
 drivers/watchdog/jz4740_wdt.c                           |  9 +++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/ingenic,jz47xx-wdt.txt

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
