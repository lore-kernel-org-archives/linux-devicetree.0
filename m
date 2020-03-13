Return-Path: <SRS0=byNV=46=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04355C2BB1D
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 16:26:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF1E1206FA
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 16:26:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VCLEFuMQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgCMQ0S (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Mar 2020 12:26:18 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40813 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgCMQ0S (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Mar 2020 12:26:18 -0400
Received: by mail-pl1-f195.google.com with SMTP id h11so4489016plk.7
        for <devicetree@vger.kernel.org>; Fri, 13 Mar 2020 09:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9duP3dH+aH6CT7yB4gVvhjVC0X7MYOO6kZ8y2HY41wc=;
        b=VCLEFuMQYF1m6BKJsL0oksC1WBq5jRVxRxsQiEcPt3NRwsUKL0k0NyLz3a9pa/pOnH
         jyhGgAShULjHz9oLPPVA99S5lBDFkR2Nu+7RrA7dbetqqjQ/v0xOn462W2t/zEHEgJ/Y
         QmsCOKz/KFqGhQfWhmlxttlq+xColL+tKFLLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9duP3dH+aH6CT7yB4gVvhjVC0X7MYOO6kZ8y2HY41wc=;
        b=GAIGQre8eWBf0KT87BYD1ULpRKhWK0kAMm8nBD12/skA0wC6AvDSj7UvJhNxkK1GIj
         MEscUptRtUl+injSk+608IiEzSwB6pugshKiPogg/8uRc1iDasxsguf38HBTBIreWGSh
         DmdAx5WAEn+o4ZHC3h93T3q/DIOH8kEtG3/KAs/8JS6qaqFTqt2oDoMAy4fXxaBViQmN
         niN/5DR261hpPB9weD+UHA22x9YNfVe3Fd5Zc7xy/yuK0bzcrDt6Ij/kzBTKt6r12+Jb
         T5PYhZJ/fnh5TSnuEfit7LeuIoKMwvZemNkhDzCW3J8CIBWidbEaWpuFF6uQ/8FLd8SS
         C3sQ==
X-Gm-Message-State: ANhLgQ35VmNvPtuD7QEaeTcF8DLlHU+rm7lG1lhdtnEl61rMwYJ5KN6g
        r9XlWRTy7m3Hv8PoKh5PPUJytw==
X-Google-Smtp-Source: ADFU+vsPsA3vvdpbgpspQcOzaz1fjLOJRiNK9x2Pzp04oC9rV4EJ/KR3BicBI9malNEFSPehXIWYmg==
X-Received: by 2002:a17:90a:714a:: with SMTP id g10mr10400527pjs.155.1584116776171;
        Fri, 13 Mar 2020 09:26:16 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id nl7sm3616751pjb.36.2020.03.13.09.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2020 09:26:15 -0700 (PDT)
Date:   Fri, 13 Mar 2020 09:26:14 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org
Subject: Re: [PATCH V2 1/8] interconnect: Add devm_of_icc_get() as exported
 API for users
Message-ID: <20200313162614.GG144492@google.com>
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-2-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1584105134-13583-2-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Mar 13, 2020 at 06:42:07PM +0530, Akash Asthana wrote:
> Users can use devm version of of_icc_get() to benefit from automatic
> resource release.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
>  drivers/interconnect/core.c  | 25 +++++++++++++++++++++++++
>  include/linux/interconnect.h |  7 +++++++
>  2 files changed, 32 insertions(+)

Reviewed by: Matthias Kaehlcke <mka@chromium.org>
