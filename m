Return-Path: <SRS0=7KoJ=ZG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B77C432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 11:03:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D47A206EF
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 11:03:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="R5x9uzjs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbfKNLDA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 Nov 2019 06:03:00 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38670 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbfKNLDA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 Nov 2019 06:03:00 -0500
Received: by mail-lf1-f65.google.com with SMTP id q28so4692961lfa.5
        for <devicetree@vger.kernel.org>; Thu, 14 Nov 2019 03:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vDUvIPPyRNx4rgOl/6jUmNuj/P2ZCCnD4pYUmkyMZ1k=;
        b=R5x9uzjscvPLquHJeOkh0tku1Ct5Uszt9lT+ldmBnhaup737IDiCn6xBY4f+17YT/D
         NHJZI85eLG2Vg7nH1JxNhI60rbgz5XgR2JyOKzIL07H2QJ1EEir75BttnwCggKIfm20Q
         HuuUVZf0ypsiSLkGOb3rF25Cz6EtuX8aPMfOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vDUvIPPyRNx4rgOl/6jUmNuj/P2ZCCnD4pYUmkyMZ1k=;
        b=gkLboWMPCkmDdetjMjGgP3bq78hB9j5jb+dmgB8e+Sd7qCGJfnz1YLbE3aEzt1CgQ0
         SXPQwhnbPH9MRlJGjeZ440utk9jd+KAW4608QOlY00/3BtBEePqJbc4pauZUi0AioyZZ
         bPa9PV37XDLwNBV4PTLxL9FuD3qMP+l5T5s6xNy1efBYGs2X9Z370a936d2a1hFXIFYv
         KK7+gesi+EG+IcGFMKqMmOxLA3aJPjsJ1SYj0IpvEfTQ44kNvGjJmxGWhMMEs8FGFgGc
         AzA4uX3hQoXWNihPm3iTZ7nToAyg/ljh0ButozFRFPa82DYq5emk82RZ7m7Xuw3ogRG8
         FUMw==
X-Gm-Message-State: APjAAAVsZKzWY0b7qILVhBqLD0OiYWgJvSmSLfWeJpdv9d8ubHx2mMCj
        dhjLfyvHWf43t2aFULho42PjFQ==
X-Google-Smtp-Source: APXvYqx+dcqdEMfunFaJ5aoDcBHQugDvO/1iPG/YCzjkmgCH3CM0yjGR8tExVmakG+Y6L4JFcIYfTw==
X-Received: by 2002:ac2:57cb:: with SMTP id k11mr6295630lfo.87.1573729376716;
        Thu, 14 Nov 2019 03:02:56 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id x5sm2498795lfg.71.2019.11.14.03.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 03:02:56 -0800 (PST)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vladimir Oltean <olteanv@gmail.com>, Marc Zyngier <maz@kernel.org>,
        netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v2 0/2] ARM: dts: ls1021a: define and use external interrupt lines
Date:   Thu, 14 Nov 2019 12:02:51 +0100
Message-Id: <20191114110254.32171-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

A device tree binding documentation as well as a driver implementing
support for the external interrupt lines on the ls1021a has been
merged into irqchip-next, so will very likely appear in v5.5. See

87cd38dfd9e6 dt/bindings: Add bindings for Layerscape external irqs
0dcd9f872769 irqchip: Add support for Layerscape external interrupt lines

present in next-20191114.

These patches simply add the extirq node to the ls1021a.dtsi and make
use of it on the LS1021A-TSN board. I hope these can be picked up so
they also land in v5.5, so we don't have to wait a full extra release
cycle.

v2: fix interrupt type in 2/2 (s/IRQ_TYPE_EDGE_FALLING/IRQ_TYPE_LEVEL_LOW/).

Rasmus Villemoes (1):
  ARM: dts: ls1021a: add node describing external interrupt lines

Vladimir Oltean (1):
  ARM: dts: ls1021a-tsn: Use interrupts for the SGMII PHYs

 arch/arm/boot/dts/ls1021a-tsn.dts |  4 ++++
 arch/arm/boot/dts/ls1021a.dtsi    | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+)

-- 
2.23.0

