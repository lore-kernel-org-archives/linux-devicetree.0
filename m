Return-Path: <SRS0=Nmyu=5B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937E6C0044D
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 09:00:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6ABA720658
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 09:00:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I4MVl719"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730204AbgCPJAc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Mar 2020 05:00:32 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36476 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730152AbgCPJAb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Mar 2020 05:00:31 -0400
Received: by mail-pl1-f195.google.com with SMTP id g2so5198419plo.3
        for <devicetree@vger.kernel.org>; Mon, 16 Mar 2020 02:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QZ7hDgG7xaUMBSl15kgzbILgCIelqn1XdtcbiGvErdo=;
        b=I4MVl719v08NW4ohcPKEQmf1U2ZUlSIR669LIJDZZCoZorRBCfHvvJvqq9SDBunBtM
         mBOMJk9Xd1LyAK8FKko6RK80vczEHl/D7HPdrxICnnPSRa/sRUKDaENUpKD8udCHpaSn
         +seVeRGvHcFoJS7Ad1zDsCh67l3H36sLX/oeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QZ7hDgG7xaUMBSl15kgzbILgCIelqn1XdtcbiGvErdo=;
        b=ZcmopER/Xre5tBfQycPdQpmJXGlQtCTP//zoSv9tcfRgORH2pZt5xQhWMvJT1qZlL0
         w6YBslAFyp7TnDC0tfHkDgSLFzVGKPgY0qMHuoTWheJeUOcagIHSYQgpNXSrxDDpBdJU
         7aV40xHq5KpfyRspC8lYnqgYqEnUOR5B/qZJRrLZybIxLDLBf36JVMcdNspZtUcDGVH8
         WAXFXhm1lUcu6h/X7tps3V4MaFtPA+1y8rWjJ0cy+/Rm9IQk7prT1cbl29m+FvrCp8Ao
         x83NCjUq47AnY8CGu5WRgQtuMmaQMVi8l/sm3xYGPj9zn5yPtwOqdN+FMLOl01CVjBho
         5WRQ==
X-Gm-Message-State: ANhLgQ3aZgW4y07oZw9UDd1E+5dzjgC2qWyADmsocq1CJ3juVzWbYaj7
        VOPL28nx6BbmUducXgdaUZUO5g==
X-Google-Smtp-Source: ADFU+vuvXlvegJAMxrnQ5HpySf4UCCZnv+xOf3E95nOR9fmoH/44E05gxBq61/j9B19Jt7HmZv9BNw==
X-Received: by 2002:a17:902:eacb:: with SMTP id p11mr26005911pld.39.1584349230937;
        Mon, 16 Mar 2020 02:00:30 -0700 (PDT)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id d3sm65040080pfn.113.2020.03.16.02.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 02:00:30 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 0/4] platform/chrome: Add Type C connector class driver
Date:   Mon, 16 Mar 2020 02:00:13 -0700
Message-Id: <20200316090021.52148-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The following series introduces a Type C port driver for Chrome OS
devices that have an EC (Embedded Controller). It derives port
information from ACPI or DT entries. This patch series adds basic
support, including registering ports, and setting certain basic
attributes.

v4: https://lkml.org/lkml/2020/3/12/1120
v3: https://lkml.org/lkml/2020/2/19/1230
v2: https://lkml.org/lkml/2020/2/7/646
v1: https://lkml.org/lkml/2020/2/5/676

Changes in v5:
- Updated DT binding license identifier.
- Updated DT binding to have full example.
- Added missing Reviewed-by tag to Patch 2/4.

Prashant Malani (4):
  dt-bindings: Add cros-ec Type C port driver
  platform/chrome: Add Type C connector class driver
  platform/chrome: typec: Get PD_CONTROL cmd version
  platform/chrome: typec: Update port info from EC

 .../bindings/chrome/google,cros-ec-typec.yaml |  54 +++
 drivers/platform/chrome/Kconfig               |  11 +
 drivers/platform/chrome/Makefile              |   1 +
 drivers/platform/chrome/cros_ec_typec.c       | 357 ++++++++++++++++++
 4 files changed, 423 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
 create mode 100644 drivers/platform/chrome/cros_ec_typec.c

-- 
2.25.1.481.gfbce0eb801-goog

