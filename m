From: Alexander Couzens <lynxis-qyMx1GtpvWw@public.gmane.org>
Subject: [PATCH v2 0/2] ath79 misc irq controller
Date: Wed,  9 Sep 2015 11:16:16 +0200
Message-ID: <1441790178-9573-1-git-send-email-lynxis@fe80.eu>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Couzens <lynxis-qyMx1GtpvWw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

v3:
 remove log line when setup ar7100 misc irq controller
 doc: write out {ar7100,ar7240} into two seperate lines

v2:
 move new IRQ_DECLARE just behind the new init for ar7100
 don't remove newline
 add log line when setup ar7100 misc irq controller
 improve commit message for missing irq ack handler


Alexander Couzens (2):
  MIPS: ath79: set missing irq ack handler for ar7100-misc-intc irq chip
  MIPS: ath79: add irq chip ar7240-misc-intc

 .../interrupt-controller/qca,ath79-misc-intc.txt   | 20 ++++++++++++++++++--
 arch/mips/ath79/irq.c                              | 22 ++++++++++++++++++++--
 2 files changed, 38 insertions(+), 4 deletions(-)

-- 
2.4.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
