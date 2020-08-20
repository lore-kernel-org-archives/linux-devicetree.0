Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B56C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 12:14:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27BFB207BB
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 12:14:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kecqFKVD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730308AbgHTMNf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Aug 2020 08:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730141AbgHTMNc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Aug 2020 08:13:32 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29225C061386
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2020 05:13:32 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id h2so960791plr.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2020 05:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2doVaeqHMIq6t5euMsS8lD+HylC+Pn28RLN5whjYgmM=;
        b=kecqFKVD+AL538Wpa8QOeSpjP0b4QE3rnhDNMJeEa05G98KrWR0dQkqpldBVRM+zQl
         wFjYLLkU+ICC9rBbV7GCFLACH9i0Wg3TIYaacfhi4m2KD1bRID/MgEpsnU6N1gIgnL68
         y+NG+JGyCft7oTd0YfkRlDJSSasQ3KEIa/UaYCNfT6azmUIvZPPoMhtzriPhfYJNbPef
         YtKJ1HRFn9ijb2FE6L7hDS4vqRdKGFMCOd1iv39sUfa7DXD7S8VWKw7k5GoyypJRhic2
         nzvyJX/CqzX2VgUH76CQNaYBJpbDf+RGrIWoxt7MY/h+vRm/Q4NbFuR6vWYyfGjAxnRV
         OrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2doVaeqHMIq6t5euMsS8lD+HylC+Pn28RLN5whjYgmM=;
        b=ZN+FoT64xjsHdp+IbXCp3vlfb54VgDwYFqabOLkchisQda3xulhG7ssI4Ii5FYQPr5
         uOJ7MpQ7SZ+ajgp7C1DTpUpzE/0H50JpMYjrBr+eWEPqY9SqzYdPGJ3TVblvzWZ5xT3t
         MS+DYK61YXqhWZKZir9rR+UBnKXFjCyAXQO8KwsEz4zQ3LF9GoGSUiYKwRA6smU3wk9p
         O/7cSNnESCJ/kYc2U/mBls05+RTq26AAo/ZkJ6A0Vlsym/UkrRb5LCFh0mui05cLzv38
         F9LkW57lQ/aFa7UfQKA5zmx0kpwXQukKmABGMJFvgGcQw9ndWVCoLnnHSc66xeZEWOqs
         t+iQ==
X-Gm-Message-State: AOAM530zHKyCqRi+kl0XVcurwhz2/IDmPMpDBBEK5Pf0U3qEVso39O2b
        JfQNVwwgcxkAZ4T2K/AdNKjN1uHe7GY=
X-Google-Smtp-Source: ABdhPJzgUWn6iNqf1YNd6Nz1hgdV1NAP4WZDvIpStKf8rWEuXtpr1RrAWUlFBOD7GEibXYQyKvZYkQ==
X-Received: by 2002:a17:90a:3b09:: with SMTP id d9mr2441229pjc.210.1597925611491;
        Thu, 20 Aug 2020 05:13:31 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.137])
        by smtp.gmail.com with ESMTPSA id p20sm1985937pjg.44.2020.08.20.05.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 05:13:31 -0700 (PDT)
From:   Anand Moon <linux.amoon@gmail.com>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>,
        Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v3 0/2]Enable RTC on Odroid N2
Date:   Thu, 20 Aug 2020 17:43:21 +0530
Message-Id: <20200820121323.564-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Inorder for test suspend/resume feature on Odroid N2
we need to enable RTC module on this device.

Changes v3
Drop the patch disable on VRTC driver.
Drop the INT pinctrl for RTC - not required for I2C.
Add the alias for RTC nodes.

Changes v2
Fix the missing INT pinctrl for RTC.

Note: Now the rtcwake feature works occordingly,
But after resume I have observed a Kernel Opps
Hope some body able to repoduce this.

-Anand Moon

Anand Moon (2):
  arm64: dts: meson-g12b-odroid-n2: Enable RTC controller node
  arm64: defconfig: Enable RTC devices for Amlogic boards

 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts      | 14 ++++++++++++++
 arch/arm64/configs/defconfig                       |  1 +
 2 files changed, 15 insertions(+)

-- 
2.28.0

