Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2206C47247
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 04:50:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BCE9206B9
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 04:50:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A9AcnKK4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgEEEuQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 00:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726542AbgEEEuP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 May 2020 00:50:15 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76230C0610D5
        for <devicetree@vger.kernel.org>; Mon,  4 May 2020 21:50:15 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id x10so334309plr.4
        for <devicetree@vger.kernel.org>; Mon, 04 May 2020 21:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qkTyRP9++ayfjZYQMfdoArBfF2pI6IvEWiERS/Grl6w=;
        b=A9AcnKK4K7fEn7hjBjS813qdWQFYS97uuMCLfZH0Dl2iHZdSMdYGSfJnrSWfuyuF9a
         u0XBCa5p3PFiNzKEpTxGTGUSdqT/C7kAGF69isRjUnGyYqoFvdxOq8pdCPLn1DpZtIQ+
         CsKDSD6FkGwjQcybqXwVIzgWsJLk/16ug3jIOu3siBnucodAdoAwuuDiyVan0DP4FLGZ
         pnq6BpyTIjyGikLFt9E6OqS2win15OOxLxfBrjAmLGmcN+Al2bSurFSY4GSV5hzE7+UD
         7IWMVO8R/btXpRm3TPuMfZ+22cTugAjcWpsK+XBuwjvj61YxYGxQp5mwuOqMrdTAZCSg
         qchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qkTyRP9++ayfjZYQMfdoArBfF2pI6IvEWiERS/Grl6w=;
        b=rYMitsydbvq4LWexhz2u3dZsjBKf1Ydgo3hUwG9dsnGq3U5zp7rtG2jMAGYkp6RV3e
         a0BWrIjJ7jnX7e9xKUN86Tq1zu2XRstC13i5jc9QE9OLVhVh8IKGnTjevmIHc9Db3hUB
         N+eNvz7P+Zf4sRIPxPS86R5enyD3NUfOOWu4ZRUu8z4ButWRXpt5tRlSBVjSoWN5tiRV
         EMkOVwEhcI8qoZoFI0qupjMNRWqYLy+jma220J6V/zAeb8v5UzxmeiT7jKZXNXQ6rF6v
         98iCEVMl5jz+SHXjtpT5xEIRhMIIAqow9pzLsmWxdLre4dRHMF1lDXk7Jedq9EDUTyQb
         GDIQ==
X-Gm-Message-State: AGi0PuZ98h4tT79h3JXQdDZYGz8z/KAncc/mKYbJrto2T3ed0FFYeC8M
        K6jrUIsQ4iJzLSi70Y3zi2J8XQ==
X-Google-Smtp-Source: APiQypJNB+DyBBi5MOQHteql+Lah2HGYUGGbgurJ8eDGQV1dBGqHQVuS6LJ+VOxQsh5bJZAsUHGAaQ==
X-Received: by 2002:a17:90a:2606:: with SMTP id l6mr598821pje.188.1588654214717;
        Mon, 04 May 2020 21:50:14 -0700 (PDT)
Received: from localhost ([122.171.118.46])
        by smtp.gmail.com with ESMTPSA id x132sm707930pfc.57.2020.05.04.21.50.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2020 21:50:14 -0700 (PDT)
Date:   Tue, 5 May 2020 10:20:12 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     sboyd@kernel.org, georgi.djakov@linaro.org,
        bjorn.andersson@linaro.org, saravanak@google.com, mka@chromium.org,
        nm@ti.com, agross@kernel.org, david.brown@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, rjw@rjwysocki.net,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        dianders@chromium.org, vincent.guittot@linaro.org,
        amit.kucheria@linaro.org, ulf.hansson@linaro.org,
        lukasz.luba@arm.com, sudeep.holla@arm.com
Subject: Re: [PATCH v4 06/12] cpufreq: qcom: Update the bandwidth levels on
 frequency change
Message-ID: <20200505045012.zfx2e6chqo5f3e4n@vireshk-i7>
References: <20200504202243.5476-1-sibis@codeaurora.org>
 <20200504202243.5476-7-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504202243.5476-7-sibis@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 05-05-20, 01:52, Sibi Sankar wrote:
> Add support to parse optional OPP table attached to the cpu node when
> the OPP bandwidth values are populated. This allows for scaling of
> DDR/L3 bandwidth levels with frequency change.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

What about using opp_set_rate instead ?

-- 
viresh
