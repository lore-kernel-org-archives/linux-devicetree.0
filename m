Return-Path: <SRS0=fjOU=5C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7855C18E5B
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 16:50:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D96120752
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 16:50:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=flowbird.group header.i=@flowbird.group header.b="INqxU/it"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgCQQuJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Mar 2020 12:50:09 -0400
Received: from mail-ed1-f99.google.com ([209.85.208.99]:42687 "EHLO
        mail-ed1-f99.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgCQQuJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Mar 2020 12:50:09 -0400
Received: by mail-ed1-f99.google.com with SMTP id b21so17051407edy.9
        for <devicetree@vger.kernel.org>; Tue, 17 Mar 2020 09:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flowbird.group; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=D2p+tmnpAxsy04BS6InK3bZXXFxrltr4nq4SPRoOSF4=;
        b=INqxU/itvBmin99Rj6KEqZ/X8AtKSU3G+2rGaRak44NC5/bHPkCBc8Jvg4DivEOE3C
         VQH4pX4kbRPBILDYU5BXrbbVJSXUEYBNa4HTgkYKXw0PRb658dWDk0eCZI4B97gmOJih
         FuFjwdLpOOn9OhZdRmoZ7cwUnJpeW2bxNCpO+Ww61J8ENGJR6+cdvqud5DIqFvMK8tca
         DfNWReen02YVLLK0iHXoGf16s9cJlWkhvdggdQB7tNWZv/hZttz/JJyHeLPuVSB+g1Pu
         pvtHRIcifiIvCQxB1I7+ZltErdvRcpo6KRbUmP+vrdyr91bHXVpkaYtrgQ1SK43Cokgf
         3Dfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=D2p+tmnpAxsy04BS6InK3bZXXFxrltr4nq4SPRoOSF4=;
        b=HgO5O8Qlx8FVZYG/fqCbLcsxfMae7+BXYiiF+/FcIRSfY6O0mb5YgLr7t/G3JJW9Xe
         ZBGbcrsQ2d6uYQfnViviFn1sY+WLaly2slMosKim5QVSlYtsjtcel+kHAGmWnazaSiZ6
         nXZ1LFfPBImyonEQFGlBBN443LWsopjdHzCabvsYQUmYG9hjgEeGRaYjnMoYmCLY/uga
         j3SpXQ92P5tUCiExeLFKKNAHdNCD6+OrwLZaOOpmac81Z8QHGL5wD4or+MAr7XxVN6MY
         9Q0axQVww363lhcdKnbEtcmMFDuZV6ptEoMp81lBRHwlz2pJTWIqW/W9jwdtQRqOGn0f
         fTxQ==
X-Gm-Message-State: ANhLgQ2n5rRsF03g0msdXbn4UVg4m9wzLYml/9HwusGs5PQ7XACN90We
        FiGSrhesaUZfl/XhMzDB3z9UbwheJttQ+JqoL0UUhbNCZFS2
X-Google-Smtp-Source: ADFU+vsH++F48qz43Kylez6m+ksNtUfaUpU0Qyx44y/anLT6Irk7uPbLPAjYnlSWIV0TO+mu0FUtJkNX2EDU
X-Received: by 2002:a17:906:2f15:: with SMTP id v21mr4901393eji.329.1584463807981;
        Tue, 17 Mar 2020 09:50:07 -0700 (PDT)
Received: from mail.besancon.parkeon.com ([185.149.63.251])
        by smtp-relay.gmail.com with ESMTPS id d17sm14462ejw.45.2020.03.17.09.50.07
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Mar 2020 09:50:07 -0700 (PDT)
X-Relaying-Domain: flowbird.group
Received: from [172.16.13.134] (port=56876 helo=PC12445-BES.dynamic.besancon.parkeon.com)
        by mail.besancon.parkeon.com with esmtp (Exim 4.71)
        (envelope-from <martin.fuzzey@flowbird.group>)
        id 1jEFPr-0000dJ-HT; Tue, 17 Mar 2020 17:50:07 +0100
From:   Martin Fuzzey <martin.fuzzey@flowbird.group>
To:     Fugang Duan <fugang.duan@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>
Cc:     netdev@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        linux-kernel@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 0/4] Fix Wake on lan with FEC on i.MX6
Date:   Tue, 17 Mar 2020 17:50:02 +0100
Message-Id: <1584463806-15788-1-git-send-email-martin.fuzzey@flowbird.group>
X-Mailer: git-send-email 1.9.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series fixes WoL support with the FEC on i.MX6
The support was already in mainline but seems to have bitrotted
somewhat.

Only tested with i.MX6DL


Martin Fuzzey (4):
  net: fec: set GPR bit on suspend by DT connfiguration.
  ARM: dts: imx6: Use gpc for FEC interrupt controller to fix wake on
    LAN.
  dt-bindings: fec: document the new fsl,stop-mode property
  ARM: dts: imx6: add fsl,stop-mode property.

 Documentation/devicetree/bindings/net/fsl-fec.txt |  5 ++
 arch/arm/boot/dts/imx6qdl.dtsi                    |  6 +-
 drivers/net/ethernet/freescale/fec.h              |  7 +++
 drivers/net/ethernet/freescale/fec_main.c         | 72 ++++++++++++++++++++---
 4 files changed, 80 insertions(+), 10 deletions(-)

-- 
1.9.1

