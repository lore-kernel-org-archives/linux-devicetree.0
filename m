Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6E4C33CA2
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:25:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B7C742072A
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578500752;
	bh=ODslVDAuh7de65gW/tg9WQIQROKBdslx9dSRBnp52xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PwvqFQO4eM2QqUFbvjSRG3+IYHQ5UY+5w9pdz4PyvxN3px73hmrZ+GikokqwEulSp
	 7SRLe9sGQSrxV701jkWZ2wHSZaHs8HV9e0KD5KzMK4XSLu8E8EbgPpaDNFTFRE2zcP
	 rPSqyJU6EcUSEJqi1bB5lfFmCb7BcOszAwolB25Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbgAHQZw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 11:25:52 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44189 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727390AbgAHQZw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 11:25:52 -0500
Received: by mail-oi1-f193.google.com with SMTP id d62so3100788oia.11
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 08:25:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Eh1a1EgozWErHHqGLEoauZ/x7T61NxvHf+uJt4V80kQ=;
        b=Kf9Pvssp8dHhYXAJYJeHqc6pH877bnXMw+hU0HAeMfNSsQ4ECiNKGcnBgpjeBvqEze
         BBKTceeBgd42neJ5LWiWJy4800MCZwNLyGam8XjMfw1nSspfofa4DLZijFXNPRuXLWJp
         ArZvfivp6ca7vraE5dJ26XJLFETqVsfByeaiMu+65RxJKgOeNPGeTm4/VQFAAYcmz/wd
         zBTm006IAfw0W4SreNcjmQ4o4SXSoJzWiFJaCYrlP9gigZKU4HMZNnWdXC2pbmHIIMdR
         gb3iHWtvukT/h0GiyH6DNcCH1aGCRtd7If3FiVqwFv7KGlRa5XpQ9Rj8Yy8bS140Fl1D
         h2vQ==
X-Gm-Message-State: APjAAAXspEMaAgkJZ47GdW8yahUpJEY7YNv9JTJLJDmsn3AgXT5SzLoK
        qOpaN4IJ1xeHvwZPtf2KHHevPfU=
X-Google-Smtp-Source: APXvYqyEAm0E4cziXedT4e/wyRqK4ayqz3HX2PRqMDvvKBMx2uE7zmEuLmNZuz+y9LGk5Y4DhuBfgA==
X-Received: by 2002:aca:de06:: with SMTP id v6mr3538865oig.168.1578500751125;
        Wed, 08 Jan 2020 08:25:51 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z12sm1261737oti.22.2020.01.08.08.25.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 08:25:50 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 10:25:49 -0600
Date:   Wed, 8 Jan 2020 10:25:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        sanm@codeaurora.org, sivaa@codeaurora.org, manafm@codeaurora.org,
        Rajeshwari <rkambl@codeaurora.org>
Subject: Re: [PATCH 2/2] dt-bindings: thermal: tsens: Add configuration for
 sc7180 in yaml
Message-ID: <20200108162549.GA24298@bogus>
References: <1577106871-19863-1-git-send-email-rkambl@codeaurora.org>
 <1577106871-19863-3-git-send-email-rkambl@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577106871-19863-3-git-send-email-rkambl@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 23 Dec 2019 18:44:31 +0530, Rajeshwari wrote:
> Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
