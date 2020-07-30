Return-Path: <SRS0=Tykm=BJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC884C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 10:02:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB247206F5
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 10:02:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGvuf0NL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728739AbgG3KC0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jul 2020 06:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgG3KCZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 30 Jul 2020 06:02:25 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F06C061794
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 03:02:24 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id u10so4117326plr.7
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 03:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jKGnrlhAfNKdaaToJ46lBcdVPmMZfVv12+YknhqbXO0=;
        b=QGvuf0NLGceYH/+wRrdOtQLDYt3saSF6XNwkqBlehffifMS+OO1e7Vly37SFa/FNff
         qgIByztFK0amyngVkDtXPvH9yIGQuGdfgerQPBlXfrfk5aKWnEGwq1VjKuaLvyGzwmJo
         fDLWvV8WgOiTpBwMgIh5FlldQrRq74IAJF3wmNFp7HnjlhEJzJgKxS83IxfZDTm4rE4e
         IzHj4z9R8byaoCeVHYhrN/bZDEPk4cwDxuXAZpZym7QN6rW98wlOXMzCxpKEfVGPqXU0
         x+kSXoOC7trOVX+q+qiBnq8Olx0Dus/Lkp6tzmb3LYxNXQDG9J/jFzZIa3m42pISCGcS
         RbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jKGnrlhAfNKdaaToJ46lBcdVPmMZfVv12+YknhqbXO0=;
        b=hzp/maZ0aO35bim//MqQvb2f3d03PEuV44vLmX3xTx5vL1pL5VHmPfh/woYcMv9OhG
         GH2ieggPGUWWr2jQdGrQ7cnY2LmJxaR9fJeNo48bF2lxQDhrkNsF5f3XIyjnMqoMCw19
         qa1cdWDzQ7+Mk/w7cKsVIQyQzb4ksk4DqmBboEBypwLgJmHdfzLy25GLs4sv6JMwIjWz
         wyTTvMh4KlgwYmucyRsejyrvBinKC1YctVwUYMlB5pUCovlv0qPz/33KTTIaoGCbDP4l
         E68im8ga1ITqujOUWEsgch8H0bPXID3UtC+AnGpGpuQNippzV1tEjvldjhoVE0maW2wz
         m7sg==
X-Gm-Message-State: AOAM531HOfQhGf9+S/FtDsiyqMWiTzJsVKLP20AUVmNtw9ep0WoWcPeq
        mhomEYdQBOLosC9kjszGiYH+Er1r
X-Google-Smtp-Source: ABdhPJxDx9Ym7HVXcpFoe1CzJLYNTbZhywq+pILuDn9bh6hwxwAfLOs5ThzX7Yev5HFde+W0GHKFLQ==
X-Received: by 2002:a17:902:6b81:: with SMTP id p1mr246370plk.331.1596103344015;
        Thu, 30 Jul 2020 03:02:24 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.37])
        by smtp.gmail.com with ESMTPSA id d12sm5476640pfh.196.2020.07.30.03.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 03:02:23 -0700 (PDT)
From:   Anand Moon <linux.amoon@gmail.com>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v1 2/3] arm64: dts: amlogic: meson-axg: add missing ethernet reset ID
Date:   Thu, 30 Jul 2020 10:02:08 +0000
Message-Id: <20200730100209.793-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200730100209.793-1-linux.amoon@gmail.com>
References: <20200730100209.793-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add missing etherent reset ID for reset controller to reset
ethernet mac controller.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 8e6281c685fa..61adc5592211 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -185,6 +185,8 @@ ethmac: ethernet@ff3f0000 {
 			clock-names = "stmmaceth", "clkin0", "clkin1";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			resets = <&reset RESET_ETHERNET>;
+			reset-names = "stmmaceth";
 			status = "disabled";
 		};
 
-- 
2.28.0

