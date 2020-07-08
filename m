Return-Path: <SRS0=Vyee=AT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22C8C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 13:15:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82FF12078C
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 13:15:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MWS3+plU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729455AbgGHNPe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jul 2020 09:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729448AbgGHNPd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jul 2020 09:15:33 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B24CC08E6DC
        for <devicetree@vger.kernel.org>; Wed,  8 Jul 2020 06:15:33 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id f16so1186391pjt.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2020 06:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TkaB98nQDQAZj54VpdleIAAukarhv3l749JNi1B5PxQ=;
        b=MWS3+plUn1olq+Vl0HSnSx9XuX4+qccQPmHePb7EJ1x/+hpS5X72De+w9gp5zePmi2
         uEBEj8+vpc2d0ZmfNZEu1tR3fmnZhOyjMH+CGfPikEuRleWqZSsb83T8bG1JmRTOj3PC
         OUlziPQqB9o29Ey6JIKiRDbMkEZU02veExKlAElj9QyWRc2DhuVCqfHXzwH4JqS1Uzv7
         XVI+mgUKRw4/U7uBudtvva9dc2A9QC6hak0Shp8idznMrB8p4oHtrXgztaxFurPnbKek
         tx1HungF0YCw9Q6kraf4iK64nLxrK7mltzcVpd95MsBgh093XGC8AlO3r8IautX/orHp
         +aSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TkaB98nQDQAZj54VpdleIAAukarhv3l749JNi1B5PxQ=;
        b=olCJ8+eM06q7fB3Il5FjykLKBYcLIcunLaMjm+rddU2OGLElCCAmEwte2Tybrxm0Hh
         bxZtKLCl2Mt6LqDQGyOdTvcBf+eoTOwSJQ/2bHrlH3LHIfAGDJmvjZWH7ay3GHeYKUXz
         t3Npk3rI2p6vQt8G8fsf9ne/HF5l2ubkgFyqLohBGNjEipzAyeiNTq+t74LJjgqMryHT
         4BF82sTBIKTqWoOWbsXSbwOQuIXwolr5ODfREpoSx2vAp46Qm9MOxoOxKG1JGnshGOhl
         FCv4fECCrg0DNBCVj1+x485OhmQtKr+d5qIfgPT++LTI4VR3YvbltlZq3TidyXABF5uD
         RxBQ==
X-Gm-Message-State: AOAM533POJpgXQ6PKoUhdzjXeqkMxnCKNKon++uFVEsQHvEvDPiBSUdK
        oY3xX8CM5Cva6XCxNzAxGBRQvQ==
X-Google-Smtp-Source: ABdhPJySUm0xfOTXmzrFgBr8CFij0vt7Ulz8YKPVEAGa5Pv1sa2H7kaBEkbqYnBp9p21gKkAyuCYLw==
X-Received: by 2002:a17:902:bd97:: with SMTP id q23mr46309205pls.251.1594214133211;
        Wed, 08 Jul 2020 06:15:33 -0700 (PDT)
Received: from debian.flets-east.jp ([2400:2411:502:a100:c84b:19e2:9b53:48bb])
        by smtp.gmail.com with ESMTPSA id y63sm4096366pgb.49.2020.07.08.06.15.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jul 2020 06:15:32 -0700 (PDT)
From:   Masahisa Kojima <masahisa.kojima@linaro.org>
To:     linux-kernel@vger.kernel.org
Cc:     masahisa.kojima@linaro.org, jarkko.sakkinen@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
        devicetree@vger.kernel.org, linux-integrity@vger.kernel.org,
        peterhuewe@gmx.de, jgg@ziepe.ca, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 2/2] dt-bindings: Add SynQucer TPM MMIO as a trivial device
Date:   Wed,  8 Jul 2020 22:14:24 +0900
Message-Id: <20200708131424.18729-3-masahisa.kojima@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200708131424.18729-1-masahisa.kojima@linaro.org>
References: <20200708131424.18729-1-masahisa.kojima@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a compatible string for the SynQuacer TPM to the binding for a
TPM exposed via a memory mapped TIS frame. The MMIO window behaves
slightly differently on this hardware, so it requires its own
identifier.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Masahisa Kojima <masahisa.kojima@linaro.org>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 4165352a590a..814148939e5a 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -328,6 +328,8 @@ properties:
           - silabs,si7020
             # Skyworks SKY81452: Six-Channel White LED Driver with Touch Panel Bias Supply
           - skyworks,sky81452
+            # Socionext SynQuacer TPM MMIO module
+          - socionext,synquacer-tpm-mmio
             # i2c serial eeprom  (24cxx)
           - st,24c256
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
-- 
2.20.1

