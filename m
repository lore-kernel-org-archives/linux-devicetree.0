Return-Path: <SRS0=p3dD=ZE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB36DC43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 00:55:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B27CB2184C
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 00:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573520137;
	bh=JHNP1i9YmOI1UGPdrgz/HbCXbMCA88qzwzoeQZYNuy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=xo/hASayLf88cu7+njmgW0ErZiS+xu2+QoZ/G6LvPR7+V+soLAIdJGirrJSKgLysB
	 Dlr2xbwvh8IrL3NJ1LTFdE2IJsm4J+9+DSrmqh695ztj3dfZcDZMRdVyWyk86LWfM0
	 t/SUXbmJMtQeEo1lyzJCTU6frURRimzfVFwuuUb8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfKLAzh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 Nov 2019 19:55:37 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37546 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbfKLAzh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 Nov 2019 19:55:37 -0500
Received: by mail-ot1-f65.google.com with SMTP id d5so12899280otp.4;
        Mon, 11 Nov 2019 16:55:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+z0lCoBUADm3R12lZfFDcZyZCyiTz2wqkm2IayUdiM0=;
        b=QWVyVFOrdI6pBr2LfT2m6q/9lIeU3hGNzmuZVkwQaGAFR5Vex8hjcTtLBU4k5I+8E+
         niYxJdlZl1Dr1RkbcNq99faAywpYnBRLd5EIWqifzc7tBDETF1xcMnzQK8Yg9GRAT90L
         OF1oY+GG00NMhFLZCXfSFbolZBMM5xmwUIZMpX9MyIOsmidgJXqbFORZ4rrEq2rbWX1u
         oKSL4Xfq+SUVBXLxQS7qV7zbNEZZXsF1Y5pkHQZTCXpzL600huqlV1OhqEBYpboVS1h0
         gJZC6dsYtWDEYsByjkV2DfFPvB+aaOtBAia32i7c4mV3UY/8c603GFIIJWb9TeTmCn9c
         VHHg==
X-Gm-Message-State: APjAAAVlRC66BogYIEMrIEFWAwt5zH1aBj6NyINdH67FoLrNgOQwj09h
        mvwlQGbjoqGGuVXJ1LDe1Q==
X-Google-Smtp-Source: APXvYqwL8yt7UtDKW+o7Qx7dwCNLZg8iJkhnbTBSLmJxk2Tf9FK20JkPABtLDnyJMutfD/0SSf4Tvg==
X-Received: by 2002:a9d:6141:: with SMTP id c1mr23902824otk.117.1573520128782;
        Mon, 11 Nov 2019 16:55:28 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e93sm5925344otb.60.2019.11.11.16.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 16:55:28 -0800 (PST)
Date:   Mon, 11 Nov 2019 18:55:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v8 3/4] dt-bindings: clock: Add support for the MSM8998
 mmcc
Message-ID: <20191112005527.GA7038@bogus>
References: <1573254987-10241-1-git-send-email-jhugo@codeaurora.org>
 <1573255068-10400-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573255068-10400-1-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri,  8 Nov 2019 16:17:48 -0700, Jeffrey Hugo wrote:
> Document the multimedia clock controller found on MSM8998.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,mmcc.yaml       |  36 ++++
>  include/dt-bindings/clock/qcom,mmcc-msm8998.h      | 210 +++++++++++++++++++++
>  2 files changed, 246 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,mmcc-msm8998.h
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
