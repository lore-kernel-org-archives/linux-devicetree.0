Return-Path: <SRS0=+eHa=B3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3791CC433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 10:21:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EFC12078A
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 10:21:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4GqF5NO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgHQKVc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Aug 2020 06:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgHQKVb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 17 Aug 2020 06:21:31 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7B0C061389
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2020 03:21:31 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ep8so7476817pjb.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2020 03:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xpoWiliSmrbipqeuKM+mM8kPpOwLpaoBEFDiLq2xgJY=;
        b=l4GqF5NOjVIChV2FDW6BmD8k8kUchapti9+rFjvlEp+PqHsX6f+jgFW6i6vQ214Wla
         AdGDGjdfHFzS1L4pveUXQaeqGmM0VztRVUklZK1zb4f8VCJ1IFyqnqtJBmQtzRvlGhSP
         2U3d0o013kf91U+VkcBzK4kz0h2z8pHzilaH4PRbbK68/1yXdq4UXS8lfxZ3E6v+Q9mE
         X//mAFOksJ/IdUS+q2vKX7LgtFmxTm3Cn6uipedKtxX1OhqM8taYuO9IFOBBO/xqk0ga
         NmsbMgRKkvLi3VgqMHbVu4XHxDglJHTG51m8tZxKE9b/RAPffr2I7CMZSo+wt8qX6VqH
         +9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xpoWiliSmrbipqeuKM+mM8kPpOwLpaoBEFDiLq2xgJY=;
        b=DkXnCwzbeOYQqv3dddfB36gFMI4HpmlRcxoNvVodT7yW7mKDACxDYG7/031t+nywe4
         ly87juUlyyb4w7GJyYCThLbzopdO0FoDkum5HvHV6j6mnc2FzRJCq4nWJCX0fxBZDcH4
         waAKI2itMsjRfL3YWuRC9VqgRbE8F+UWkxV8vZVc2/b0aKBSqTa2BLbZEKD8T1GyUF6W
         A58KeoxfyDONTcguW3pwPr3CKN7h9CnJf+YQfYDgEVg7txdhLFym9ruKwV9VLq0poBAl
         shyUzHHOKfT7IGkozFKa3CU34DmbzK4KOO8JdRpwuKL6EFglJydOeE4O8jTI1GDIasHe
         V+BA==
X-Gm-Message-State: AOAM533X4VYm05vLhATN+4BAGOFjYt2wcA8LNkladnIjaj1h4D2lcTPn
        Fu9feQf/jQ/EBGtwxhjjFrow5YY4EME=
X-Google-Smtp-Source: ABdhPJwZ8okcl7vz61PX8StuiQt4c10YNQqMN7HUFBmEFtzsUgfR/OjElvgZy+MCCRQRH7sZ7g4K5g==
X-Received: by 2002:a17:90a:4e42:: with SMTP id t2mr11723381pjl.121.1597659690866;
        Mon, 17 Aug 2020 03:21:30 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.137])
        by smtp.gmail.com with ESMTPSA id l67sm16773206pga.41.2020.08.17.03.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 03:21:30 -0700 (PDT)
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
Subject: [PATCH v2 0/3] Enable RTC on Odroid N2
Date:   Mon, 17 Aug 2020 10:21:19 +0000
Message-Id: <20200817102122.434-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Inorder for test suspend/resume feature on Odroid N2
we need to enable RTC module on this device.

Changes v2
Fix the missing INT pinctrl for RTC.

Note: Now the rtcwake feature works occordingly,
But after resume I have observed a Kernel Opps
Hope some body able to repoduce this.

-Anand Moon

Anand Moon (3):
  arm64: dts: meson-g12b-odroid-n2: Enable RTC controller node
  arm64: dts: meson-g12b-odroid-n2: Disable virtual RTC driver
  arm64: defconfig: Enable RTC devices for Amlogic boards

 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts   | 17 +++++++++++++++++
 arch/arm64/configs/defconfig                    |  1 +
 2 files changed, 18 insertions(+)

-- 
2.28.0

