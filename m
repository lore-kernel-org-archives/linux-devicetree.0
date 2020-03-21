Return-Path: <SRS0=1bdf=5G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394C2C4332D
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Mar 2020 22:08:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A34820724
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Mar 2020 22:08:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zzk/6hit"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbgCUWIj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 21 Mar 2020 18:08:39 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45580 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727700AbgCUWIj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 21 Mar 2020 18:08:39 -0400
Received: by mail-pl1-f195.google.com with SMTP id b9so4111241pls.12
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2020 15:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=nIofFguDr7Ltn+f6bBe8LL67edLfSLV7lBXX5mVoxYg=;
        b=Zzk/6hitFPzGvWafKvotJLpoasNwk069kZidVNohZ71zksbQLbe4cAILxBO3nRIAIC
         gs3gPgrz+RzyHaiJjVVkTJ+33p6jcju5vyRJqFEAbZBZVXMS//IPHojORjKWRfhoqdVa
         ChpyHQPH/FBGjmuy3gTGmmGZIEITADWUFsuzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=nIofFguDr7Ltn+f6bBe8LL67edLfSLV7lBXX5mVoxYg=;
        b=eb1cFXz6JfCfW8wQsWqBTw1yLd6lbF/Nl2ze49qilGvpUKa/mEpr2TVqnk0k7We8Kk
         tRTjmXs3Osxwy3KemnD3fzJZPfigdwsKsudvg6QlGea3ihpOtuNn2K+czkuwTZLrdALT
         /YHKkP0cSIMNiHIqf5GoiJuHP+S2P/pvpyFSu6awClvdMDJ2cptMi7Owel6DogifPOml
         rQ9EQlFWbttodp2sDeWES5Q4OzXdCjuZOHcoy5muchB7IUEJAI9huY+Yx9vEr+g4HyB6
         3t9Ovc1DsUakSLNpkulfEStSoFF2TO/UrezH43ZMd8hrwk3wuP79IfPu1EzR0DMIfVB8
         xsjg==
X-Gm-Message-State: ANhLgQ3d3zQmTMkik5/g+ckDt8QXMjdHJnAqf63RYhhNqiq4tYq86fW5
        ur8HmxpX6Bt9CfgcXLPSmDTN7g==
X-Google-Smtp-Source: ADFU+vuyjvfGK9PKW/a1GeddzdjEG6fKAd4IDpxdIIXvp2pktn1wD0MxRMPSQoRKiCy62a2RMchHVA==
X-Received: by 2002:a17:902:8f8a:: with SMTP id z10mr15252641plo.169.1584828518566;
        Sat, 21 Mar 2020 15:08:38 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id f8sm9086672pfn.2.2020.03.21.15.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2020 15:08:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <07a6b272c6e71e0e480f0dd0bffaf3138c0ab4c2.1584689229.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1584689229.git.saiprakash.ranjan@codeaurora.org> <07a6b272c6e71e0e480f0dd0bffaf3138c0ab4c2.1584689229.git.saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 1/2] coresight: etm4x: Add support for Qualcomm SC7180 SoC
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Leo Yan <leo.yan@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        devicetree@vger.kernel.org
Date:   Sat, 21 Mar 2020 15:08:36 -0700
Message-ID: <158482851650.125146.5830908665934727745@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sai Prakash Ranjan (2020-03-20 00:44:28)
> Add ETM Peripheral IDs for Qualcomm SC7180 SoC. It has
> 2 big CPU cores based on Cortex-A76 and 6 LITTLE CPU
> cores based on Cortex-A55.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
