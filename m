Return-Path: <SRS0=GIEZ=26=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4060C33CA1
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 14:02:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A120120880
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 14:02:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=monstr-eu.20150623.gappssmtp.com header.i=@monstr-eu.20150623.gappssmtp.com header.b="R3YuKmY+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731434AbgAIOCo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jan 2020 09:02:44 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37833 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731458AbgAIOCo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jan 2020 09:02:44 -0500
Received: by mail-wr1-f65.google.com with SMTP id w15so7542414wru.4
        for <devicetree@vger.kernel.org>; Thu, 09 Jan 2020 06:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=syyZvcqrhkvwz9+9AfK0kisJzKRZe7HmGDtRCZtQx7c=;
        b=R3YuKmY+q+Hu/s5I4o2jG1sF4dIKnkXnWee0yEPCF2pvxhAVP6I7HAvNIR2UgGj/du
         qjbYiA7f6HIxfmwWUWRlo6zauXE1yk2mIdwAIIH0crY3pmkxpixfer4FJfAkrmDD6hMB
         g7WS4jjPxiM78ZGRrAoOFhZK+pXADwgjR4A5evRn/+p4iNEp3JrJDHXd71998Uxrw+yx
         04Nbkcjl8rBomUskduByR21gw/+TAXkWCw6MDlfTFnVbusoHw8CZYMqOBVFO3gLRVK0X
         cfvTplbLuy/u7YGUbUKkoHzoZeiLqzNQjdS74qAFj5h7IYLp/1iv7KSinU7vXUV1YTYs
         eGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=syyZvcqrhkvwz9+9AfK0kisJzKRZe7HmGDtRCZtQx7c=;
        b=UzEg6UFlpvxKPu5lqrhPESpX3bFn+h0+Hycpvbg8bqrE/Yh5CFYc1VqjO0bpY+ii7X
         SCIA981UyYO+zsfr5Fz+P/QIJ6a76Ny2kKUq+nX2xf9D9z4xcX/VaR5pE9iaCJVmHrae
         Vq6SI0b2ZQyhikJ2Khp/7Ssd+HrEGAmdaL30T0uNGhjvRZZJDcYrqbDKtyNrvNhqCtJU
         TM+FroDslW9X84sArKbONDj55Gbs0dbw35WqevxRon02qgtUaH28Sd/fo5+z+4thUzzu
         SqA0AjyrImh9044/FgEc+8pxAtxIUS76cIoZIytCKAztJCbDG/JVdOTk4tcNDETBwFOT
         lpvQ==
X-Gm-Message-State: APjAAAXDs3AiszYUo/YZdvuLtfu8t5uYOF2e81zvw98Gsq0eujZazilN
        PWTGyaU2jkDTU1XQEG0m2VARJA==
X-Google-Smtp-Source: APXvYqwQ6hMiArjqehmXFiPoI9oRbrRuf+K8jWXYPDm5kOzDnjt/nygyDYp+H7K246LRLunL2lYxaQ==
X-Received: by 2002:adf:fd07:: with SMTP id e7mr10930170wrr.21.1578578561226;
        Thu, 09 Jan 2020 06:02:41 -0800 (PST)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id e18sm8201370wrw.70.2020.01.09.06.02.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2020 06:02:40 -0800 (PST)
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-arm-kernel@lists.infradead.org, git@xilinx.com
Cc:     Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
        Harini Katakam <harini.katakam@xilinx.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] arm64: zynqmp: Add label property to all ina226 on zcu106
