Return-Path: <SRS0=9zIi=6I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA872C54FD0
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 20:57:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83899215A4
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 20:57:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q8RRoyAY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbgDXU5E (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Apr 2020 16:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbgDXU5D (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 Apr 2020 16:57:03 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98AD6C09B049
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2020 13:57:03 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id ay1so4203992plb.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2020 13:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CMlR2Lch6qanhmgzHXzt9Ss34iAITfulP0yBSMWEtIk=;
        b=Q8RRoyAYtL/AzdVawKmyJnSkxSE86u03IG8xw3LhjN5TgulDYq1XdyATi6YsU3g7sf
         O8Nj2OoAahkWNE2WzQgpYAejnxmiP2G+jbNPownYuQ+2ypW+cRGyHoX6HeFrrjm2C7Q8
         ZdojSE55OwpRlmFGD1RY4LREZWh6qxCy7bU9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CMlR2Lch6qanhmgzHXzt9Ss34iAITfulP0yBSMWEtIk=;
        b=LBFc1UvQDxg0gzMtFd7pH96ZzyenVjdtlm8yjGPwGOB5gJb2yGAHSv1CmKbvF3AEuJ
         wE9Q1HcTpFlbKsXj6/XGLMw5xFfQ6EKmG52cIkUA9cFASt/BW/9xCXH20DG4OFaxVQez
         L2n5WVI4CvC5WaxtUEBAgIMqCrY67aXPi1zpJhVk22OpLklQprAI7fF+QiXSn105bXIO
         OSSDxBo3J5ikr+JTNRmbJ3gHbe5QoqUa4NKX07vIdY9rWJhLh2eQ4OUscCu9kIXvq7J7
         Q8daTZquRPC1Tnre6WbmoYRjLqTNU3A00YfbTjwMbm+fDnchUUgG8MgwouMT+oThq6e1
         EK/A==
X-Gm-Message-State: AGi0Pua97ooJ721mwLPMY+30767VpZMi9DwdPJ38K+2vx9qDBnWO5Ro6
        I8eU3jGIpwx/ASEBBqKFFu1wyw==
X-Google-Smtp-Source: APiQypJ1Esxx+d2XPYW85epj3fqYRYqoDJaHV+BQi55XveY65BnIq4Qp6GCNmfHLlAsHZADZhUGE3g==
X-Received: by 2002:a17:902:76c5:: with SMTP id j5mr2136961plt.189.1587761823068;
        Fri, 24 Apr 2020 13:57:03 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id j13sm5405122pje.1.2020.04.24.13.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 13:57:02 -0700 (PDT)
Date:   Fri, 24 Apr 2020 13:57:01 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>, rojay@codeaurora.org,
        c_skakit@codeaurora.org
Subject: Re: [PATCH V5 3/3] dt-bindings: geni-se: Add binding for UART pin
 swap
Message-ID: <20200424205701.GE4525@google.com>
References: <1584095350-841-1-git-send-email-akashast@codeaurora.org>
 <1584095350-841-4-git-send-email-akashast@codeaurora.org>
 <CAL_JsqKLoiPUhiJDuYX+bSQwoCLTXOvtNyEB8ti__xMfEDyxNQ@mail.gmail.com>
 <ee34573a-e4ff-ad43-64ed-53439206d534@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ee34573a-e4ff-ad43-64ed-53439206d534@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Akash,

On Tue, Mar 24, 2020 at 10:46:40AM +0530, Akash Asthana wrote:
> Hi Rob,
> 
> On 3/20/2020 11:37 PM, Rob Herring wrote:
> > On Fri, Mar 13, 2020 at 4:29 AM Akash Asthana <akashast@codeaurora.org> wrote:
> > > Add documentation to support RX/TX/CTS/RTS pin swap in HW.
> > > 
> > > Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> > > ---
> > > Changes in V5:
> > >   -  As per Matthias's comment, remove rx-tx-cts-rts-swap property from UART
> > >      child node.
> > > 
> > >   Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > STM32 folks need something similar. Can you move this to a common
> > location. That's serial.txt, but that is being converted to DT schema.
> > 
> > Rob
> 
> Okay, once serial.txt is converted to DT schema, I will move it there.

It has landed upstream:

175a7427bb72 dt-bindings: serial: Convert generic bindings to json-schema
