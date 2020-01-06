Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 583A6C33C9E
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 22:16:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2ED5F2080A
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 22:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578348961;
	bh=bs/08X9tAF095TJQpY6dkFHokbOPLHKSZfjlCyMHFdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=McDFG0WGpIy9sSng2mw2KcJeZtaR4HLm7L2pp5HvWhn5F1ZR1+v15NOSy5SEJ51GT
	 3kJBQjyTPUOtXRRaxt9fv3k3z9Cp33CKkAP08ZvTbkd/KKfyyjm+UNNwmD2hpHcwnr
	 D52faVDtLI1Xp+58E3WxFJb/G9AIdGBVKxFPedvM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgAFWQA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 17:16:00 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41475 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgAFWQA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 17:16:00 -0500
Received: by mail-ot1-f65.google.com with SMTP id r27so73578587otc.8
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 14:16:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Q4aqEcEXQdHw3uki8qu3nWuz9k6ghGOYowLINem0O0M=;
        b=cWYsZn2HDGquWITVlUEHbRJ9MTPGzfZlwAb/1v2l61YG1TYOsZomwyap/cPIXGcS+9
         9byK4xsz/UMm2UqPSknrhtnQMo5g8sOfgPOZSuseyc79n+EqEeBc2gT37R9nJM2hWzmq
         kOurA+1/IGfmwrJRqsmGSibGqoNvvjBoJe+7L5gWOLovwOupwVjj4AZIq2E7IAmqU0Yd
         9euz+3Bz6woo8RniMXhXLL6NEa5TJkvC4mp5S6akPsiw+GxS/JfKGwLbAIzP/rrAWX8X
         hNVAcLcrYlToT0zNVvaNwUd4qi2aZjaLUQZnO68kjS7Jwc4us+Nh6jAut1C0Yls2W/Dd
         KFqg==
X-Gm-Message-State: APjAAAVLD/DAlKeEVkDfZi/OJ9kOGTu+7TJTKGj+b6KLSbXes/hK9evH
        KYMK3njaeZvV0gbP5N3IamDgzw0=
X-Google-Smtp-Source: APXvYqz3BvLNmeHGF0SCmMLarGuq+bbm/94fBctVDYde1n0ZPz3Dk11dPdwj536VCfVp48X9vSLKuw==
X-Received: by 2002:a9d:6745:: with SMTP id w5mr104784294otm.52.1578348958899;
        Mon, 06 Jan 2020 14:15:58 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id d7sm18887834oic.46.2020.01.06.14.15.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 14:15:57 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22043f
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 16:15:54 -0600
Date:   Mon, 6 Jan 2020 16:15:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 1/4] dt-bindings: Add Broadcom AVS RO thermal
Message-ID: <20200106221554.GA26925@bogus>
References: <1578072236-31820-1-git-send-email-wahrenst@gmx.net>
 <1578072236-31820-2-git-send-email-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578072236-31820-2-git-send-email-wahrenst@gmx.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jan 03, 2020 at 06:23:53PM +0100, Stefan Wahren wrote:
> Since the BCM2711 doesn't have a AVS TMON block, the thermal information
> must be retrieved from the AVS ring oscillator block. This block is part
> of the AVS monitor which contains a bunch of raw sensors.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  .../bindings/thermal/brcm,avs-ro-thermal.yaml      | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
> 
> diff --git a/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml b/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
> new file mode 100644
> index 0000000..7dce05e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: GPL-2.0+

Dual license new bindings please:

(GPL-2.0-only OR BSD-2-Clause)

With that:

Reviewed-by: Rob Herring <robh@kernel.org>
