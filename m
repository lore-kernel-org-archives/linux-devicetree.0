Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FEDC33C9E
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 22:04:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B1268207FF
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 22:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578348264;
	bh=K8sSGCEA4gLNwt6qs0f0N6cwbqEMGwN2lQ+Jv6wFCSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=E8C0SC7qvFKSRi2SQOcs4pdPGGb1LoAArNcXuYUdY4ErVAsEijwAjeD8oFeHA9KDF
	 aStm34K5eAegd8/EC9mOfFZd0CHTkMwtgrW7y1BTANmgqxaOIbcM25OyevS7gjHeja
	 BbHT4qBjVc38xQDxXmTFjcASYW4SQQHWT76wMRg0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgAFWEX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 17:04:23 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33988 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbgAFWEU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 17:04:20 -0500
Received: by mail-ot1-f67.google.com with SMTP id a15so73542793otf.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 14:04:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fFftcAxBxD84neD4s5xVO4mH7xPSROdINRJxfvD8MYA=;
        b=ES9NiFOXPerEk3PHiAc8FfIajoF0kZscTn9yfbgLKO6GLeuTeDYZ2bNTxfxyb8CqG9
         cE2N3cjxvHke4VcWTLtOPP8J2HYlrruHsR09ELYwWGlG4YFZ36p+cE3H/OoL2xf2V7bP
         8uA+5vPqUFCU3Vbb1kC6bVDxjjS42CeqKwG96FFhB/nhxmWfYebj1gxL2CXGzSjysX9b
         TD/fNgWMAG2ymlU9W6FRA+b1ZatbGQFJ0oDDqcEs5RTEyDbz6HtE0fHZkMdRH8Hjh4XF
         DfwHFm+c/VygryZ/1jyoGW2QScQM1R33cGBduw6dkDrhhPIVgbYVqacH4XCxurN1w/Wk
         dU2w==
X-Gm-Message-State: APjAAAUJ6bEdRFr/XpH6m40CXJxFleuxEQ8lTiu9e+m4+Ix4RCw1pv7c
        L46cNxm8KYZPrd8diET3sH3a4DQ=
X-Google-Smtp-Source: APXvYqyMRm/Jpvbxn66CddoMX10hWg8rPlkhK79RDoMzP5qkXuThcxWg7BFVUk8d05MYfEtWVVtU3g==
X-Received: by 2002:a9d:6481:: with SMTP id g1mr120770025otl.180.1578348259662;
        Mon, 06 Jan 2020 14:04:19 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id q13sm3283143otc.5.2020.01.06.14.04.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 14:04:18 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220d32
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 16:04:14 -0600
Date:   Mon, 6 Jan 2020 16:04:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v4 06/12] dt-bindings: media: venus: Convert msm8916 to
 DT schema
Message-ID: <20200106220414.GA10744@bogus>
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
 <20200106154929.4331-7-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106154929.4331-7-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon,  6 Jan 2020 17:49:23 +0200, Stanimir Varbanov wrote:
> Convert qcom,msm8916-venus Venus binding to DT schema
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../bindings/media/qcom,msm8916-venus.yaml    | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
