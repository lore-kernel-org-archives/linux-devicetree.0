Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8EEC54FCB
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 03:36:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38CA521D82
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 03:36:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WZXgiclI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgDTDgL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 19 Apr 2020 23:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgDTDgL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 19 Apr 2020 23:36:11 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56730C061A0C
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2020 20:36:11 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id z6so3432761plk.10
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2020 20:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8H1NUjMwWNaYbzJpijo9kPT16a39a5axF1s4naNgu3E=;
        b=WZXgiclIG1eDxkvnwjc1k3Zzr4gy0TUdaDeugR4EpWuGKYW7hws4VBsItL6z0bnp6a
         I6PPu8wCTlM2BsSoikRX2Cu3/pSvwrcfQW00KgvxY74Khv0cUefGkIrIiwKzFIQjdOrm
         wYvqL/kfMEdDLcrjZ2wwbCa0Dl9I7KF+czR0MG72KNllSpMIIcIo2nNA8wayK0O72mYk
         l1sQLTkeNFC8W7tw+y43pe74eBy4Ocs229venEfem7hgcdpky1EMrWZLEosbrXTGEi9v
         jHrjnXZxG92Pmu1u5MiN+Uc1eLhZzqaNGiX+lVLoS1WjQU/flGs+TEQXx98+WtzAiT0h
         Bqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8H1NUjMwWNaYbzJpijo9kPT16a39a5axF1s4naNgu3E=;
        b=jmHYlBvr2YCj9+8zIBV8gq8qqvj1qyOHLeLWPZpKUBV8dUzPtbSr7P+WUR1bD4+KsY
         rBSRMIxW0itQqX8bJaLPrKG0BtnxLs2oUPt1gzwEVqGfHdcRQJbussN11RDX69drk0cd
         ZTcv4d9F8ngE//Uc9uR/05N15u+X1X7IXhIIIyE3pTOAEC6CtA+wRlBWEm76gJ4rAUTl
         uDwmPrQs37X0Gh2Ub/vMkaPMi6Lgz+trlibbFkuAM1orgRSk6eW8d2gXairwidCmkJqY
         LDXJZQkwBNAE3ERggaEN+tyBXYoOgJsJSUvQ9ZGFuxexrc1cl3eMYmACvafKiDeJAT0B
         kz+w==
X-Gm-Message-State: AGi0PuazxDjJNNskxAzHmdmjP6CJyPGKK23reFjNf2nnhpkYkuHSyR9z
        uZ4Tfl8cRge1UA+mzxJFlRqUrhjzFq0=
X-Google-Smtp-Source: APiQypLPmtlVFRC4fQpc3g0/x5O4imtV2N6XeI7jX2JLMMsPbZFwZ7CxmsczZhYf1ismWHip0KZPZw==
X-Received: by 2002:a17:902:bc8c:: with SMTP id bb12mr14096905plb.13.1587353770635;
        Sun, 19 Apr 2020 20:36:10 -0700 (PDT)
Received: from localhost ([122.171.118.46])
        by smtp.gmail.com with ESMTPSA id c15sm24108426pgk.66.2020.04.19.20.36.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Apr 2020 20:36:09 -0700 (PDT)
Date:   Mon, 20 Apr 2020 09:06:07 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     sboyd@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org
Subject: Re: [PATCH v2 00/17] DVFS for IO devices on sdm845 and sc7180
Message-ID: <20200420033607.eci57emjzcz7jaq4@vireshk-i7>
References: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 17-04-20, 19:34, Rajendra Nayak wrote:
> Changes in v2:
> 1. Added error handling for dev_pm_opp_set_clkname()
> and dev_pm_opp_of_add_table()
> 2. Used dev_pm_opp_put_clkname() in the cleanup path
> 3. Dropped the OPP patch pulled in by Viresh [1]

This is part of 5.7-rc2 now. Thanks.

-- 
viresh
