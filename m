From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 0/5] FlexRM driver improvements
Date: Tue,  1 Aug 2017 16:05:49 +0530
Message-ID: <1501583754-31969-1-git-send-email-anup.patel@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset does various improvments to Broadcom FlexRM
mailbox controller driver and also adds FlexRM DT nodes
for Stingray SOC.

The patches are based on Linux-4.13-rc3 and can also be
found at flexrm-imp-v3 branch of
https://github.com/Broadcom/arm64-linux.git

Changes since v2:
 - Dropped PATCH5 and PATCH6
 - Added a PATCH to use txdone_ack instead of txdone_poll
 - Dropped PATCH7 because it is now part of
http://www.mail-archive.com/linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg1456425.html

Changes since v1:
 - Add one more patch to use bitmap instead of IDA in FlexRM driver

Anup Patel (5):
  mailbox: bcm-flexrm-mailbox: Set IRQ affinity hint for FlexRM ring
    IRQs
  mailbox: bcm-flexrm-mailbox: Add debugfs support
  mailbox: bcm-flexrm-mailbox: Fix mask used in CMPL_START_ADDR_VALUE()
  mailbox: bcm-flexrm-mailbox: Use bitmap instead of IDA
  mailbox: bcm-flexrm-mailbox: Use txdone_ack instead of txdone_poll

 drivers/mailbox/bcm-flexrm-mailbox.c | 252 ++++++++++++++++++++++++-----------
 1 file changed, 175 insertions(+), 77 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
