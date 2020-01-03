Return-Path: <SRS0=7PY0=2Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F47C00523
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 22:32:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56DDD227BF
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 22:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578090749;
	bh=N49noEXNds+w4WsW60C+fFauAE6eurYgQnBP4kyunw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=tneo7WXewMix1Z7r+doCQxkT4kbwqRtcBca5nOUJMOg5+KBBPdjShHrBriehSlHNq
	 Y3c1QqsGW4yAp/7sdv/QCpzpkNG61W7wZT80aiDSsS8+1PCd8+bRkkM0yLVVx/6xhA
	 juJpxeQIYGdVLpmn3tv5tqB0i2oFN+QQDMbWIIvM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728820AbgACWc3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 17:32:29 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:36531 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728687AbgACWc2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 17:32:28 -0500
Received: by mail-il1-f194.google.com with SMTP id b15so37889671iln.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 14:32:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AwM+4lmsp4OwDXSOplbN0YrPFwHAVZ/Q655/TuvMXxw=;
        b=rqj4ClpfgaRoKQdWZumHoa++zjeXZ69JmLV/qA+Mpau80nVOLq3dZFEJN6NHuWBX7M
         XrcrGE96QJ7ldKl1wK5xjMLWPjcg66OfEMZnTgGt6X+dCjiaph1AlxTHaNTThHNsVW0F
         6C3sjamogTXt12MBHg3tEf/qNpsQwqc5UVh5BNP8UFObB+WcLY+r/+hQZ/79ewV469XY
         LHqiMXQeRwsS6pHQg5Kt0NY6i8+jBSRGkxuQzuy7+3JXvjeAm6CKBKmLiOxYg4EQQ7bM
         ghMbqzPvPM6XVEmJY3YpbbYEo3ufER4oLmGm8caK2QsMbkmyj+MhHeKPHNTdpIvtqW9T
         uyPw==
X-Gm-Message-State: APjAAAVhvktfJPIA14ywDuAEfHYkMknAI8SGwpdfK0KKDtlErvfl2qAN
        8j4esmPofa3ISWB7/7dDAIMXN7s=
X-Google-Smtp-Source: APXvYqyDDVEFQYpazgiK4wflftlB+MpFlEz1ugqn8y6QMbeZctYaL6GvNh4AH7J8Y8SCpzcRXUYpHw==
X-Received: by 2002:a92:5d03:: with SMTP id r3mr72527148ilb.278.1578090747625;
        Fri, 03 Jan 2020 14:32:27 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id q11sm12368711ioi.25.2020.01.03.14.32.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 14:32:27 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 15:32:25 -0700
Date:   Fri, 3 Jan 2020 15:32:25 -0700
From:   Rob Herring <robh@kernel.org>
To:     Robert Jones <rjones@gateworks.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/5] dt-bindings: arm: fsl: Add Gateworks Ventana
 i.MX6DL/Q compatibles
Message-ID: <20200103223225.GB654@bogus>
References: <20191230231953.29646-1-rjones@gateworks.com>
 <20191230231953.29646-2-rjones@gateworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191230231953.29646-2-rjones@gateworks.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Dec 30, 2019 at 03:19:49PM -0800, Robert Jones wrote:
> Add the compatible enum entries for Gateworks Ventana boards.
> 
> Signed-off-by: Robert Jones <rjones@gateworks.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 31 ++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index f79683a..8ed4c85 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -126,6 +126,22 @@ properties:
>                - toradex,apalis_imx6q-ixora      # Apalis iMX6 Module on Ixora
>                - toradex,apalis_imx6q-ixora-v1.1 # Apalis iMX6 Module on Ixora V1.1
>                - variscite,dt6customboard
> +              - gw,ventana                # Gateworks i.MX6DL or i.MX6Q Ventana
> +              - gw,imx6q-gw51xx

This doesn't match what you have in dts files. Please check with:

make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/fsl.yaml

You'll need a separate entry with 3 compatibles and 'gw,ventana' or drop 
it.

> +              - gw,imx6q-gw52xx
> +              - gw,imx6q-gw53xx
> +              - gw,imx6q-gw5400-a
> +              - gw,imx6q-gw54xx
> +              - gw,imx6q-gw551x
> +              - gw,imx6q-gw552x
> +              - gw,imx6q-gw553x
> +              - gw,imx6q-gw560x
> +              - gw,imx6q-gw5903
> +              - gw,imx6q-gw5904
> +              - gw,imx6q-gw5907
> +              - gw,imx6q-gw5910
> +              - gw,imx6q-gw5912
> +              - gw,imx6q-gw5913
>            - const: fsl,imx6q
>  
>        - description: i.MX6QP based Boards
> @@ -152,6 +168,21 @@ properties:
>                - ysoft,imx6dl-yapp4-draco  # i.MX6 DualLite Y Soft IOTA Draco board
>                - ysoft,imx6dl-yapp4-hydra  # i.MX6 DualLite Y Soft IOTA Hydra board
>                - ysoft,imx6dl-yapp4-ursa   # i.MX6 Solo Y Soft IOTA Ursa board
> +              - gw,ventana                # Gateworks i.MX6DL or i.MX6Q Ventana
> +              - gw,imx6dl-gw51xx
> +              - gw,imx6dl-gw52xx
> +              - gw,imx6dl-gw53xx
> +              - gw,imx6dl-gw54xx
> +              - gw,imx6dl-gw551x
> +              - gw,imx6dl-gw552x
> +              - gw,imx6dl-gw553x
> +              - gw,imx6dl-gw560x
> +              - gw,imx6dl-gw5903
> +              - gw,imx6dl-gw5904
> +              - gw,imx6dl-gw5907
> +              - gw,imx6dl-gw5910
> +              - gw,imx6dl-gw5912
> +              - gw,imx6dl-gw5913
>            - const: fsl,imx6dl
>  
>        - description: i.MX6SL based Boards
> -- 
> 2.9.2
> 
