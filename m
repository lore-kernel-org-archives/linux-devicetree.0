Return-Path: <SRS0=2gCm=5I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6704CC4332B
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 23:34:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F341206C3
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 23:34:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QbtMCVGG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbgCWXeO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Mar 2020 19:34:14 -0400
Received: from mail-ua1-f73.google.com ([209.85.222.73]:53631 "EHLO
        mail-ua1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbgCWXeO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Mar 2020 19:34:14 -0400
Received: by mail-ua1-f73.google.com with SMTP id 14so5625905ual.20
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2020 16:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=tXPEW76sKJjaPQGOZOimHJEP26LY2RMe5WtADrdJadU=;
        b=QbtMCVGGHfrzaPRSTOG6hYYZxOLOAJUOS7nSkIWYeuCBEGvFanrgs59bjGOXXPxZBJ
         bHAuvMI19M1Cl8fmZDd1Zl5BJSmfSmgYX7voMEM64BkT+OmECDkwOmb5kGuBbx326ZYV
         5Xad/Ole1WKEk3xofvjvHLRACG9gqI51bzRUCvXrL+4s3WuorbsJSEoncubX7m7qi6zJ
         oqDheiFmlN5YvzOMowlMkH99wT6l4OvlG+o9VPjh/glIu+slaTwYugVRK6WT45ZghgJX
         ePNxq4qTsD8RWuWw1KNJBVFK+USe9+6bexHrzChg7Mr2MCoGBx4kmV4Mg8whJaBF6qkZ
         YQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=tXPEW76sKJjaPQGOZOimHJEP26LY2RMe5WtADrdJadU=;
        b=g1APTL0+7A70t+mPpIirzG9vMNPXEWVBv7iprVSnIz4/fL6T3iwO89qM4Vn+jriINf
         uYnRB6urwylX/qPObEAN9NK9h6FFrPdT0s954DD28VlTofLOuSRoNLBX9SFqqe1pnKgL
         dWlgabHJtASD5b7Li6Q75nBnGRuDmyMuZdbOwMm2PLLMH/4f9YFqiomldZWuR0FXXBq4
         Wkjm7+EMkqb9e7ueaQpqkR/AAZ1UeCKAOUrRDMuHXrAiiB4i7swpQ1QLP2UjC+hDFl0u
         hgjYJ5jxJocP0Fmd/BQV2Axe/t8Qy+HMMYh2jpmHWCksXNIB/fEVACzEH9BKsXgNwCMW
         uJ9A==
X-Gm-Message-State: ANhLgQ1ofH5oY16bsyvBhUxv7/WRH3JIDkRjsBzSE7QlG/WeG6YSkj+K
        P51n0Wd3rxfnv+DQjpMkrlojyRI7Fg==
X-Google-Smtp-Source: ADFU+vuLxlD+2uO92bRrRaRHd0gjs4zp+jDXUXilAFiN/Eux1EFzVf5TdgZWCwGXv1Yhg1tiwl6PAvstYA==
X-Received: by 2002:ab0:698e:: with SMTP id t14mr16110287uaq.53.1585006453359;
 Mon, 23 Mar 2020 16:34:13 -0700 (PDT)
Date:   Mon, 23 Mar 2020 16:33:53 -0700
In-Reply-To: <20200323233354.239365-1-kunyi@google.com>
Message-Id: <20200323233354.239365-3-kunyi@google.com>
Mime-Version: 1.0
References: <20200323233354.239365-1-kunyi@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH linux hwmon-next v2 2/3] hwmon: (sbtsi) Add documentation
From:   Kun Yi <kunyi@google.com>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     Kun Yi <kunyi@google.com>, openbmc@lists.ozlabs.org,
        joel@jms.id.au, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Document the SB-TSI sensor interface driver.

Signed-off-by: Kun Yi <kunyi@google.com>
Change-Id: I4b086a124d1d94a516386b0d2ff1cd7180b1dac1
---
 Documentation/hwmon/sbtsi_temp.rst | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/hwmon/sbtsi_temp.rst

diff --git a/Documentation/hwmon/sbtsi_temp.rst b/Documentation/hwmon/sbtsi_temp.rst
new file mode 100644
index 000000000000..9f0f197c8aa2
--- /dev/null
+++ b/Documentation/hwmon/sbtsi_temp.rst
@@ -0,0 +1,40 @@
+Kernel driver sbtsi_temp
+==================
+
+Supported hardware:
+
+  * Sideband interface (SBI) Temperature Sensor Interface (SB-TSI)
+    compliant AMD SoC temperature device.
+
+    Prefix: 'sbtsi_temp'
+
+    Addresses scanned: This driver doesn't support address scanning.
+
+    To instantiate this driver on an AMD CPU with SB-TSI
+    support, the i2c bus number would be the bus connected from the board
+    management controller (BMC) to the CPU. The i2c address is specified in
+    Section 6.3.1 of the SoC register reference: The SB-TSI address is normally
+    98h for socket 0 and 90h for socket 1, but it could vary based on hardware
+    address select pins.
+
+    Datasheet: The SB-TSI interface and protocol is available as part of
+               the open source SoC register reference at:
+
+	       https://www.amd.com/system/files/TechDocs/56255_OSRR.pdf
+
+               The Advanced Platform Management Link (APML) Specification is
+               available at:
+
+	       http://developer.amd.com/wordpress/media/2012/10/41918.pdf
+
+Author: Kun Yi <kunyi@google.com>
+
+Description
+-----------
+
+The SBI temperature sensor interface (SB-TSI) is an emulation of the software
+and physical interface of a typical 8-pin remote temperature sensor (RTS) on
+AMD SoCs. It implements one temperature sensor with readings and limit
+registers encode the temperature in increments of 0.125 from 0 to 255.875.
+Limits can be set through the writable thresholds, and if reached will trigger
+corresponding alert signals.
-- 
2.25.1.696.g5e7596f4ac-goog