Date:   Thu,  9 Jan 2020 15:02:21 +0100
Message-Id: <d659d25f4ebfd1304e5a3b9b1a7a993525a0a2ae.1578578535.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1578578535.git.michal.simek@xilinx.com>
References: <cover.1578578535.git.michal.simek@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Label property is adding capability to distiguish chips from each other
when iio framework is used.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 .../boot/dts/xilinx/zynqmp-zcu106-revA.dts     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
index d136ce1fb07e..6e9efe233838 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
@@ -253,60 +253,70 @@ i2c@0 {
 			u76: ina226@40 { /* u76 */
 				compatible = "ti,ina226";
 				#io-channel-cells = <1>;
+				label = "ina226-u76";
 				reg = <0x40>;
 				shunt-resistor = <5000>;
 			};
 			u77: ina226@41 { /* u77 */
 				compatible = "ti,ina226";
 				#io-channel-cells = <1>;
+				label = "ina226-u77";
 				reg = <0x41>;
 				shunt-resistor = <5000>;
 			};
 			u78: ina226@42 { /* u78 */
 				compatible = "ti,ina226";
 				#io-channel-cells = <1>;
+				label = "ina226-u78";
 				reg = <0x42>;
 				shunt-resistor = <5000>;
 			};
 			u87: ina226@43 { /* u87 */
 				compatible = "ti,ina226";
 				#io-channel-cells = <1>;
+				label = "ina226-u87";
 				reg = <0x43>;
 				shunt-resistor = <5000>;
 			};
 			u85: ina226@44 { /* u85 */
 				compatible = "ti,ina226";
 				#io-channel-cells = <1>;
+				label = "ina226-u85";
 				reg = <0x44>;
 				shunt-resistor = <5000>;
 			};
 			u86: ina226@45 { /* u86 */
 				compatible = "ti,ina226";
 				#io-channel-cells = <1>;
+				label = "ina226-u86";
 				reg = <0x45>;
 				shunt-resistor = <5000>;
 			};
 			u93: ina226@46 { /* u93 */
 				compatible = "ti,ina226";
 				#io-channel-cells = <1>;
+				label = "ina226-u93";
 				reg = <0x46>;
 				shunt-resistor = <5000>;
 			};
 			u88: ina226@47 { /* u88 */
 				compatible = "ti,ina226";
 				#io-channel-cells = <1>;
+				label = "ina226-u88";
 				reg = <0x47>;
 				shunt-resistor = <5000>;
 			};
 			u15: ina226@4a { /* u15 */
 				compatible = "ti,ina226";
 				#io-channel-cells = <1>;
+				label = "ina226-u15";
 				reg = <0x4a>;
 				shunt-resistor = <5000>;
 			};
 			u92: ina226@4b { /* u92 */
 				compatible = "ti,ina226";
 				#io-channel-cells = <1>;
+				label = "ina226-u92";
 				reg = <0x4b>;
 				shunt-resistor = <5000>;
 			};
@@ -319,48 +329,56 @@ i2c@1 {
 			u79: ina226@40 { /* u79 */
 				compatible = "ti,ina226";
 				#io-channel-cells = <1>;
+				label = "ina226-u79";
 				reg = <0x40>;
 				shunt-resistor = <2000>;
 			};
 			u81: ina226@41 { /* u81 */
 				compatible = "ti,ina226";
 				#io-channel-cells = <1>;
+				label = "ina226-u81";
 				reg = <0x41>;
 				shunt-resistor = <5000>;
 			};
 			u80: ina226@42 { /* u80 */
 				compatible = "ti,ina226";
 				#io-channel-cells = <1>;
+				label = "ina226-u80";
 				reg = <0x42>;
 				shunt-resistor = <5000>;
 			};
 			u84: ina226@43 { /* u84 */
 				compatible = "ti,ina226";
 				#io-channel-cells = <1>;
+				label = "ina226-u84";
 				reg = <0x43>;
 				shunt-resistor = <5000>;
 			};
 			u16: ina226@44 { /* u16 */
 				compatible = "ti,ina226";
 				#io-channel-cells = <1>;
+				label = "ina226-u16";
 				reg = <0x44>;
 				shunt-resistor = <5000>;
 			};
 			u65: ina226@45 { /* u65 */
 				compatible = "ti,ina226";
 				#io-channel-cells = <1>;
+				label = "ina226-u65";
 				reg = <0x45>;
 				shunt-resistor = <5000>;
 			};
 			u74: ina226@46 { /* u74 */
 				compatible = "ti,ina226";
 				#io-channel-cells = <1>;
+				label = "ina226-u74";
 				reg = <0x46>;
 				shunt-resistor = <5000>;
 			};
 			u75: ina226@47 { /* u75 */
 				compatible = "ti,ina226";
 				#io-channel-cells = <1>;
+				label = "ina226-u75";
 				reg = <0x47>;
 				shunt-resistor = <5000>;
 			};
-- 
2.24.0

