Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAB9C33CA2
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 14:03:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4319E20720
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 14:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578492218;
	bh=+MCUxMzGd+RDqcP+vQKQ3F1cAmV9C3Q5FeohSf0f5ec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=K/y1qXSSWV6mTHp4eRyL23s+LvK9nOOyI4ITImLT+AW8sI7WaGvAF69aOVGtE1Bpc
	 4Nuv89mmh8uWLUK1j2eLrt6SlZSJzpwli6NWC8jqO3/Mm6IvcHHoiNNa+ZpPQVVcmu
	 SthUQrU9w2BWwHAxuVOwTmUASOCpB5x+nZqtlJ+A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgAHODh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 09:03:37 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44568 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbgAHODg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 09:03:36 -0500
Received: by mail-ot1-f68.google.com with SMTP id h9so3618002otj.11
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 06:03:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1qDRUzHeFwyAUO2Q/767FDAbVLRtOK6UuSxm91oaf74=;
        b=Muw2E6UL5Fb+Yr83xvxjVcsgQuwzuBNX5gCTrMO+bMcUFAgl7ec8Y5vsM9EsBJwilK
         /omLTAJOLkQFiVQ3H1vnoZrfMMJhnRCkjEEOkFpawq2f/4XS4zkYCXiyOmBhmZDFnSKj
         5GO4jp6Em3X8vT/2HuMhp6GLOKNTlmpEuJE0ovL8Jz0VTz8TKITc0SOLlT8/k4ydYCNL
         oew3h7p6gBuabaGaVV9k8rwuBANK58tIpmHK4b4KXp5EPXBDRD6fU0o4PdO8MbBzd1NE
         PpHWd2tx8WogObkkNXK0kiOTRMGIF3M/m+eZEuqX0q1EyYKC0/Ls4uYojiZdp6s4DTl/
         CmVA==
X-Gm-Message-State: APjAAAVkuV+cvizY9sdX1NUQDOL5m2jREb20pYhy1fKwtbvSPwnf+ejl
        ShS3M29OhUwJ0iwMdJcCeHCQF4A=
X-Google-Smtp-Source: APXvYqzgdJvpppIhz9AlGBeu+c2JH7A/lnL7MknJRdUe8lwldwZQzCkmOS4IhhMkhmdcKE5/TiPitg==
X-Received: by 2002:a9d:70d9:: with SMTP id w25mr4458390otj.231.1578492215572;
        Wed, 08 Jan 2020 06:03:35 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g19sm1140983otj.1.2020.01.08.06.03.34
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 06:03:34 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 08:03:33 -0600
Date:   Wed, 8 Jan 2020 08:03:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] DT: bindings: Add cooling cells for idle states
Message-ID: <20200108140333.GA12276@bogus>
References: <20191219221932.15930-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191219221932.15930-1-daniel.lezcano@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Dec 19, 2019 at 11:19:27PM +0100, Daniel Lezcano wrote:
> Add DT documentation to add an idle state as a cooling device. The CPU
> is actually the cooling device but the definition is already used by
> frequency capping. As we need to make cpufreq capping and idle
> injection to co-exist together on the system in order to mitigate at
> different trip points, the CPU can not be used as the cooling device
> for idle injection. The idle state can be seen as an hardware feature
> and therefore as a component for the passive mitigation.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/idle-states.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)

This is now a schema in my tree. Can you rebase on that and I'll pick up 
the binding change.

Rob
