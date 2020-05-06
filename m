Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8060C47259
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 10:08:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C5F22075A
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 10:08:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qrtC2sCM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729264AbgEFKI0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 06:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729159AbgEFKI0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 06:08:26 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A11C061A10
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 03:08:24 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id l18so1476540wrn.6
        for <devicetree@vger.kernel.org>; Wed, 06 May 2020 03:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=S5wjK64FTvIBUVGDVz6eqN0rnGF+I8hoKjMUDtYZWj8=;
        b=qrtC2sCMpZ60MCnJYVqgIBCr1c4yVFgq0J7IINfi6C2o3ZpkjkmQH+yah9iqks+c0t
         o93h8LJ/SLc7b30VAnD+RH07r6ktNXmtE535lCnuJHRCK5+SXdkPicCLbwSKDL7HiB38
         9sH5eO69Ic7cZTvCU2NqJVvty1qJgb0VUin+wHtLhnjyMEI1NLhfzO9zoGHNKjlcuxi4
         DAbJIzabXgD56W1vmUcEsX5A/BEH1EJ+mb4F5H8O7EzHUjVkS6b4WU5yeaWO5z5NV1NM
         C8p++DwtqPtBl2X2YdsbKARE37kagvNQEGAWK/OEGI0ET4dVoszmnqmpOlqsO9QSE+es
         LIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=S5wjK64FTvIBUVGDVz6eqN0rnGF+I8hoKjMUDtYZWj8=;
        b=DkRG0gW2Y1OhISCiWznxwzliW54BWEgURWMFWn0D/CorWz2RPoS5/mMJ1pnHneZgyQ
         i1fenvavPnc/x0+TTrnHBetTiU4XzDaUQoOdVQOmUFgt1vfo991IlpPL/Qjd6Vz50t4I
         kAb6SKr4TFjrHyBkSJNsGbiw3C6PBPria6Y/tizBL0/6vZMdDqSA6Nd7F/MsVj8SGvtd
         kWm80p51t1/GjPiQHpSgy6kTKOyCfcPXvG8oKLFpzH8pLbfGzk42M0qKqDHxVISBY9Fg
         F30HeBSmLp30s3uaO0p6J0m16Y7izF5mvCsNKBjuRn5RMaMMx9R2Fc4S6r2DpeMEH4Wy
         45xQ==
X-Gm-Message-State: AGi0PubYYa2WSPcuhV4DeFIYBtZ6Qcxi0GmrYrlXHuwkAP/esfKhdRD0
        umGQXqqCTRD5ecxq8izm27Qu/A==
X-Google-Smtp-Source: APiQypLG3DH7DJNZShRtgYXyoOjxP+TIAMjAS7WtIWfxoyMmVGs10rGkH6+s+On16puojbDyPclMEA==
X-Received: by 2002:adf:cc89:: with SMTP id p9mr8780517wrj.269.1588759703535;
        Wed, 06 May 2020 03:08:23 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id j13sm1920029wrx.5.2020.05.06.03.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 03:08:22 -0700 (PDT)
Date:   Wed, 6 May 2020 11:08:21 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        robh@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH V6 3/4] backlight: qcom-wled: Add WLED5 bindings
Message-ID: <20200506100821.GF823950@dell>
References: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
 <1587656017-27911-4-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1587656017-27911-4-git-send-email-kgunda@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 23 Apr 2020, Kiran Gunda wrote:

> Add WLED5 specific bindings.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.yaml         | 59 ++++++++++++++++++++--
>  1 file changed, 56 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
