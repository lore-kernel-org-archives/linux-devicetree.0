Return-Path: <SRS0=V/11=AM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71737C433E2
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 15:08:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BC0A20760
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 15:08:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UO8tTv46"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731930AbgGAPI5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Jul 2020 11:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731865AbgGAPI4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Jul 2020 11:08:56 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C770C08C5DB
        for <devicetree@vger.kernel.org>; Wed,  1 Jul 2020 08:08:56 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id l63so11837770pge.12
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2020 08:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=r//RURoO3TnB3wTz8mwe3gfHxqmQYWwVK9iwzBO1A80=;
        b=UO8tTv46sKsUUVWPDwHcDgy4ubT579oFxF+ACPnaKkPTqHrHqlrIIsdao1sYMGriZ2
         IyR0/1tFThmpImSrIF0wLRAHLfL0ADbk5GXoyYXl5tml6omd9DrB6qbEBmOvltPHmqlV
         OrcuwgBj3IcMBg2pIX/SCjhXT7cklFQpHIV2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=r//RURoO3TnB3wTz8mwe3gfHxqmQYWwVK9iwzBO1A80=;
        b=B12C2fV5mukHEV3StewtaUbGVLujuG78bZasLfFEg4KFrJk4y3tm+0V76OK8+qpymt
         MjUUJ1V9sMXX6Z6ai8L7vsHk8kTa2DeE5UsN91ECJKp4xtCeS2Q7Nb9YykPYMy3CfL0f
         wt1HJC1LvHLG2FxCpvOTCnh+HhfZJJHpqaMLdB0iWoMlFpQ1nmPhoQs4ehnNYMQ4KxAh
         hFb/w22ijmH1AIii61ctjoodZBGXm/d/s/O5wEawIyIDXxz5VefJ+mZoUw/MbEzGFYOU
         v8/tKBri5ut9whouXMR0O4Nximl3JGmFbvS8FMu5CfThbLj/7kaQfWt//Q3z+iMlZOSW
         T1xA==
X-Gm-Message-State: AOAM531J0VHoamiilYUP1uN/EN5hC3rIf7Y8+TybUoIZPqiNLpGkHGXe
        MSaoLsBiasup8BBu9TB64CQKGg==
X-Google-Smtp-Source: ABdhPJyUHWfSn4p4nAusnO2St4+eWaSv2zhKgithl7JoGjHXORjuhCmtCWuk9nCPfc66aRvEn++/ww==
X-Received: by 2002:a63:7c51:: with SMTP id l17mr20058757pgn.303.1593616135540;
        Wed, 01 Jul 2020 08:08:55 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id g12sm5965952pfb.190.2020.07.01.08.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 08:08:55 -0700 (PDT)
Date:   Wed, 1 Jul 2020 08:08:54 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     robdclark@gmail.com, sean@poorly.run, agross@kernel.org,
        bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: sc7180: Add DSI and MDP OPP tables and
 power-domains
Message-ID: <20200701150854.GN39073@google.com>
References: <1593518176-24450-1-git-send-email-rnayak@codeaurora.org>
 <1593518176-24450-5-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1593518176-24450-5-git-send-email-rnayak@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jun 30, 2020 at 05:26:16PM +0530, Rajendra Nayak wrote:
> Add the OPP tables for DSI and MDP based on the perf state/clk
> requirements, and add the power-domains property to specify the
> scalable power domain.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
