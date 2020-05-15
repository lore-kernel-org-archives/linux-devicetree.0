Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC173C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 00:40:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 963D3206B6
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 00:40:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ncWP6c8T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgEOAkA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 20:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726100AbgEOAj7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 14 May 2020 20:39:59 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C80C061A0C
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 17:39:59 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id n11so163648pgl.9
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 17:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MxFx2v3CXXJI2uqpzJc0nTIbU803tm+QFkEcg6RoGME=;
        b=ncWP6c8T/qeB5mTi8dmQ/2f++LBk5CizP09+SlPJnyCzgNs/XM3OV3LABFolMAuaaE
         UYHUIc3yE2lEXImqHTT1olFACAUL2RuRf0qtmuTLimsMw3ZEFjzxm4slAwvUIDb2cFT/
         wcJNyV8sDtE3sXgsivVXiTYvixU3wl/p0/67k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MxFx2v3CXXJI2uqpzJc0nTIbU803tm+QFkEcg6RoGME=;
        b=gUUKhbPxEJhdkUWcAsAn5mC86d0Euk2X0h5nbkStiweFbV+bjLEWiidHocdKjZMKUj
         +SzNS8uBojBfJZRzIXn9e5GGDpGbARSfA2AR/Mp2G75y66mrmwWHN+4Ige1/SHhtKngH
         WHy2vTOjPTQ/Mtn3q3n+eFApD067qt0d2i0iwUqQWvIQBYFUP2CkjnRNS1Et8ztJFAc7
         x0FoPf+4AwvBLCfPEW9J0W0254JZSNG49Pjqig59/ug/YW421Gd+ytuzLZG0lhp6J9eE
         7njveqT1CXKDcfx8wj6JwoONP1f5RNKHxOgoEYu+aGL8ra0Wo1oJnbHxEZtBDX/wP1GE
         xwcw==
X-Gm-Message-State: AOAM533vDJjecVvaQpVVr58fVmcb639Ub3qT5PObh4o6kRVbcfL4yoLC
        qB/oGzSsasXH6FSkIjSKGhbtXQ==
X-Google-Smtp-Source: ABdhPJyyWhg/HZloV77tc/5SwAYHguc5UciRxuk4OrFHLyBPk1weM70XMcLYipySphGQrca0OnCZSQ==
X-Received: by 2002:a62:3343:: with SMTP id z64mr1187982pfz.55.1589503199243;
        Thu, 14 May 2020 17:39:59 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 138sm334556pfz.31.2020.05.14.17.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 17:39:58 -0700 (PDT)
Date:   Thu, 14 May 2020 17:39:57 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        georgi.djakov@linaro.org
Subject: Re: [PATCH 4/6] drm: msm: a6xx: send opp instead of a frequency
Message-ID: <20200515003957.GV4525@google.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-5-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1589453659-27581-5-git-send-email-smasetty@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, May 14, 2020 at 04:24:17PM +0530, Sharat Masetty wrote:
> This patch changes the plumbing to send the devfreq recommended opp rather
> than the frequency. Also consolidate and rearrange the code in a6xx to set
> the GPU frequency and the icc vote in preparation for the upcoming
> changes for GPU->DDR scaling votes.

Could this be relatively easily split in two patches, one passing the OPP
instead of the frequency, and another doing the consolidation? It typically
makes reviewing easier when logically unrelated changes are done in separate
patches.
