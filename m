Return-Path: <SRS0=WWXW=5F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C53EC4332B
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 16:39:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E9C920663
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 16:39:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgCTQj0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 12:39:26 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:45819 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbgCTQj0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Mar 2020 12:39:26 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N1u2b-1jQNCn1Vxh-012KNh for <devicetree@vger.kernel.org>; Fri, 20 Mar
 2020 17:39:24 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 34106650123
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2020 16:39:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1PsRH_UJxv4e for <devicetree@vger.kernel.org>;
        Fri, 20 Mar 2020 17:39:23 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id CE94764C337
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2020 17:39:23 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 17:39:23 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 33D6A80505; Fri, 20 Mar 2020 17:12:04 +0100 (CET)
Date:   Fri, 20 Mar 2020 17:12:04 +0100
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
Subject: [PATCH v3 08/11] dt-bindings: adv748x: add information about serial
 audio interface (I2S/TDM)
Message-ID: <5e7da04cd003778cf525eac96d8bacdf4a245a13.1584720678.git.alexander.riesen@cetitec.com>
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
References: <cover.1584720678.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1584720678.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.41]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7660
X-Provags-ID: V03:K1:sc9y98i62d5iyM2zmlEbyFVa7pJl1ZW5vDoAOLJ6oJRVBC0PBdu
 C7gJxq8cfjbiD7KLleHPsYTG0fimZVmzVi5KL4OkXMYwieNbxZEKtQhVuO7uT9h18XsV6h/
 cZHdIpzPMqGk3LaF2ALHIeCOGKtNZkAJMdDRn3XrEKW46Z49sZTy0dhcUAjKZLMomIZMREh
 RegicryI3CXxdibVB4e5A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IZkxpIjPa08=:kTJ6CcaIOFf5y//Qt2EF7E
 cohn33rVWYYjVq4GZVTV+V6x2SYdtCjATup6e7Cit9Uur0w2CV6CdPPI9hyxkV89CZlQ2PJhU
 fztXersm0SWvw8GyVYiZDxE2yIT33GhrCkRR/XTClERFXySSSPKmfK0Bgjac8KytkcFLPkSIH
 VN4BjnzR16UKgSo02RTvDfi1QJHmSaqHU/tPCI+ISqFwaXv0Ou8B+MXf1RYEt+2px7sWNRYQ4
 Y39UREStsTy/3BbyvTAfjHstlDwjbfdMn0u/jBhnCunknouv15kAcyikHl0OOEClTWunHiC8y
 e+sCKJs8D/L0auLT3oRXpWAWmhjlLNBggekGLd1gg3El7CF1Wp/Lz2rx0mVIjXJaOnXKY+JDs
 aQyExewAucVn+5HQswpMo3NMDwgqc5SQevLpfzVUgiWM7ZWXrehrk5m4K6CaS8YBAnlxZ3MmU
 Yu/DuM7XNpzBePaMMNnwRmn3HgBNKvCFRyf3mF+dFExWNs6DKNW7bsT+sBjuU5kbzli2q0hpa
 ThOGdL8pYm/Dr26UQ2bSY+lt4w4WHpLWoC1FqsmNhmLyybs2edRdnkybDrfBmRMlopSo5hq5q
 Ohq2MfSyuWsm7xGDlrzR2GQ15GyqjlnEpm1VYDa8p1Y56eos8UM+S1A8HH/08io6AFDnrIKVf
 HtxP48OvLtcQXsT43hhXFspfAekVSLCfy9oWOwIFg63aJ/Uwq2P3bqVVIfSGYnneNztsRC0SX
 7c6e6XJ+kpoJSiZvkXkXHVG+YdySnBDwlt4LIcnL3YTXUPEY3rLRdCgEjDCZo2FoktKUbb8uH
 2iWPVofwsvR2Gz2Ngv0XreoLUJCZmPqEFk3GSFzDt7SDyA9iO9pWRlX5bVpyYSi/RmnsYdV
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


