Return-Path: <SRS0=vtFV=5K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD10C2D0E5
	for <linux-devicetree@archiver.kernel.org>; Wed, 25 Mar 2020 18:12:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 794D32077D
	for <linux-devicetree@archiver.kernel.org>; Wed, 25 Mar 2020 18:12:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=flowbird.group header.i=@flowbird.group header.b="iLyoXKlK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgCYSMJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 25 Mar 2020 14:12:09 -0400
Received: from mail-lf1-f97.google.com ([209.85.167.97]:40320 "EHLO
        mail-lf1-f97.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727904AbgCYSME (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 25 Mar 2020 14:12:04 -0400
Received: by mail-lf1-f97.google.com with SMTP id j17so2617083lfe.7
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2020 11:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flowbird.group; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fLsD0pf0Z2Qy/ATTVpbRFX98Scq2+qNt41yDSpwIQQk=;
        b=iLyoXKlKVAEeJKb4GZYsqeun1adVsC9YRwFHuXskB9nuaEPBvhLao07deNQYw72RQZ
         wUwwf0sN6Ny/pl8t5eyZT7VfFmA3hHfjm0p/6KznAlT68UT2/NfUk4WM2Bzg2QPFbQNK
         Dq1SSAcgbZ97s/TTEkSa8wqn5E9oLog/QQ9+ti8S0vepfcEUM3V4wFHq5Zow6/K/fYGH
         U/veqSNDhMM86ByHOJR9SIOtlnkc38IhLnho9ySmFzY8ZsFnUvBQ23Ybb+NcJ4a7pQMO
         XTwn5dlOUF1oWN2ly2rRSEI7VzWpGaIUzS7n+zM1bjONc+vbSRGCjXC0QOf+r1RIlru6
         +A3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fLsD0pf0Z2Qy/ATTVpbRFX98Scq2+qNt41yDSpwIQQk=;
        b=P48NfbgNFZpHbUpfoQb8Q9GAXwGIcnFCKURDWyJJFqc2K2GxiSLdYy+mi4hK+MXcPM
         iGx83jB9Ab8rUCaC84gQJYbRo4cKpZ7hMBQTOJjLH8QUAeSG2/9RSZ60VSADNSfUaFBW
         ski+BMzqAJF/SFDgBxmthv3140jZqUe040A1+Zoc4eNb55VPW6r1XwnnnZFWu9ok/paz
         iTOQWqx6A60CfmJBbNDQmRUJMEtr6MwvA0CyWToWRcXkdR/FWXbVt9aSWEu+xLphJVWl
         HPXWS+Tejz6iPMsnCMM5iDCxC7ogItQZ/UNtjma8en4rJt58VrDc9W0401wZuLxG3Vfx
         8sKg==
X-Gm-Message-State: ANhLgQ3J4sGtWN+YldCkPOuTooDWBeo6FawMluJUyLni4ZczsolwKVg/
        BidOxlinlfZNHy4NLaIKmATAxqI+qRREValtnJJ+DGKQFMkW
X-Google-Smtp-Source: ADFU+vu3J9uRTLiIP5vf8lSLTAkoSWCPvzFRTGJZ+RRp6NqycNXaFIzinWVyrA2u9iaNoUfPCIbblHthN6mv
X-Received: by 2002:a19:660a:: with SMTP id a10mr3091046lfc.9.1585159921405;
        Wed, 25 Mar 2020 11:12:01 -0700 (PDT)
Received: from mail.besancon.parkeon.com ([185.149.63.251])
        by smtp-relay.gmail.com with ESMTPS id x11sm55799lji.25.2020.03.25.11.12.01
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Mar 2020 11:12:01 -0700 (PDT)
X-Relaying-Domain: flowbird.group
Received: from [172.16.13.190] (port=39524 helo=PC12445-BES.dynamic.besancon.parkeon.com)
        by mail.besancon.parkeon.com with esmtp (Exim 4.71)
        (envelope-from <martin.fuzzey@flowbird.group>)
        id 1jHAVU-0003Oy-K9; Wed, 25 Mar 2020 19:12:00 +0100
From:   Martin Fuzzey <martin.fuzzey@flowbird.group>
To:     Fugang Duan <fugang.duan@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>
Cc:     netdev@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        linux-kernel@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 4/4] ARM: dts: imx6: add fec gpr property.
Date:   Wed, 25 Mar 2020 19:11:59 +0100
Message-Id: <1585159919-11491-5-git-send-email-martin.fuzzey@flowbird.group>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1585159919-11491-1-git-send-email-martin.fuzzey@flowbird.group>
References: <1585159919-11491-1-git-send-email-martin.fuzzey@flowbird.group>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This is required for wake on lan on i.MX6

Signed-off-by: Martin Fuzzey <martin.fuzzey@flowbird.group>
---
 arch/arm/boot/dts/imx6qdl.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index bc488df..65b0c8a 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -1045,6 +1045,7 @@
 					 <&clks IMX6QDL_CLK_ENET>,
 					 <&clks IMX6QDL_CLK_ENET_REF>;
 				clock-names = "ipg", "ahb", "ptp";
+				gpr = <&gpr>;
 				status = "disabled";
 			};
 
-- 
1.9.1

