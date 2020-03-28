Return-Path: <SRS0=dVBB=5N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E26C43331
	for <linux-devicetree@archiver.kernel.org>; Sat, 28 Mar 2020 18:37:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 299CC206E6
	for <linux-devicetree@archiver.kernel.org>; Sat, 28 Mar 2020 18:37:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmSkohK9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbgC1ShC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 28 Mar 2020 14:37:02 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:40770 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgC1ShC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 28 Mar 2020 14:37:02 -0400
Received: by mail-qt1-f195.google.com with SMTP id c9so11627242qtw.7
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2020 11:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=gOE1QJ7KEzi2821QFOUr5VIkfnYNAnKkaW2u6yhroF0=;
        b=kmSkohK9C99aKQMtcTaFk7VI6eCx8fIEA2JspD5Ai/1besCmp5AL7m1d5zrNarN9/g
         WcLnr93JMyYvpGjVt8uh69o6+w/N/DaH7++Ww/VMpBMxX3sgz792/2m2mxVjr9MM7vEd
         RaVAGU1qju5Khd7nQaeGgIlME9y1JbQfp6xEkU/97kyu8z7P3Sk5I0iU3udPQEYpd+Xp
         fElkx6HBH5tS+WIYZMUQeFhr4Z8AW+29n648e4nq7h3aNgXiymCOTkcd1YpzUYd0v5Su
         wFbWHhebJ/9vWl3SMcRqc9o+1CwZoL6KTm5I5/vXRqDwGTftA8MptQ+GWSxqQ2+GxJD7
         g4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gOE1QJ7KEzi2821QFOUr5VIkfnYNAnKkaW2u6yhroF0=;
        b=UHCuIWJPosxZYaNpLtPa++pelcNp6G+YGNiudmIplcKwrIEdBwq1+YShavvziZVXsv
         HwFCYH7mHimlUHDV5ppf1eh3tYSrz/P12Gufam20njonIIZ9fdWtFD36aVswKj7VFJGL
         qRz3qBBJ0lYj+cB7fv0KmJTlv3+8pgEmJa7L7BirlLGmaQjco9Vk+f0PQRspuFmrDPXM
         nxv+wmvSRthJgkp3P71/LtTaNaFdu8E1tC0KRdl18bXL1H4CRif5dGmw+C7UqINYct8V
         OOzkS+yBsYBApHIKU2AX2wiCXi7n+Y101d//sacRW7HLSZ0fMmfO/LT3iLeHcUTkz5oG
         QPEA==
X-Gm-Message-State: ANhLgQ2wy4vIGSOqqVwzohpLqEJtBZtNq0DDboyYlZFQ4pu17ZaWStuK
        hoWd9/Q3SCqdqVErOhqM7uTLuOBa+Dc=
X-Google-Smtp-Source: ADFU+vukbniIbbOEjIUJNNGnuXRbWumjZpud/PTzz0M96h+nBpM4Neds+sKV/il0u+AFwBLmJmF92Q==
X-Received: by 2002:aed:39e4:: with SMTP id m91mr5206540qte.188.1585420621130;
        Sat, 28 Mar 2020 11:37:01 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:5bb::4])
        by smtp.gmail.com with ESMTPSA id u40sm6822420qtc.62.2020.03.28.11.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2020 11:37:00 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     sam@ravnborg.org
Cc:     robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, heiko.stuebner@theobroma-systems.com,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] dt-bindings: display: ltk500hd1829: Remove the reg property
Date:   Sat, 28 Mar 2020 15:36:40 -0300
Message-Id: <20200328183641.11226-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Commit 52120e8c7ae3 ("dt-bindings: display: fix panel warnings") removed
the dsi unit name, but missed to remove the 'reg' property, which causes
the following 'make dt_binding_check' warning:

Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.example.dts:17.5-29.11: Warning (unit_address_vs_reg): /example-0/dsi: node has a reg or ranges property, but no unit name

Fix it by removing the unneeded 'reg' property.

Fixes: 52120e8c7ae3 ("dt-bindings: display: fix panel warnings")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml  | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
index fd931b293816..b900973b5f7b 100644
--- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
+++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
@@ -37,7 +37,6 @@ examples:
     dsi {
         #address-cells = <1>;
         #size-cells = <0>;
-        reg = <0xff450000 0x1000>;
 
         panel@0 {
             compatible = "leadtek,ltk500hd1829";
-- 
2.17.1

