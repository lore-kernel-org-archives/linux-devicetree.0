Return-Path: <SRS0=uLJJ=BK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C04BC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 11:03:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A3F022BF3
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 11:03:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732437AbgGaLDd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jul 2020 07:03:33 -0400
Received: from mga17.intel.com ([192.55.52.151]:31640 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732293AbgGaLDd (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 31 Jul 2020 07:03:33 -0400
IronPort-SDR: 7sXxuCg7ULnFkDntTqFQaGwFRb4RHaJ/8064F/7AxjIRTUgdp4vn3o5H3eYjjFRfS+ZuW4f3vj
 vfNOK1qOMlrw==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="131830368"
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; 
   d="scan'208";a="131830368"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2020 04:03:31 -0700
IronPort-SDR: 7Q/eTgsF6UWajqc4+Szdc4pPoNYzCB3Ivcqe8wLHcDBNyfMdJz40ninEd6Nerj0lYhxlBj0tFE
 1YUbG4MYcx1Q==
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; 
   d="scan'208";a="329215246"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2020 04:03:30 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 1249C20722; Fri, 31 Jul 2020 14:03:29 +0300 (EEST)
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 1998B202F2
        for <sailus@localhost>; Tue, 23 Jun 2020 13:05:22 +0300 (EEST)
Received: from linux.intel.com [10.54.29.200]
        by paasikivi.fi.intel.com with IMAP (fetchmail-6.4.0.beta4)
        for <sailus@localhost> (single-drop); Tue, 23 Jun 2020 13:05:22 +0300 (EEST)
Received: from fmsmga004.fm.intel.com (fmsmga004.fm.intel.com [10.253.24.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by linux.intel.com (Postfix) with ESMTPS id 356E558066D
        for <sakari.ailus@linux.intel.com>; Tue, 23 Jun 2020 03:05:20 -0700 (PDT)
IronPort-SDR: 2OF8D8qcvVo9sSR7UneAScL59XxYdk5yh5aLgfhIIyDh++PXrDKhA+/hL/dtAo+y4D9u7sutm7
 Z2fElZiaUlWSlWeOflunBV4jDDTB/obCQ=
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="301198778"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; 
   d="scan'208";a="301198778"
Received: from fmsmga101.fm.intel.com ([10.1.193.65])
  by fmsmga004-1.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 03:05:19 -0700
IronPort-SDR: HfsKNpB0TPy0K8z/MiJ41VAcJ9OjWkpvfGlw6wL/0S70KWmhEFcdCR3YZ6sa3PXTbJEOC6Lv9Q
 i9iOOqr5LEnmM0Nh4tv0pqY52DxKjG9lg=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0G0AACe0/Feh8a3RtlmHQEBAQEJARI?=
 =?us-ascii?q?BBQUBgXkFAQsBg24xLAqNG6QJCwEBAQEBAQEBAQgtAgQBAYRHAoIUAiQ3Bg4?=
 =?us-ascii?q?CAwEBCwEBAQQBAQECAQYEAgIQAQEBCA0JCBsOhW6GSAMDMgFGEFE9GgcSgya?=
 =?us-ascii?q?DAQG4RIkTgUCBOAGHdYRtGj+BQYERg06KDyIEkWuicYJkgQuYEQ8ggQmdcpE?=
 =?us-ascii?q?xnnGBaYF6MxoIKAiDJFAXAg2OOI4vQDI3AgYIAQEDCVgkjlgBgRABAQ?=
X-IPAS-Result: =?us-ascii?q?A0G0AACe0/Feh8a3RtlmHQEBAQEJARIBBQUBgXkFAQsBg?=
 =?us-ascii?q?24xLAqNG6QJCwEBAQEBAQEBAQgtAgQBAYRHAoIUAiQ3Bg4CAwEBCwEBAQQBA?=
 =?us-ascii?q?QECAQYEAgIQAQEBCA0JCBsOhW6GSAMDMgFGEFE9GgcSgyaDAQG4RIkTgUCBO?=
 =?us-ascii?q?AGHdYRtGj+BQYERg06KDyIEkWuicYJkgQuYEQ8ggQmdcpExnnGBaYF6MxoIK?=
 =?us-ascii?q?AiDJFAXAg2OOI4vQDI3AgYIAQEDCVgkjlgBgRABAQ?=
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="162105205"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; 
   d="scan'208";a="162105205"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
  by mga01b.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 03:05:14 -0700
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A8BE4C000A;
        Tue, 23 Jun 2020 10:05:08 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mrodin@de.adit-jv.com,
        hugues.fruchet@st.com, mripard@kernel.org, aford173@gmail.com,
        sudipi@jp.adit-jv.com, andrew_gabbasov@mentor.com,
        erosca@de.adit-jv.com, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Subject: [PATCH 01/25] dt-bindings: media: ov5647: Document pwdn-gpios
Date:   Tue, 23 Jun 2020 12:07:51 +0200
Message-Id: <20200623100815.10674-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623100815.10674-1-jacopo@jmondi.org>
References: <20200623100815.10674-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Document in dt-schema bindings for the ov5647 sensor the optional
'pwdn-gpios' property.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 Documentation/devicetree/bindings/media/i2c/ov5647.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
index 067e222e0c7c3..58d64a69e9640 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
@@ -25,6 +25,10 @@ properties:
     description: Reference to the xclk clock
     maxItems: 1
 
+  pwdn-gpios:
+    description: Reference to the GPIO connected to the pwdn pin. Active high.
+    maxItems: 1
+
   port:
     type: object
     description: |-
@@ -61,6 +65,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
 
     i2c {
         #address-cells = <1>;
@@ -70,6 +75,7 @@ examples:
             compatible = "ovti,ov5647";
             reg = <0x36>;
             clocks = <&camera_clk>;
+            pwdn-gpios = <&pioE 29 GPIO_ACTIVE_HIGH>;
 
             port {
                 camera_out: endpoint {
-- 
2.27.0

