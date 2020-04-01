Return-Path: <SRS0=fmve=5R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC23C43331
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 22:52:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3CD3B2071A
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 22:52:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L1GphxYw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389294AbgDAWwJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Apr 2020 18:52:09 -0400
Received: from mail-pl1-f202.google.com ([209.85.214.202]:55367 "EHLO
        mail-pl1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389293AbgDAWwJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Apr 2020 18:52:09 -0400
Received: by mail-pl1-f202.google.com with SMTP id w11so1021061plp.22
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2020 15:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=q4ZMYmBcDBfZ3/eKhJPvc8UL2Mx5kdXJ4d7Xvr4DvUY=;
        b=L1GphxYwE+P1HgKdoSybxCMrbn+Boz7nmON5n7k3g9V4dXrhW0rWOJGJePJlYea17Y
         F7VInZKMeB5rMmSNjL+Bh/e1T7sgowsYWQYLaYDS4SXzZRVNcIl3Ql72Du4dMjtUP2yw
         PoKfo+L22F7cJitsf3BcJuOKx8Nxc6lRK542wFVheb6BlwDiPiNhkNP7ofG1bcOKnLKg
         ZrOpfq+QHbannMNS/YaAb/nm/fhKvRLo6G4ihXHtXcwm6yZhhzFkLqhSoK82MR0PVxpV
         SmRXlFfRq8f4JMoKGNwoltsal/Tf/Bv/8fbuXIU13Y6oeF07QEVmuK6mNQJ1IS8urF+A
         t0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=q4ZMYmBcDBfZ3/eKhJPvc8UL2Mx5kdXJ4d7Xvr4DvUY=;
        b=FA16F4bO/+tVwprAdyb2oQTzooQRMxEeXREvF/Q5h0n3S39p5wwIVYUUJX1OnCtthH
         0WGgZbEOw0VSsFpHNctCea9GS57dIfTlAdVzKMZRlQlcc5cMU1aO6RJKepNHloq8I7Gw
         6VALvAO2Se4EIoatCCD7/0HplbyR3IL/iXCAeq3KuCeLZZqxuxAcas0S0PwzcZzvBK62
         MhOKN+N7HpQvIaxUbp4KGir3eoOXjdEokOl+2ffkdf78WHfjbyKV8hPNoPV1p0bnyynw
         h2yAO4z/CvTjHVVeu7tKWSsPpcZVyINPpIN3V8i2TrSXsYM6GeYGEf1UOfB4+gOHIotG
         PQZQ==
X-Gm-Message-State: AGi0PuYnICa5cKzy+ezeVzM9Vg0bxKYHXEJtKHmz4M0LPg+WqtOgnOCl
        fVHNdwN4da+NfUYUUEvKoset1DhtL8UwKys=
X-Google-Smtp-Source: APiQypL0Vn5cplei/vqShyJo71u2PrrvdfFxnXkPwm+A/1r+1xEltM5Wv4/QfJ8XSc9zgYbwYXbLn7ONiaEq75A=
X-Received: by 2002:a17:90b:388e:: with SMTP id mu14mr361788pjb.122.1585781528023;
 Wed, 01 Apr 2020 15:52:08 -0700 (PDT)
Date:   Wed,  1 Apr 2020 15:52:03 -0700
Message-Id: <20200401225203.163155-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH v1] of: property: Add device link support for extcon
From:   Saravana Kannan <saravanak@google.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Saravana Kannan <saravanak@google.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>, kernel-team@android.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add support for creating device links out of more DT properties.

Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index b4916dcc9e72..252e4f600155 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1206,6 +1206,7 @@ DEFINE_SIMPLE_PROP(interrupt_parent, "interrupt-parent", NULL)
 DEFINE_SIMPLE_PROP(dmas, "dmas", "#dma-cells")
 DEFINE_SIMPLE_PROP(power_domains, "power-domains", "#power-domain-cells")
 DEFINE_SIMPLE_PROP(hwlocks, "hwlocks", "#hwlock-cells")
+DEFINE_SIMPLE_PROP(extcon, "extcon", NULL)
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")
@@ -1230,6 +1231,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_dmas, },
 	{ .parse_prop = parse_power_domains, },
 	{ .parse_prop = parse_hwlocks, },
+	{ .parse_prop = parse_extcon, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.26.0.rc2.310.g2932bb562d-goog

