Return-Path: <SRS0=d5cD=3G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5B5C33CB1
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 16:43:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ECEF9217F4
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 16:43:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com header.b="hDmTmSeG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgAQQnt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jan 2020 11:43:49 -0500
Received: from mail-ed1-f54.google.com ([209.85.208.54]:37920 "EHLO
        mail-ed1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgAQQnt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jan 2020 11:43:49 -0500
Received: by mail-ed1-f54.google.com with SMTP id i16so22842784edr.5
        for <devicetree@vger.kernel.org>; Fri, 17 Jan 2020 08:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=essensium.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tEv3CQeWt5hgTO0fdyyZhcvyQnL+294XMDPWLhPD0R4=;
        b=hDmTmSeGz2AEdx2fauiQrkNs/vfYmqXUd6vAQpGvQL6aQIssTqCtwRKhDg3Z+UclUN
         mEGuyAoqb1GD8AKuVkDua7bAuUWXyTz6dild8D1VsN9kAC2h5oml0r97KYMVstotWxZm
         7bqoAuy7YAspCTGECzK/781du1Z69kyzJQ8BxNe/p43Y7EfLiJUhofA7yQdyiY8o0Xew
         8ffP2RZboZO94zKS3LMf2nsmqYO6OWr/G38PTtrzP860bRc0TQP/sjaZgivocuXV6kZz
         J3QXABMd3sVzqoEhWrJ2/kIRC14Oo2TXq5ZMVBJNUUPVDDcu7KgN6qrWMRAS2en9vJoC
         jt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tEv3CQeWt5hgTO0fdyyZhcvyQnL+294XMDPWLhPD0R4=;
        b=GPjqKLs40XS46CSxyG+uYCT7Q/J9i5NNGOgWZws3Z9LREHYxwRtlfo7ED5ygL1bUmh
         esfGfaREqZhjDb3MjhlswdaqkoK2Zy0z9I/ZYqWO0bv3u3O4S0jzKhyXRnncQRUHMueN
         dziG5eytd7ehINXgsPGW53Q86NziyZRxSK0EBYKP9J+7iB3flnFaJD8idXfZcCCXXUg8
         3YmlW+pT4fKwrIAbiVMiINjrKEW2xbSUMCGvCIqz8kL7XU8IoLPSLmPRz6B1gEFjPbqW
         Zf2iDPSDP5ef1MD+LWBNzF/itygaBYKvPeEF0KMx0adzZ23FwJ3YgD1CUuP4a9rkgtZC
         pgiQ==
X-Gm-Message-State: APjAAAWWn5Khcdtxphxdr1zMfhDHQqf7D+55BmxYMxwFc5I8hHdhxEKY
        apiHvwO5fi8lpgpt4HFSr2XkOQ==
X-Google-Smtp-Source: APXvYqyakRpTIi59mOROuo3NU+eFqkh+xuVDpfObMLe+BjR9X4R6Ly0Vz2pXLAr2oOFCxUThCmh9ng==
X-Received: by 2002:aa7:db04:: with SMTP id t4mr4655603eds.122.1579279427334;
        Fri, 17 Jan 2020 08:43:47 -0800 (PST)
Received: from localhost.localdomain (10.20-136-217.adsl-dyn.isp.belgacom.be. [217.136.20.10])
        by smtp.googlemail.com with ESMTPSA id b4sm868622ejb.37.2020.01.17.08.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 08:43:46 -0800 (PST)
From:   Charles-Antoine Couret <charles-antoine.couret@essensium.com>
To:     alsa-devel@alsa-project.org
Cc:     Charles-Antoine Couret <charles-antoine.couret@essensium.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] ASoC: tas5756m: Add DT binding document
Date:   Fri, 17 Jan 2020 17:43:31 +0100
Message-Id: <20200117164331.87442-2-charles-antoine.couret@essensium.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117164331.87442-1-charles-antoine.couret@essensium.com>
References: <20200117164331.87442-1-charles-antoine.couret@essensium.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Document the bindings for the tas5756m driver.
---
 .../devicetree/bindings/sound/tas5756m.txt    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/tas5756m.txt

diff --git a/Documentation/devicetree/bindings/sound/tas5756m.txt b/Documentation/devicetree/bindings/sound/tas5756m.txt
new file mode 100644
index 000000000000..293eaf20d008
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tas5756m.txt
@@ -0,0 +1,25 @@
+TAS5756M audio CODEC
+
+Required properties:
+
+  - compatible: should be one of the following:
+    - "ti,tas5756m"
+    - "ti,tas5754m"
+  - reg: the I2C address of the device for I2C.
+
+Optional properties:
+
+  - mute-gpio : GPIO wired to the mute pin.
+  - hybridflow : an integer between 1 and 9 to select the HybridFlow program.
+      if not supplied default DSP program is used.
+
+Example:
+
+	tas5756m: tas5756m@4c {
+		compatible = "ti,tas5756m";
+		reg = <0x4c>;
+		#sound-dai-cells = <0>;
+
+		hybridflow = <6>;
+		mute-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
+	};
-- 
2.24.1

