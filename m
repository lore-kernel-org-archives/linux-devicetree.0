Return-Path: <SRS0=L07u=CG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E723C433E6
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 21:52:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 194542078A
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 21:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598651571;
	bh=ROFVvjuyhout5udhMdUexmszaY/V6Pgw8mRjD/NJUQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=JVpPR71TtENaKAybBxJ33uQgBdubDfO5EPic5+yLM3s+6TP709QEX7FTLdLG1BOu7
	 FPbfM+XcmZhk26ltzGTF4vFAhWJ7O6UajBWQ6Rs24xxSTuUKXtq3fMuTqY7c8+nMdJ
	 7Tqy9yRKjl0soLFYIKdV0Czgd5YiY/z6ebc0Z9n8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgH1Vwu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Aug 2020 17:52:50 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:41922 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbgH1Vwt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Aug 2020 17:52:49 -0400
Received: by mail-il1-f194.google.com with SMTP id q14so1921629ilj.8;
        Fri, 28 Aug 2020 14:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=en+PfxEtmvRwXUALF3uVWa2UzaRDDagomEGlqyPEpSA=;
        b=pIknoNRAfOTwiZtaZ7zejbkyGT4JY3JBPypvtT+i6rQtccbaRJOxKs6cenHPiFH9xH
         AVzn1o/xHTc8CfZ6uWlDY6BNcrIagqF/wnMNd4givpPDV1cBIg7uESDZDllAoNcWL5dl
         y+KynrkqTzBs6pcwySe5KmoNkYqGHJeSvh9EJTG7MBj8Vq7nk7z4DloaM3N29HaAUFIv
         q1jCAMteXSHv7sZHFpEVoWvGAHAeX5hUlq9UCRsPBYQsj+B/REliguj8yMnigLP/sRMU
         f9XilPjjvQJClsXQFmF2IQx7IePPjaLSc7xDoLvdmBmzlgJcObdgOEL4KFMvQgGHFDkr
         kxKA==
X-Gm-Message-State: AOAM5319cihIdcN4UaWyAt4w23UMtUGahj4sW1d3wrr/7mRAomTnESV8
        Z+3XiAFmsJIViPxBDQM/Zw==
X-Google-Smtp-Source: ABdhPJy4YaTio1rbBlu0PiA76q677TzpWC0WH5BRcOwzNptJ7mNdQnN0x/aVJ+Fn3tDYsugM/Ig9+g==
X-Received: by 2002:a05:6e02:673:: with SMTP id l19mr726225ilt.121.1598651568896;
        Fri, 28 Aug 2020 14:52:48 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id m19sm302471ila.40.2020.08.28.14.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 14:52:47 -0700 (PDT)
Received: (nullmailer pid 3469322 invoked by uid 1000);
        Fri, 28 Aug 2020 21:52:43 -0000
Date:   Fri, 28 Aug 2020 15:52:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Cheng-Yi Chiang <cychiang@chromium.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        devicetree@vger.kernel.org, dianders@chromium.org,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        tzungbi@chromium.org, Rohit kumar <rohitkr@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, dgreid@chromium.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Patrick Lai <plai@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 1/2] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
Message-ID: <20200828215243.GA3469273@bogus>
References: <20200826110454.1811352-1-cychiang@chromium.org>
 <20200826110454.1811352-2-cychiang@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826110454.1811352-2-cychiang@chromium.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 26 Aug 2020 19:04:53 +0800, Cheng-Yi Chiang wrote:
> Add devicetree bindings documentation file for sc7180 sound card.
> 
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
>  .../bindings/sound/qcom,sc7180.yaml           | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
