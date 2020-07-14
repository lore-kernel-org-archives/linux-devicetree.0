Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCB7C433E3
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 00:36:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 813F42186A
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 00:36:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RjJpjRvC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgGNAgM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 20:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgGNAgH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 20:36:07 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 524BCC08C5DB
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 17:36:07 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id m9so6810527pfh.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 17:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=A7lpw6xuEk98E7l/Wdgz5P9zvThUyBZ2UkYBSt1Hrdo=;
        b=RjJpjRvCeLyEGpg4MIYDt/ZGKyckJkPDjyT4JZAk6F8Zjul6IXJY/mNRnwqtUXKLLs
         hs5kBKjpaeqx/ZOx1JR3zh+Ekb9aGAl9d5RmQq3GJyz0u1vkJCUMbPizqbQRmbBxufTf
         VGxEHkDEfwsPwbmHPG9bzuaridwPz03UJUv5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A7lpw6xuEk98E7l/Wdgz5P9zvThUyBZ2UkYBSt1Hrdo=;
        b=FDhv8LeI1ERvOx68s8ThWHy/9CuHwNosgvusEn7OYPyOwRozPfzcKw1pyDMZtZE71B
         7PAFgl7BZ+PWdLVECOlzXGw+0QbAdlIOfadO3vhQXx868Cj62W+0s3cGZh+ErqVvNiFn
         zwBQ2Uih8n2d6x5GiD4SO8Gi81nZi4JYxJYbJl+ARcgJVKQIj1L/zH+ZtANDdOtyJx00
         qQ8hiAba/YJMXCY+DRRy0Qg3SIfe75Ox7Jg3HwVW1jLCQdaiSp6aCKnuX0Ac2zsDawPj
         qCDaE078ayDklhXNOWjYpnA2GqaUw0lPz+p/o9L0HIvKah7XPz5pmyua4XYnBPM4sTIO
         9EXQ==
X-Gm-Message-State: AOAM533AC6/k9ajo1H/d38BcoLkf/MHXpMqwvzwW9mXcexYWys4L21la
        bDL/AyaMZnMRqVHKNnbHExtJdg==
X-Google-Smtp-Source: ABdhPJxHMHL3gvRbWi8K6hyKlsY+h7vOtYivEYiBYHkW/4wu/JcZ+ysku+NUBYwSAHd9i63V7asVEw==
X-Received: by 2002:a63:e24d:: with SMTP id y13mr1415981pgj.248.1594686966735;
        Mon, 13 Jul 2020 17:36:06 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id 186sm15402499pfe.1.2020.07.13.17.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 17:36:05 -0700 (PDT)
Date:   Mon, 13 Jul 2020 17:36:03 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: sc7180: Add OPP tables and power-domains
 for venus
Message-ID: <20200714003603.GP3191083@google.com>
References: <1593603638-19296-1-git-send-email-rnayak@codeaurora.org>
 <1593603638-19296-4-git-send-email-rnayak@codeaurora.org>
 <20200701165414.GB3191083@google.com>
 <1ce702e1-6deb-8f13-3e17-38170b136b2c@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1ce702e1-6deb-8f13-3e17-38170b136b2c@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jul 02, 2020 at 02:26:14PM +0530, Rajendra Nayak wrote:
> 
> On 7/1/2020 10:24 PM, Matthias Kaehlcke wrote:
> > On Wed, Jul 01, 2020 at 05:10:38PM +0530, Rajendra Nayak wrote:
> > > Add the OPP tables in order to be able to vote on the performance state
> > > of a power-domain
> > > 
> > > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sc7180.dtsi | 35 +++++++++++++++++++++++++++++++++--
> > >   1 file changed, 33 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > index ad57df2..738a741 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > @@ -2392,8 +2392,10 @@
> > >   			reg = <0 0x0aa00000 0 0xff000>;
> > >   			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > >   			power-domains = <&videocc VENUS_GDSC>,
> > > -					<&videocc VCODEC0_GDSC>;
> > > -			power-domain-names = "venus", "vcodec0";
> > > +					<&videocc VCODEC0_GDSC>,
> > > +					<&rpmhpd SC7180_CX>;
> > > +			power-domain-names = "venus", "vcodec0", "opp-pd";
> > > +			operating-points-v2 = <&venus_opp_table>;
> > >   			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> > >   				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> > >   				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> > > @@ -2414,6 +2416,35 @@
> > >   			video-encoder {
> > >   				compatible = "venus-encoder";
> > >   			};
> > > +
> > > +			venus_opp_table: venus-opp-table {
> > > +				compatible = "operating-points-v2";
> > > +
> > > +				opp-200000000 {
> > > +					opp-hz = /bits/ 64 <150000000>;
> > > +					required-opps = <&rpmhpd_opp_low_svs>;
> > > +				};
> > > +
> > > +				opp-320000000 {
> > > +					opp-hz = /bits/ 64 <270000000>;
> > > +					required-opps = <&rpmhpd_opp_svs>;
> > > +				};
> > > +
> > > +				opp-380000000 {
> > > +					opp-hz = /bits/ 64 <340000000>;
> > > +					required-opps = <&rpmhpd_opp_svs_l1>;
> > > +				};
> > > +
> > > +				opp-444000000 {
> > > +					opp-hz = /bits/ 64 <434000000>;
> > > +					required-opps = <&rpmhpd_opp_nom>;
> > > +				};
> > > +
> > > +				opp-533000000 {
> > > +					opp-hz = /bits/ 64 <500000000>;
> > > +					required-opps = <&rpmhpd_opp_turbo>;
> > > +				};
> > 
> > the labels of the OPP nodes don't match the specified frequencies
> 
> Oops, I'll fix and respin.

ping, it seems the respin is still pending
