Return-Path: <SRS0=dVBB=5N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76AE3C2D0EC
	for <linux-devicetree@archiver.kernel.org>; Sat, 28 Mar 2020 18:59:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 430E4206F6
	for <linux-devicetree@archiver.kernel.org>; Sat, 28 Mar 2020 18:59:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sj3kS01e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbgC1S7e (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 28 Mar 2020 14:59:34 -0400
Received: from mail-pj1-f73.google.com ([209.85.216.73]:54023 "EHLO
        mail-pj1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727417AbgC1S7d (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 28 Mar 2020 14:59:33 -0400
Received: by mail-pj1-f73.google.com with SMTP id l5so10710319pjr.3
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2020 11:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=OGNXs3NwKjk0dDeSHSXg81YijfbEbudE8mDeHpkOVOE=;
        b=Sj3kS01eYr5WT4Fc1GvJ9Y3z7uu2N1FDeotd7kk6k8/7QydjsRgg7y84YBxLjH/5px
         Ja3168nhkht1ak+6owEmdvZ08ApoeSJby75xk4dDbRLESLOVZEpdwlNibYYRZQQVR8UD
         AailkVpZN+syYaACa2t7ZUmwNSo67n4iSXI6fsCP6dF7GaFSttHKThBML1fByuRpO8cX
         nuzAJhnN2SdaZDERJ9Hgi8AUVbkgX0onXkY2nklQcYdw4djr2Ql11NDBNULzqIisWuOg
         SPsyx5uT6uX9ed7pM+D7tbmKQjvbQICjbFQ8LwFFQF3x+vA/VV3VuIV5vBMFqV7vdPs/
         edyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=OGNXs3NwKjk0dDeSHSXg81YijfbEbudE8mDeHpkOVOE=;
        b=LGOK4pt+m7JSgDfvEwBU19g44Upv1IH5j9WI6jyflU1VoFQa28Zhbm09PrybWJys7E
         nVMORRCfsqbkDJlxRJBQpnv7K9cmbPrALJ420XDKOnNVj9U0yfy5rZciDfD2C2Kqgzz+
         sYRPYvGS4rFia6Q8tcMXina1I8VJu+rf9JiFLTDwpUMdHvFNQ8zY/fDCUO/nKGjp3Mjq
         qziHHhRQb1KTsJvXv4T+j2u4qtYU2/g/hvtvnwrhHIUJb3Gis6JdQFu91HS+CQ+gK/Yy
         oVOo6DPXBJQjWTGCsjpL7wU31cyCS6JOxn9hDbbiV1ri8GZ40y7GjznzvOk8yGb+Xz1f
         2JjQ==
X-Gm-Message-State: ANhLgQ2tzijMl4MPi5r9Yr6yEWpRLGt9gI9dlsTswaQOtf94yX8jm+Mc
        9gjwAMxe7XBwipv8ULA6RIAi0/GeDBLV
X-Google-Smtp-Source: ADFU+vvC8nj/oK4By2+uBwrMdTDFPDLZ8i8ninPAa5Vf86oXT8sTO+R/ULp/peL9EAEGwoArfK8NIXRQWcTR
X-Received: by 2002:a63:6d43:: with SMTP id i64mr5379169pgc.201.1585421972254;
 Sat, 28 Mar 2020 11:59:32 -0700 (PDT)
Date:   Sat, 28 Mar 2020 11:59:15 -0700
In-Reply-To: <20200328185916.98423-1-rajatja@google.com>
Message-Id: <20200328185916.98423-4-rajatja@google.com>
Mime-Version: 1.0
References: <20200328185916.98423-1-rajatja@google.com>
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH v4 4/5] Input: atkbd: Receive and use physcode->keycode
 mapping from FW
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

Allow the firmware to specify the mapping between the physical
code and the linux keycode. This takes the form of a "linux,keymap"
property which is an array of u32 values, each value specifying
mapping for a key.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v4: Property name "keymap" -> "linux,keymap"
v3: Don't save the FW mapping in atkbd device.
v2: Remove the Change-Id from the commit log

 drivers/input/keyboard/atkbd.c | 41 +++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 3b20aba1861cd..3379fb5e7169b 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -66,6 +66,9 @@ MODULE_PARM_DESC(terminal, "Enable break codes on an IBM Terminal keyboard conne
 
 #define MAX_FUNCTION_ROW_KEYS	24
 
+#define PHYSCODE(keymap)	((keymap >> 16) & 0xFFFF)
+#define KEYCODE(keymap)		(keymap & 0xFFFF)
+
 /*
  * Scancode to keycode tables. These are just the default setting, and
  * are loadable via a userland utility.
@@ -1032,6 +1035,38 @@ static unsigned int atkbd_oqo_01plus_scancode_fixup(struct atkbd *atkbd,
 	return code;
 }
 
+static int atkbd_get_keymap_from_fwnode(struct atkbd *atkbd)
+{
+	struct device *dev = &atkbd->ps2dev.serio->dev;
+	int i, n;
+	u32 *ptr;
+	u16 physcode, keycode;
+
+	/* Parse "linux,keymap" property */
+	n = device_property_count_u32(dev, "linux,keymap");
+	if (n <= 0 || n > ATKBD_KEYMAP_SIZE)
+		return -ENXIO;
+
+	ptr = kcalloc(n, sizeof(u32), GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	if (device_property_read_u32_array(dev, "linux,keymap", ptr, n)) {
+		dev_err(dev, "problem parsing FW keymap property\n");
+		kfree(ptr);
+		return -EINVAL;
+	}
+
+	memset(atkbd->keycode, 0, sizeof(atkbd->keycode));
+	for (i = 0; i < n; i++) {
+		physcode = PHYSCODE(ptr[i]);
+		keycode = KEYCODE(ptr[i]);
+		atkbd->keycode[physcode] = keycode;
+	}
+	kfree(ptr);
+	return 0;
+}
+
 /*
  * atkbd_set_keycode_table() initializes keyboard's keycode table
  * according to the selected scancode set
@@ -1039,13 +1074,16 @@ static unsigned int atkbd_oqo_01plus_scancode_fixup(struct atkbd *atkbd,
 
 static void atkbd_set_keycode_table(struct atkbd *atkbd)
 {
+	struct device *dev = &atkbd->ps2dev.serio->dev;
 	unsigned int scancode;
 	int i, j;
 
 	memset(atkbd->keycode, 0, sizeof(atkbd->keycode));
 	bitmap_zero(atkbd->force_release_mask, ATKBD_KEYMAP_SIZE);
 
-	if (atkbd->translated) {
+	if (!atkbd_get_keymap_from_fwnode(atkbd)) {
+		dev_dbg(dev, "Using FW keymap\n");
+	} else if (atkbd->translated) {
 		for (i = 0; i < 128; i++) {
 			scancode = atkbd_unxlate_table[i];
 			atkbd->keycode[i] = atkbd_set2_keycode[scancode];
@@ -1173,6 +1211,7 @@ static void atkbd_parse_fwnode_data(struct serio *serio)
 		atkbd->num_function_row_keys = n;
 		dev_dbg(dev, "FW reported %d function-row key locations\n", n);
 	}
+
 }
 
 /*
-- 
2.26.0.rc2.310.g2932bb562d-goog

