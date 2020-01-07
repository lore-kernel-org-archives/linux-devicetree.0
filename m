Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8081EC33C99
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 09:29:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A979206DB
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 09:29:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZJhcPv9V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbgAGJ36 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 04:29:58 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33338 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727167AbgAGJ36 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 04:29:58 -0500
Received: by mail-wr1-f66.google.com with SMTP id b6so53136367wrq.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 01:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=ZhKekxLTP92RphP15HP22YKK/XHkNOZwqR3Bm0RWNn4=;
        b=ZJhcPv9VdZ/7VIGypWEKwM5EncUxXp0fNe+4lYsmyU2Qk/MlORWzXDCDpxYwo/f8c5
         nWI1WyE1jWYp1JRiQ5XcqZMB7lirXbLDe+NJQSrfFpLQgyqjU7wmB8o3qTDtJkUrdPoA
         6Oc+IcB4gUH0jIpPkhx+4Ewbd5S0UfrpTA1iWpAsv058Buk1FKKxfIof+Fqf/zslP+yu
         u3mw0lfzhZdZkbBfw4Yf4PtDoCvBDckD5etJlXfebZIepenqHlVSy+W2OVFnKDKQFUCP
         y7HgQzbrwCmrTA5Om423DjuyBs6dRNz4JxViQtkE5o4qphLd0gwGlZbjfK6t5p9D8qe8
         PYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZhKekxLTP92RphP15HP22YKK/XHkNOZwqR3Bm0RWNn4=;
        b=XMVl52N47F0mRfgDjswsM5DiAvJITEAq9FlopT/ey9ksYEKYbXaihyAOOatkBglp8C
         MWQ6JjzUlBUCe+EoYRz57c6h7VOuI3MtDlP7lfaiXgxY35mlC6R0NGPiu9SqeGAAJ/K3
         TWlFHvmiBAPeQzK2/w7qUwCWJhxarhxLL2m8B/4wCr3xiV7qgDe1MQA5KPfdkD67QYfW
         3Qslzw7Cnbnn1Kp2vkD9rXMKlJsLj2t9AuqqUKxhRyZx60anjeEYx8l4Vx4uxnirEfnr
         yGYMAx9gqwF75LXyQ6IVoQUsSK6SCGkER8HnczF1DTTPDxqi3EyuR6SS8VUht/pZC+B+
         ID+Q==
X-Gm-Message-State: APjAAAU+jafoLuHhB807HXa9iCOHwtZgzkq0RGQSYYWncioyWflm/yL5
        cVHVqrvkA9lmKxku71vjSqUDuw==
X-Google-Smtp-Source: APXvYqyBJgLVBMFmDPjle8pjsXE/Ihg1UOVL/twyltX1BaSO63tN2499JJk0LQeLW1FMO53qx3nADw==
X-Received: by 2002:adf:a141:: with SMTP id r1mr109570212wrr.285.1578389396079;
        Tue, 07 Jan 2020 01:29:56 -0800 (PST)
Received: from localhost.localdomain (i16-les01-ntr-213-44-229-207.sfr.lns.abo.bbox.fr. [213.44.229.207])
        by smtp.googlemail.com with ESMTPSA id x14sm25959969wmj.42.2020.01.07.01.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 01:29:55 -0800 (PST)
From:   Khouloud Touil <ktouil@baylibre.com>
To:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org,
        Khouloud Touil <ktouil@baylibre.com>
Subject: [PATCH v4 0/5] at24: move write-protect pin handling to nvmem core
Date:   Tue,  7 Jan 2020 10:29:17 +0100
Message-Id: <20200107092922.18408-1-ktouil@baylibre.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The write-protect pin handling looks like a standard property that
could benefit other users if available in the core nvmem framework.

Instead of modifying all the drivers to check this pin, make the
nvmem subsystem check if the write-protect GPIO being passed
through the nvmem_config or defined in the device tree and pull it
low whenever writing to the memory.

This patchset:

- adds support for the write-protect pin split into two parts.
The first patch modifies modifies the relevant binding document,
while the second modifies the nvmem code to pull the write-protect
GPIO low (if present) during write operations.

- removes support for the write-protect pin split into two parts.
The first patch modifies the relevant binding document to make the
wp-gpio a reference to the property defined by nvmem , while the
second removes the relevant code in the at24 driver.

- adds reference in the at25 binding document for the wp-gpios property
as it uses nvmem subsystem.

Changes since v1:
-Add an explenation on how the wp-gpios works
-Keep reference to the wp-gpios in the at24 binding

Changes since v2:
-Use the flag GPIO_ACTIVE_HIGH instead of 0

Changes since v3:
-Keep the example of the wp-gpios in the at25 bindings
-Add reference for the wp-gpios property in the at25 binding


Khouloud Touil (5):
  dt-bindings: nvmem: new optional property wp-gpios
  nvmem: add support for the write-protect pin
  dt-bindings: at24: make wp-gpios a reference to the property defined
    by nvmem
  dt-bindings: at25: add reference for the wp-gpios property
  eeprom: at24: remove the write-protect pin support

 .../devicetree/bindings/eeprom/at24.yaml      |  5 +----
 .../devicetree/bindings/eeprom/at25.txt       |  2 ++
 .../devicetree/bindings/nvmem/nvmem.yaml      | 11 +++++++++++
 drivers/misc/eeprom/at24.c                    |  9 ---------
 drivers/nvmem/core.c                          | 19 +++++++++++++++++--
 drivers/nvmem/nvmem.h                         |  2 ++
 include/linux/nvmem-provider.h                |  3 +++
 7 files changed, 36 insertions(+), 15 deletions(-)

-- 
2.17.1

