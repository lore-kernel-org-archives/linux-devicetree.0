Return-Path: <SRS0=YuQm=5V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FB0C2BA1E
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Apr 2020 03:01:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD3F9206A3
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Apr 2020 03:01:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PO44/Tdb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgDEDBg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Apr 2020 23:01:36 -0400
Received: from mail-pg1-f202.google.com ([209.85.215.202]:44142 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgDEDBf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Apr 2020 23:01:35 -0400
Received: by mail-pg1-f202.google.com with SMTP id 201so2028458pgg.11
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2020 20:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=/mhEVKDrcLowpzfx6YTsJHtWxucbZ6JF/7+trFXxaIo=;
        b=PO44/TdbXsdOKUnGcbwCiq/biYVFIazEY47zEiL9aID60XNQpcSbVLtTbF1LgtQNwu
         pq8ors1X0WVg3T14QfHi7jePFG7uQd9ygbYZ6CpcFfjP/18Wf+elgVnt5F1k5n4JTJ88
         wPmAHTdtEMBZ9c4iEm7ET5yZaVXbSdnJxh4D/AcqBo+UW8TDHuzclsZA7utXw9OpDhga
         +2K7HKhe7i3QIUgjhE6O9ZNROr7e5cy2HNGHVJrpRSZmhPjQGhABt/equMSc59wTWcwT
         pJfczuxrC9ZErwPiAZCZ5Yd0aL2OYbkslHcPXbWXWA0pWQUgI8ar1xlvTEqM5Uvs3TiU
         N6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=/mhEVKDrcLowpzfx6YTsJHtWxucbZ6JF/7+trFXxaIo=;
        b=LDL86extoHeIzPe+YDaxkFchqu3hQGbro6mKUJgKZIYy0BNM6CyMjWtqDjM9OW+dkX
         hwUj5h1xuIMxex+wKzKdbXazAved167X+NObfG7JhEIApWVH5Ty7rvr5hmxqqJh/gfdV
         oWoVlCGBLe/5+ECZOsJju85h017loe+cZViV1NsGuQmYtsJB03TnIXHagqXH92HZ9dyg
         4PBZT99VzZe/ltUQy4HZfp7v3J1QfuO0BQeDW0uwIzTOuaKhboUMmJenfDd8ZzGSoJHu
         A4a8iTlwieMiV6J0LRD5vJyzSgwJp7Ymp+JG/3bqeDP/c2nWrry9O3nWwTqYP2+Ep4Wc
         r12w==
X-Gm-Message-State: AGi0PuYge1ng0utb9yaiK7d3UE50jnqbV47dc9/1RPPDpqoBDHklAQg2
        xMZ9xiGZJ4sSc43LR2R0+N6ajnTIbQ==
X-Google-Smtp-Source: APiQypJo7hFsDNHoEJgwxYSllOJInVS57xICFoKfaImyalPvwkywRfVPaQkhFH+eDgQu9zLiFFDHLfoToQ==
X-Received: by 2002:a63:2e44:: with SMTP id u65mr3435016pgu.142.1586055694463;
 Sat, 04 Apr 2020 20:01:34 -0700 (PDT)
Date:   Sat,  4 Apr 2020 20:01:18 -0700
In-Reply-To: <20200405030118.191950-1-kunyi@google.com>
Message-Id: <20200405030118.191950-4-kunyi@google.com>
Mime-Version: 1.0
References: <20200405030118.191950-1-kunyi@google.com>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
Subject: [PATCH linux hwmon-next v3 3/3] dt-bindings: (hwmon/sbtsi_tmep) Add
 SB-TSI hwmon driver bindings
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

Document device tree bindings for AMD SB-TSI emulated temperature
sensor.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 .../devicetree/bindings/hwmon/amd,sbtsi.txt   | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/amd,sbtsi.txt

diff --git a/Documentation/devicetree/bindings/hwmon/amd,sbtsi.txt b/Documentation/devicetree/bindings/hwmon/amd,sbtsi.txt
new file mode 100644
index 000000000000..be7293c43c0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/amd,sbtsi.txt
@@ -0,0 +1,26 @@
+* Sideband interface Temperature Sensor Interface (SB-TSI) compliant
+AMD SoC temperature device.
+
+SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
+interface that reports AMD SoC's Ttcl (normalized temperature),
+and resembles a typical 8-pin remote temperature sensor's I2C interface
+to BMC. The emulated thermal sensor can report temperatures in increments of
+0.125 degrees, ranging from 0 to 255.875.
+
+Required properties:
+- compatible: manufacturer and chip name, should be
+	"amd,sbtsi",
+
+- reg: I2C bus address of the device as specified in Section 6.3.1 of the
+SoC register reference: The SB-TSI address is normally 98h for socket 0 and
+90h for socket 1, but it could vary based on hardware address select pins.
+
+[open source SoC register reference]:
+	https://www.amd.com/system/files/TechDocs/56255_OSRR.pdf
+
+Example:
+
+sbtsi@4c {
+	compatible = "amd,sbtsi";
+	reg = <0x4c>;
+};
-- 
2.26.0.292.g33ef6b2f38-goog

