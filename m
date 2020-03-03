Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 926DBC3F2C6
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 12:56:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A48320873
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 12:56:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="w4Bzhtx2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbgCCM4S (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Mar 2020 07:56:18 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36030 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728921AbgCCM4S (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Mar 2020 07:56:18 -0500
Received: by mail-lj1-f194.google.com with SMTP id 195so3422558ljf.3
        for <devicetree@vger.kernel.org>; Tue, 03 Mar 2020 04:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=pqV06LQZUd28i1cTxW0Gc1ZSuLC1L8sbXgs7z0l8GAc=;
        b=w4Bzhtx2iPmqZTeVbcoWPtSMyw7Zj1fw4RtKD0zWxxI9s2ysXUWOC+1k6ZE9Br43nF
         TCn9q+ASnbrewxJnd3ytFaFiP/vlRttu/GdccU/hNnDZz5UXjoyA7KNIt8abwxNc8hCa
         KSRj+dY9wcIyXFTmPDwXJcJsRmeKOfWwaORQ+0DVUO24G0f/Mx4l73vgpPKDOuoHV4l9
         q/IN47eyfYhr4VLxTBydRewx7EI8PamoicBQgE1TRVe3x9ZgicKDPaw45uocesjvcKqY
         kTs8bkh7L3Tt5JF9AAscjIK8Lb3LHY6PXMNcrc9BE+VW6zwJhy+AEnGjvPFfHfwDpK18
         4/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=pqV06LQZUd28i1cTxW0Gc1ZSuLC1L8sbXgs7z0l8GAc=;
        b=KBuJeh/BkQ4PV0ivC+wtCDiS4cvo613WFOPfep3jUJApa7ymePUoDGINw6KS9kR47w
         N01yE0aRpEFchKIUtMOgk1Hq1qI/YFMZATPglT+BcldLbs7tl/ZAklzktluQFL10Xs4S
         PgFIaTL/4FUiFL99JE6GPU2SkiU0Heo0uHOleffRmbyogNXmlNM59De5GROmuRuw3HA0
         AOFQYWZ2bk99v+ryNNqzwUIiMR2PEm0arz2mFdlzdZa/2YuVyP6eDphxpwMM/h1fPXKm
         EqMZ5nX3oLbNeth5uh3zlRMyntjSpeM500ErD/Q0B1KvtCJjkftgl2bMKoEyr1SLjZig
         dD8A==
X-Gm-Message-State: ANhLgQ1WIo6LYTuACg+TZVXROK/u1hE5q0qD4YibstGaBc2oAjq2xi1X
        bls60pq78DMhfaSqWpiimmz29w==
X-Google-Smtp-Source: ADFU+vswquO+8MQTyhuHCYQBrwIlqLoyrpsDzoJjRsfVzZgxnXwwwvTm4N2QEn7BI1apENCJyG5/gA==
X-Received: by 2002:a2e:8790:: with SMTP id n16mr2393069lji.190.1583240176200;
        Tue, 03 Mar 2020 04:56:16 -0800 (PST)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id w20sm11912400lfk.25.2020.03.03.04.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 04:56:15 -0800 (PST)
Date:   Tue, 3 Mar 2020 13:56:15 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: power: apmu: Convert to json-schema
Message-ID: <20200303125615.GC571445@oden.dyn.berto.se>
References: <20200221121221.31298-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200221121221.31298-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2020-02-21 13:12:21 +0100, Geert Uytterhoeven wrote:
> Convert the Renesas Advanced Power Management Unit Device Tree binding
> documentation to json-schema.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../bindings/power/renesas,apmu.txt           | 35 ------------
>  .../bindings/power/renesas,apmu.yaml          | 55 +++++++++++++++++++
>  2 files changed, 55 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/power/renesas,apmu.txt
>  create mode 100644 Documentation/devicetree/bindings/power/renesas,apmu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/renesas,apmu.txt b/Documentation/devicetree/bindings/power/renesas,apmu.txt
> deleted file mode 100644
> index 5f24586c8cf33fcf..0000000000000000
> --- a/Documentation/devicetree/bindings/power/renesas,apmu.txt
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -DT bindings for the Renesas Advanced Power Management Unit
> -
> -Renesas R-Car and RZ/G1 SoCs utilize one or more APMU hardware units
> -for CPU core power domain control including SMP boot and CPU Hotplug.
> -
> -Required properties:
> -
> -- compatible: Should be "renesas,<soctype>-apmu", "renesas,apmu" as fallback.
> -	      Examples with soctypes are:
> -		- "renesas,r8a7743-apmu" (RZ/G1M)
> -		- "renesas,r8a7744-apmu" (RZ/G1N)
> -		- "renesas,r8a7745-apmu" (RZ/G1E)
> -		- "renesas,r8a77470-apmu" (RZ/G1C)
> -		- "renesas,r8a7790-apmu" (R-Car H2)
> -		- "renesas,r8a7791-apmu" (R-Car M2-W)
> -		- "renesas,r8a7792-apmu" (R-Car V2H)
> -		- "renesas,r8a7793-apmu" (R-Car M2-N)
> -		- "renesas,r8a7794-apmu" (R-Car E2)
> -
> -- reg: Base address and length of the I/O registers used by the APMU.
> -
> -- cpus: This node contains a list of CPU cores, which should match the order
> -  of CPU cores used by the WUPCR and PSTR registers in the Advanced Power
> -  Management Unit section of the device's datasheet.
> -
> -
> -Example:
> -
> -This shows the r8a7791 APMU that can control CPU0 and CPU1.
> -
> -	apmu@e6152000 {
> -		compatible = "renesas,r8a7791-apmu", "renesas,apmu";
> -		reg = <0 0xe6152000 0 0x188>;
> -		cpus = <&cpu0 &cpu1>;
> -	};
> diff --git a/Documentation/devicetree/bindings/power/renesas,apmu.yaml b/Documentation/devicetree/bindings/power/renesas,apmu.yaml
> new file mode 100644
> index 0000000000000000..09328d311d16422f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/renesas,apmu.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/power/renesas,apmu.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: DT bindings for the Renesas Advanced Power Management Unit
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +  - Magnus Damm <magnus.damm@gmail.com>
> +
> +description:
> +  Renesas R-Car Gen2 and RZ/G1 SoCs utilize one or more APMU hardware units for
> +  CPU core power domain control including SMP boot and CPU Hotplug.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r8a7743-apmu  # RZ/G1M
> +          - renesas,r8a7744-apmu  # RZ/G1N
> +          - renesas,r8a7745-apmu  # RZ/G1E
> +          - renesas,r8a77470-apmu # RZ/G1C
> +          - renesas,r8a7790-apmu  # R-Car H2
> +          - renesas,r8a7791-apmu  # R-Car M2-W
> +          - renesas,r8a7792-apmu  # R-Car V2H
> +          - renesas,r8a7793-apmu  # R-Car M2-N
> +          - renesas,r8a7794-apmu  # R-Car E2
> +      - const: renesas,apmu
> +
> +  reg:
> +    maxItems: 1
> +
> +  cpus:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      Array of phandles pointing to CPU cores, which should match the order of
> +      CPU cores used by the WUPCR and PSTR registers in the Advanced Power
> +      Management Unit section of the device's datasheet.
> +
> +required:
> +  - compatible
> +  - reg
> +  - cpus
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    apmu@e6152000 {
> +            compatible = "renesas,r8a7791-apmu", "renesas,apmu";
> +            reg = <0xe6152000 0x188>;
> +            cpus = <&cpu0 &cpu1>;
> +    };
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
