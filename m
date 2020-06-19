Return-Path: <SRS0=bA0P=AA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C076BC433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 20:21:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BDE7206C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 20:21:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="QNlaYFSj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392016AbgFSUVm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 19 Jun 2020 16:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389360AbgFSUVk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 19 Jun 2020 16:21:40 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7DCC0613EE
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2020 13:21:40 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id y11so12928712ljm.9
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2020 13:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LUBR4CULljFUZ9PDSVX5KbmdMj0OiDPwIg7vSOQMetQ=;
        b=QNlaYFSjvf9NC/TSd7BE/N2D9vWtKgE8mBozN/DzLanRll1xVP33aNJFckyW08QTZa
         uSktLWSJeaWe6qVnG5OjOq2lsDFSwc8c1ze05l+Z2IB5geXBxVUQGb7hcTooKcKAe2ep
         uXMblxqiLTuf8HYd220hsaJQ2dcTXw5Ez/3UC27wVr7k4WedIVor7x83pcQf5K47FjzO
         y40sMk+wnI7rUD12FHkYNq+W61sK/q8Dw1YBZmMmEngxFwaEUQWjdVM21GjDevFDy6Gd
         BsaAj7pTfd9wICKnhp59BihM/wEJxHoRzJ+THZ3sDXxka23sIUxVMRiOZ8bCwLdyP3N9
         fQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=LUBR4CULljFUZ9PDSVX5KbmdMj0OiDPwIg7vSOQMetQ=;
        b=s69TG8S3knURYhMxB4HOfc8k/NT1JGM+OGd1hBMf9x5Brvrb1nnMXVbUroMs3dioU0
         CITWWfikacsmli9uykq8B91/C1yZ/lYYcTUhC5ehn6aizow4GP0t/T0B4XHiqO7H+/aw
         8rh/zJsNsaNErwaOpPfXei6WrLf01+bhrEphuiD8xGC0pj1fv2qMrllcV1LZQsEMtnem
         McHB4pU/jRgL4uQRiaTXGuwtV8nxuUS1akVARZF35KDawVNZ29kSfdtmTBuIY9UcsTEM
         Lf8ZHQISLgXRKMczmUCMSwI4Nu7uXwT6jgRmAOE1yzLklt3gYZOnKB93OErNo5SKdCOp
         HEuA==
X-Gm-Message-State: AOAM533f1o+Ro9pZoUIBUq5MXY9r6FmBPJCK2dV4LjQRJOoyOQGkGbEQ
        Kv716gspvk0eZ64s9rSY2R44Cw==
X-Google-Smtp-Source: ABdhPJwEuxEbpJcCU+QAdtPf83HUNRNDcXOLnWwwodMrY8VTMdGcnhaaxKtYFl/mjdm1gkW3XNPNxA==
X-Received: by 2002:a2e:8690:: with SMTP id l16mr2341085lji.462.1592598098981;
        Fri, 19 Jun 2020 13:21:38 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:441c:ac8f:7564:6e7d:9e36:7ded])
        by smtp.gmail.com with ESMTPSA id r11sm1591776lfc.29.2020.06.19.13.21.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jun 2020 13:21:38 -0700 (PDT)
Subject: [PATCH v2 1/2] arm64: dts: renesas: r8a77970: add RPC-IF support
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
References: <13425133-eedf-081f-4ed7-cd9012ce7d6d@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <ba8bb326-7e77-6ab7-668f-fdc22010c8ef@cogentembedded.com>
Date:   Fri, 19 Jun 2020 23:21:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <13425133-eedf-081f-4ed7-cd9012ce7d6d@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Describe RPC-IF in the R8A77970 device tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- removed the R8A77980 part, renamed the patch, and updated the description;
- renamed the RPC-IF node to "spi@ee200000";
- updated the R8A77970 RPC-IF "compatible" prop to match the bindings;
- split the 1st region in the "reg"/"reg-names" props for the WBUF registers;
- refreshed the patch.

 arch/arm64/boot/dts/renesas/r8a77970.dtsi |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

Index: renesas-devel/arch/arm64/boot/dts/renesas/r8a77970.dtsi
===================================================================
--- renesas-devel.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ renesas-devel/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -1039,6 +1039,23 @@
 			status = "disabled";
 		};
 
+		rpc: spi@ee200000 {
+			compatible = "renesas,r8a77970-rpc-if",
+				     "renesas,rcar-gen3-rpc-if";
+			reg = <0 0xee200000 0 0x200>,
+			      <0 0x08000000 0 0x4000000>,
+			      <0 0xee208000 0 0x100>;
+			reg-names = "regs", "dirmap", "wbuf";
+			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 917>;
+			clock-names = "rpc";
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			resets = <&cpg 917>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@f1010000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
