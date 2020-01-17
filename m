Return-Path: <SRS0=d5cD=3G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2899C3F68F
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 11:15:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B202217F4
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 11:15:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p0bl/Pvp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgAQLPr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jan 2020 06:15:47 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:32918 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbgAQLPr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jan 2020 06:15:47 -0500
Received: by mail-pl1-f193.google.com with SMTP id ay11so9749644plb.0;
        Fri, 17 Jan 2020 03:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Grg9yoAnqVAfWkAAQV4kee2RpcS6+9mUDMMS5oTe+HU=;
        b=p0bl/PvptNyvztc0HVEDCRgnYR289d9AoHGP4sYgXLfUM61I4NrpGuD0bg860oJuNG
         vU7YIgF+X6YQwCjX0DmzZFhqYOALOQY1X+e1YX/mRsqKybAy+mbPYYFbVx6p4q8x59sA
         3BBs2GNCTAebaW7F+SM48FN6qprov0zMuKUCBENg+Xvpyt/qX80iMxXybV/AW7hPO0YU
         XZbK3wk9StHZiRyfsm73O4GGh5vxkwDO0hthJZmFc+xsBxSaSRO4wxFnp2JXJqHsxViX
         l86astFjlarwMsWS++S4VmbxXeu4YPoYP9wxj+hoHEhEJaZitQLMPG0a6+Um69r9NkAd
         kobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Grg9yoAnqVAfWkAAQV4kee2RpcS6+9mUDMMS5oTe+HU=;
        b=Pnmfp5pNjYY1J1IB0fDzjOS31dE68woQvXBCmDv/XEk1oh/MdCVQqiVS0r7AL044K/
         cGndWeJgVoaVnVVh/i/xR6f3qJbwb4HxNufuP0TCLtATcEDsSWSRqZ6wurTArmbkahLW
         LI9CZWDbqjC6IkEv7zzsoQSg/hqhXTUv+OG2ngUxTRF06sc42/i//tuy9OvSfTx14+Ek
         Ixk+TfxRLbMT/iUJIqmSLYPmKQbkqm1LyN7pjDTyri9B+xbKXPAvHIROyl02IZpzpiwV
         hEyQQW9S2Xj1HI8/DaHm/Y5P1zGigRul/Bpq6F46+NiBp7cmw3GRY+pQzM2ScZNAqV8a
         pKIw==
X-Gm-Message-State: APjAAAUO8df1FkGFXHZTAk2ZIFllq6syV/MFyjrG2FKx13hTpsA/BdFt
        ArbLVw1LVVtIFomnizEkuDs=
X-Google-Smtp-Source: APXvYqzrur6I7YW3RjIDWil9sqEGv+14JOHSwFTX3x8JNKsCXbb00tHMoQi13kaRdgsuOejOGMApCQ==
X-Received: by 2002:a17:902:82cc:: with SMTP id u12mr35118153plz.342.1579259747036;
        Fri, 17 Jan 2020 03:15:47 -0800 (PST)
Received: from localhost ([43.224.245.181])
        by smtp.gmail.com with ESMTPSA id e2sm29361611pfh.84.2020.01.17.03.15.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jan 2020 03:15:46 -0800 (PST)
From:   lijiazi <jqqlijiazi@gmail.com>
X-Google-Original-From: lijiazi <lijiazi@xiaomi.com>
To:     Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     lijiazi <lijiazi@xiaomi.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE), linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH v2] lib/vsprintf: introduce OF_DEVICE_NODE_FLAG_MAX for %pOF
Date:   Fri, 17 Jan 2020 19:15:19 +0800
Message-Id: <1579259719-16904-1-git-send-email-lijiazi@xiaomi.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Introduce OF_DEVICE_NODE_FLAG_MAX for device node printk, if add
new device node flag, please add the corresponding flag abbreviation
to tbuf in device_node_string.

Signed-off-by: lijiazi <lijiazi@xiaomi.com>
---
 Documentation/core-api/printk-formats.rst |  2 ++
 include/linux/of.h                        |  6 ++++++
 lib/vsprintf.c                            | 14 +++++++-------
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index 8ebe46b1..c73ccad 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -441,6 +441,8 @@ Examples::
 							d - detached
 							P - Populated
 							B - Populated bus
+                                                        O - Overlay
+                                                        F - Overlay free cset
 
 Passed by reference.
 
diff --git a/include/linux/of.h b/include/linux/of.h
index c669c0a..0453601 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -147,6 +147,12 @@ extern raw_spinlock_t devtree_lock;
 #define OF_OVERLAY		5 /* allocated for an overlay */
 #define OF_OVERLAY_FREE_CSET	6 /* in overlay cset being freed */
 
+/* Add flag max for %pOF related printk, if add new flag, please
+ * increase following marco, and add abbreviations to tbuf in
+ * device_node_string function.
+ */
+#define OF_DEVICE_NODE_FLAG_MAX 6 /* maximum available flags */
+
 #define OF_BAD_ADDR	((u64)-1)
 
 #ifdef CONFIG_OF
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 7c488a1..3c219b4 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1937,9 +1937,9 @@ static noinline_for_stack
 char *device_node_string(char *buf, char *end, struct device_node *dn,
 			 struct printf_spec spec, const char *fmt)
 {
-	char tbuf[sizeof("xxxx") + 1];
+	char tbuf[OF_DEVICE_NODE_FLAG_MAX + 1] = { "DdPBOF" };
 	const char *p;
-	int ret;
+	int ret, i;
 	char *buf_start = buf;
 	struct property *prop;
 	bool has_mult, pass;
@@ -1997,11 +1997,11 @@ char *device_node_string(char *buf, char *end, struct device_node *dn,
 			buf = string(buf, end, p, str_spec);
 			break;
 		case 'F':	/* flags */
-			tbuf[0] = of_node_check_flag(dn, OF_DYNAMIC) ? 'D' : '-';
-			tbuf[1] = of_node_check_flag(dn, OF_DETACHED) ? 'd' : '-';
-			tbuf[2] = of_node_check_flag(dn, OF_POPULATED) ? 'P' : '-';
-			tbuf[3] = of_node_check_flag(dn, OF_POPULATED_BUS) ? 'B' : '-';
-			tbuf[4] = 0;
+			for (i = 0; i < OF_DEVICE_NODE_FLAG_MAX; i++) {
+				if (!of_node_check_flag(dn, OF_DYNAMIC + i))
+					tbuf[i] = '-';
+			}
+			tbuf[OF_DEVICE_NODE_FLAG_MAX] = 0;
 			buf = string_nocheck(buf, end, tbuf, str_spec);
 			break;
 		case 'c':	/* major compatible string */
-- 
2.7.4

