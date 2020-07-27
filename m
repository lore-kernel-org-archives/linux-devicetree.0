Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB618C433E4
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 21:02:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 855AF20792
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 21:02:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bRfFtHzX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgG0VCJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 17:02:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgG0VCI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 17:02:08 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79865C061794
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 14:02:08 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id w2so10620312pgg.10
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 14:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CnrNkbaFG+mo4svSlEoBObsg4w60j22J8+PYU+PPvCU=;
        b=bRfFtHzX1zVRP2KIqcniBiHeMDlhjIOU9Yqml+WYD/0qj/30U1iKTD6aLjfxsmvsIh
         2DI827NOO8fp17l913ZXVV/i4xiHpwS3PnCguZtL1TWXK73R0bTtoAt0vUlmWNNQN0JA
         cevBggN1G9RolPdsvBl48M4oForqiVBJIFebodZDCHDhTWfzDtoT51+gOExhaipG578n
         Yy8QciRsWunDIqNKU2kIvh8RnsmKMFECTgK04U1Rl941Ysg4/Y82s7KH5j3lWGfMTB01
         5gsGBcJiRJVrXH99DyqKbmTPqenXApD/dl6iOvozpT5JMOvz6kImIUjVDJVyFy/0Q9QY
         CuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CnrNkbaFG+mo4svSlEoBObsg4w60j22J8+PYU+PPvCU=;
        b=ji4edJJIb5Q2Pz//d/TvLlMNuw99s+BwkGaCEMpS3Hjg3XaIzPcN2gGbJ4joX8P95K
         0QMhHF3Rkadc6+r+n4Z01wAlPtUbQMMTvuOLUVjqe/OMnXobWbHdNVaWG7rnXqoVTvSe
         aWs3xlLbI+cKL6fF2dzuH9ILzLX2FdM9K+3dpKQvjcvfgo/InOk15LszlxoeoWf7F+Q2
         razLeHJiqGvKoVShqyhTTiVIcDyoPy3hxGqxFyHkVD8sRoJJ/os2zk1CcbIckgDSVylv
         C1HuLF4UMRCr9glgyaqSwMnYto9ggO5j8SwDGphE4F2aDiTnVE/7Mut8bt6UpvnbteN+
         uYmw==
X-Gm-Message-State: AOAM531Thswy702XnE6cynvZOd07M8LYmTyCqKjh6bkxr5mydrrPU6ra
        dNWDzvLfs1uJlg65McqyGU8Acg==
X-Google-Smtp-Source: ABdhPJwwmvQE1grbXpKyCQ9I9VejZ9WeQ4E0X7yonbSngdxc3zyray6+GR0huEYUc7zxd8h2CwTOFw==
X-Received: by 2002:a62:fcca:: with SMTP id e193mr22259656pfh.307.1595883727948;
        Mon, 27 Jul 2020 14:02:07 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b24sm14930840pgn.8.2020.07.27.14.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 14:02:07 -0700 (PDT)
Date:   Mon, 27 Jul 2020 13:58:34 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        mike.leach@linaro.org, Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sc7180: Add iommus property to ETR
Message-ID: <20200727205834.GA202429@builder.lan>
References: <cover.1591708204.git.saiprakash.ranjan@codeaurora.org>
 <2312c9a10e7251d69e31e4f51c0f1d70e6f2f2f5.1591708204.git.saiprakash.ranjan@codeaurora.org>
 <20200621072213.GG128451@builder.lan>
 <f40621b2b01f836a8a97686707599dd0@codeaurora.org>
 <e270acd3f7db076c043f1b982b1efea0@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e270acd3f7db076c043f1b982b1efea0@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue 23 Jun 23:56 PDT 2020, Sai Prakash Ranjan wrote:

> Hi Bjorn,
> 
> On 2020-06-21 13:39, Sai Prakash Ranjan wrote:
> > Hi Bjorn,
> > 
> > On 2020-06-21 12:52, Bjorn Andersson wrote:
> > > On Tue 09 Jun 06:30 PDT 2020, Sai Prakash Ranjan wrote:
> > > 
> > > > Define iommus property for Coresight ETR component in
> > > > SC7180 SoC with the SID and mask to enable SMMU
> > > > translation for this master.
> > > > 
> > > 
> > > We don't have &apps_smmu in linux-next, as we've yet to figure out how
> > > to disable the boot splash or support the stream mapping handover.
> > > 
> > > So I'm not able to apply this.
> > > 
> > 
> > This is for SC7180 which has apps_smmu not SM8150.
> > 
> 
> Please let me know if this needs further explanation.
> 

I must have commented on the wrong patch, sorry about that. The SM8150
patch in this series does not compile due to the lack of &apps_smmu.

I've picked the other 3 patches.

Thanks,
Bjorn
