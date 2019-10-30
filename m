Return-Path: <SRS0=UUkD=YX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C6DCA9EC5
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 19:50:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 04F612080F
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 19:50:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WpD0szc9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfJ3TuY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 30 Oct 2019 15:50:24 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45026 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbfJ3TuY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 30 Oct 2019 15:50:24 -0400
Received: by mail-pf1-f194.google.com with SMTP id q26so2314502pfn.11
        for <devicetree@vger.kernel.org>; Wed, 30 Oct 2019 12:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HQ9FlWq+UvdDEfKTzeyzDf/xB7q4VOki0EmDu2rneyI=;
        b=WpD0szc9Md9tY2/n0MEWZBMJUxjxDAsnN5nv6bFIaLE3Mfco+mnhKg/9Q3231acaPu
         JgrrSy8x2aEqZsWMcbT7a63vu8s7c+meiHWRXHNjjoCoeEJOMmjvXKC0U/rfoleoDLxv
         4ZSTicknUi/kduQca2gQQHhpq9n3Fz0KNstO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HQ9FlWq+UvdDEfKTzeyzDf/xB7q4VOki0EmDu2rneyI=;
        b=GiTxFHcFjm1uEw5QL1ImhplAHdM5KkDyueZi6ggUhUwLL46PwsfZkMVZ5Q8xEP8KE0
         HLNngebbwRQxxrNtbew16XIh4neTZtrZcXe0WaHowk/LkEiRHhoBN7+rxgQFIpqGAKIL
         aythFClxrGtFSfyGUWkwIgq1hN/ZaW50uFGjgwPX98C8pMcMUTr+u46+5vW8oIga81bk
         b3SsqD0zPcpn2kxZ0Hptb5imBpw2+xJ1VJubeRYasNK1fBVvud07dwyCrYr9iKXFXPTp
         esOqAE/tseDDLkYKkuTNZPChTX7vGYl7+Ec6HIToCgSUCos0Fg2YHvT6daptNGU/aOLp
         Ytvw==
X-Gm-Message-State: APjAAAVYm4OD/dD97OQV0ik9FhOKnVCXuGaT+8zbo3PoAzZ5yXEADxx4
        yLrQV+xY79ZqAHsnZzDab0NCGw==
X-Google-Smtp-Source: APXvYqz/QWsyM/lJiIGheJ/+yIlYmhs+n/d7akVsIpvcixXB40xL1Dd1YxIGf/82aICZka66QdEzTQ==
X-Received: by 2002:a17:90a:77c6:: with SMTP id e6mr1213558pjs.93.1572465023464;
        Wed, 30 Oct 2019 12:50:23 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id k32sm2965175pje.10.2019.10.30.12.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2019 12:50:22 -0700 (PDT)
Date:   Wed, 30 Oct 2019 12:50:21 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH v3 11/11] arm64: dts: qcom: sc7180: Add pdc interrupt
 controller
Message-ID: <20191030195021.GC27773@google.com>
References: <20191023090219.15603-1-rnayak@codeaurora.org>
 <20191023090219.15603-12-rnayak@codeaurora.org>
 <5db86de0.1c69fb81.9e27d.0f47@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5db86de0.1c69fb81.9e27d.0f47@mx.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Oct 29, 2019 at 09:50:40AM -0700, Stephen Boyd wrote:
> Quoting Rajendra Nayak (2019-10-23 02:02:19)
> > From: Maulik Shah <mkshah@codeaurora.org>
> > 
> > Add pdc interrupt controller for sc7180
> > 
> > Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> > ---
> > v3:
> > Used the qcom,sdm845-pdc compatible for pdc node
> 
> Everything else isn't doing the weird old compatible thing. Why not just
> add the new compatible and update the driver? I guess I'll have to go
> read the history.

Marc Zyngier complained  on v2 about the churn from adding compatible
strings for identical components, and I kinda see his point.

I agree that using the 'sdm845' compatible string for sc7180 is odd too.
Maybe we should introduce SoC independent compatible strings for IP blocks
that are shared across multiple SoCs? If differentiation is needed SoC
specific strings can be added.


