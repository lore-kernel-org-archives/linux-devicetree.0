Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808BFC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 06:45:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5942A206C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 06:45:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iWHIz5l7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgE2Gpf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 May 2020 02:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbgE2Gpf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 May 2020 02:45:35 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 227CFC03E969
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 23:45:35 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id q16so711089plr.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 23:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CsPp/MjEkjxQ7BHxRS1EKI7s+vKwtYlnMgwQX8LCIxA=;
        b=iWHIz5l7wo+azBnT6siaYYEyfnTszaVhdlMJFQdzGA/yc97aaVwNLlSmd1ZlNwTFEe
         Rp8utiOEwOFfnFTt40r10ZbKGMbQyYC8/Dbsi0lw8sj+1XNcJhs4dHbl1bMdCSXQF8Un
         k9unp5AFU+b9mALmIXLk7sRuPkowO+clqVbZeX8SRazPe1W1C7+ig/U0VOb2KoSRq3FE
         m0x4EW5WMWfdwKzCltow0TkeSnuqQRdMgO5A1LCPS1WUUqYrub5/Hzy0qCgDCPESF+wS
         JWptVDhoBblJ+Z/HepgKYGJJqWGwv0BiSotsHlcxzVLr34yTPsoJ/s6eKCQHb73hsA68
         fIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CsPp/MjEkjxQ7BHxRS1EKI7s+vKwtYlnMgwQX8LCIxA=;
        b=W5gaFFOdeRnpYhNpcmYb9bvgU9ndjSjXORjRe78WoZReOsjr2H99WSKW7EnCGRqnJy
         L6T5NCLeNE8/stO2Jykck2wLsgfm+IAjaqDj9TLC36LgdxW5EE5wbUH4Zd5H1ZTmEKr1
         yhIYtUIzPvWa7nsmzrJMh+VWHHrJoLCiuKD3p0XweBELEjptd/3hKBM7t21W6RGYdwXE
         J3AMAVse1+7p2NItSvRLfdc45Xk641DME20B7gr2rPiUW3g8F+Y/E2TOIUiYWKllWDyv
         AzMfatecyBtcCFG6+ei+uo432hSBj1GRohhnG0ze6ya3+l+DCtaT9D/AHCVbtWGVgsbe
         ptVw==
X-Gm-Message-State: AOAM530LMvkoJipS1aWYoHwWUFCExu9h9oHSR83SmJYsUsZjaols0AOn
        VATchkaOL7biFHmYohr9ddVRwQ==
X-Google-Smtp-Source: ABdhPJxvuF7AiJF3TGTNL39nVwgiDoJPMPTBtOy2mbkMIOX6o805cq/ssNzqiXtiCFK7kzld6ULmPQ==
X-Received: by 2002:a17:90a:a2d:: with SMTP id o42mr1019553pjo.101.1590734734583;
        Thu, 28 May 2020 23:45:34 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id iq13sm7400811pjb.48.2020.05.28.23.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 23:45:33 -0700 (PDT)
Date:   Thu, 28 May 2020 23:44:29 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: smmu/USB nodes and HDK855/HDK865
 dts
Message-ID: <20200529064429.GA1246811@builder.lan>
References: <20200524023815.21789-1-jonathan@marek.ca>
 <20200529030505.GY279327@builder.lan>
 <0630ae9c-6ae7-b74e-5dd3-0c569bad74f5@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0630ae9c-6ae7-b74e-5dd3-0c569bad74f5@marek.ca>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu 28 May 20:15 PDT 2020, Jonathan Marek wrote:

> On 5/28/20 11:05 PM, Bjorn Andersson wrote:
> > On Sat 23 May 19:38 PDT 2020, Jonathan Marek wrote:
> > 
> > > Add dts nodes for apps_smmu and USB for both sm8150 and sm8250.
> > > 
> > > Also add initial dts files for HDK855 and HDK865, based on mtp dts, with a
> > > few changes. Notably, the HDK865 dts has regulator config changed a bit based
> > > on downstream (I think sm8250-mtp.dts is wrong and copied too much from sm8150).
> > 
> > Can you please elaborate on this discrepancy? I do remember seeing
> > something odd when looking at this, but it seems like I didn't document
> > it anywhere...
> > 
> > Thanks,
> > Bjorn
> > 
> 
> Mainly there's a few regulators with different min/max voltage values. For
> example with l16a, downstream has min/max 3024000/3304000 but upstream
> sm8250-mtp has 2704000/2960000. I also added l18a.
> 

Thanks, we'll double check these.

Regards,
Bjorn

> > > 
> > > Jonathan Marek (6):
> > >    arm64: dts: qcom: sm8150: add apps_smmu node
> > >    arm64: dts: qcom: sm8250: add apps_smmu node
> > >    arm64: dts: qcom: sm8150: Add secondary USB and PHY nodes
> > >    arm64: dts: qcom: sm8250: Add USB and PHY device nodes
> > >    arm64: dts: qcom: add sm8150 hdk dts
> > >    arm64: dts: qcom: add sm8250 hdk dts
> > > 
> > >   arch/arm64/boot/dts/qcom/Makefile       |   2 +
> > >   arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 461 ++++++++++++++++++++++++
> > >   arch/arm64/boot/dts/qcom/sm8150.dtsi    | 180 +++++++++
> > >   arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 454 +++++++++++++++++++++++
> > >   arch/arm64/boot/dts/qcom/sm8250.dtsi    | 287 +++++++++++++++
> > >   5 files changed, 1384 insertions(+)
> > >   create mode 100644 arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> > >   create mode 100644 arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> > > 
> > > -- 
> > > 2.26.1
> > > 
