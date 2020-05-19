Return-Path: <SRS0=7YFh=7B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14D4C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 20:13:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9121A20829
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 20:13:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="gBvhIeyF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726978AbgESUNY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 May 2020 16:13:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgESUNX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 May 2020 16:13:23 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C00C08C5C0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 13:13:23 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id h26so620798lfg.6
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 13:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1NYHvA+/pry/oT1dXbXyyamtkH2aPraSmDT66YhYCyA=;
        b=gBvhIeyFI3gy8ClNDN+i0017lijbJdlivhzXqgTSaPYx8tSrRPLIG8KJCHGytIjwhr
         CBdgdM4mXj/FPLduuELUIyH1HS8E1jnHzFrtw9WY8FkzxMOVm9v6YZ2Vly3C3QMeUvLn
         iy/joKS88OO6ClBoGLh/1dnWn929dt7xDg8WWk4L7UPqkxb1uaujYY+1QLz3F3dkfqOn
         Lm/oQMBxIFHgFbAYwFHN3CwkHCJArMmHiTMSO3DvZLf3NO53zgXU2nHrgLdmmqIzye7z
         zsdtyujFdqiyYHeaOVvJp7p/jF+eAR1oQXYBMLg6bPiqSFA65onADEXvpnn3nP7s5ERd
         OiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1NYHvA+/pry/oT1dXbXyyamtkH2aPraSmDT66YhYCyA=;
        b=CY9JTVJxfkyAwHkYHKMtrP6X+/rSvgzsNt77BhgnSTjiluda+HIXKIBCCMT5Txwj6r
         zd9HXZwFFyRzeRsBzx1FgXGI92ioeLKGqXrdDdDMrrHRiT/8LEX1n9dgAO6Lk1K5HiZk
         IKsMtpmpSIhhCHw13wdoqA9cVpEbfWtrjVt49fbCN74jOIJbnRZ8/1ruG8xa3NkQOPMG
         NHjhMFzyZxFIobNExIn35oMkEIf7prEKlHh7C3CNuY+4trufWUK54Z9hTGkHqAFfhywj
         llO75HSD7EmjrcVG8lccKvu/hbwq5R68Xk+7Y403AT8BFrrPDlCkKNt4T4hnuxl3fZOR
         EiDA==
X-Gm-Message-State: AOAM530o+8wTEf7lAk15Tr1YDi8B9RNU079stuMzGT0e+oNRajjGBiZz
        ZLzx4DpiJ8HS9glaH4ioDlprtQ==
X-Google-Smtp-Source: ABdhPJzRY6Dgi8KKX9J88laAfIw+byZfxOKO2k7v4wTbDIKzAyEiMSo0+5bSS3sBQ61wC1/eiEAXFg==
X-Received: by 2002:ac2:4145:: with SMTP id c5mr363264lfi.91.1589919201648;
        Tue, 19 May 2020 13:13:21 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:2c3:baf8:452e:b00:c0e9:c252])
        by smtp.gmail.com with ESMTPSA id h26sm352546lja.0.2020.05.19.13.13.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 May 2020 13:13:20 -0700 (PDT)
Subject: PATCH v2 1/2] arm64: dts: renesas: r8a77980: add RPC-IF support
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
References: <850d4a7b-4984-eb0f-de89-e5c39d61d19e@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <f18853d9-8ef9-717a-9039-2191b26e579f@cogentembedded.com>
Date:   Tue, 19 May 2020 23:13:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <850d4a7b-4984-eb0f-de89-e5c39d61d19e@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Describe RPC-IF in the R8A77980 device tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- removed the R8A77970 part, renamed the patch, and updated the description;
- renamed the RPC-IF node to "spi@ee200000";
- updated the R8A77980 RPC-IF "compatible" prop to match the bindings;
- split the 1st region in the "reg"/"reg-names" props for the WBUF registers;
- refreshed the patch.

 arch/arm64/boot/dts/renesas/r8a77980.dtsi |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

Index: renesas-devel/arch/arm64/boot/dts/renesas/r8a77980.dtsi
===================================================================
--- renesas-devel.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ renesas-devel/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -1344,6 +1344,23 @@
 			status = "disabled";
 		};
 
+		rpc: spi@ee200000 {
+			compatible = "renesas,r8a77980-rpc-if",
+				     "renesas,rcar-gen3-rpc-if";
+			reg = <0 0xee200000 0 0x200>,
+			      <0 0x08000000 0 0x4000000>,
+			      <0 0xee208000 0 0x100>;
+			reg-names = "regs", "dirmap", "wbuf";
+			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 917>;
+			clock-names = "rpc";
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 917>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@f1010000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
