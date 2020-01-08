Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECADAC33C9E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 11:25:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF088206DB
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 11:25:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CtjHRbGp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbgAHLZ7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 06:25:59 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42558 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgAHLZ7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 06:25:59 -0500
Received: by mail-pl1-f195.google.com with SMTP id p9so1003103plk.9
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 03:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2jDjtJ0LH2mOG9+BZqbx8yqqoSjYxW1SBZl9GtzI988=;
        b=CtjHRbGpYB3RTWUy42hyridIUPO9xTDmfbMefaeG71PHp+Sf/G1DKQINkrtN6yMJAl
         Ea2tB8EO6xVDkcpato+OYYbpMamWooyj4Kk1x773HgjlUOFyhtp7Caei5B60RUsYrqIP
         EkwH0hWU8gT7DDXexq/0U8DxMKXGkoc7bi7Tru/aYDUNoYzEObvP1zvR+D44noTbCKOE
         uhSzqp0HrWcfmk1H9BZACz4ZK7iRzw5HLOJA9v/a6hdetvyV1zt1MXoQSax3YFd/xZC2
         u99b6del2xMNPmh9ceI+czmQTcAvEXJyFByezipPkOp74AaxHPwlgY217OjlZD72MlCq
         PcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2jDjtJ0LH2mOG9+BZqbx8yqqoSjYxW1SBZl9GtzI988=;
        b=IFYjKfb81emr16FGT6qfQvxwCU/LcIiwYpGsuMsYTCoMxFQnlaZGhaIhbTu+crdP3H
         E+FXSQMxuoDz4RWS8OZZKnYJ6wg9R+nK6q0XdhIaq30GGxT41mL6Kfyrdw89S4U90lGO
         FbpGkrDe5biweYZLgOanmCkrJbzE+H8eJJFZXgN8RLCTaFfuk7esD3s2OWgn9xy8nqyS
         w64YIOqu5rgZ7sMJjJ04CQ3uX1U6ZyFhZPsFatbhe63ctPTAywHiutiWDqWeZxE94WfO
         Xqte5EP830R94WdRFwWxMxWkP3Trhbrm2YW9jZEIYiiE49yRwM0DT4sacqeB1uqoF5Nr
         0kgw==
X-Gm-Message-State: APjAAAW286G0s6lQnrX2MC5oAUpygAbUWfpT5b6PIiw9fsXAh8L7raUy
        t5MFfojPf24V8yWnyrygMENljQ==
X-Google-Smtp-Source: APXvYqw/4SBhbRUxwhtzItPaL11vUZHZyu0FFeuTOqk4dHHi/Cg7gtxxXqMqYdVLbQnKNKseyzN+nQ==
X-Received: by 2002:a17:902:8a91:: with SMTP id p17mr4545912plo.75.1578482758436;
        Wed, 08 Jan 2020 03:25:58 -0800 (PST)
Received: from localhost ([122.172.26.121])
        by smtp.gmail.com with ESMTPSA id 68sm3294721pge.14.2020.01.08.03.25.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jan 2020 03:25:57 -0800 (PST)
Date:   Wed, 8 Jan 2020 16:55:55 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        vincent.guittot@linaro.org, seansw@qti.qualcomm.com,
        daidavid1@codeaurora.org, adharmap@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>, sibis@codeaurora.org,
        bjorn.andersson@linaro.org, evgreen@chromium.org,
        kernel-team@android.com, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 0/3] Introduce Bandwidth OPPs for interconnects
Message-ID: <20200108112522.afg535ybfxrlypcv@vireshk-i7>
References: <20191207002424.201796-1-saravanak@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191207002424.201796-1-saravanak@google.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 06-12-19, 16:24, Saravana Kannan wrote:
> Viresh/Stephen,
> 
> I don't think all the additional code/diff in this v6 series is worth it
> to avoid using the rate field to store peak bandwidth. However, since folks
> weren't too happy about it, here it is. I prefer the v5 series, but not
> too strongly tied to it. Let me know what you think Viresh/Stephen.
> 
> Btw, I wasn't sure of opp-hz = 0

I am not sure either ;)

> or opp-level = 0 were allowed. Also,

I think this is allowed.

> it's not clear why the duplicate check isn't done for opp-level when
> _opp_add() is called. Based on that, we could add opp-level comparison

This should be done. Please do that in the first patch as I suggested
in the code as well.

> to opp_compare_key(). That's why you'll see a few spurious
> opp_key.level = 0 lines. Let me know how you want to go with that.
> 
> I could also add a opp.key_type enum field to store what key type the
> opp entry is. But looks like I can get away without adding an
> unnecessary variable. So, I've skipped that for now.

Not in the OPP struct, but such an enum can be used for helper
routines as I commented.

-- 
viresh
