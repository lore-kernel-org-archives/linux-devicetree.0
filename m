Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE1FC2BBFD
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:52:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C14E20769
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:52:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1fD+FP3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbgDIRww (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 13:52:52 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34721 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgDIRwv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Apr 2020 13:52:51 -0400
Received: by mail-wm1-f65.google.com with SMTP id c195so3066815wme.1;
        Thu, 09 Apr 2020 10:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bfcqBI3xg0gUATSEy+cBbSVf5etgOy40mC7zxa+FMN0=;
        b=g1fD+FP3CtGTS8Gidx14+z21rlRLYQcTsc1T7unutGm8qkPFEZvbwnfGgipcgDLTqY
         mtThA+8KPcoU87PppJV8VzfYatpAnjt8uC3bNRW9pQNBiromskS9dE+aA1T3OXtuF8Dc
         Umcur96fRTG6ghpUjXJJfPvjLcMc/goqv2CRhVylyYbsXuNJJfu8/OQdxrlJHSeuiJ6d
         IlRfJTkPgtgzzqWxqNBxJG80KZAEbcr1NUxgqpNrp3UxTZlPycZfpRi72gUIamr0bJI9
         A0eJpEl9G8hjdIV55XtZ3MJ/vUvCqOVvB6FgXH40+/qslt3R7HcJLbD6yzKXNb337YzB
         jaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bfcqBI3xg0gUATSEy+cBbSVf5etgOy40mC7zxa+FMN0=;
        b=kzyJ1uh25JCC+v0/pWp41rOg8Olj0HJ3PyT3lcxI3mT7Jp4u6fuq48Ym0N7OpW6TMy
         SGgcOuI1OjCl2ag9WAtCF5PI1+iKVRt4QeY8UmfFhTE/TOlYIfjNrOUcH4YOTKv4DC+J
         OV74ukCsW34G5AoQTC3TAYn4yk/eE5nODIAm9cRtfbI7fodJ6vlih3KRXAy1Joeahddb
         1DMnnjfy1QE551GwkB+sjRZMe1ZuJN0QozSehyhb1B9dKZzX5N5u1MzqwOFcmT/EE6WO
         j1nKvFoP/3Kh+qKadKGZZ5Qa65YA5hL/RY3VWfUrkMvjkuuRT+dxqVX/MEIsLL7EyldY
         6HbQ==
X-Gm-Message-State: AGi0PuZhkUkTHK+USpJyZASyx7FudQ9UzyDLX4eyjSfOoDWgVyYy/8kh
        J78AKCS6m62Nzt29273rFL4=
X-Google-Smtp-Source: APiQypJdr2akCWptOFhocybblUVKNcNP9vNr9RPMd6bLx3PXA4JtlI5oUQignMcCTYn3wBdf4c+M+Q==
X-Received: by 2002:a1c:2203:: with SMTP id i3mr1012035wmi.0.1586454768341;
        Thu, 09 Apr 2020 10:52:48 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id k184sm4664605wma.13.2020.04.09.10.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 10:52:47 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 02/14] of: reserved-memory: Support lookup of regions by name
Date:   Thu,  9 Apr 2020 19:52:26 +0200
Message-Id: <20200409175238.3586487-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200409175238.3586487-1-thierry.reding@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add support for looking up memory regions by name. This looks up the
given name in the newly introduced memory-region-names property and
returns the memory region at the corresponding index in the memory-
region(s) property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/of/of_reserved_mem.c    | 19 +++++++++++++++++++
 include/linux/of_reserved_mem.h | 11 +++++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 1a84bc0d5fa8..ed2ff6f01d32 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -357,6 +357,25 @@ int of_reserved_mem_device_init_by_idx(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_device_init_by_idx);
 
+/**
+ * of_reserved_mem_device_init_by_name() - assign named reserved memory region
+ *					   to given device
+ * @dev: pointer to the device to configure
+ * @np: pointer to the device node with 'memory-region' property
+ * @name: name of the selected memory region
+ *
+ * Returns: 0 on success or a negative error-code on failure.
+ */
+int of_reserved_mem_device_init_by_name(struct device *dev,
+					struct device_node *np,
+					const char *name)
+{
+	int idx = of_property_match_string(np, "memory-region-names", name);
+
+	return of_reserved_mem_device_init_by_idx(dev, np, idx);
+}
+EXPORT_SYMBOL_GPL(of_reserved_mem_device_init_by_name);
+
 /**
  * of_reserved_mem_device_release() - release reserved memory device structures
  * @dev:	Pointer to the device to deconfigure
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 60f541912ccf..a1b427ac291b 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -33,6 +33,9 @@ typedef int (*reservedmem_of_init_fn)(struct reserved_mem *rmem);
 
 int of_reserved_mem_device_init_by_idx(struct device *dev,
 				       struct device_node *np, int idx);
+int of_reserved_mem_device_init_by_name(struct device *dev,
+					struct device_node *np,
+					const char *name);
 void of_reserved_mem_device_release(struct device *dev);
 
 void fdt_init_reserved_mem(void);
@@ -45,6 +48,14 @@ static inline int of_reserved_mem_device_init_by_idx(struct device *dev,
 {
 	return -ENOSYS;
 }
+
+static inline int of_reserved_mem_device_init_by_name(struct device *dev,
+						      struct device_node *np,
+						      const char *name)
+{
+	return -ENOSYS;
+}
+
 static inline void of_reserved_mem_device_release(struct device *pdev) { }
 
 static inline void fdt_init_reserved_mem(void) { }
-- 
2.24.1

