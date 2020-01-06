Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116F9C33C9E
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 22:06:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D28FE2072A
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 22:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578348359;
	bh=95BPPFdIitwGbLU6o/a9R4aINAqJd6YKUkp0l8oQvz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=NtSeaTgMCi2cCrd5hZOCOvOL7EMdlfgl8pYLbZcRK2PbIypULLwutxQAAo5LLMzcm
	 9DEN6MqyII0epFIDxcKBy4brB8H99MLP4+WlH1/fKqPWMqb1u6yEskwZdqJJg8Culd
	 3GcbnQicTsiObIfcz+wKL5h7yrqa8oaNc9Xwajno=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgAFWF7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 17:05:59 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41425 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726695AbgAFWF7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 17:05:59 -0500
Received: by mail-ot1-f68.google.com with SMTP id r27so73551032otc.8
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 14:05:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dOrlWUldD83XBK01h071I64wECD6WdEMkunkhAq43Js=;
        b=YIqiiU877y0bWoO2983iBizLsGy5ypQralHcjFCBJVZsS0o85CGtjnaSD8xiUcrFG/
         ettqvnd/Uv43ZD5CXZu5uFCJnDoE2DwxbubQXONyXy0tlzOjlTSgebVPv0IknTbpP8NT
         CcLD+UiPrkNzzvI2Naw1qLriUiHhrvYjbYKnRMkfTuqKZqAzFti13wJidorm8lWwgko5
         dp1mMAIugk/IV+u5Ndiv8n/f2NqdQ5xKS64EosvN3h8iMmqz/NTYfMQwDSAH9H0zZUsQ
         w4oU/Q+n+EjkHU5QWeex8aIEQ7gHeZ1Vy4TdV11U29MGevCtmYdEBJdv8POxqn4MZqax
         mpCw==
X-Gm-Message-State: APjAAAVZTmchuS8Z6gh7zKa1YgpN6+Ftfa+0rSMHn9R/cnI62VQ/zkPD
        f86/xlOexRMRdT0Ydpp/kY2QYbc=
X-Google-Smtp-Source: APXvYqxAC2yf9VukUu8GmqYSA6UlZw6arBjajGNijIUOsu7hup4zgEmAsIuviTHZWFA6hfNnlc+iWQ==
X-Received: by 2002:a05:6830:2147:: with SMTP id r7mr15783109otd.94.1578348357700;
        Mon, 06 Jan 2020 14:05:57 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id d7sm18878876oic.46.2020.01.06.14.05.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 14:05:57 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2208aa
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 16:05:54 -0600
Date:   Mon, 6 Jan 2020 16:05:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v4 07/12] dt-bindings: media: venus: Convert msm8996 to
 DT schema
Message-ID: <20200106220554.GA13282@bogus>
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
 <20200106154929.4331-8-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106154929.4331-8-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon,  6 Jan 2020 17:49:24 +0200, Stanimir Varbanov wrote:
> Convert qcom,msm8996-venus Venus binding to DT schema.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../bindings/media/qcom,msm8996-venus.yaml    | 153 ++++++++++++++++++
>  1 file changed, 153 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
