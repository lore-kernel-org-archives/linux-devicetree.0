Return-Path: <SRS0=Evye=3H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF23C33CB1
	for <linux-devicetree@archiver.kernel.org>; Sat, 18 Jan 2020 09:23:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5847621D56
	for <linux-devicetree@archiver.kernel.org>; Sat, 18 Jan 2020 09:23:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com header.b="SMUce4J8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgARJX1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 18 Jan 2020 04:23:27 -0500
Received: from mail-ed1-f49.google.com ([209.85.208.49]:37071 "EHLO
        mail-ed1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbgARJX1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 18 Jan 2020 04:23:27 -0500
Received: by mail-ed1-f49.google.com with SMTP id cy15so24650197edb.4
        for <devicetree@vger.kernel.org>; Sat, 18 Jan 2020 01:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=essensium.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tEv3CQeWt5hgTO0fdyyZhcvyQnL+294XMDPWLhPD0R4=;
        b=SMUce4J8PyOnFUcMTF2ulvGT7HqcEyboIZ3KRX7jYrCBEgNZz+iFoIlg4VsZa6SyMc
         086ujzTghpMkQffnqvRdTAFDcGjL7QJQobuR1yAQqvgiBrnxbdfCjT/ImBMSz6Jy1yUj
         ziYtTh3HDbM2B0CIiIFQdk7BitRo/ldAfzU5WO0ANJRbU4qHSNfl81Sp//EBvjhyQdWe
         JKOyR7AWS/h5ON/7JIwjPVsZkRN3gWjhxKFvzD9eX5mNTIQ/bGwljs6Mc6UCN3MVHEua
         6gLQxK425u4sX1X1OLOH5L28vGlWgYt9fQh1YAoerrWGXHnYertUyBepmLVynHWmo21I
         Fsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tEv3CQeWt5hgTO0fdyyZhcvyQnL+294XMDPWLhPD0R4=;
        b=Li0xZNbM2E3Uc2dP0Qf+2THvfdzsTsFESEO7q1Nh+MyYRm1OnpRnRtzZb2Ie/Us6gB
         h+tcCjOx1mCIxgvkWDdwYh35dvd7+9lR76CyoessI6oP1IHxUfLaga3AGlRtQi5aGVHZ
         U/bxh/N+bjlBHUVEvlaZ6HJEpEuCWgZgZKYirwCzbaXLvUElrAL+28ebqifapMf/cPpS
         iKfXHAjBH+aDfwgW1F+yooj56uBDcEbDYsROU+R+s2Jj7cC7mDX8tD9/X+eC07uFKXRA
         PSwIGISLf37MSM1JF14htUARj0gMw83HTtZSK6C9s9aBVEdDzfIoRG9E9/F5MMGVqzB9
         fZdw==
X-Gm-Message-State: APjAAAXPw/6LPNj+xn+vVfkt7aeRKyoy4/NOeJBsBtqYovpiN6tI6BJP
        qyrcWyO9Lj3NMRqpkq3n1bxGfQ==
X-Google-Smtp-Source: APXvYqx9Kth68jmU6ZU3PMNsEVaG87MpswBkVRsp/aKO6HUfEFpig+CaMPfYXrx4zig/ZT9lckSpTw==
X-Received: by 2002:a17:906:5586:: with SMTP id y6mr11686039ejp.336.1579339405582;
        Sat, 18 Jan 2020 01:23:25 -0800 (PST)
Received: from Abby.home (10.20-136-217.adsl-dyn.isp.belgacom.be. [217.136.20.10])
        by smtp.googlemail.com with ESMTPSA id s19sm1057402edr.55.2020.01.18.01.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 01:23:25 -0800 (PST)
From:   Charles-Antoine Couret <charles-antoine.couret@essensium.com>
To:     alsa-devel@alsa-project.org
Cc:     Charles-Antoine Couret <charles-antoine.couret@essensium.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] ASoC: tas5756m: Add DT binding document
Date:   Sat, 18 Jan 2020 10:23:15 +0100
Message-Id: <20200118092315.10384-2-charles-antoine.couret@essensium.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200118092315.10384-1-charles-antoine.couret@essensium.com>
References: <20200118092315.10384-1-charles-antoine.couret@essensium.com>
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

