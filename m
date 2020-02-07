Return-Path: <SRS0=EXmG=33=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36DCBC2BA83
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Feb 2020 20:38:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F3CB20838
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Feb 2020 20:38:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ebfLute2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbgBGUiE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 7 Feb 2020 15:38:04 -0500
Received: from mail-pj1-f49.google.com ([209.85.216.49]:35698 "EHLO
        mail-pj1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727005AbgBGUiE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 7 Feb 2020 15:38:04 -0500
Received: by mail-pj1-f49.google.com with SMTP id q39so1408843pjc.0
        for <devicetree@vger.kernel.org>; Fri, 07 Feb 2020 12:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ifCbiBJDktUTJhTkv9KSAGNf4cll4FIlR1vlR2WCup0=;
        b=ebfLute2BqyBNSLfR3/rTFEZ9Lk6VvKLon7hSktz5FbtUuroU4kw1HVg918t1ASWc7
         1VrAUpvhGqVUYciYlLyARi5kCxpQc5AN4QdSH3i2LH/WX+U2wnm3531IFn0HB6HT+769
         49PmXTNWg0jrtAg0Z34mvxgtr9Tqt3IDQac9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ifCbiBJDktUTJhTkv9KSAGNf4cll4FIlR1vlR2WCup0=;
        b=jwTDj5Pxc5N184wktJykw1u/HsMXo2M7VlFVXb1IuIS0TUvQRDlp0iRjTiZ3BKrrKM
         7IyVsn+MW0QUzqoYuwmjjDJfBN+8PUtKy5qmFdfo4SRlBF5788LQJDWAqqomOYvITRBn
         eiJbKCLhOlcJhV9t4LzN5Evfh2iOUypfTyvfpmiiPv/ZQ9FR6oPz26UGMLRxK/faxX4w
         43cUZXQzMcY6isSQZ5WlLikL4DMHFbRgD3xfEaYvZKn8H6/uVSGdTQSzZyoeQ9hBKDOi
         X7PoeCmNHuO0UDm+p5QgxXJaFFJFCVMj87RTF43e+Gj/w5h0rSwWDqnGbz7AqinAXCHy
         OIog==
X-Gm-Message-State: APjAAAVzn1WRNvsnqz1m2EdYNMvaLZTaLzu6z8iVAK7fY9fhztsVGaLq
        CPOH+BJdo6KdeeCza7E+m0F3LQ==
X-Google-Smtp-Source: APXvYqzk42NKqsohxngK4S9f5vG7B8djpKPCB3LdmBDlJ8WzumloON87AggSCNxJk0WZvSKUC0oGcg==
X-Received: by 2002:a17:90b:3115:: with SMTP id gc21mr5649351pjb.54.1581107882002;
        Fri, 07 Feb 2020 12:38:02 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:172e:4646:c089:ce59])
        by smtp.gmail.com with ESMTPSA id 4sm4051001pfn.90.2020.02.07.12.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 12:38:01 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     heikki.krogerus@intel.com, enric.balletbo@collabora.com,
        bleung@chromium.org, Prashant Malani <pmalani@chromium.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), Guenter Roeck <groeck@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/4] platform/chrome: Add Type C connector class driver
Date:   Fri,  7 Feb 2020 12:37:42 -0800
Message-Id: <20200207203752.209296-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The following series introduces a Type C port driver for Chrome OS devices
that have an EC (Embedded Controller). It derives port information from
ACPI or DT entries. This patch series adds basic support, including
registering ports, and setting certain basic attributes.

v1: https://lkml.org/lkml/2020/2/5/676

Changes in v2:
- Added DT bindings entry in Documentation.
- Fixed minor comments in cros_ec_typec.c driver file.
- Incorporated get_num_ports() code into probe() function.

Prashant Malani (4):
  dt-bindings: Add cros-ec Type C port driver
  platform/chrome: Add Type C connector class driver
  platform/chrome: typec: Get PD_CONTROL cmd version
  platform/chrome: typec: Update port info from EC

 .../bindings/chrome/google,cros-ec-typec.yaml |  77 ++++
 drivers/platform/chrome/Kconfig               |  11 +
 drivers/platform/chrome/Makefile              |   1 +
 drivers/platform/chrome/cros_ec_typec.c       | 337 ++++++++++++++++++
 4 files changed, 426 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
 create mode 100644 drivers/platform/chrome/cros_ec_typec.c

-- 
2.25.0.341.g760bfbb309-goog

