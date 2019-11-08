Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF7DFA372C
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 15:57:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8EB4215EA
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 15:57:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbfKHP56 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 10:57:58 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:50285 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbfKHP56 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 Nov 2019 10:57:58 -0500
Received: from uno.lan (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id D9727100010;
        Fri,  8 Nov 2019 15:57:54 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), devicetree@vger.kernel.org
Subject: [PATCH v5 01/11] dt-bindings: video-interfaces: Document 'location' property
Date:   Fri,  8 Nov 2019 16:59:34 +0100
Message-Id: <20191108155944.1040883-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108155944.1040883-1-jacopo@jmondi.org>
References: <20191108155944.1040883-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the 'location' device property, used to specify a device mounting
position. The property is particularly meaningful for mobile devices
with a well defined usage orientation.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../devicetree/bindings/media/video-interfaces.txt    | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index f884ada0bffc..1211bdf80722 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -89,6 +89,17 @@ Optional properties
   but a number of degrees counter clockwise. Typical values are 0 and 180
   (upside down).

+- location: The mount location of a device (typically an image sensor or a flash
+  LED) expressed as a position relative to the usage orientation of the system
+  where the device is installed on.
+  Possible values are:
+  0 - Front. The device is mounted on the front facing side of the system.
+  For mobile devices such as smartphones, tablets and laptops the front side is
+  the user facing side.
+  1 - Back. The device is mounted on the back side of the system, which is
+  defined as the opposite side of the front facing one.
+  2 - External. The device is not attached directly to the system but is
+  attached in a way that allows it to move freely.

 Optional endpoint properties
 ----------------------------
--
2.23.0

