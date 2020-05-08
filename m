Return-Path: <SRS0=pmuo=6W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603F3C54E49
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 May 2020 09:59:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FEB2216FD
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 May 2020 09:59:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgEHJ7J (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 May 2020 05:59:09 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:52557 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbgEHJ7J (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 May 2020 05:59:09 -0400
X-Originating-IP: 2.224.242.101
Received: from localhost.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 35297FF80A;
        Fri,  8 May 2020 09:59:06 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, tfiga@google.com, pavel@ucw.cz,
        devicetree@vger.kernel.org
Subject: [PATCH v10 03/13] dt-bindings: Add media properties
Date:   Fri,  8 May 2020 12:01:48 +0200
Message-Id: <20200508100158.3437161-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200508100158.3437161-1-jacopo@jmondi.org>
References: <20200508100158.3437161-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a DT header file to contain definitions for standard media properties.

The file is named after:
Documentation/devicetree/bindings/media/video-interfaces.txt
which contains the standard media properties definitions.

Initially add three macros to define the supported 'orientation'
property values.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 include/dt-bindings/media/video-interfaces.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 include/dt-bindings/media/video-interfaces.h

diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
new file mode 100644
index 0000000000000..404c697d6bd6e
--- /dev/null
+++ b/include/dt-bindings/media/video-interfaces.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * include/dt-bindings/media/video-interfaces.h
+ *
+ * Copyright (C) 2020 Jacopo Mondi <jacopo@jmondi.org>
+ */
+
+#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
+#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
+
+#define FRONT_CAMERA		<0>
+#define BACK_CAMERA		<1>
+#define EXTERNAL_CAMERA		<2>
+
+#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
--
2.26.1

