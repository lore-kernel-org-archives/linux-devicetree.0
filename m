Return-Path: <SRS0=jSFQ=5M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79251C43331
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 01:32:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 43A6220774
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 01:32:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OeidLvA5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727674AbgC0Bct (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Mar 2020 21:32:49 -0400
Received: from mail-pl1-f201.google.com ([209.85.214.201]:39602 "EHLO
        mail-pl1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727600AbgC0Bct (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 26 Mar 2020 21:32:49 -0400
Received: by mail-pl1-f201.google.com with SMTP id d11so5856279pll.6
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2020 18:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=00RV7bNLHk/+srLS130iQAKmhRfndHchHDNeo4WMsqs=;
        b=OeidLvA5lvefgDK7/Lhlm9pfs2j2GdTsKuu8cUAqJgpnGukG4D3aD9o8ROmAxiZfiC
         N1um11XjyxlpPPHf/FZ8K1Knc0277Ub7tcnjwFjGTNp6UbKWixZoqxIJkikE/UJ+SBJU
         DEoQbeU3GkPGwQK1vCm+BsGV/ZnEauid0cdne89ZrJQXeRkV0wQdsZnIL82oHnGJ8Gy7
         y8hn5XXtGEpKHzaVacRzIMYV4NRWE4E7QwF7lElKf7yq8G+pZwFc1UyIpMRgNs7bKa0z
         scMoBz3E+MotGPm3SgxPfEx/JimkmjYMipqOEL53oJ+eI8rT+Z4JP6MI7vZgX/rVgMOB
         LHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=00RV7bNLHk/+srLS130iQAKmhRfndHchHDNeo4WMsqs=;
        b=elTkpNTnLZV1Re55Z/LZaUzZa0gv7v0ONSuvwrcso7IkEI8IVguWkHcJo/kfeSDBRB
         nNl1Qz6QGyQ10oIKLevo7zsxcUhqwLAwZKzMQhmPb7wpflAyPAAq01Exdy4Z35kKA6Lc
         rayLChKM8Pecis0lI78aO1Xfp6HsnfVxlv31s8m5Z/cMC1+fL3iL3s8rHgnrFlfJkBAb
         k5QKSjmAWo2UlUk7a5dgVyVtnngicuEdSOJBmjhCFLiFMRPtiYAKtQZVDkppq2mdPhQr
         Hoas/6Wa1NRjQnAkCy9UgVLYha5ptvvC/vB0NcEXhyr3nPMNuKDYyX5reO6mdQaLhmSL
         txhg==
X-Gm-Message-State: ANhLgQ1LrhhcGyjd9VCY7P3VAm2FkrdSdNZI8I1F7p9+jlxbmHIXtay6
        w7QfgbjejdqBJXTUJuRWvRdP1NVWee9k
X-Google-Smtp-Source: ADFU+vvxEB6/tnu1KoE7CiH6g1ntv3CfQrUiRH4eQWXOoeZZYIIdOLTg20OXiK4zK1sdzoHVsZ96xI4ldhQa
X-Received: by 2002:a63:cf4a:: with SMTP id b10mr11648063pgj.354.1585272768440;
 Thu, 26 Mar 2020 18:32:48 -0700 (PDT)
Date:   Thu, 26 Mar 2020 18:32:35 -0700
Message-Id: <20200327013239.238182-1-rajatja@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH v3 1/5] input/serio/i8042: Attach fwnode to serio i8042 kbd device
From:   Rajat Jain <rajatja@google.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>, dtor@google.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajat Jain <rajatja@google.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, furquan@google.com,
        dlaurie@google.com, bleung@google.com, zentaro@google.com,
        dbehr@google.com
Cc:     rajatxjain@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Attach the firmware node to the serio i8042 kbd device so that device
properties can be passed from the firmware.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v3: Same as v2
v2: Remove the Change-Id from the commit log

 drivers/input/serio/i8042-x86ia64io.h | 1 +
 drivers/input/serio/i8042.c           | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
index dc974c288e880..ed9ec4310d976 100644
--- a/drivers/input/serio/i8042-x86ia64io.h
+++ b/drivers/input/serio/i8042-x86ia64io.h
@@ -927,6 +927,7 @@ static int i8042_pnp_kbd_probe(struct pnp_dev *dev, const struct pnp_device_id *
 	}
 	i8042_pnp_id_to_string(dev->id, i8042_kbd_firmware_id,
 			       sizeof(i8042_kbd_firmware_id));
+	i8042_kbd_fwnode = dev_fwnode(&dev->dev);
 
 	/* Keyboard ports are always supposed to be wakeup-enabled */
 	device_set_wakeup_enable(&dev->dev, true);
diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index 20ff2bed3917a..0dddf273afd94 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -21,6 +21,7 @@
 #include <linux/i8042.h>
 #include <linux/slab.h>
 #include <linux/suspend.h>
+#include <linux/property.h>
 
 #include <asm/io.h>
 
@@ -124,6 +125,7 @@ MODULE_PARM_DESC(unmask_kbd_data, "Unconditional enable (may reveal sensitive da
 static bool i8042_bypass_aux_irq_test;
 static char i8042_kbd_firmware_id[128];
 static char i8042_aux_firmware_id[128];
+static struct fwnode_handle *i8042_kbd_fwnode;
 
 #include "i8042.h"
 
@@ -1335,6 +1337,7 @@ static int __init i8042_create_kbd_port(void)
 	strlcpy(serio->phys, I8042_KBD_PHYS_DESC, sizeof(serio->phys));
 	strlcpy(serio->firmware_id, i8042_kbd_firmware_id,
 		sizeof(serio->firmware_id));
+	set_primary_fwnode(&serio->dev, i8042_kbd_fwnode);
 
 	port->serio = serio;
 	port->irq = I8042_KBD_IRQ;
-- 
2.25.1.696.g5e7596f4ac-goog

