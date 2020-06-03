Return-Path: <SRS0=VnZl=7Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4345C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 08:30:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADE9D204EF
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 08:30:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vyc2OKuh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgFCIaT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 3 Jun 2020 04:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgFCIaS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jun 2020 04:30:18 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA966C05BD1E
        for <devicetree@vger.kernel.org>; Wed,  3 Jun 2020 01:30:18 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id p21so1237104pgm.13
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2020 01:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:user-agent:in-reply-to:references:mime-version
         :content-transfer-encoding:subject:to:cc:from:message-id;
        bh=Vm2rNwbfPao4e2I5pWY0wiZoJOeGk4AhOiG6Z/5T/cc=;
        b=Vyc2OKuhMNM+m3bEYlhMtN7QYParoLisO2XTS7OXJKQrXcq+BPboim9P6FyY+YoRbA
         sYp2r1vYXikG7w0aowvM3H44/AQ3Vx6koCEgm7kIIXnOjWKXANkm8QvGVmVORe/A4RC3
         RsAc4evczs7WiEQluUzli94TrYErfOP6VHrlf7wfeF9BF5b167vgEwvDvOGzoNXp80A2
         dqZIFLvtbY8xCi8fn/K/KEGohyRHLVs8FBxB76Wpg7MZrdoq5WhvCh8tUnmfn5FDJ4re
         QLLQS0X8QlyAh0z/JKkOVaKz6rnl4vyXhqPNWJLGQIF/dj6pe9vMq+w/EbqkEz2FUpM5
         Wx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:user-agent:in-reply-to:references
         :mime-version:content-transfer-encoding:subject:to:cc:from
         :message-id;
        bh=Vm2rNwbfPao4e2I5pWY0wiZoJOeGk4AhOiG6Z/5T/cc=;
        b=BDqbGHAFGHindpgabj+N2hYOyaGrZZFiOZItOTRj5jW7ArpU2kAR4ZG+B4IcJd+f2C
         mApyDL7d2+dgZVXThmiUeV6tPLDuoab4mEHrkuU0yeBJ8AICVaIpvSMn42In1W7pgCyp
         eD71SqKAYFHHK9DM3/fkxNdDBY6mw65rccGcR5bTd2RXfYj96gOHXCGqloSRLMN0YWHQ
         w1mPpAZ63ZLVMhf/Svzm/HHP+84Nm1jW14bEtABnTHkxZTW/JgRAL/a/ZlPcmPV9i3zN
         LKIdsmvJIzyOENX+8vLu/cPE8h9zadp7QtQ+4gHQdxbRrTLN51p4oqAcO5Q6dECWm1Nv
         Idag==
X-Gm-Message-State: AOAM533RmYD+awCurh1G1oxSj1n0xRPYrZ3ZuO41Txh8k8lv9kiK5FIe
        lE1tx3vixs50zV2Iy6nFViIu
X-Google-Smtp-Source: ABdhPJwtBYv4OfeBBiKv6vChqL7mdmvw08uaaouRRsDP2wtQ+XZeQo9VM+8C3RNZlD4J8wYKP3hEfg==
X-Received: by 2002:a63:7353:: with SMTP id d19mr28852908pgn.239.1591173018031;
        Wed, 03 Jun 2020 01:30:18 -0700 (PDT)
Received: from ?IPv6:2409:4072:6e19:d568:fc3d:9e72:444d:f928? ([2409:4072:6e19:d568:fc3d:9e72:444d:f928])
        by smtp.gmail.com with ESMTPSA id 207sm1240606pfw.190.2020.06.03.01.30.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 01:30:17 -0700 (PDT)
Date:   Wed, 03 Jun 2020 14:00:08 +0530
User-Agent: K-9 Mail for Android
In-Reply-To: <1591119192-18538-7-git-send-email-amittomer25@gmail.com>
References: <1591119192-18538-1-git-send-email-amittomer25@gmail.com> <1591119192-18538-7-git-send-email-amittomer25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 06/10] arm64: dts: actions: Add DMA Controller for S700
To:     Amit Singh Tomar <amittomer25@gmail.com>, andre.przywara@arm.com,
        afaerber@suse.de, vkoul@kernel.org, robh+dt@kernel.org
CC:     dan.j.williams@intel.com, cristian.ciocaltea@gmail.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <5B0DBC8E-36C3-4DC9-A5A4-043313C4C7FD@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 2 June 2020 11:03:08 PM IST, Amit Singh Tomar <amittomer25@gmail=2Ecom>=
 wrote:
>This commit adds DAM controller present on Actions S700, it differs

DMA

>from
>S900 in terms of number of dma channels and requests=2E
>
>Signed-off-by: Amit Singh Tomar <amittomer25@gmail=2Ecom>
>---
>Changes since v2:
>	* added power-domain property as sps
>          is enabled now and DMA needs it=2E
>Changes since v1:
>        * No Change=2E
>Changes since RFC:
>        * No Change=2E
>---
> arch/arm64/boot/dts/actions/s700=2Edtsi | 15 +++++++++++++++
> 1 file changed, 15 insertions(+)
>
>diff --git a/arch/arm64/boot/dts/actions/s700=2Edtsi
>b/arch/arm64/boot/dts/actions/s700=2Edtsi
>index f8eb72bb4125=2E=2E605594dd7a0e 100644
>--- a/arch/arm64/boot/dts/actions/s700=2Edtsi
>+++ b/arch/arm64/boot/dts/actions/s700=2Edtsi
>@@ -6,6 +6,7 @@
> #include <dt-bindings/clock/actions,s700-cmu=2Eh>
> #include <dt-bindings/interrupt-controller/arm-gic=2Eh>
> #include <dt-bindings/reset/actions,s700-reset=2Eh>
>+#include <dt-bindings/power/owl-s700-powergate=2Eh>

Sort this alphabetically=2E=20

Thanks,=20
Mani

>=20
> / {
> 	compatible =3D "actions,s700";
>@@ -244,5 +245,19 @@
> 				     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
> 				     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> 		};
>+
>+		dma: dma-controller@e0230000 {
>+			compatible =3D "actions,s700-dma";
>+			reg =3D <0x0 0xe0230000 0x0 0x1000>;
>+			interrupts =3D <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
>+				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
>+				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
>+				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
>+			#dma-cells =3D <1>;
>+			dma-channels =3D <10>;
>+			dma-requests =3D <44>;
>+			clocks =3D <&cmu CLK_DMAC>;
>+			power-domains =3D <&sps S700_PD_DMA>;
>+		};
> 	};
> };

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
