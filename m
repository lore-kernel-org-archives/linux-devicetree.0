Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75CE4C33C8C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 22:07:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4885D207FD
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 22:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578348448;
	bh=52I/ytr8y9cirx8LrY22EFRDoW9M0a1IhsQ6eg6oJeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=QTcZu8aIzasGP7QJIMsC+H2TNlUpXXEaMZ+kNSuU4zpnztLmIkvTBkEbc08IAgdUp
	 cbgwwCfAs6PwSzv3ldTkemMFRAKG+mandOVRvVBmlIhd6Jzf/ZUdHkJfZy8uPaCKPL
	 iP84HP/Je/HHYBjaABED7qf5GRxrb4PVncI45mrc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgAFWH1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 17:07:27 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34947 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgAFWH1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 17:07:27 -0500
Received: by mail-oi1-f196.google.com with SMTP id k4so16992520oik.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 14:07:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mX8Apg3ZN6eJo68XMUgHBKoUIUkBElk8pz2rAOhoL5k=;
        b=FeMi8vATPUrrxv7WBrDrILQsF1paLQl8ctTv3q5mUMaa0U8ABXelI4KHRnF4vhBJoe
         fOKvCQQNZ11wDB6NmNYwmVV+xaGGPTK95YrupnsjpZPBELkU5nStRaPxFgJSWOXJYQUx
         XWt/tMjLREm/JerR0pm+N6Umgvm5LffN0T7kQgZVhyh6X5m0OXPfpSLnz9+Wn4z3Mfkd
         tYg1bvoqHBmz+m8CG56OPkw4ZvgSoLKfL6et1jiBwSAlNRdoYVu0r8cOxlO7pLGC6kNj
         eCyzZqENQrJQgob27gw6u16gczjjAFLP9cDrq+LID/XZ/65OgeDNwVPWlInkY++/UPg6
         TxdA==
X-Gm-Message-State: APjAAAXMqiKDT+Pcy0e4WtHm39nqoRXfQLPsajtOEPvBmFx/oFX+/2LV
        eqy0Nk3uzORqE9RAInPiEeKR2Dc=
X-Google-Smtp-Source: APXvYqzBIxRro1KpnCM+cI4CMyeZI2hpLc+tllTWmwAKoOGLvRVJXbsunesiUh3zhIbU7ZUFrDvRwQ==
X-Received: by 2002:aca:6108:: with SMTP id v8mr6020711oib.96.1578348446375;
        Mon, 06 Jan 2020 14:07:26 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id i12sm24630071otk.11.2020.01.06.14.07.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 14:07:25 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2207cd
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 16:07:25 -0600
Date:   Mon, 6 Jan 2020 16:07:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v4 09/12] dt-bindings: media: venus: Add sdm845v2 DT
 schema
Message-ID: <20200106220724.GA15963@bogus>
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
 <20200106154929.4331-10-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106154929.4331-10-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon,  6 Jan 2020 17:49:26 +0200, Stanimir Varbanov wrote:
> Add new qcom,sdm845-venus-v2 DT binding schema.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../bindings/media/qcom,sdm845-venus-v2.yaml  | 140 ++++++++++++++++++
>  1 file changed, 140 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
