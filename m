Return-Path: <SRS0=Uhz2=4B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D9BC352A3
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 19:57:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB73A20659
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 19:57:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nmkZ4Nzf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728522AbgBMT5a (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 14:57:30 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37092 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728115AbgBMT53 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Feb 2020 14:57:29 -0500
Received: by mail-pg1-f196.google.com with SMTP id z12so3688709pgl.4
        for <devicetree@vger.kernel.org>; Thu, 13 Feb 2020 11:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=m1ZL+cG+Lhvx02V1ZHQxLgn/86YJrvrp+mo0irV6ra8=;
        b=nmkZ4Nzf/SJwqqzPOa3UEnycsRTHRVc4+sZQN4Jnsyha5149n6PwJuEtI/R/bl5aug
         F8XPHTMXPybUhqvB1JN1O+NnEk8Kg4dLOFiEkqPzbhA7P2767hWBaKa2ihxwawC0VA69
         Nif1EwOqVmG+4Vv9QR8dU+vV7O1ygMNo1Q3vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=m1ZL+cG+Lhvx02V1ZHQxLgn/86YJrvrp+mo0irV6ra8=;
        b=Q0gVF5AxFLJFGOqzyvnDW1jZi0Oyb5TEC20ns0Erh4K/MMd5sp95u3iriq9pzutWdb
         w8j/s4GAWij5bZMx63bRqbSOBF6pw4CrS4z2Rod+fFoJdWEvNfD1d8DQj34PqCgVff7c
         hzK/kj23f5/tASmdS8oENx+w6AUYjvEXPI+oOuJYQGmS/lc4MJB4VLIUuQb4yomhsqPZ
         HyZT7Ybq9tgf/Fc76LLyUQ/EiyuSTbg1BZUNmPQDMVv68sD+GNRxrNcwZlAwa3KD5Um1
         yiOQbJVGImxCqJ9/0pY+xVFTjb/hbXYMH+9RW9KLXoDsoCQ/srueMSLK/VEFh19WG1bc
         3N9Q==
X-Gm-Message-State: APjAAAWJ5QJK68wgF3VJcLarcgVuvZDAGKwM9NFL95SpcJrYERZIQDE2
        AMGvrvPYhQnXPEzPFtKerwLlyA==
X-Google-Smtp-Source: APXvYqyWWS4urX6qPpv69y5a04RIC8pgtBfCtIoAnuGEK/H2aH6ENml9WKKE3GiT9io/ir2WYl8R0g==
X-Received: by 2002:a63:31d7:: with SMTP id x206mr15375581pgx.283.1581623847708;
        Thu, 13 Feb 2020 11:57:27 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id b4sm3995718pfd.18.2020.02.13.11.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2020 11:57:26 -0800 (PST)
Date:   Thu, 13 Feb 2020 11:57:25 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vgarodia@codeaurora.org,
        Odelu Kukatla <okukatla@codeaurora.org>
Subject: Re: [PATCH V4 0/4] Enable video on sc7180
Message-ID: <20200213195725.GH50449@google.com>
References: <1579006416-11599-1-git-send-email-dikshita@codeaurora.org>
 <20200203180240.GD3948@builder>
 <20200213185305.GF50449@google.com>
 <20200213192627.GA1455@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200213192627.GA1455@tuxbook-pro>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Feb 13, 2020 at 11:26:27AM -0800, Bjorn Andersson wrote:
> On Thu 13 Feb 10:53 PST 2020, Matthias Kaehlcke wrote:
> 
> > Hi Bjorn,
> > 
> > On Mon, Feb 03, 2020 at 10:02:40AM -0800, Bjorn Andersson wrote:
> > > On Tue 14 Jan 04:53 PST 2020, Dikshita Agarwal wrote:
> > > 
> > > > Hello,
> > > > 
> > > > Changes since v3:
> > > > 
> > > >   - addressed DT and DT schema review comments.
> > > > 
> > > >   - renamed DT schema file.
> > > > 
> > > > v3 can be found at [1].
> > > > These changes depend on patch series [2] - [6].
> > > > 
> > > > Thanks,
> > > > Dikshita
> > > > 
> > > 
> > > Picked up the dts patches for 5.7, with Stan's acks
> > 
> > I can't seem to find the patches in the QCOM repo, neither in
> > 'arm64-for-5.7' nor 'for-next'. Am I looking at the wrong place or
> > maybe you forget to push these?
> > 
> 
> Thanks for the question Matthias, I was looking for this email as I
> rebased onto v5.6-rc1 earlier this week, but got distracted.
> 
> I pulled them in, but in the rebase I realized that we don't have the
> interconnects in place, so in it's current form these patches doesn't
> compile.
> 
> Seems we're waiting for rather trivial respin of
> https://lore.kernel.org/linux-arm-msm/1577782737-32068-1-git-send-email-okukatla@codeaurora.org/
> to get this settled.

Hm, there has been no response to the comments in more than a month, also
the series depends on another ('Split SDM845 interconnect nodes and
consolidate RPMh support' https://patchwork.kernel.org/project/linux-arm-msm/list/?series=238831),
even though that isn't mentioned anywhere.

IIUC the interconnect configuration isn't strictly required to get the
video codec to work. I wonder if it would make sense to respin this
series to remove the interconnect properties. They could be added in a
separate patch after the ICC support has landed.

Dikshita/Bjorn, what do you think?
