Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD1EC35656
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 16:26:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D81C9208E4
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 16:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582302417;
	bh=t1V43wNRmlXXbwHM5UCwthYHCaU8uRTSqTXicUUb1OA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=wnH0sVsv0Cxjux/mE6VAY8/4frA+FhfgPTMcy38YALk2caR4KY0EzC2yXQF6fSWxF
	 sHC+7tu5R9dUEhGB78lp1Jw1AOR1nJfi/rX2ekJwIXG5GtmevE4BdlSs5/TgOdzBzG
	 yvNUK//KlKBKNrs5f89ADcSkiiRtGUmuMV4riR8s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgBUQ05 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 11:26:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:35478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726342AbgBUQ05 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 21 Feb 2020 11:26:57 -0500
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7022F208E4
        for <devicetree@vger.kernel.org>; Fri, 21 Feb 2020 16:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582302416;
        bh=t1V43wNRmlXXbwHM5UCwthYHCaU8uRTSqTXicUUb1OA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nDNTY3NxX7sVLdRIdt3YPByd9Kv7CBWyk5mK1+pILwo8B/tIagUKlZB2GyeE65jg7
         qKK/qvZs6rVBVnfHKWFiaAWtbzhYCyxkcY6pzo6HGUKrpiDlaQQPJNCo6V4TrOiA7P
         fzA4sFEipaf1po4oM4UyDnGBcLq3/XPdySgDs+9Y=
Received: by mail-qt1-f172.google.com with SMTP id d9so1643721qte.12
        for <devicetree@vger.kernel.org>; Fri, 21 Feb 2020 08:26:56 -0800 (PST)
X-Gm-Message-State: APjAAAWjYXExb4zoSuPFVx+rm3UgS+O0/nVOiNrst5O8KoUE3jeNvxqW
        UWPeUUPnrqdEeZMLDm9KSfg3fN6pwJ7mHjLQRA==
X-Google-Smtp-Source: APXvYqy3IJCfMKCYhwtA6Nh648QtdiZGkAdnsHguH4t6HAx9AAKqow0Va6pQMhbNm4jzkgv6vsm3zB5p0PonBGVLLc4=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr33281075qtj.300.1582302415519;
 Fri, 21 Feb 2020 08:26:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582300927.git.robin.murphy@arm.com> <3954ca0b86641e5e6a1935886df6658b9305ec4a.1582300927.git.robin.murphy@arm.com>
In-Reply-To: <3954ca0b86641e5e6a1935886df6658b9305ec4a.1582300927.git.robin.murphy@arm.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 21 Feb 2020 10:26:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKgz7N=nsA=TgJx=G9Zad77s39gyd3fwJV71-hdqokQpg@mail.gmail.com>
Message-ID: <CAL_JsqKgz7N=nsA=TgJx=G9Zad77s39gyd3fwJV71-hdqokQpg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: ARM: Add recent Cortex/Neoverse PMUs
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Feb 21, 2020 at 10:05 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> Add new PMU definitions to correspond with the CPU bindings.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/pmu.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
> index 52ae094ce330..cc52195d0e9e 100644
> --- a/Documentation/devicetree/bindings/arm/pmu.yaml
> +++ b/Documentation/devicetree/bindings/arm/pmu.yaml
> @@ -21,11 +21,20 @@ properties:
>        - enum:
>            - apm,potenza-pmu
>            - arm,armv8-pmuv3
> +          - arm,neoverse-n1-pmu
> +          - arm,neoverse-e1-pmu

We've managed to do some interesting sorting here. Oh well.

I'll take patches 1 and 2.

> +          - arm,cortex-a77-pmu
> +          - arm,cortex-a76-pmu
> +          - arm,cortex-a75-pmu
>            - arm,cortex-a73-pmu
>            - arm,cortex-a72-pmu
> +          - arm,cortex-a65-pmu
>            - arm,cortex-a57-pmu
> +          - arm,cortex-a55-pmu
>            - arm,cortex-a53-pmu
>            - arm,cortex-a35-pmu
> +          - arm,cortex-a34-pmu
> +          - arm,cortex-a32-pmu
>            - arm,cortex-a17-pmu
>            - arm,cortex-a15-pmu
>            - arm,cortex-a12-pmu
> --
> 2.23.0.dirty
>
