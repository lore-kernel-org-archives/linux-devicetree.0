Return-Path: <SRS0=lOvj=AE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7F5C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 00:00:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C90CA2075A
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 00:00:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M1WXzOjj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731395AbgFWAAc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 20:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731375AbgFWAAb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 22 Jun 2020 20:00:31 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 052A1C061573
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 17:00:30 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id s20so13805122qvw.12
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 17:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=5zTsNUOuWpxVQwqHyA81KsGM2YNeS5DPukrNNpPb13M=;
        b=M1WXzOjjwSSfmdXJyrDzw7m8OND5MaAnFF8VN//vPg5cCgawoble5uRcZkUBeUOJJU
         HG3LmP53IMR+Q1ugUKF6KeIX+giRSSnJ9lh+zXibW5vkAH8PLfr4gjP7iMyUkNEU8KjA
         yTLRa82PFinpCZn2gab4Zcu3GRxf9gh0sgijRQNM8BFUVjY1R190he2sB/XzaTbptoPg
         ibPszbD2g5xl2RkyzJGFEqXVt3D5Fx2ecdgl/PpPY4IVsBsR8B8tp/4rptfCbgH0+qcF
         VmQpOu6IfsZ4fWvSyLI6omVUsK8/74szoBahPwb9Ww7xr0Xx92sTmtdXUiauPS4yT+Xy
         chgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=5zTsNUOuWpxVQwqHyA81KsGM2YNeS5DPukrNNpPb13M=;
        b=lpblWz1VA6nLSE+bMm2WOmBpz36RS30Ae9fVFXElzwIakJkP3PgBEBzf9ejJmldpIN
         gS5hwodJQ09S4R395oRWjuZeXggSGEOfE9REBg0gtbzw0gZWEFXlYIRquIdfnDFpFqDd
         bdwMMhIn0JcctvelEmcxzj5v33fsTNEqSeiUULAAK2zhWpjY5aMD6Upr5utgrfZzLXaD
         qq7wUWf1FmXhmokkC7n77BmhLwt5Pxpj8rPXBiWIiQf/RrTdctxNssp9QDCzwI5DzDKl
         5fDbbhX500ackBHzDqaRn6mZVaUKXk0SAoIjC1q4DRSh8fzhoQ7SaBhlWKRLSdO+suAz
         MmPQ==
X-Gm-Message-State: AOAM530b38sV7pRC3QH60JRNTVMeFyowt/Fkfrb9Iu/bqFEax9kq7T7c
        nan749VJcTOufRxKYnCAJyugIkkPGxUz
X-Google-Smtp-Source: ABdhPJz1DB2VVCqnZsMRidGWCQLIf5KPXc6QT1FvyTz15HvgqxhYW5wOeIgatgZS1ZxxT02qnvwEKFSepQqf
X-Received: by 2002:a0c:f78b:: with SMTP id s11mr24268161qvn.33.1592870429157;
 Mon, 22 Jun 2020 17:00:29 -0700 (PDT)
Date:   Mon, 22 Jun 2020 19:59:49 -0400
In-Reply-To: <20200622235950.169001-1-jnchase@google.com>
Message-Id: <20200622235950.169001-3-jnchase@google.com>
Mime-Version: 1.0
References: <20200622235950.169001-1-jnchase@google.com>
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
Subject: [PATCH v6 2/3] media: cec: add adap_controls_phys_addr option
From:   Jeff Chase <jnchase@google.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, robh+dt@kernel.org,
        devicetree@vger.kernel.org, Jeff Chase <jnchase@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Use of the cec notifier framework is required to support
CEC_CAP_CONNECTOR_INFO but some devices do not want physical address
updates from the notifier. This adds an option to allow registering
with a cec notifier without getting address updates.

Signed-off-by: Jeff Chase <jnchase@google.com>
---
 drivers/media/cec/core/cec-notifier.c | 11 +++++++----
 include/media/cec.h                   |  1 +
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/core/cec-notifier.c b/drivers/media/cec/core/cec-notifier.c
index 517e0035fc99..95f363bb1d19 100644
--- a/drivers/media/cec/core/cec-notifier.c
+++ b/drivers/media/cec/core/cec-notifier.c
@@ -116,7 +116,8 @@ cec_notifier_conn_register(struct device *hdmi_dev, const char *port_name,
 	else
 		memset(&n->conn_info, 0, sizeof(n->conn_info));
 	if (n->cec_adap) {
-		cec_phys_addr_invalidate(n->cec_adap);
+		if (!n->cec_adap->adap_controls_phys_addr)
+			cec_phys_addr_invalidate(n->cec_adap);
 		cec_s_conn_info(n->cec_adap, conn_info);
 	}
 	mutex_unlock(&n->lock);
@@ -133,7 +134,8 @@ void cec_notifier_conn_unregister(struct cec_notifier *n)
 	memset(&n->conn_info, 0, sizeof(n->conn_info));
 	n->phys_addr = CEC_PHYS_ADDR_INVALID;
 	if (n->cec_adap) {
-		cec_phys_addr_invalidate(n->cec_adap);
+		if (!n->cec_adap->adap_controls_phys_addr)
+			cec_phys_addr_invalidate(n->cec_adap);
 		cec_s_conn_info(n->cec_adap, NULL);
 	}
 	mutex_unlock(&n->lock);
@@ -158,7 +160,8 @@ cec_notifier_cec_adap_register(struct device *hdmi_dev, const char *port_name,
 	n->cec_adap = adap;
 	adap->conn_info = n->conn_info;
 	adap->notifier = n;
-	cec_s_phys_addr(adap, n->phys_addr, false);
+	if (!adap->adap_controls_phys_addr)
+		cec_s_phys_addr(adap, n->phys_addr, false);
 	mutex_unlock(&n->lock);
 	return n;
 }
@@ -185,7 +188,7 @@ void cec_notifier_set_phys_addr(struct cec_notifier *n, u16 pa)
 
 	mutex_lock(&n->lock);
 	n->phys_addr = pa;
-	if (n->cec_adap)
+	if (n->cec_adap && !n->cec_adap->adap_controls_phys_addr)
 		cec_s_phys_addr(n->cec_adap, n->phys_addr, false);
 	mutex_unlock(&n->lock);
 }
diff --git a/include/media/cec.h b/include/media/cec.h
index 972bc8cd4384..50482b6c4b66 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -174,6 +174,7 @@ struct cec_adapter {
 	bool is_configuring;
 	bool is_configured;
 	bool cec_pin_is_high;
+	bool adap_controls_phys_addr;
 	u8 last_initiator;
 	u32 monitor_all_cnt;
 	u32 monitor_pin_cnt;
-- 
2.27.0.111.gc72c7da667-goog

