Return-Path: <SRS0=OpRu=5H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3DFC4332E
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Mar 2020 13:05:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 70A132072E
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Mar 2020 13:05:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ycH96OQA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgCVNF2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Mar 2020 09:05:28 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40494 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbgCVNF1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 22 Mar 2020 09:05:27 -0400
Received: by mail-wm1-f68.google.com with SMTP id a81so5632811wmf.5
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2020 06:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=y0obWhE6JeJc849b3MeKOon4JLevkMsZjwtU+Vr0Uc0=;
        b=ycH96OQAdISI3933+ye9qCoVatB4K42NRNk7emUGZaYrEic3edhPWkkbA8puFRRMUF
         A5k/ss5R9qp4pKEvBJiWhGgJ2JsvB7q+vEJye2y0j//K4imY1rdSOuaoN9DrK38LVivH
         FPS34GSzHRmbBsqxF1gnsKc9Fdgdy338Uw4vbUjTdz7QLl4vR9rj7C00RmO/Yspx9sls
         hOHQm9KOkPES7HF7Q5YXbRwP0Ap93CbjRjCYfz0oMty3pqcH2COYikxRcbEG6KOA15oD
         TTGgN1bNA2gxA30Gn5SteaFWOTdyTgVB4TDhSa4nkTGrumgB/0WIVcP/UwHb1wXeziAm
         Eovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=y0obWhE6JeJc849b3MeKOon4JLevkMsZjwtU+Vr0Uc0=;
        b=gkgHpBRSBovAa8JdEISWnPm8Kx9hfopZK22P3xegWCknCua1zTB//7FCzO9UiDrLXO
         E3V7yrrIqL4zZJAnDcCM1qs2mAd1POYd2pWmZSsmXelao8XhwqMcnVO1DgXv0cvaLIfl
         NovIoGUBiNfRGll7gY1NhtNI4gSbpC2ID87Xv8L0gwoFQCNnCkXtUiTunXlVQISAQXV+
         azAbnwHQBbs+6UPeLYV1RIGxy8UbDgbQ8yZJXDtpUknDs43lRm2NJh9hDLkuE9AvGqAE
         7OHxvZMZs8JTNYxNwfA+8Bc9M6hR3bzg9Iebc95EVGyCY+aWEygZhxobmRVOtba2oBYT
         DjBA==
X-Gm-Message-State: ANhLgQ1tDu7nzy3mCaz1CTsdUYjPgSbDNTgOumdVCuAabYkVO2hZtgCT
        fm9nEhqkxpJepSPVdDI81qfAbw==
X-Google-Smtp-Source: ADFU+vt663IbGfqXLqaBBoBd/TtlcKYWmh2rCAAdSzpeyW9dLOYoeNgoyGmVYk+sBiebfEUDTJQ5xw==
X-Received: by 2002:a05:600c:2190:: with SMTP id e16mr14938974wme.42.1584882325357;
        Sun, 22 Mar 2020 06:05:25 -0700 (PDT)
Received: from Armstrongs-MacBook-Pro.local ([2a01:e35:2ec0:82b0:5d7b:95e6:6719:f85a])
        by smtp.gmail.com with ESMTPSA id a11sm18675524wrx.54.2020.03.22.06.05.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Mar 2020 06:05:24 -0700 (PDT)
Subject: Re: [PATCH] ARM: dts: oxnas: Fix clear-mask property
To:     Sungbo Eo <mans0n@gorani.run>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200321143653.2412823-1-mans0n@gorani.run>
From:   Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <ca1a1cdc-6c20-bd2c-d1ea-edd6610f68a4@baylibre.com>
Date:   Sun, 22 Mar 2020 14:05:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200321143653.2412823-1-mans0n@gorani.run>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

Le 21/03/2020 à 15:36, Sungbo Eo a écrit :
> Disable all rps-irq interrupts during driver initialization to prevent
> an accidental interrupt on GIC.
> 
> Fixes: 84316f4ef141 ("ARM: boot: dts: Add Oxford Semiconductor OX810SE dtsi")
> Fixes: 38d4a53733f5 ("ARM: dts: Add support for OX820 and Pogoplug V3")
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
> ---
>  arch/arm/boot/dts/ox810se.dtsi | 4 ++--
>  arch/arm/boot/dts/ox820.dtsi   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ox810se.dtsi b/arch/arm/boot/dts/ox810se.dtsi
> index 9f6c2b660ed3..0755e5864c4a 100644
> --- a/arch/arm/boot/dts/ox810se.dtsi
> +++ b/arch/arm/boot/dts/ox810se.dtsi
> @@ -323,8 +323,8 @@ intc: interrupt-controller@0 {
>  					interrupt-controller;
>  					reg = <0 0x200>;
>  					#interrupt-cells = <1>;
> -					valid-mask = <0xFFFFFFFF>;
> -					clear-mask = <0>;
> +					valid-mask = <0xffffffff>;
> +					clear-mask = <0xffffffff>;
>  				};
>  
>  				timer0: timer@200 {
> diff --git a/arch/arm/boot/dts/ox820.dtsi b/arch/arm/boot/dts/ox820.dtsi
> index c9b327732063..90846a7655b4 100644
> --- a/arch/arm/boot/dts/ox820.dtsi
> +++ b/arch/arm/boot/dts/ox820.dtsi
> @@ -240,8 +240,8 @@ intc: interrupt-controller@0 {
>  					reg = <0 0x200>;
>  					interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
>  					#interrupt-cells = <1>;
> -					valid-mask = <0xFFFFFFFF>;
> -					clear-mask = <0>;
> +					valid-mask = <0xffffffff>;
> +					clear-mask = <0xffffffff>;
>  				};
>  
>  				timer0: timer@200 {
> 

Thanks a lot for the patch,
Acked-by: Neil Armstrong <narmstrong@baylibre.com>

I'll apply it asap and push it to arm-soc fixes.

Neil
