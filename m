Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D750CA9EB0
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 03:01:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D47DF2245A
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 03:01:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jcm/Vieo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfJUDBn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 20 Oct 2019 23:01:43 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34702 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbfJUDBm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 20 Oct 2019 23:01:42 -0400
Received: by mail-pf1-f196.google.com with SMTP id b128so7480012pfa.1
        for <devicetree@vger.kernel.org>; Sun, 20 Oct 2019 20:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=53GjbEy/nsPj+4UEc+uvGOL1TBk0D0nk1iUE+20TlKo=;
        b=jcm/VieopYgxtYS44oxFj6QgkwNgRXoXDTSmNvVG7GYL7CqOJ9EESOt1eUJ9rfyiQz
         u+DmFP12HNUibIvRphyXYTuW15zFiJDmuj7+Y/huM9rW4T1MaGlvGoosHIRr+awSP2Tj
         /fbqImVbpaRMLpluTsKT2KWo168wQwK/sO8CE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=53GjbEy/nsPj+4UEc+uvGOL1TBk0D0nk1iUE+20TlKo=;
        b=j4PFF3G88O5ccNIRu3j6ytWrZ9WlfhfciQpEYKkzS0Zye4lqqdYAHBpq4KJDDR88vt
         mwHq+63+nPI4dk9HpsnrYUvpP4OziB9vEj0gpzNkKfljKwdneSr3yNDf3sSbr3i12kp3
         5diqt1hEPcuLJMmfwSsS7mfjBPoVNDKNUTb2/uUy5gx0pbjCGXwf29bB8KTy2w77tpeC
         GKdAEbuO/pKtY693m9yGRtXMLqHPj3lz4qs5KuXsbbu5Ii5uYozWy9WWyyBW2SET/V0V
         QIOK56nZsCl3rcxWj/jR3S0RG+f0NJa4RaCCRIdnGhWtIT/PxUdkLEqTEIHC+5Ew7MH5
         8GSw==
X-Gm-Message-State: APjAAAVH6VrExSl2qhe/WXjz1z2x719LDBoZ86XanrXtGDSvG7rY6krV
        iyFFx3wRtt9Dhkq+zZ1PTx9u9g==
X-Google-Smtp-Source: APXvYqxdAfBbfcbPnqcsZB+p1eFJqDEHK32FefwfhQ4gjfvT96ZE0PIyAnNC8G0GY4izGWXS5lR0Ag==
X-Received: by 2002:a17:90a:17e1:: with SMTP id q88mr26087406pja.134.1571626900517;
        Sun, 20 Oct 2019 20:01:40 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id c1sm17134623pfb.135.2019.10.20.20.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 20:01:39 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        Nicolas Boitchat <drinkcat@chromium.org>,
        Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH v2 0/2] HID: google: add device tree bindings for
Date:   Mon, 21 Oct 2019 11:00:52 +0800
Message-Id: <20191021030051.32199-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

DT bindings for Whiskers swich device and its documentation.

v2 has no changes from v1, but
* dropped a patch not relevant to DT bindings
* Add more recipients (add devicetree@ and robh+dt@)

Ikjoon Jang (2):
  dt-bindings: input: Add DT bindings for Whiskers switch
  HID: google: Add of_match table to Whiskers switch device.

 .../devicetree/bindings/input/cros-cbas.yaml  | 25 +++++++++++++++++++
 drivers/hid/hid-google-hammer.c               | 10 ++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/cros-cbas.yaml

-- 
2.23.0.866.gb869b98d4c-goog

