Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D63FC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 07:17:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDC162070A
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 07:17:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UoMzpgXl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgERHRU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 03:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgERHRU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 May 2020 03:17:20 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31294C061A0C
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 00:17:20 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id y198so2962579pfb.4
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 00:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aGW79/y1sQxyNyKnYCdm7xRnlp2A+ncCgZ78AmDbDP0=;
        b=UoMzpgXlEUtE4xe4uJZtseFzP5Ny1oiUH3PWAPrU0uwohnVsjL6+mWGVtr3ZbY62L3
         CdEvu72849N2oUeWuGuvQsh7R2CyVghspGfDG8oIdxjSCe48IU5eP12SSasjjvjEuq0m
         6ooxwWrlTiGPcrDQXDa8pFCA5Ee9Oq5QO4OeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aGW79/y1sQxyNyKnYCdm7xRnlp2A+ncCgZ78AmDbDP0=;
        b=Ez3WCfgDxv1djV7c9xfuHrh7SBDeR3Qo78W0f8PksQjsJQMX5u2xfimfUQCVT7lFxG
         fD7ZMSWR8t5e80+d2P8eEUpmHuWgEuIcgu44DSRYimOjb7kPYvIAF2F7ulFJ/4wnhTcP
         j8a8+VpPkrRacJTd3AVKRY5pAJdGstt9Zd4ZExwPqV2PIrYVSMsFrZGA5+Dg0GUv121p
         LrhoOl4RJpWroJfeUcYEJoiPmBkPhWYFgu3XwWMryADsmTuygGx+4pWkN6vJW/xn04v5
         64diHZw4g25g2hrW1C8lCwwbqHW5WlFzKRlEH7DMhRdaDmeobSi9UiEB3zfQD26743ku
         ER/A==
X-Gm-Message-State: AOAM531epRdpAtIVNMhkt7guytVXnMMpt6G/s0RoNaIKHVgUURzrYgd1
        LQhh08kHheS8ggU4wqg0axb/FQ==
X-Google-Smtp-Source: ABdhPJyv0URzVNnS1GzQydgz4Ze44LkdtRVqQhZVXcedVFYRQ2f2wxpZaMbCk5O9s+Iin1/nelLPLg==
X-Received: by 2002:a63:4f0e:: with SMTP id d14mr13794386pgb.445.1589786239476;
        Mon, 18 May 2020 00:17:19 -0700 (PDT)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id 30sm6928590pgp.38.2020.05.18.00.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 00:17:18 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     heikki.krogerus@linux.intel.com,
        Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: chrome: Add cros-ec-typec mux props
Date:   Mon, 18 May 2020 00:17:04 -0700
Message-Id: <20200518071707.161843-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add properties for mode, orientation and USB data role switches for
Type C connectors. When available, these will allow the Type C connector
class port driver to configure the various switches according to USB PD
information (like orientation, alt mode etc.) provided by the Chrome OS
EC controller.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
Acked-By: Benson Leung <bleung@chromium.org>
---

Changes in v2:
- Added more text to the switch descriptions, explaining their purpose,
  and relation to the Type C connector class framework.

 .../bindings/chrome/google,cros-ec-typec.yaml | 40 ++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
index 6d7396ab8bee..800c005a0e44 100644
--- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
+++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
@@ -21,7 +21,34 @@ properties:
     const: google,cros-ec-typec
 
   connector:
-    $ref: /schemas/connector/usb-connector.yaml#
+    allOf:
+      - $ref: /schemas/connector/usb-connector.yaml#
+      - type: object
+        properties:
+          mode-switch:
+            description: Reference to a DT node for the USB Type C Multiplexer
+              for this connector. This switch controls the data lines routing
+              for this connector for various operation modes, including
+              Alternate Modes. This switch is assumed registered with the Type C
+              connector class framework by its driver. The Type C connector
+              class framework assumes that the mode switch property uses this
+              name.
+
+          orientation-switch:
+            description: Reference to a DT node for the USB Type C orientation
+              switch for this connector. This switch controls routing the
+              correct data pairs depending on the cable plug orientation from
+              this connector to the USB / Alternate Mode controllers. This
+              switch is assumed registered with the Type C connector class
+              framework by its driver. The Type C connector class framework
+              assumes that the orientation switch property uses this name.
+
+          usb-role-switch:
+            description: Reference to a DT node for the USB Data role switch
+              for this connector. This switch is assumed registered with the
+              Type C connector class framework by its driver. The Type C
+              connector class framework assumes that the USB role switch
+              property uses this name.
 
 required:
   - compatible
@@ -49,6 +76,17 @@ examples:
             data-role = "dual";
             try-power-role = "source";
           };
+
+          connector@1 {
+            compatible = "usb-c-connector";
+            reg = <1>;
+            power-role = "dual";
+            data-role = "host";
+            try-power-role = "source";
+            mode-switch = <&typec_mux>;
+            orientation-switch = <&typec_orientation_switch>;
+            usb-role-switch = <&typec_mux>;
+          };
         };
       };
     };
-- 
2.26.2.761.g0e0b3e54be-goog

