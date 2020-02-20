Return-Path: <SRS0=21hy=4I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E2CC11D01
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 05:53:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B55532465D
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 05:53:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dbj0y4eV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgBTFxD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Feb 2020 00:53:03 -0500
Received: from mail-pl1-f202.google.com ([209.85.214.202]:47937 "EHLO
        mail-pl1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgBTFxD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Feb 2020 00:53:03 -0500
Received: by mail-pl1-f202.google.com with SMTP id h3so1597671plt.14
        for <devicetree@vger.kernel.org>; Wed, 19 Feb 2020 21:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=nl3RPJB2d6ViIOhoDwVm0BTw7tW7NUBEzufzTKYpnXc=;
        b=Dbj0y4eVYaiMi34+H/DpZxxNGq3yaaZJnS0Yq38l9gcRHiVda9a5WsXKFIKSQjqoQu
         THNdBOaNyf+oQj9+WbX2eh4yQOPDxIndKfq1KX4pGr8JttKX4CtblHcI8vRdgdkE3wsF
         Y2Ns2Vt/6F5SN21lS4s7z7wM/3+tMVKXUkmHjJ8nIEXuIU0ZxjuCzQuxmePzf8RnSmNS
         qLPkgdrirOLrfY8tLQTdWApEjXhajKSAJWWYawLSkHKdtC+Um0ncRZW/OZ311rkctLLV
         Xr0yqw8sjObC5sqJYI4As8eA+qGJA5wmDTxQJKuLXmzG2V1kdTzjGL2jbtAr/0nhWf6A
         1iyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=nl3RPJB2d6ViIOhoDwVm0BTw7tW7NUBEzufzTKYpnXc=;
        b=H/XWqUdSuyM5754Qm1bWSwM7JkW9aUnDRmok1CTosUKsDGyTEHLHPGtzUAIgnrAIIO
         to5kra9lmLbtrVjJ/bnQLURkXeDaJ7ZnxdPuRoT39Xv0z/5WJ88cWXHhJFcKHpPGCntn
         F1oKixP4v4P2wGztqwT7XGD1dGMKnxn7eW/4unZo7W1g6QJkUxNV+ZlS3LNnHyNiyOVc
         Nuk2urMdLL6CYfwlT9e9kpRPJ22taTvI1rMyuqz+pWbItSApDjPilH3MmPEYbfHTtVZc
         qly7qtPuWMbP4vFhxzAurjJ56NDSNZIZdYYK8gYu3v187O4flcexFklkZG4oP8+x4xAy
         IxOg==
X-Gm-Message-State: APjAAAXNENIoMPSCCqs0v2ulhBH95MopeiwcGOzmGbUFIhs40Dhmkv7d
        ft0ujVfH6tz2iYlr+XEYUDoND+rRXWXLox4=
X-Google-Smtp-Source: APXvYqy4SHuUt+Wdi7Jk03QlHFri6nCdgrgM+tkdNH0KM2noC47Abc/IxlGKmTwrmbII4aBmMk0Ll+EJgyEH8o4=
X-Received: by 2002:a63:3c4b:: with SMTP id i11mr32426363pgn.123.1582177980998;
 Wed, 19 Feb 2020 21:53:00 -0800 (PST)
Date:   Wed, 19 Feb 2020 21:52:50 -0800
Message-Id: <20200220055250.196456-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v1] of: property: Add device link support for power-domains
 and hwlocks
From:   Saravana Kannan <saravanak@google.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Saravana Kannan <saravanak@google.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
        Todd Kjos <tkjos@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-pm@vger.kernel.org, kernel-team@android.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add support for creating device links out of more DT properties.

To: lkml <linux-kernel@vger.kernel.org>
To: John Stultz <john.stultz@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Kevin Hilman <khilman@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Len Brown <len.brown@intel.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-pm@vger.kernel.org
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/property.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index e851c57a15b0..d977c11decda 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1204,6 +1204,8 @@ DEFINE_SIMPLE_PROP(mboxes, "mboxes", "#mbox-cells")
 DEFINE_SIMPLE_PROP(io_channels, "io-channel", "#io-channel-cells")
 DEFINE_SIMPLE_PROP(interrupt_parent, "interrupt-parent", NULL)
 DEFINE_SIMPLE_PROP(dmas, "dmas", "#dma-cells")
+DEFINE_SIMPLE_PROP(power_domains, "power-domains", "#power-domain-cells")
+DEFINE_SIMPLE_PROP(hwlocks, "hwlocks", "#hwlock-cells")
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")
@@ -1226,6 +1228,8 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_io_channels, },
 	{ .parse_prop = parse_interrupt_parent, },
 	{ .parse_prop = parse_dmas, },
+	{ .parse_prop = parse_power_domains, },
+	{ .parse_prop = parse_hwlocks, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.25.0.265.gbab2e86ba0-goog

