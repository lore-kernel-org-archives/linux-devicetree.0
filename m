Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1CFC2BBFD
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:52:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B847920769
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:52:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVQ7LmkP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgDIRws (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 13:52:48 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35890 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgDIRws (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Apr 2020 13:52:48 -0400
Received: by mail-wm1-f67.google.com with SMTP id d202so655556wmd.1;
        Thu, 09 Apr 2020 10:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iJCxIfL1xux7zbow1yR6sLNUuWJFlrPO5LaLJSAKCAk=;
        b=bVQ7LmkPJGtTRlNPDLKIQb59onG7LSnqeJl1ASqMJMHKbA0EDo6Wiwn2BturZnvBuv
         sqrMtvbCrZex9KbS9hD/nfMXlaYTcrQqv0NCHynmWjgvEPey7rCvx2q7lGOZVj30MGh7
         s2gauaDO/NQM+OvIjoA26rp3O5uK6m16MSDhKUvNNTvYfnUoYUAIT1g3JZ05kk8vjUUN
         //Ai5CrbUS43fRN37X7WHh3mEyzoUOWBwCljOnUp2wag3g6ILU1eJnEmHmVhz6/bb6Kl
         LdLlriKZPzikvDFbw3LwLfqsSstjye0K3oeSc0nFbbcgSt8nO3vryfrblxExfBSNMfV3
         BcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iJCxIfL1xux7zbow1yR6sLNUuWJFlrPO5LaLJSAKCAk=;
        b=rFP2V58tGmP+6iGkR+VWikEp+yUmjjLvfx42+jKy2ILDDf1ZbPOBON+KEqqwt2yVqu
         qFMJAVIUdvW8jsxKSzRHPpav4eSJ4U+z6SxqO7kazI2ul1CMcSzYvZ9h1TnLnjb/PLwS
         CuSJVmjsO1GihIGWLGHVz12u7tFZiEsQNB9jTgDhgr449kyh04N28R4Z0Y/enqOI7dA7
         VUZksz7k46r1u6NxBna5eIqbCzb6GE1NGYpBsFOSkLd9qcHpZ8fPXLFgC3+OYp/zT4Yd
         Pvy9NQa1pT+6nS8icoS/EF9TpfGB28fO/wBWoy8LlNWDYvYtx4X3fd5yGB+Ux4ixrnLx
         1/3g==
X-Gm-Message-State: AGi0PuaAz6aYN9YDaAS5EJPGVXODzeGZCZwQa/BjodBYx9Yf77vbSA74
        hh3SBqDkRjTzKZ4PqRNHcQE=
X-Google-Smtp-Source: APiQypJdSEVqF3BY/HTP1GDyrgQPW7P2au5kkjIrbfzEK04mt9L+lD88qeAW+eNAzT34vBWW79XuWQ==
X-Received: by 2002:a05:600c:2c47:: with SMTP id r7mr997554wmg.50.1586454766564;
        Thu, 09 Apr 2020 10:52:46 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id w18sm18194561wrn.55.2020.04.09.10.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 10:52:45 -0700 (PDT)
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
Subject: [PATCH v6 01/14] dt-bindings: reserved-memory: Introduce memory-region-names
Date:   Thu,  9 Apr 2020 19:52:25 +0200
Message-Id: <20200409175238.3586487-2-thierry.reding@gmail.com>
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

In order to make the reserved-memory bindings more consistent with other
existing bindings, add a memory-region-names property that contains an
array of strings that name the entries of the memory-region property and
allows these regions to be looked up by name.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v6:
- drop addition of memory-regions alias

 .../devicetree/bindings/reserved-memory/reserved-memory.txt     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
index bac4afa3b197..4dd20de6977f 100644
--- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
@@ -77,6 +77,8 @@ Regions in the /reserved-memory node may be referenced by other device
 nodes by adding a memory-region property to the device node.
 
 memory-region (optional) - phandle, specifier pairs to children of /reserved-memory
+memory-region-names (optional) - a list of names, one for each corresponding
+  entry in the memory-region property
 
 Example
 -------
-- 
2.24.1

