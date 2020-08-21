Return-Path: <SRS0=+ed7=B7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF82EC433E4
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 14:45:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E3AB2086A
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 14:45:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GmKcGM6U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgHUOpW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Aug 2020 10:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727988AbgHUOom (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Aug 2020 10:44:42 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E30C0617A2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2020 07:44:37 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id j15so1036243lfg.7
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2020 07:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dCxd2Q4l5lkrNLliGFJQWYHxizvRKPbrS09MX/RoHLM=;
        b=GmKcGM6UHhTOSrzyGoon8fimsUsJsoCmfRi2IX7drBYlygMYxMH+UN27VCNCU1t3AG
         C6uS7uOwqapSy69YRq29pHHahyG3Z+49HchV+3KC25FAyTZasPEnxRLa1PdHVU0WJ0Gq
         mm25ZZImCfybEp8lRAcrSSJ5lEoxK9ctEzOKnJirmpymflqtczwRXdrIlNPawPiSb30n
         OGdx7u9DWqzbahDTGzZdXsXrvGScFStGCRT/0+COD3hX8YlG3C3msC8Us3RoQYrROPCY
         Ked5yYkGMsOAXVN/IFfl8JrXSg5XwrYlEXFQV6Cxcg2VnqycEwfx5+61IBjaOG1Fyhvm
         Z0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dCxd2Q4l5lkrNLliGFJQWYHxizvRKPbrS09MX/RoHLM=;
        b=d4H3L9ob0+rR7xn4rXPdXaZZ1dQ8Sd5HU8OcwDNvd/bR5xWSIeXQb2bKSxdCscxnv6
         R+FoppHC4n+vh5Gyf20odKl1TMAfECqMmsLbbTaIzeuY5hbDxthSRhj+FrmX688PGY0E
         aAH6raKV2kJ+vvoZbjFK4x11dDpn2g5u+hTMSyCckVDJV+bMV3s0L5mm+/Yd83H3KYaO
         rN+OcIXdoAsDgOi+Ad9DdmB1THYmbRwRrct5rZjOsjzzm+50xhHmyzjkTW2aDLFz+Tvf
         DKhNd6gErpLcknC/4TE+TqqdIQROxGLSYe5xssLSuuvEqgwd40Id6ICQkdFOo30HyqlQ
         3m/g==
X-Gm-Message-State: AOAM530FKYpCcbtDdnQalH5enS8qXZ0y8olAzdtdgMV2ZQUh+bMPWuQ+
        oFme9NPxNf9xi9fK1oyRYfzWug==
X-Google-Smtp-Source: ABdhPJy+O9TCor1YYjDT1vPpSOc3rLR+SybCootz5q6qINXbs623zAq/NPoBXcSDtFn6O6eD3oRHSQ==
X-Received: by 2002:ac2:4881:: with SMTP id x1mr1621731lfc.162.1598021075745;
        Fri, 21 Aug 2020 07:44:35 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id u10sm425301lfo.39.2020.08.21.07.44.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Aug 2020 07:44:35 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, tony@atomide.com
Subject: [PATCH v2 7/7] soc: ti: pruss: Enable support for ICSSG subsystems on K3 J721E SoCs
Date:   Fri, 21 Aug 2020 16:42:44 +0200
Message-Id: <1598020964-29877-8-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598020964-29877-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1598020964-29877-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The K3 J721E family of SoCs have a revised version of the PRU-ICSS (ICSSG)
processor subsystem present on K3 AM65x SoCs. These SoCs contain typically
two ICSSG instances named ICSSG0 and ICSSG1. The two ICSSGs are identical
to each other for the most part with minor SoC integration differences and
capabilities. The ICSSG1 supports slightly enhanced features like SGMII
mode Ethernet, while the ICSSG0 instance is limited to MII mode only.

There is no change in the Interrupt Controller w.r.t AM65x. All other
integration aspects are very similar to the ICSSGs on AM65x SoCs.

The existing pruss platform driver has been updated to support these new
ICSSG instances through new J721E specific compatibles.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
v1->v2:
 - New patch which was not present in v1.
---
 drivers/soc/ti/pruss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index ccc9783..37df543 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -164,6 +164,7 @@ static const struct of_device_id pruss_of_match[] = {
 	{ .compatible = "ti,am5728-pruss" },
 	{ .compatible = "ti,k2g-pruss" },
 	{ .compatible = "ti,am654-icssg" },
+	{ .compatible = "ti,j721e-icssg" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pruss_of_match);
-- 
2.7.4

