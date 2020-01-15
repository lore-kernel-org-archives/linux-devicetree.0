Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21320C33CB3
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 14:39:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E132E214AF
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 14:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579099146;
	bh=Vru0+4HoL/Avmuem0SAIOokFLrQcpL82fV+Pv9E7es0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Vj3IMQcymnvlf23lyGqLYH2aZP89eK3ZoZOkHKT9nXpR1b/ubjtVyID+40e46p/1C
	 yGEXNgYWscn/hDiH/jNKgi22ernPov/U80gO5mQkUkdwhIrhxKuApjrFFgTCViceqo
	 0XFmMPGZZ2SNoEltGVgI3I4pS0LFt7mF3UBA/zKE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgAOOjF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 09:39:05 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45639 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbgAOOjF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 09:39:05 -0500
Received: by mail-ot1-f66.google.com with SMTP id 59so16255641otp.12
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 06:39:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zVuLMr/lvKJoF5UPfuI+lUQAIQkXCUMqhXcAHAs8ml4=;
        b=FEnLtGiUkwDZxbYOPdNHll+HQl2Xo0RuD+nArol+3gMih9eH3ep483WYhxeGQP1DUb
         e4yLpBv4lzv3bt9wmR5S5vd0++1hKKg3aqI8P/cXXGqLAP0mmOoZ2PhvJf1y3bsxTT/F
         TJO3c3ASgec13wJUj9vIWDq/7gcoz3uBNpvVnfBrx8NMjrUPdtVOjOr5LH8m7EDrQxYC
         i9s2vVEs3cO5IUJ1xR8/jOfKaUuZROfQQMqdHmdun+9klB3CDFL790URh9nzdJ9GsTN6
         Ux97oRXMs0JukuOKcpvc0zbXub7ztHMDbOlUm2HlYW/U4LdqzwhunbNWNz14UZYw6enS
         d9/g==
X-Gm-Message-State: APjAAAWarWhH47h92kQLCNZrIJ+WUPCnoF1SobLg+wKq8yvVdzrc/i2m
        xL2g8W8CAgLde/UAAX+WerrOWz8=
X-Google-Smtp-Source: APXvYqwk9eO3AFZNo8EDVIXdx0kWskmYvN4oBPr6Qu+0XWkiqJzg7Zqg/gvoK9a+EMgiXvibSYFWwg==
X-Received: by 2002:a05:6830:1042:: with SMTP id b2mr2897560otp.306.1579099143397;
        Wed, 15 Jan 2020 06:39:03 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x26sm762052oto.7.2020.01.15.06.39.01
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:39:02 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220379
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 08:39:01 -0600
Date:   Wed, 15 Jan 2020 08:39:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     David Dai <daidavid1@codeaurora.org>
Cc:     georgi.djakov@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, David Dai <daidavid1@codeaurora.org>,
        evgreen@google.com, sboyd@kernel.org, ilina@codeaurora.org,
        seansw@qti.qualcomm.com, elder@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: interconnect: Convert qcom,sdm845 to
 DT schema
Message-ID: <20200115143901.GA4664@bogus>
References: <1578630784-962-1-git-send-email-daidavid1@codeaurora.org>
 <1578630784-962-2-git-send-email-daidavid1@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578630784-962-2-git-send-email-daidavid1@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu,  9 Jan 2020 20:32:59 -0800, David Dai wrote:
> Convert the qcom,sdm845 interconnect provider binding to DT schema.
> 
> Signed-off-by: David Dai <daidavid1@codeaurora.org>
> ---
>  .../bindings/interconnect/qcom,sdm845.txt          | 24 ------------
>  .../bindings/interconnect/qcom,sdm845.yaml         | 43 ++++++++++++++++++++++
>  2 files changed, 43 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sdm845.txt
>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sdm845.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
