Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E22C352A4
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 09:27:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E58322464
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 09:27:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bLihywFB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgBJJ1a (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 04:27:30 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34267 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbgBJJ1a (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 04:27:30 -0500
Received: by mail-lj1-f195.google.com with SMTP id x7so6322334ljc.1
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 01:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4oCdw4EMcaGAIMom3SqVsEVPDCH2z9QogNcbqKHn9HA=;
        b=bLihywFBQK+ePz5zj1fPsXKJBLg7P9wboAA8mgZ3VdNdSmak04q5ZP0tPgv6V+6pa3
         SoawWsfbaara39EiZAG2R//onU8d8D6iIen3Lg7kAr2GawMZTkRpZWwwn2Wnte8oT3BK
         t4964MhRRirXgJKIinZuWKs0RrSkcPTRvl3r/9gTwIoTMH7vnY9XhWsFhyDvV7yOQWiU
         s5Hr7h4M0Uz9VIxeJ3uJBOFaXMBM1ZUIKDK89i/EsiJd9yfLZTfWiK9fOKS4YXJUypYz
         BR5RoH9sIETPLSJryIivZH854wmhEbIlHcFhAFSHdXWdFH/jKChC2ogjXTMlH8RIhd14
         7/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4oCdw4EMcaGAIMom3SqVsEVPDCH2z9QogNcbqKHn9HA=;
        b=H3pJIUhV+biLQ2U4H2r4Wm+KiOQ6GJBBaEEsJjWZykFeU9BTtnyMBia8AbvhG4ASEx
         CYx39ERaUw36FpPrlUNbnwQRGj7aYlWL82H7RfNmfywr2FzC1PwBJVSGamMXgGy4VA24
         7T6gU+H5qoXceVtB6RJEru2O/okd9wehqs28j026+b9ueAAi3GCeqnROYjTQAAU0ejTd
         yF8HjKKNP4IKbCivr0xQDt6J4yM+imoq/lBa5t4eTF1IvAVH9zWyvDTWzMMVXW/A+62h
         QQ1jJ4Fdn2I+sra8cMDF+/rN2v9MN8xEtQlLwM8cqrffwvkq/GAd9gT/R6rKehFRK2j5
         yk0Q==
X-Gm-Message-State: APjAAAWgjnbMsf9I7KYf1Kzk8YmcgF03L3n3wtaCKcqH+CkfJ/nLYdNh
        1oKKxJVxeKLEw+jMsHDkE2sawyuUx2c=
X-Google-Smtp-Source: APXvYqw8Clis7LKjtsbN5b28CUHEdrIEMz1FGxo+GUKChtaWk9hU99hGrQBgmd3+rYqfim9tHtn1Hg==
X-Received: by 2002:a2e:8e2a:: with SMTP id r10mr281487ljk.219.1581326848014;
        Mon, 10 Feb 2020 01:27:28 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id d9sm5989882lja.73.2020.02.10.01.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 01:27:27 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/7] ARM: dts: RealView: Fix the name of the SoC node
Date:   Mon, 10 Feb 2020 10:27:08 +0100
Message-Id: <20200210092713.279105-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200210092713.279105-1-linus.walleij@linaro.org>
References: <20200210092713.279105-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Drop the surplus @0 on the soc node making the devicetree
conform strictly to the schema.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/arm-realview-pbx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm-realview-pbx.dtsi
index 09f3f544f3a7..f61bd59ae5ba 100644
--- a/arch/arm/boot/dts/arm-realview-pbx.dtsi
+++ b/arch/arm/boot/dts/arm-realview-pbx.dtsi
@@ -210,7 +210,7 @@
 		};
 	};
 
-	soc: soc@0 {
+	soc: soc {
 		compatible = "arm,realview-pbx-soc", "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.23.0

