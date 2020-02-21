Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2089DC35640
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 09:15:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E9C1220679
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 09:15:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lK15oznk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbgBUJPl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 04:15:41 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34527 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbgBUJPl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Feb 2020 04:15:41 -0500
Received: by mail-wr1-f68.google.com with SMTP id n10so1134208wrm.1
        for <devicetree@vger.kernel.org>; Fri, 21 Feb 2020 01:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cskzhIjwtS0ZVRi8zMZa+kHk4M1kBjG50N69LQL60P8=;
        b=lK15oznkmE7fuECcUv45VNqmPJJHug5zq8zfFtk6asoOdoXNE8Ncepmk6uu778oaRb
         Wb5ADtEcDnQ1EoHLqd9x0hDO5Zfon8zRMFSAH3D55szfBAnIoMh5/8gqJqjERYn6z7CK
         XrtoYQCsOXL16av6t6Mdss1v/p6VCWn4Sx5PtMWtn8PmEsqzJvgSfDSeNd8wJcTim5y+
         YpDWz//queWKkrXbRBzoOqidSN8hslbIgUtrEFT74IISO51Y4qL45svbFHnAqa3Fmpkb
         400SJQUNjWCrbsCZsGX26tBkAiu5lPFKsnhs1hlVXw93LQvck3x54xy2xbRGbD0DX3b2
         X44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cskzhIjwtS0ZVRi8zMZa+kHk4M1kBjG50N69LQL60P8=;
        b=OwH9ohv9RMW7ksKG8/kAuVuYqIpEqX5U9cOX3+dwnXWg/UtliivbTe2VNGzyLjPz9d
         11Felud1TA9FKov0e84t4xNCLQsNUOOVv+XPoQA+0T39VWLaHzvD3JJOQxpP9kDwbdIh
         jceDlhrOpbXX0s0KV0L4AqiHiXLxHuVAg1yTzayEbw9AkeWwAQZfvmHhd64I2SfeVIC3
         BYJJu2KIG98K4Ua7c8Aez0NwmDNChqRJBPmx9FOfwr+pqaywhnKH2zOeQxSdYVuBQjz4
         thLHzlTpsmJkQQ6AltnZKOoDF3OxOEXIFJsjTDzddEHM1irTsKoBw/FqTVeZ3u4LSE2t
         qObQ==
X-Gm-Message-State: APjAAAUHcqGNi71rPUXvCR0zje2ob934l2OrIOHmQ6k+S2z/0vdYNBPa
        Z/F1/ZPusVNa7bxQESaCVQRjNUxatSoVGw==
X-Google-Smtp-Source: APXvYqw1IrIayRzEm5+L4hNTMttvykUESXzbqguy+LbKUkETLLIIENqD5GsBuIotlJYN9+0XYuZ30g==
X-Received: by 2002:adf:b1c9:: with SMTP id r9mr47715116wra.339.1582276539064;
        Fri, 21 Feb 2020 01:15:39 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858])
        by smtp.gmail.com with ESMTPSA id o15sm3257837wra.83.2020.02.21.01.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 01:15:38 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     balbi@kernel.org, khilman@baylibre.com, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dongjin Kim <tobetter@gmail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Thinh Nguyen <thinhn@synopsys.com>,
        Jun Li <lijun.kernel@gmail.com>, Tim <elatllat@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/3] doc: dt: bindings: usb: dwc3: Update entries for disabling SS instances in park mode
Date:   Fri, 21 Feb 2020 10:15:30 +0100
Message-Id: <20200221091532.8142-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200221091532.8142-1-narmstrong@baylibre.com>
References: <20200221091532.8142-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch updates the documentation with the information related
to the quirks that needs to be added for disabling all SuperSpeed XHCI
instances in park mode.

Cc: Dongjin Kim <tobetter@gmail.com>
Cc: Jianxin Pan <jianxin.pan@amlogic.com>
Cc: Thinh Nguyen <thinhn@synopsys.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Reported-by: Tim <elatllat@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 66780a47ad85..c977a3ba2f35 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -75,6 +75,8 @@ Optional properties:
 			from P0 to P1/P2/P3 without delay.
  - snps,dis-tx-ipgap-linecheck-quirk: when set, disable u2mac linestate check
 			during HS transmit.
+ - snps,parkmode-disable-ss-quirk: when set, all SuperSpeed bus instances in
+			park mode are disabled.
  - snps,dis_metastability_quirk: when set, disable metastability workaround.
 			CAUTION: use only if you are absolutely sure of it.
  - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
-- 
2.22.0

