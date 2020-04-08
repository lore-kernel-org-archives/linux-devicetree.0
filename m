Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9919BC2BBC7
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C8582082F
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXutsEU3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730265AbgDHTwO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:52:14 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44194 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730241AbgDHTwN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:52:13 -0400
Received: by mail-lj1-f193.google.com with SMTP id z26so4884540ljz.11
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6D6qYDVAoDX49O3pqM7t4Fg8LndWENhGAQHVsmY5Z5o=;
        b=XXutsEU3l6r+yPO9oJgX925/EDBqLG+ysEOjCx8DGzfZCFdjWwBb5YErtaIjok8IsY
         I/cHrBMUtYMWwnEm/3A/VDSnpY3BsPhb4/TC5NmFIEj/5kqLZobOSL7ZfTegy00rNoUI
         tzqjFODTBjWuonPRDA7ypa72lBvL7i4woLyBpa3Aj89AZO1XWzckF9HHFLWpvNEYkY5/
         NKS0dcOMUVTFe8qngfzfQF+m5KPSHggKQjcjDdqn0XuT9VjV3hbk8wyiAlOIYi8WFgQT
         uKrEZasT4W9KZ5ab70JIsGnm/7qu1pvm/QezA1Z5Mws2KO8cMM1J2XIbXiNjFx5qvm1w
         pDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=6D6qYDVAoDX49O3pqM7t4Fg8LndWENhGAQHVsmY5Z5o=;
        b=aaGPSYDG0IMSjGqeMN2rqeQ5S+CipGOP8HMGRbtTMm5/gD8GzfXPM27v+9GkGf/Gpp
         QVieBZWVV/pk52xCMwzshaZleQXvVGmWbOve/dxnAAsUAaEVGCjtIAb3MkKdK9ASfbfh
         LecNB9cc3yqS4zfJaU4qN2Fl1aHyPv0VXELNTbIXE+SYyfG1NgT81UQDEq7f4Zh77hGo
         F9Eb2UnMRns06OsgWDKFOCw9nMIlw79m/Y4U4xk1XE3BZGCduvV0ig7DrFx/+BBdS3GE
         DoFGQ41eULLPNodqMBEwNacu8U1bGubWooyZ7JXgZm1G9iuYlqIO4dUenkp+s2IawI3Q
         lChQ==
X-Gm-Message-State: AGi0PuanfpU8u/xbR+rV6Ujy6uJmkt0ZCUTOZWX4mQBKelsJTMAxYfJ0
        h+/cRFyrouVgwMw4iXq5EmE=
X-Google-Smtp-Source: APiQypKNYRQcSSHozxvibYIjkxAF3kS1iwCxc1DBka0R8azioQKkkgz4VifSElVsqxT/YIokQcgAUg==
X-Received: by 2002:a2e:6809:: with SMTP id c9mr5871304lja.251.1586375531273;
        Wed, 08 Apr 2020 12:52:11 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:52:10 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 28/36] dt-bindings: display: drop unused simple-panel.txt
Date:   Wed,  8 Apr 2020 21:51:01 +0200
Message-Id: <20200408195109.32692-29-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

There are no more references to simple-panel.txt.
Delete it.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 Documentation/devicetree/bindings/display/panel/simple-panel.txt | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/simple-panel.txt

diff --git a/Documentation/devicetree/bindings/display/panel/simple-panel.txt b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
deleted file mode 100644
index e11208fb7da8..000000000000
--- a/Documentation/devicetree/bindings/display/panel/simple-panel.txt
+++ /dev/null
@@ -1 +0,0 @@
-See panel-common.yaml in this directory.
-- 
2.20.1

