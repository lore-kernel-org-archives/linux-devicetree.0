Return-Path: <SRS0=vtFV=5K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465D6C1975A
	for <linux-devicetree@archiver.kernel.org>; Wed, 25 Mar 2020 15:44:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1DFE220740
	for <linux-devicetree@archiver.kernel.org>; Wed, 25 Mar 2020 15:44:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BQj5OkGj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727642AbgCYPoE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 25 Mar 2020 11:44:04 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45520 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727488AbgCYPoE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 25 Mar 2020 11:44:04 -0400
Received: by mail-lj1-f195.google.com with SMTP id t17so2930012ljc.12
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2020 08:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LBAifNBmrJnMhjXFj42AkkhqZk/DQgMX1I7zEeLO1KM=;
        b=BQj5OkGjAfRNIZLzNB09MAQd/d6rMp+y/3v/RIjRwrlpz81TLpzSf574xy/Fzl7TWc
         /CnJxZQkyKsuI2hoYgY/UcZrNpajW/YYPP0OOU7g5Nz/CllobgzdUZOJK22HsGxZmNBf
         SzrH6aZ5hgUTYeckKeYq9JSpshRCWflklBFg9xgRIjWUjef35vEidrAzDW6isEjPiRRV
         VZptdUit+XcCDzugpMaYWb0ADXPmkqRaKu2WGVuv6JDxh1NxtYWzsOUzkYZwiYwkN0Ri
         K32sgHweA6E+NuYJZWEucxvaA5w8ELuazdl49BTu7DSaKyFxSKhbTslV9+C+TNMsVfL5
         9fVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LBAifNBmrJnMhjXFj42AkkhqZk/DQgMX1I7zEeLO1KM=;
        b=ZD9WbEIazz65Mgl3HOcICQ5rORJZkzJY7JQp3ZWwv4S5pH3g4IIeQ/ywYfmG3Vn76S
         Y3w4gp+7QWTNxwy+ztiTR8NavEIaQv28Nr9IgUQrvY/roNPONmoObebMJ96GleEJtvJx
         oqR0RQbHmS8tp4von65PdWrwqPSurHq7R5up3b+xmPW0r5k+WNoMTsMyTiz8OfsoLSMn
         rxtNsOKPEfQGjhmkvm2IDcHiWT899OSQbqCPMb4gcV7udatj7WS/Nt5niaxYnkwmvZeQ
         tuV8yt2cxj6eHYlo7uEtrWuejcgm/77fH99ztWHpMoN9BimdQf9BdDQHKVM5Zj3JuqUa
         hryw==
X-Gm-Message-State: ANhLgQ0BNMx9f3if9S4yBBI0iFKfl76arrl5GRgbgrKZGRb1FLrcCFHB
        ESMhk3HQBBRmQo/wSRPhUfUO8+oU48w/ycHiszw6kg==
X-Google-Smtp-Source: APiQypLy1o1jAyUhx+0b/e3QcaAKhZzmljoMl1rKjv8eoyonaedCEKN0p1ZyRQD0GsUQPUQztHMcDRDH5VU2lJagPw8=
X-Received: by 2002:a2e:9497:: with SMTP id c23mr2340592ljh.286.1585151042137;
 Wed, 25 Mar 2020 08:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200324180513.3882-1-robh@kernel.org>
In-Reply-To: <20200324180513.3882-1-robh@kernel.org>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Wed, 25 Mar 2020 21:13:50 +0530
Message-ID: <CAP245DWvF+BPczjQgcwrSoYrAB7DxVaz+LSphbBMo00JT=O85w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: tsens: Fix nvmem-cell-names schema
To:     Rob Herring <robh@kernel.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Mar 24, 2020 at 11:35 PM Rob Herring <robh@kernel.org> wrote:
>
> There's a typo 'nvmem-cells-names' in the schema which means the correct
> 'nvmem-cell-names' in the examples are not checked. The possible values
> are wrong too both in that the 2nd entry is not specified correctly and the
> values are just wrong based on the dts files in the kernel.


Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> Fixes: a877e768f655 ("dt-bindings: thermal: tsens: Convert over to a yaml schema")
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Amit Kucheria <amit.kucheria@linaro.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/thermal/qcom-tsens.yaml          | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index eac644d9e238..7a38d2116059 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -52,13 +52,12 @@ properties:
>      description:
>        Reference to an nvmem node for the calibration data
>
> -  nvmem-cells-names:
> +  nvmem-cell-names:
>      minItems: 1
>      maxItems: 2
>      items:
> -      - enum:
> -        - caldata
> -        - calsel
> +      - const: calib
> +      - const: calib_sel
>
>    "#qcom,sensors":
>      allOf:
> @@ -124,7 +123,7 @@ examples:
>                   <0x4a8000 0x1000>; /* SROT */
>
>             nvmem-cells = <&tsens_caldata>, <&tsens_calsel>;
> -           nvmem-cell-names = "caldata", "calsel";
> +           nvmem-cell-names = "calib", "calib_sel";
>
>             interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
>             interrupt-names = "uplow";
> --
> 2.20.1
>
