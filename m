Return-Path: <SRS0=mzwU=6O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEC1C83002
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 06:09:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E38422173E
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 06:09:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="byAT5GYT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgD3GJH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Apr 2020 02:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726358AbgD3GJG (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Apr 2020 02:09:06 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 240C3C035495
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 23:09:05 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id mq3so290199pjb.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 23:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gnoiaAuFUo4sUlvrv+0H1shPq44QtsmkGsofLniz4yU=;
        b=byAT5GYTKMmb9dN5DO0AqZOOlkZMewiHMDiX3iF5oAJvqYbarJDnT8HiAaHb+UZOFk
         bmEdH/HOUPRjPjpIJrvauvZsiyMivzMY6/bZJQHWR3JCAZpkxjE9fJ/lgPByDjtg4Wqp
         /MfNGLswKIMjLShQj0qTFpiMganNPnTRkjOs/NWunKHrbNWD0rys519H3+xIxPwWmh1V
         6C9E218KrhOJMq0fvfve5jDcZ84v1EkCmoqLcNPFjQaQAd0ZTiMEriuBnjr26/OBf1nY
         4qIHhZ/wc62lGL5pJevZFoSh0J5Jg2Q8KOWoEAXyLEsHnH6nS5t2c8VbjLOV1WtlTtf8
         vfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gnoiaAuFUo4sUlvrv+0H1shPq44QtsmkGsofLniz4yU=;
        b=CpbXlcfd72Bc5f1/XvRjTlYzCa7Gc0ONd9MbGx9gJshy9XxttDx/Fu/iC/9X5yYcDY
         6798ouc6/MBvWkYX8kuWuVKGi1QZJOsTKf77o+xD7QfeOpdHWANXi+2WCedh9tNXNovS
         ukS7M+K0fcJPkp7XyuPe5vPjkMCrQFV6sbLd7Jeh1Fh14Slm7nPdAF9/PW14WbIwD47k
         B3x8/cNRYJuWGqwMZaQPnweM4owtL87WsTlktC2h/C5OYwtDPtmnBZsOAYO46p2WHH6U
         gWIpoHa7Udc+DaZPcQOxGU8nN9oufQM+bdxD+ZXh34jMSm6c9CyqcrIw6d6niWbvefhW
         J6rA==
X-Gm-Message-State: AGi0Pubsi0wvEJmgibbjbQyiN/bX8ZEwixBSTGFTRLzNMkU4W8u/7aSS
        bDTgeCEPjDyCyMrTpxL0jd3h/Q==
X-Google-Smtp-Source: APiQypL5K6KJakKoCQTgtpj++245Liqa/pnUNFWRMXQInyp9Q1+LAUoIIzocBD3tizpFbPtxFCAJhA==
X-Received: by 2002:a17:90a:68cb:: with SMTP id q11mr1200392pjj.15.1588226944531;
        Wed, 29 Apr 2020 23:09:04 -0700 (PDT)
Received: from localhost ([122.171.118.46])
        by smtp.gmail.com with ESMTPSA id t28sm2296509pgo.46.2020.04.29.23.09.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Apr 2020 23:09:03 -0700 (PDT)
Date:   Thu, 30 Apr 2020 11:39:01 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Evan Green <evgreen@chromium.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 6/7] OPP: Update the bandwidth on OPP frequency changes
Message-ID: <20200430060901.j7jjw6soo5h5xoul@vireshk-i7>
References: <20200424155404.10746-1-georgi.djakov@linaro.org>
 <20200424155404.10746-7-georgi.djakov@linaro.org>
 <CAGETcx9iAJRW9Y9orHNF-fC53nNob_vZKYUNEpwf_AeAdWCOjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGETcx9iAJRW9Y9orHNF-fC53nNob_vZKYUNEpwf_AeAdWCOjw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 24-04-20, 14:18, Saravana Kannan wrote:
> My only comment is -- can we drop this patch please? I'd like to use
> devfreq governors for voting on bandwidth and this will effectively
> override whatever bandwidth decisions are made by the devfreq
> governor.

And why would that be better ? FWIW, that will have the same problem
which cpufreq governors had since ages, i.e. they were not proactive
and were always too late.

The bw should get updated right with frequency, why shouldn't it ?

-- 
viresh
