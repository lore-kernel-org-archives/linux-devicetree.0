Return-Path: <SRS0=lKpO=5L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F2FC43331
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 11:01:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A48D20409
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 11:01:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbgCZLB5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Mar 2020 07:01:57 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:39583 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727910AbgCZLB5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 26 Mar 2020 07:01:57 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MWzXj-1ikoKA0T8L-00XKog for <devicetree@vger.kernel.org>; Thu, 26 Mar
 2020 12:01:55 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id E289164FC1C
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2020 11:01:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id HSxGjnNmGWZc for <devicetree@vger.kernel.org>;
        Thu, 26 Mar 2020 12:01:54 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 8060664C9BD
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2020 12:01:54 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.79) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 26 Mar 2020 12:01:54 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id A12B180505; Thu, 26 Mar 2020 11:35:43 +0100 (CET)
Date:   Thu, 26 Mar 2020 11:35:43 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v4 8/9] dt-bindings: adv748x: add information about serial
 audio interface (I2S/TDM)
Message-ID: <37482bdfc6d6c6e231c58550b6bc4582aa29dde0.1585218857.git.alexander.riesen@cetitec.com>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1585218857.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1585218857.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.79]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7C67
X-Provags-ID: V03:K1:UFXMbwYvvkt6Sc11eAf7K2C0mOiAZnBfufTMgEJj4fnp9/oF7P3
 fMPPd+TJvsAZ1HKuiUY04n0azRjaMG00uvum4/ogHglmF2k72eOMuzZ1ORZGOTDDbqNC9wN
 4FsuK2hXkBIrZzb2zOkbW0dHBXCrJi9q196Dr9pvfLOGRGS8nLnHPpRewG4SxjJmehDpcxY
 z9de0KSbbbWpWJaO3ZlRw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jYKjvxm0w1k=:jT1pFitG14+bdhGJn5aD3g
 ee9VtMXSrmQ+0bo23Z3CvF4l/RfehTSkwH1az1Wur3Duw5LwS6sSwV+dBUe0LvmVtVp2TVBAY
 CMhn22m7qSMTRRtv6OTiVuH1mYKij8LmM3bYjkLJ8UHthZAHsISe8aUBocVVg/sLntc5T/Zs9
 w03OeOpGfz06ng8ZyF2+0WFaq3TAEKao3XLK4SwKvRHAWeTKy1b75JZylKfY0T0D6Ot/Vq1SP
 LyueG2fo4OzwfWrguL7xcmaxzUwsqEq2d2nBDsjDVru7VNvVWFGHNmga35Xrd5UcPWa1gem+z
 fbYixj7o+OT0zPQqAonY4f06lAKYrnNoug/quKEv+X2RzBXIZs4zcbGrqgVgacOVfogMjCj8p
 wT2TsTR01PgXZNqauzpboIzP6/6v2N7Tj9QM6uzv98xDUIldUW9lUZg/U18M6qOUGqMm6VsPs
 Rf2SKOlBhU3/QtCF+rxGPn1QCo0t8+RHTpb4zDnBfhLfgg3rEA3JbSVJihe6V5tRRibsDL0Mj
 xDO/rxFwpM+J8f2MtCm4GIH1Qny6FezyhjZsZmIpq/dWRbwEllwoTDYAUmz6CtTdupKeXf8WI
 +qGlHBiXAaHtFG3ZEGDj9MjOGWyOa/EUya6te2Mq3qXJ3rQjLxFOlwJsiEYb4KlQ81hZwKxrP
 n2eC21yoq10XpGURmDec5k4bjBL2lbZL6gDbIfM6TGeycTKur+IVYwkHyDRHekA4yeY+AOR3r
 +LsKSUJBRJ2io06U7meHC6Sgx71UORk6qeG5r1cvWvijVju7/EDY5KjHsFsRn9CxfI4wheMSW
 LWkoj7zz+1Age0C7kOvQcY/ym4/yIarP/PyeXykXzpF64tdwk+s5VyWvJiExuBeVkxxaYJS
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

As the driver has some support for the audio interface of the device,
the bindings file should mention it.

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--

v3: remove optionality off MCLK clock cell to ensure the description
    matches the hardware no matter if the line is connected.
    Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 .../devicetree/bindings/media/i2c/adv748x.txt    | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.txt b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
index 4f91686e54a6..50a753189b81 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv748x.txt
+++ b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
@@ -2,7 +2,9 @@
 
 The ADV7481 and ADV7482 are multi format video decoders with an integrated
 HDMI receiver. They can output CSI-2 on two independent outputs TXA and TXB
-from three input sources HDMI, analog and TTL.
+from three input sources HDMI, analog and TTL. There is also support for an
+I2S-compatible interface connected to the audio processor of the HDMI decoder.
+The interface has TDM capability (8 slots, 32 bits, left or right justified).
 
 Required Properties:
 
@@ -16,6 +18,8 @@ Required Properties:
     slave device on the I2C bus. The main address is mandatory, others are
     optional and remain at default values if not specified.
 
+  - #clock-cells: must be <0>
+
 Optional Properties:
 
   - interrupt-names: Should specify the interrupts as "intrq1", "intrq2" and/or
@@ -47,6 +51,7 @@ are numbered as follows.
 	  TTL		sink		9
 	  TXA		source		10
 	  TXB		source		11
+	  I2S		source		12
 
 The digital output port nodes, when present, shall contain at least one
 endpoint. Each of those endpoints shall contain the data-lanes property as
@@ -72,6 +77,7 @@ Example:
 
 		#address-cells = <1>;
 		#size-cells = <0>;
+		#clock-cells = <0>;
 
 		interrupt-parent = <&gpio6>;
 		interrupt-names = "intrq1", "intrq2";
@@ -113,4 +119,12 @@ Example:
 				remote-endpoint = <&csi20_in>;
 			};
 		};
+
+		port@c {
+			reg = <12>;
+
+			adv7482_i2s: endpoint {
+				remote-endpoint = <&i2s_in>;
+			};
+		};
 	};
-- 
2.25.1.25.g9ecbe7eb18


