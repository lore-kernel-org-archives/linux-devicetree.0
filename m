Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 898A7C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 06:52:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BC34207E8
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 06:52:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rt+ymG5C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbgG1GwE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 02:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726993AbgG1GwE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jul 2020 02:52:04 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD46C0619D2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 23:52:04 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g67so11328138pgc.8
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 23:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/GS/4OHUC58pzoucFVteRuIhHVuqFuzv5eBDbKwTaes=;
        b=rt+ymG5Cbhfum5rPhzbu2bNlLrOp2IYPr1KhUaVGa/JAf4KFUIgZoNlrcr9ss8BvzG
         QwIQxBO7tsuKVEqXL4c3rX0VtADAkGcNlf5nIDGY+cRQkp5Umvsg0jlr+YVA9ucRX6Zl
         9rJOvRnTFaw1+62YFnp0j3qDHqPZPgSoMJ7M4KlvRpvhcyfuvo3Vq92tm5pT/qK1robW
         pD5CudnsUUBNCVG93MqMptvbYcGnCP0okPFROypwhzqtHhn4yfVf9hm5YpELNmTwdeat
         TvTd7hKZrmrB02cq/aCptA4N4sj/mUUFU8wzNpS3783wXNxRwLv80AIS8P4T22iDYZuk
         fAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/GS/4OHUC58pzoucFVteRuIhHVuqFuzv5eBDbKwTaes=;
        b=pR10r9WeryYcHDZAgnoERSFkJXjerr6BxRDh4OgeCemYR4safkvyxvaPX81kO89/a5
         b2IVqswaeDh5hRMki7YKW9adbD2ax8Ern3kbqA3SX9gajLX2tq+wcWfVWthPNRxXyPKt
         Iladd353O2nQggqqDEHUa24JF3nUsdBHsYpAdheLq8UMJTA4oh4FOUT9WfTstIi5uZbL
         jSlGX0H3xMmPcVSioAsA5j9aAXbFXzknGDtizD5lU9DOATb1w57o82NQAper/jb1KQxx
         vi/Evfdf7YGvRrQbA+L5DK3TUxBsiYsKGsIKnb1z1/OA7Bd/HGQnjRqGUq/ZixjDPPN3
         wkHg==
X-Gm-Message-State: AOAM531qFhHy5tjurAlhDt/zFLwcuvHY2EvaDz6Nqq5dPWSuDBFFoDov
        tBgxlnk8q+3XtRqyw0IljO5oRg==
X-Google-Smtp-Source: ABdhPJxfbaZBUKL4RCI1GSa5MCOEQqQ61UEUjQME4GaIZXbAZyAHFPAaz4UlbjqcmBNjh+s0Ky1hDQ==
X-Received: by 2002:a63:fd44:: with SMTP id m4mr22809692pgj.160.1595919123788;
        Mon, 27 Jul 2020 23:52:03 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t73sm16963494pfc.78.2020.07.27.23.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 23:52:03 -0700 (PDT)
Date:   Mon, 27 Jul 2020 23:48:31 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 00/13] msm8992 DTS updates, peripheral enablement
Message-ID: <20200728064831.GD202429@builder.lan>
References: <20200625182118.131476-1-konradybcio@gmail.com>
 <CAMS8qEVKssmOTZTQqgo3y6yUp7KztapQLtek+Q6FewqVaSGYyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMS8qEVKssmOTZTQqgo3y6yUp7KztapQLtek+Q6FewqVaSGYyA@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon 27 Jul 11:20 PDT 2020, Konrad Dybcio wrote:

> Bumping this up, in case it just got overlooked.
> 

It was just overlooked, thanks for the bump!

I think it looks good, will pick up the patches, and the previous series
that it depends on.

Thanks,
Bjorn
