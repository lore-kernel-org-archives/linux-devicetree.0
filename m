Return-Path: <SRS0=p3dD=ZE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2E3C17441
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 13:20:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D74A820818
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 13:20:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="DUMIM24I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbfKLNUS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 08:20:18 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35417 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfKLNUS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 12 Nov 2019 08:20:18 -0500
Received: by mail-lf1-f68.google.com with SMTP id i26so1750088lfl.2
        for <devicetree@vger.kernel.org>; Tue, 12 Nov 2019 05:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0pZeHJXrkcOE52JT+BLqoRf59jEWL/uBcfxLoGjjwKQ=;
        b=DUMIM24ILNaW7JrnAwsV7kKLEPHiTz/bkIaUMXL4XqBJHjuXVhmATdQWCeqUl5qDbI
         DAujvN5K84e2xlLvUUPHplVV0UMkPQ/36Bw4nTkvDua5kXv8zQBupu0HgUApQbTJ17nw
         +00cRK0IBB3mWLN4xaktL/eZB4w40NTQYYGXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0pZeHJXrkcOE52JT+BLqoRf59jEWL/uBcfxLoGjjwKQ=;
        b=X8GMCR/rUArD8HkOXFXGE/UG/POFxiBN/TVT1vJnHycuJrmy+kINv9O0dWmRgJ7k6C
         9lA88IWyzEK9/dtBYWpPK7BQ1M5Cl4h09w81w8DRnfeQ6pjTL0supIPxu9ADSD+E6hLU
         O5xFYFr2NZtqiCP5C2X8xb+zhhgChEORezUpe3POj5ExJ3UrufBBZaiiVmRQ/atM+NBZ
         YGdch4d4g2Ll41g+kyZahxcTyi9KGnRTmgSDwXInjnufgTTvSeV2NJc9r8E2qYl3/HY0
         LW32Ry3DXj+/m3RTvTzs0DuVWfTkcPqL5oG7qMY2k3QB5TfU+vvPMUMgfjqmIhyKOGay
         WhmQ==
X-Gm-Message-State: APjAAAVpBCTqVU1eIhtWd6LQD2KP8qlE5Eu7s1rmTi3+2ykEB6IlumAr
        IUkec7Q5iiD6CcOR0TGrsOAmiQ==
X-Google-Smtp-Source: APXvYqzxHffr4e1+dAJjjPz5zrGyAj/4YB2n45y1G8UEWMUh280NYl3CkA9jXpQXK6Xr81MsFj7yfA==
X-Received: by 2002:a19:5e0e:: with SMTP id s14mr19338765lfb.30.1573564814637;
        Tue, 12 Nov 2019 05:20:14 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id f20sm869050lfc.75.2019.11.12.05.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 05:20:14 -0800 (PST)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vladimir Oltean <olteanv@gmail.com>, Marc Zyngier <maz@kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 0/2] ARM: dts: ls1021a: define and use external interrupt lines
Date:   Tue, 12 Nov 2019 14:20:08 +0100
Message-Id: <20191112132010.18274-1-linux@rasmusvillemoes.dk>
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

present in next-20191112.

These patches simply add the extirq node to the ls1021a.dtsi and make
use of it on the LS1021A-TSN board. I hope these can be picked up so
they also land in v5.5, so we don't have to wait a full extra release
cycle.

Rasmus Villemoes (1):
  ARM: dts: ls1021a: add node describing external interrupt lines

Vladimir Oltean (1):
  ARM: dts: ls1021a-tsn: Use interrupts for the SGMII PHYs

 arch/arm/boot/dts/ls1021a-tsn.dts |  4 ++++
 arch/arm/boot/dts/ls1021a.dtsi    | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+)

-- 
2.23.0

