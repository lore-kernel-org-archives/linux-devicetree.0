Return-Path: <SRS0=deyM=Y4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F085FCA9ED3
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 07:10:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C78F72246B
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 07:10:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rvIq103d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727236AbfKDHKd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 Nov 2019 02:10:33 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43990 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbfKDHKd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 Nov 2019 02:10:33 -0500
Received: by mail-pf1-f193.google.com with SMTP id 3so11527999pfb.10
        for <devicetree@vger.kernel.org>; Sun, 03 Nov 2019 23:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=t4TV25A1uMzOUpxnPE9T6D69bjxp+CQFn1rWNaSp17E=;
        b=rvIq103d5QvkQPhePPHFLq0nK/ACbSKZY7eteyZPRm6ZQLdn2P9/L9r/QTnrN6rUNP
         jm/ua7SGVaxRhSR5Nl9cOL5W9VLF8VkSl68eghceC1CCxqeyfDFNFUNDf85yimIPPvY0
         o1yfdXK5tO1vLx1FxzcPkmng+u9IkRYuIwq5EzIIzZ68U8SNrPlIZsU7d0qY1AO6zsuI
         pS1eCuVH8jlep136XfWsjFnO9FVNrx6OLJT5MeeAZHVVLtbzerSB2XgwPwUxJ+miWDfv
         02MGnva9fIZ+K8PsBCyhgUeisAMN55iFNb1AzWrJ037fxdbVJklLbH3Lgnji2xW2YZRp
         2V9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=t4TV25A1uMzOUpxnPE9T6D69bjxp+CQFn1rWNaSp17E=;
        b=EAPTeXXqsMm0viMoSluvfykb0v4mt3dJaUWLNOIFX/e8EtaJie4e4DfnjJ8iheBVTQ
         5X1kIOB/YAdFRvKaIjCmFED56ImPFaT2t+coNGlbGtQIwTB1RH4DlHm5XaFbXsJznS8q
         Iums1eItW4L9ckvuq0/5qklAe6IHpB7mf2Moc/oIZXMIwnoYV2rneQiS15m4veUgyNOA
         7TkZej39DUJwOlq7+IE5Q0fO2DdA7jy2OiG6O/j0fPpCsMdwHjZSBVMf/7IWNVMpfj0/
         kX4s2pkZYdHPnVvif8NeDOfEMpKH6VDS5hMl5UfOfwAQVyHVvTDbRVrbyzNt2QRCd3RX
         cD0A==
X-Gm-Message-State: APjAAAX1HjPZGvtivGPaYqXGF8sTrbyDSOxIL8H0n1pRhNwNLyeuXqc7
        xFH/62T709yXjImem+vZBSgCSg==
X-Google-Smtp-Source: APXvYqxHOP7JBpbRrN/9vm7qE7CKnT+oDstfysttIvzcmp2Ai7mrtOlTLr+klYFNg71UF1Ve/+0Xhg==
X-Received: by 2002:a63:b62:: with SMTP id a34mr8305598pgl.123.1572851430833;
        Sun, 03 Nov 2019 23:10:30 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l11sm16775340pgr.77.2019.11.03.23.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2019 23:10:30 -0800 (PST)
Date:   Sun, 3 Nov 2019 23:10:27 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH v3 11/11] arm64: dts: qcom: sc7180: Add pdc interrupt
 controller
Message-ID: <20191104071027.GD585@tuxbook-pro>
References: <20191023090219.15603-1-rnayak@codeaurora.org>
 <20191023090219.15603-12-rnayak@codeaurora.org>
 <5db86de0.1c69fb81.9e27d.0f47@mx.google.com>
 <20191030195021.GC27773@google.com>
 <6610d7fe-5a4d-5a43-5c4f-9ae61e7e53ee@codeaurora.org>
 <20191104063348.GA2464@tuxbook-pro>
 <c214110f-7620-8771-ef83-8a4fb1f8724f@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c214110f-7620-8771-ef83-8a4fb1f8724f@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun 03 Nov 22:56 PST 2019, Rajendra Nayak wrote:

> 
> 
> On 11/4/2019 12:03 PM, Bjorn Andersson wrote:
> > On Sun 03 Nov 22:17 PST 2019, Rajendra Nayak wrote:
> > 
> > > 
> > > 
> > > On 10/31/2019 1:20 AM, Matthias Kaehlcke wrote:
> > > > On Tue, Oct 29, 2019 at 09:50:40AM -0700, Stephen Boyd wrote:
> > > > > Quoting Rajendra Nayak (2019-10-23 02:02:19)
> > > > > > From: Maulik Shah <mkshah@codeaurora.org>
> > > > > > 
> > > > > > Add pdc interrupt controller for sc7180
> > > > > > 
> > > > > > Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> > > > > > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> > > > > > ---
> > > > > > v3:
> > > > > > Used the qcom,sdm845-pdc compatible for pdc node
> > > > > 
> > > > > Everything else isn't doing the weird old compatible thing. Why not just
> > > > > add the new compatible and update the driver? I guess I'll have to go
> > > > > read the history.
> > > > 
> > > > Marc Zyngier complained  on v2 about the churn from adding compatible
> > > > strings for identical components, and I kinda see his point.
> > > > 
> > > > I agree that using the 'sdm845' compatible string for sc7180 is odd too.
> > > > Maybe we should introduce SoC independent compatible strings for IP blocks
> > > > that are shared across multiple SoCs? If differentiation is needed SoC
> > > > specific strings can be added.
> > > 
> > > Sure, I will perhaps add a qcom,pdc SoC independent compatible to avoid
> > > confusion.
> > > 
> > 
> > I agree,
> > 
> > compatible = "qcom,sc7180-pdc", "qcom,pdc";
> > 
> > is the way to go.
> 
> I wasn't planning on adding a qcom,sc7180-pdc, but instead just use the
> qcom,pdc one for sc7180.
> 
> > 
> > Reusing qcom,sdm845-pdc would prevent us from tackling any unforeseen
> > issues/variations/erratas with one or the other platform in the future.
> 
> That was the intention of adding qcom,sc7180-pdc in the first place,
> but Marc Zyngier was not happy with the churn, given there aren't really
> any variations or erratas that we know of.
> 

Right, but by putting both compatibles in the dts and the generic one in
the driver we avoid the driver churn and we're future compatible.

And given that we haven't yet added the qcom,sdm845-pdc node to the
sdm845.dtsi we don't need to maintain the qcom,sdm845-pdc in the driver.
So switch qcom,sdm845-pdc to qcom,pdc in qcom-pdc.c.

Regards,
Bjorn

> > 
> > Regards,
> > Bjorn
> > 
> > > 
> > > -- 
> > > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> > > of Code Aurora Forum, hosted by The Linux Foundation
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
