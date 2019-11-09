Return-Path: <SRS0=1yYv=ZB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3319AC43331
	for <linux-devicetree@archiver.kernel.org>; Sat,  9 Nov 2019 11:34:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF063222BE
	for <linux-devicetree@archiver.kernel.org>; Sat,  9 Nov 2019 11:34:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YpeGzP57"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfKILel (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 9 Nov 2019 06:34:41 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43979 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfKILel (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 9 Nov 2019 06:34:41 -0500
Received: by mail-wr1-f68.google.com with SMTP id n1so9759339wra.10
        for <devicetree@vger.kernel.org>; Sat, 09 Nov 2019 03:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0U2Hfl11NqYYCRdPoKWLjnogI538taxuOyQTz7nQ32Q=;
        b=YpeGzP57HZS0B/szmrSnq2N1OK7R9hLTkIAINAiLjyxUZD6vB4nYs6qZcrVKvWYSru
         lqIN6Fi4vGUGvKULrHMbKdyvPoUs0KeJnt2rDuUYLtR9cW+IXLCr8wwEjvRzeAzvE9UF
         HoLGmIDBvWKRNGmM77gMUovveyp+yvuTqXcisfO7xCSXdUHNyNZqdE3fCOvAhTirXRUS
         vhifDt/QELsDqNsuZz939uO+VOQ5BeiB+i7fV9XE6zYy97qNDfETAIKRZi/ldjEMooWa
         aY+Zevqq/qoPx9JzBF3/b3CjJ5BS+wLt6v3O/+Ksa4SOK9K8g+KuzDxJFwp0F62FPR2X
         XaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0U2Hfl11NqYYCRdPoKWLjnogI538taxuOyQTz7nQ32Q=;
        b=Pk4t0ls3I7nzYzsh2clbwcjsUY5JbiMow3YYtJdtOVpLweWLVvBOGSV7daR0BKIf5n
         eqnFgKMAE+rKDBiKqFoaxTmQGAM1oi9qmu6zgJC8GOYghtWDdJtc+QDyAp5VUYU6PRlJ
         ChS22sOrYUYO2oxf08uOM88BkEh265W6o/aUewHYND6UEGxunufRoGkE9oc+v9hCqMmG
         mj2akGM4hcGCYYfA273ReCfP9l5c/+a//Am/q+VZ1GvSOTdyxyEedj+neooOI3/cO8Ra
         CyW3n4xbuDvZDAhmFfMITfa8aStTqKNgfkCM2j91RtMZt5gPUjRI0Djsnt44O5ZSJ+LR
         cABA==
X-Gm-Message-State: APjAAAUL/nbFH2ii+ZqX55tGDiS4MKSHZzMOJlIYDi3EBtoSOUWuNSOg
        n46au7nzY9nnd8NB7hr7ECFqAAA5
X-Google-Smtp-Source: APXvYqyUAT7GapiKbn1vROHyc9EbmUXEZOwyowIJ5U3tqgNJU9lP2tj97o64e33k/C9h+VhfqFiwGQ==
X-Received: by 2002:adf:fd85:: with SMTP id d5mr12919249wrr.101.1573299279019;
        Sat, 09 Nov 2019 03:34:39 -0800 (PST)
Received: from mamamia.internal (a89-183-63-51.net-htp.de. [89.183.63.51])
        by smtp.gmail.com with ESMTPSA id w132sm13964296wma.6.2019.11.09.03.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2019 03:34:37 -0800 (PST)
From:   Andre Heider <a.heider@gmail.com>
To:     mripard@kernel.org, wens@csie.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        jernej.skrabec@siol.net
Subject: [PATCH] arm64: dts: allwinner: orange-pi-3: Enable IR receiver
Date:   Sat,  9 Nov 2019 12:34:36 +0100
Message-Id: <20191109113436.17979-1-a.heider@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Orange Pi 3 has an on-board IR receiver, enable it.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index eb379cd402ac..d3e30a67587c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -263,6 +263,10 @@
 	};
 };
 
+&r_ir {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
-- 
2.24.0

