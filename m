Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08941C47247
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 03:38:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF37B206C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 03:38:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SwyhJPUN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgEEDiT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 May 2020 23:38:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgEEDiS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 May 2020 23:38:18 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCCC4C061A10
        for <devicetree@vger.kernel.org>; Mon,  4 May 2020 20:38:18 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id s20so268816plp.6
        for <devicetree@vger.kernel.org>; Mon, 04 May 2020 20:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HBwKtkgcj7e3nr8p0Kt5Si9efTL9Ko6MemGJAknCtRU=;
        b=SwyhJPUNhCcc7Tp4Jp7nd/nAqeRejEiNeEGtWuuX7TZ22IFY86p2KuTYasfPuh9fys
         epsXKL0C+e63zY3sqCXmUBZwl2XuiFE87/HWQ7VsDUKhU+7sHSoXc7CdrwvHEZjY94+h
         hJWUn/YxzT9Z0N12I4nbO+eoWm31RL04sSOuHWG5FKJf83kMSAI/OzLdcfGr3uRgMolm
         UtNgXgZr6tlOh08IDhoZ7zvO02iIlVDQGzunbXFTDemrwtHI0Bx8faVAcDZQC5v8tUFR
         +Van6kAal4wXxATTiBVnnZdDJkP2lyEsjFmSIPFscUytZFmIG/GaMOuQ7+/9rsAtiY/U
         j5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HBwKtkgcj7e3nr8p0Kt5Si9efTL9Ko6MemGJAknCtRU=;
        b=FoSX521KINPSvT4ERBEtEZpNl1+AmSFyRoJytl6FnAUy2jaR87EgfXS8UkZOPWlh1q
         sqFLquhhbu6XgwThuI1p+opa/TH1QUV3cP3orh0ujs3BuBCGDcXeOQ8LPf3xJ5hX0E+a
         U0uQ1Uo0eqVnkeoLAtUmxp9fWS2wys07v0sJmpM9eFwvtF1NTfXDtENmrJx/YPOnygRc
         xbGxox4iOcGwKM+EcJuOU0zztYwLBniK2mlfWCicNNvawHI+WEH3zpmw3sFmeEB54+DU
         nHtTdXLo6WijiLDL/zgx0L+1ELBL+shV7zygjwKksoIatWsiiIZikE2Bkf0axoxxITp5
         3LOw==
X-Gm-Message-State: AGi0PuaChLqdkwy0cZm74T0+HXNLn7J5gUZ6I1PtNyiPFyILD4nkPjTw
        K2B4gqPeTlAqd8o228iN8Q7UkQ==
X-Google-Smtp-Source: APiQypLicexy0ehqN8xOj3LloaEOyPRjQ2nyZrfaqjqvvZbZfaw2Ycgy1LAXgKlbnmF7NhSiqpM/Og==
X-Received: by 2002:a17:90b:155:: with SMTP id em21mr442033pjb.59.1588649898205;
        Mon, 04 May 2020 20:38:18 -0700 (PDT)
Received: from localhost ([122.171.118.46])
        by smtp.gmail.com with ESMTPSA id p19sm543124pfn.19.2020.05.04.20.38.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2020 20:38:17 -0700 (PDT)
Date:   Tue, 5 May 2020 09:08:15 +0530
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
Message-ID: <20200505033815.kz7mhjmsbkaux7av@vireshk-i7>
References: <20200424155404.10746-1-georgi.djakov@linaro.org>
 <20200424155404.10746-7-georgi.djakov@linaro.org>
 <CAGETcx9iAJRW9Y9orHNF-fC53nNob_vZKYUNEpwf_AeAdWCOjw@mail.gmail.com>
 <20200430060901.j7jjw6soo5h5xoul@vireshk-i7>
 <CAGETcx_zH_KJ7_A7Ofc2M5GfHKX_J__URJB127MSMcTeaqyzjw@mail.gmail.com>
 <20200430075356.rjtctfuenirvhxgn@vireshk-i7>
 <CAGETcx-W5XjNtgjDz2Ma_miN=cUBb5LFfhzYtKRpf6iAi4bXNw@mail.gmail.com>
 <20200504050017.nsd7fp7gtxxwt3d7@vireshk-i7>
 <CAGETcx_3ZrTigJ+CxJFA+N1xZaG9Vg6m0egew+kb-h4jSMsk2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGETcx_3ZrTigJ+CxJFA+N1xZaG9Vg6m0egew+kb-h4jSMsk2Q@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 04-05-20, 14:01, Saravana Kannan wrote:
> Fair enough. But don't "voltage corner" based devices NEED to use OPP
> framework to set their frequencies?

No. Anyone can call dev_pm_genpd_set_performance_state().

-- 
viresh
