Return-Path: <SRS0=uLJJ=BK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC00C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 11:03:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2728B20838
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 11:03:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732485AbgGaLDd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jul 2020 07:03:33 -0400
Received: from mga02.intel.com ([134.134.136.20]:44004 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732437AbgGaLDc (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 31 Jul 2020 07:03:32 -0400
IronPort-SDR: y2YhxVngtaIUJcjlNA8evNfE50AiClSD10KxHlYGldmRSvyp6KqkhVtEIRo7jJ5d8ygh/5BMNK
 VBY9nwhEgwsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="139742167"
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; 
   d="scan'208";a="139742167"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2020 04:03:32 -0700
IronPort-SDR: zFoRDOA8eEjfMz6q08pHPaOxRsRXpm7fj6VTtwkWBjJUm/qoIyHH/jU09t039D8TcOGxeZdm0L
 xtciy3hsx5gg==
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; 
   d="scan'208";a="291188435"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2020 04:03:31 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 1756B20859; Fri, 31 Jul 2020 14:03:29 +0300 (EEST)
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 98F94202F2
        for <sailus@localhost>; Tue, 23 Jun 2020 13:05:23 +0300 (EEST)
Received: from linux.intel.com [10.54.29.200]
        by paasikivi.fi.intel.com with IMAP (fetchmail-6.4.0.beta4)
        for <sailus@localhost> (single-drop); Tue, 23 Jun 2020 13:05:23 +0300 (EEST)
Received: from orsmga006.jf.intel.com (orsmga006.jf.intel.com [10.7.209.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by linux.intel.com (Postfix) with ESMTPS id F2169580638
        for <sakari.ailus@linux.intel.com>; Tue, 23 Jun 2020 03:05:21 -0700 (PDT)
IronPort-SDR: qmJhAXXoo2Dsz+19oRAK3+/gjOKamjDAT9K3KPprrXlx6QVPZ4cUC84GjFphp0UDMNnRAnAczR
 i3Bao/xXvIzv2Mzusj/Hs/IPw6zCqI2oU=
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="279068024"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; 
   d="scan'208";a="279068024"
Received: from orsmga101.jf.intel.com ([10.7.208.22])
  by orsmga006-1.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 03:05:21 -0700
IronPort-SDR: vf+UnxLO824h3u4S9FqHaBh4TcUv/x9UG7mt0a/qVtHIuVczGwp9zw5p9B8i2N4Z+NpYvG24Tw
 Drl4uQcdr/NJvX8lF9ItLVJB2/vfXLJGs=
IronPort-PHdr: =?us-ascii?q?9a23=3AngFZMRNlULyM2yi/go0l6mtUPXoX/o7sNwtQ0K?=
 =?us-ascii?q?IMzox0I/XzrarrMEGX3/hxlliBBdydt6sZzbOG7+u6AiQp2tWoiDg6aptCVh?=
 =?us-ascii?q?sI2409vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFR?=
 =?us-ascii?q?rhKAF7Ovr6GpLIj8Swyuu+54Dfbx9HiTagYb5+Ngi6oAbeu8UZn4dvJLs6xw?=
 =?us-ascii?q?fUrHdPZ+lY335jK0iJnxb76Mew/Zpj/DpVtvk86cNOUrj0crohQ7BAAzsoL2?=
 =?us-ascii?q?465MvwtRneVgSP/WcTUn8XkhVTHQfI6gzxU4rrvSv7sup93zSaPdHzQLspVz?=
 =?us-ascii?q?mu87tnRRn1gyoBKjU38nzYitZogaxbvhyvuhJxzY3Tbo6XOvpxcazTcMgGSW?=
 =?us-ascii?q?dCRMtdSzZMDp+gY4YJEuEPPfxYr474p1YWqRWxHxWjBOT3yj9Pm3T42qo60+?=
 =?us-ascii?q?I8HgHHwQctGNAOv27Io9XyLKcSVvu4zKvNzTXEafNZxDb95JLPchA7rvGBRL?=
 =?us-ascii?q?R9etfexkczDQ3KlEmQqZD7MDOP0OQAq2yW4uRuWO+uiWMqtQ9/riayy8oilo?=
 =?us-ascii?q?XEhYEYx1PK+yhk3Yo7K9y1RFB4bNCkHpZcqT2XOYV4TM4sR2xluyk3x6AAtJ?=
 =?us-ascii?q?WmfyYK0IwqywDCZ/GFaYSF4A7vWPyMLTp7in9pYq+zihKx/ES4zuDxWNO43V?=
 =?us-ascii?q?hFoyZfj9XAq3MA2wbN5sWJRPZw+Fqq1yyV2ADJ8O5EJFg5larFJJ4lxb49jo?=
 =?us-ascii?q?ATvlrHHiDsmET7jbaaeVg+9uit8evnY7HmqoWTN4BujAHxL6Uulta5AesmLg?=
 =?us-ascii?q?gCR2mb+eKi273/5UD1XqhGg/8snqTbrJzWP9kXq623DgNPz4ou7xWyAy+j0N?=
 =?us-ascii?q?sCnHkHKFxFeAiAj4jsI1zOIur3Auu4g1S0lzdm3PLGPrjmApXLM3fDka3tfb?=
 =?us-ascii?q?Fn605T0AYz18xQ54pICrEdJ/L+QlTxu8bbDhAjKQy0wvzrB8981oMaRGKPGb?=
 =?us-ascii?q?SUMKfTsV+O++IuLPOAZI4TuDbhNfcl4+TigmM+mV8YLuGV2s4SY3C1Hv1sC0?=
 =?us-ascii?q?aUe3zhhpEGC2hO9hE3T+XwiRuLUDpOfF62XqQh9nc6Dp6rCcHIQYXpyLyf0T?=
 =?us-ascii?q?24A5xSTnBdVlmIFTHuc8HMX/4Rci+UPol5kzoPVbG7V6cg2Rynrwj8wb1uNO?=
 =?us-ascii?q?aS8Sod8dr509184avQkg878T1qFMeM0kmCS2Z+l2cMQDA31+Z0pkk5gluKz6?=
 =?us-ascii?q?U+mOBVC9FV/PRPeh0zLobWwvZgGsjzHAXbcZPBTl+7WdWOGzgqVtg82cUfe0?=
 =?us-ascii?q?c7ENKn3T7Z2C//IbYekKSMTLkz9K7dlyzzLs1603Hu1qwmiVUnBMxVOjv11e?=
 =?us-ascii?q?ZE6wHPCtuRwA2inKGwePFE0Q=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0GRAwDm0vFeh8a3RtlmHgEBCxIMhXk?=
 =?us-ascii?q?xLAqNG6QKCwEBAQEBAQEBAQgtAgQBAYRHAoIUAiQ4EwIDAQELAQEBBAEBAQI?=
 =?us-ascii?q?BBgQBAQIQAQEBCA0JCBsOhW6COyKDawMDMgFGEFE9GgcSgyaDAQG4Q4kTgUC?=
 =?us-ascii?q?BOId2hG0aP4FBhF+KDyIEkWuicYJkgQuYEQ8ggQmdcpBoSZ5xgWqBeTMaCCg?=
 =?us-ascii?q?IgyRQFwINjjiOL0AyNwIGCAEBAwlYJI5YAYEQAQE?=
X-IPAS-Result: =?us-ascii?q?A0GRAwDm0vFeh8a3RtlmHgEBCxIMhXkxLAqNG6QKCwEBA?=
 =?us-ascii?q?QEBAQEBAQgtAgQBAYRHAoIUAiQ4EwIDAQELAQEBBAEBAQIBBgQBAQIQAQEBC?=
 =?us-ascii?q?A0JCBsOhW6COyKDawMDMgFGEFE9GgcSgyaDAQG4Q4kTgUCBOId2hG0aP4FBh?=
 =?us-ascii?q?F+KDyIEkWuicYJkgQuYEQ8ggQmdcpBoSZ5xgWqBeTMaCCgIgyRQFwINjjiOL?=
 =?us-ascii?q?0AyNwIGCAEBAwlYJI5YAYEQAQE?=
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="132427080"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; 
   d="scan'208";a="132427080"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
  by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 03:05:16 -0700
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BF2B5C0011;
        Tue, 23 Jun 2020 10:05:12 +0000 (UTC)
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
Subject: [PATCH 02/25] dt-bindings: media: ov5647: Document clock-noncontinuous
Date:   Tue, 23 Jun 2020 12:07:52 +0200
Message-Id: <20200623100815.10674-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623100815.10674-1-jacopo@jmondi.org>
References: <20200623100815.10674-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Document the optional clock-noncontinuous endpoint property that
allows enabling MIPI CSI-2 non-continuous clock operations.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 Documentation/devicetree/bindings/media/i2c/ov5647.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
index 58d64a69e9640..68d6998d7180c 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
@@ -45,6 +45,11 @@ properties:
             description: |-
               phandle to the video receiver input port
 
+          clock-noncontinuous:
+            type: boolean
+            description: |-
+              Set to true to allow MIPI CSI-2 non-continuous clock operations
+
         required:
           - remote-endpoint
 
-- 
2.27.0

