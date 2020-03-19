Return-Path: <SRS0=Rh3i=5E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95970C4332D
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 22:48:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 564B22076E
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 22:48:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MhM+didP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727598AbgCSWs3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Mar 2020 18:48:29 -0400
Received: from mail-pl1-f202.google.com ([209.85.214.202]:40792 "EHLO
        mail-pl1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727237AbgCSWs3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Mar 2020 18:48:29 -0400
Received: by mail-pl1-f202.google.com with SMTP id p25so2609678pli.7
        for <devicetree@vger.kernel.org>; Thu, 19 Mar 2020 15:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=LhMQ+INauU/9KsdnAD4j2Pb0cvx1ECfEdZDOsAn7Tjs=;
        b=MhM+didPcgg860ORFtZLYW+f0Yigz9R3V9Dt9sQFenpw5C8t+d3zAp4iZdnHS20qBj
         rluUdvf3Tk5HZ+fhAi+3AhaWvz6M+8nPWu3gEjKl+mlO13h6gzwlEWXL/mUVBeRs2Q1Z
         BXnLAIZ4oYQYPE6viTR1RxUYphilXx+en4IHpEXGMygvfUa40O3kVU0Oxj2sc6V1ACiT
         3eQOHS+rfuemcp3ctkZ5yzASfOo/QIp4jzErU+6nwvqG/FjdsT3YbnG4foi4eG0755xh
         aBIwiN7e8pqaY440bLfaY470kt6vhy+0vhGsbDWheRHYTqa9t2oI6lP7JabCSxg+rBng
         2tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=LhMQ+INauU/9KsdnAD4j2Pb0cvx1ECfEdZDOsAn7Tjs=;
        b=jVC9FFPVHgVM40dL/l5x02oXk/7gPIfzo4ONEPnEvNmRjRCEE1Em71WMCFEoBLtNVD
         6YkLJG5H2Hn75BzY3l2R/APfLZP/ufTboeaKNmIfNR8FcKv7R6aUIrDXaS0xsEquqIha
         jw6+jgdXZGDcYsU1hPSzbmlZL7CuxDVLa0RZLqPKHbrf2zd06wcQtYaKzMeNZmHKwWkr
         Iz20+v/TuTHt7kEKECBYAcleEQXyCtTVDmybcsC1BHVl2Y4NijpE5cpsDWZL6pOqtLFw
         JwI4VviHLYBRnUReyGj+2Y9IBIOg5u55+59zI6/ifnzF7+xfbeOlowajV6TiEmv13Ah0
         /y2A==
X-Gm-Message-State: ANhLgQ0iuTcf8h4Z6aCSfGuOLLauLgxnWf6D8USe1CDKqmSeR0BxEs3L
        8SZ7VrMM/3lTzfpCFO9DslzKBMp/4w==
X-Google-Smtp-Source: ADFU+vsLgunwRk9yZ3AUlPSafEADszzRYkrqieYJNQ1jOtHdB0maXLeE+UQJmDtZWigVEJCVaugEtLcuxQ==
X-Received: by 2002:a17:90a:25c8:: with SMTP id k66mr6241638pje.90.1584658108071;
 Thu, 19 Mar 2020 15:48:28 -0700 (PDT)
Date:   Thu, 19 Mar 2020 15:48:11 -0700
In-Reply-To: <20200319224812.202013-1-kunyi@google.com>
Message-Id: <20200319224812.202013-3-kunyi@google.com>
Mime-Version: 1.0
References: <20200319224812.202013-1-kunyi@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH linux hwmon-next v1 2/3] hwmon: (sbtsi) Add documentation
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
---
 Documentation/hwmon/sbtsi_temp.rst | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/hwmon/sbtsi_temp.rst

diff --git a/Documentation/hwmon/sbtsi_temp.rst b/Documentation/hwmon/sbtsi_temp.rst
new file mode 100644
index 000000000000..f5addb72d13f
--- /dev/null
+++ b/Documentation/hwmon/sbtsi_temp.rst
@@ -0,0 +1,33 @@
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

