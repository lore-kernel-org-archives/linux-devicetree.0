Return-Path: <SRS0=tl9x=5S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D57C43331
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 19:01:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0EB6120737
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 19:01:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389013AbgDBTBp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Apr 2020 15:01:45 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:33233 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388843AbgDBTBp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Apr 2020 15:01:45 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MN5S1-1jav9n45sz-00Izsj for <devicetree@vger.kernel.org>; Thu, 02 Apr
 2020 21:01:43 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id A44DD650ABC
        for <devicetree@vger.kernel.org>; Thu,  2 Apr 2020 19:01:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 0PMVW9xbAPCx for <devicetree@vger.kernel.org>;
        Thu,  2 Apr 2020 21:01:42 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 3D5C8650ABB
        for <devicetree@vger.kernel.org>; Thu,  2 Apr 2020 21:01:42 +0200 (CEST)
Received: from pflmari.corp.cetitec.com (10.8.5.12) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 2 Apr 2020 21:01:39 +0200
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 34C0C80505; Thu,  2 Apr 2020 20:35:06 +0200 (CEST)
Date:   Thu, 2 Apr 2020 20:35:06 +0200
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
Subject: [PATCH v5 8/9] dt-bindings: adv748x: add information about serial
 audio interface (I2S/TDM)
Message-ID: <337b689519806178458ab77385c8ac6f510cb0da.1585852001.git.alexander.riesen@cetitec.com>
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
References: <cover.1585852001.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1585852001.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.12]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6C7266
X-Provags-ID: V03:K1:ysnkoo2aeQRQNHzDjnZen1vGknkgO7RHcnVj6O5B6mRVhuNOPA+
 E+S4uy/RAb1DRgIPI7+1neD1iXfnI5/Tp2I4OLH+bWwjOqGwceP/xAWtvHhRcYBJ1J+6RLq
 qD8TJRO9KsSrdi1ywM4YtWV2Q3lMYTIsw3lCRtIY8z9KV8TfCdhFrvgB3+vB1EO7wuAUjI0
 ZRdhpAYzVE6PF8yD7/OPw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:K+DxiqLEaHM=:dAjWyeOJHHEsfbijWexshY
 sJOmZsJIuobJVOFQ0ykdwqJ0xgUvSdmXaHPvF6lc5DtYErK+yXh7plOfSqqV31SEVIQN5zF83
 iw3vTLbs1fIuvBxNpS/7GLkt5zLMvHGhhOg/Yd1WFbv2ZUf/AFu8itc0hLZb4PV+5KzgcZUuS
 HzBbplC5PXq+jYDMdvu/FxcGw1mguz0pOqrX9YpkXFeiCFIyLaE0ZOiiiYwG0UhO0HvQH7Y0L
 HhYZv6Ne7zHn+s98RcP2ez0xPSp0NO265xO0lXMp7wjcgMTMkHl3XgMwq4rQyFIYUpdYjXNfu
 vwXMzPxThKPWn7mUl+wsS5sZhDmNq9J317iYWl4ETh9UHpSogFagmcUMBCcVnA48LuWsuEhyi
 5aTygpFtLHafoVjrNgnJGSWDnU2SebnfbCiYc6w6cECNM71N8+tpMMHsavHdOWsvFXnMgskmE
 JZXQBoFvBIPf54wW69WdKjML8P03YNOLe/eh8/Ad0yB/AUc/n/gOp6c/7px+gF7hZbwETBzJD
 xuBH8p3ByEEjaqkE2j/VUKud5UsW0EONko4DJ+9zUyE5oVA43dJIG/luu6ECUbeQmG372R7qz
 J+xstto49oYFPVoA9/zTd5cBgNdW1KfXYW5fkSXpO5zg0T2ewo4ZcpXkASYYeAQR7qyr301QD
 YHDUFEc6RzmTHSgZVsjOBjoYY3fFFK2VGvf3hm7JR8ppHEI+0H6RnfDPELuVmtcKrUSDgt0c1
 KibZnHm0hSwb60vpMi2lPxX0rgisnXDGqavtGPKmqD5MoXgl2jNcp0rY2rTyzG/5635nh79Rn
 66zNY4pTaD2Kty2pLSqyrxSV9/+9ev6LPsxlvb6eIPBNlVYzUd/muFdGjcMSAJYCh4aUDuN
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


