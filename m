Return-Path: <SRS0=d5cD=3G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA77C33CB6
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 23:53:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F95C22464
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 23:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iWSB9WXc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730434AbgAQXxh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jan 2020 18:53:37 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39292 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730377AbgAQXxh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jan 2020 18:53:37 -0500
Received: by mail-pf1-f193.google.com with SMTP id q10so12654431pfs.6
        for <devicetree@vger.kernel.org>; Fri, 17 Jan 2020 15:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LI745qyhfC24gzXUC8Xnl8TDVqe/BweZFfeh/F4qgX8=;
        b=iWSB9WXctOtQvLtA/1Z6XcpzXS2vBNhlFGNoTKDSXf4sSuJHBqCc6hgW/Ofgh4AEaL
         JvlOO5pGnMvrlJCvA2wLe7Kh9eZkIbVemqI7UEOEhIiYz/IWzP0L1/IHZQ0AzKwnbP1j
         5NiPQJ7nLoOv3P5wp9XQZO0ZIb9kz4ozi6Wtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LI745qyhfC24gzXUC8Xnl8TDVqe/BweZFfeh/F4qgX8=;
        b=D6bSJ7KHq2UFHJfVmBlh393nPd7v4DgdwPrXv4/3qwNiDZ48I5CYFh/R7z5mfWGMhR
         n/5RqdUfWCrvDTEpDfthnLKHxiXuYTwXrlTUOGDKRfrs9yafXVu0ToMzPb+xpHVsHKdN
         hV12LyZscX/z1+FQd2XmVAe99epVYOU0yn099yQgai0m9THcCBM/4oUS3LALve4J0DTw
         d7kqc337rPl6L4Kqei4ywBrUW2DzGej151RKpOxynuvLWdALny27U78vhDRHaAr8EzzC
         4y7rKQl/ZSXLdNuRi7ioG8kvaYGgEYJzbrVECg4aVr03DE30pQaBrh6xQzr2Y+3Zscs6
         o44w==
X-Gm-Message-State: APjAAAXqtJ9cw3tK4C61tzJgx0bSKQP0p9t73FnhMaBGpTibzI4u6dwg
        epUfU1jHcBidVYo6O4CihWfxoQ==
X-Google-Smtp-Source: APXvYqwjkCD5j5Pvhce9ZTqoVwIBg5agZtC0F3r1I2MXKvuT7W8zYAZz8j21fgSSJnRtECpB3DEiVA==
X-Received: by 2002:a62:53c3:: with SMTP id h186mr5563105pfb.118.1579305216492;
        Fri, 17 Jan 2020 15:53:36 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id e1sm30865105pfl.98.2020.01.17.15.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 15:53:36 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, mka@chromium.org,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH v3] dt-bindings: timer: Use non-empty ranges in example
Date:   Fri, 17 Jan 2020 15:53:26 -0800
Message-Id: <20200117155303.v3.1.I7dbd712cfe0bdf7b53d9ef9791072b7e9c6d3c33@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On many arm64 qcom device trees, running `make dtbs_check` yells:

  timer@17c20000: #size-cells:0:0: 1 was expected

It appears that someone was trying to assert the fact that sub-nodes
describing frames would never have a size that's more than 32-bits
big.  That does indeed appear to be true for all cases I could find.

Currently many arm64 qcom device tree files have a #address-cells and
about in commit bede7d2dc8f3 ("arm64: dts: qcom: sdm845: Increase
address and size cells for soc").  That means the only way we can
shrink them down is to use a non-empty ranges.

Since forever it has said in "writing-bindings.txt" to "DO use
non-empty 'ranges' to limit the size of child buses/devices".  I guess
we should start listening to it.

I believe (but am not certain) that this also means that we should use
"ranges" to simplify the "reg" of our sub devices by specifying an
offset.  Let's update the example in the bindings to make this
obvious.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
See:
  https://lore.kernel.org/r/20191212113540.7.Ia9bd3fca24ad34a5faaf1c3e58095c74b38abca1@changeid

...for the patch that sparked this change.

Changes in v3:
- Fixed my typo frame@f0003000 => frame@2000

Changes in v2:
- Fixed my typo 0xf0000000 => 0xf0001000

 .../bindings/timer/arm,arch_timer_mmio.yaml          | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml b/Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml
index b3f0fe96ff0d..102f319833d9 100644
--- a/Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml
+++ b/Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml
@@ -99,22 +99,22 @@ examples:
       compatible = "arm,armv7-timer-mem";
       #address-cells = <1>;
       #size-cells = <1>;
-      ranges;
+      ranges = <0 0xf0001000 0x1000>;
       reg = <0xf0000000 0x1000>;
       clock-frequency = <50000000>;
 
-      frame@f0001000 {
+      frame@0 {
         frame-number = <0>;
         interrupts = <0 13 0x8>,
                <0 14 0x8>;
-        reg = <0xf0001000 0x1000>,
-              <0xf0002000 0x1000>;
+        reg = <0x0000 0x1000>,
+              <0x1000 0x1000>;
       };
 
-      frame@f0003000 {
+      frame@2000 {
         frame-number = <1>;
         interrupts = <0 15 0x8>;
-        reg = <0xf0003000 0x1000>;
+        reg = <0x2000 0x1000>;
       };
     };
 
-- 
2.25.0.341.g760bfbb309-goog

