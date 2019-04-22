Return-Path: <SRS0=1iwi=SY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.bugwerft.de ([46.23.86.59]:50092 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726305AbfDVIgE (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 22 Apr 2019 04:36:04 -0400
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH 2/2] input: touch: eeti: read hardware state once after wakeup
Date: Mon, 22 Apr 2019 10:35:40 +0200
Message-Id: <20190422083540.8380-2-daniel@zonque.org>
In-Reply-To: <20190422083540.8380-1-daniel@zonque.org>
References: <20190422083540.8380-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>, Sven Neumann <Sven.Neumann@teufel.de>
List-ID: <devicetree@vger.kernel.org>

For systems in which the touch IRQ is acting as wakeup source, the interrupt
controller might not latch the GPIO IRQ during sleep. In such cases, the
interrupt will never occur again after resume, hence the touch screen
appears dead.

To fix this, call into eeti_ts_read() once to read the hardware status and
to arm the IRQ again.

Signed-off-by: Daniel Mack <daniel@zonque.org>
Reported-by: Sven Neumann <Sven.Neumann@teufel.de>
---
 drivers/input/touchscreen/eeti_ts.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/eeti_ts.c b/drivers/input/touchscreen/eeti_ts.c
index f5724aaa815b..674386f910ba 100644
--- a/drivers/input/touchscreen/eeti_ts.c
+++ b/drivers/input/touchscreen/eeti_ts.c
@@ -117,6 +117,7 @@ static void eeti_ts_start(struct eeti_ts *eeti)
 	eeti->running = true;
 	wmb();
 	enable_irq(eeti->client->irq);
+	eeti_ts_read(eeti);
 }
 
 static void eeti_ts_stop(struct eeti_ts *eeti)
-- 
2.20.1
