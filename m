Return-Path: <SRS0=Rh3i=5E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60913C4332B
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 10:24:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3832C20739
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 10:24:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hMfSKg1A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgCSKYQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Mar 2020 06:24:16 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38945 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727025AbgCSKYQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Mar 2020 06:24:16 -0400
Received: by mail-pg1-f194.google.com with SMTP id b22so1027370pgb.6
        for <devicetree@vger.kernel.org>; Thu, 19 Mar 2020 03:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ejqis7jZWtiS2ZJTMrRUUKldwFIqOJuqqMCf3220n+4=;
        b=hMfSKg1AkvvlQME8YGZu9tky0WqVsplrt7JrWxrTqFiKboOzIKmDiLwh38WSiez0Fx
         vXZMCa3A7gMmUsjJPEhaooP1Ibtae1V2h41wqN/eazLKPEHSNnKKYuQf/0b0+zE5J8Wi
         0I1L0Tle35xHNWanMkUymga3f0fTvI7mHSCwYYn58YQJAYcyHXN3zU8YKYvpx+e0vH6D
         kWPR9rMXZVqj3BbI5CqtsWgQ9GYbokoBYeInrFcSgvNOeHJmSS/l1Sledp1LRbZm+RYk
         mQqtoEoCncsJ7+Xu3Lk5JAWFh3UVJojPdtcpy+wOXJm/sOhMva0WyyI1C8WDvdOBA5JR
         rxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ejqis7jZWtiS2ZJTMrRUUKldwFIqOJuqqMCf3220n+4=;
        b=FNFaIuF54TYbkWzSQp11HdFKHFlgDvaJMUnoSVmItSWJsBqUgTQ0YMksvIdZPDQ5x8
         1CxMsWeDieoohHyS8GuBq61QbRX61EagFuwrEFzv+tuLO4PFfrN5+BkNgVZBR7KX0OrY
         VdxPFkmWNTajnQH0ejbZ6CqBTNmuKenZdOQNP7oiEhpvNHt67AqZLwlzHOooLbbjbXyu
         I/ABCwVTyazKLB9kk8P23HfBBxo0b9TZOyEFX6dRQ9ifxdlG7jer7xYq8CJS8xmy8qQ0
         7PhWVOctI7Wi2rL2GoUkDWmLz6Ibimc4vPY387t5yOMTQKqwO9rmOWsWYKBZWTFe3JZq
         Ndfw==
X-Gm-Message-State: ANhLgQ3SaTkgdlMfZY/dv5SlUU9x4M8c5kfn9CXGLD+npWtKrnbZ/m7+
        ovXHVGmYsZC0EpUDGwFedqLkdw==
X-Google-Smtp-Source: ADFU+vsfsrSDZTmHpVU3LAAmj3UlUBy/81zcWkCE3fx118L6TIcuQvcw29TgeFrn42KkMnYAVFhMaQ==
X-Received: by 2002:aa7:8708:: with SMTP id b8mr3375903pfo.209.1584613454639;
        Thu, 19 Mar 2020 03:24:14 -0700 (PDT)
Received: from localhost ([122.171.118.46])
        by smtp.gmail.com with ESMTPSA id i126sm1850038pfc.105.2020.03.19.03.24.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Mar 2020 03:24:13 -0700 (PDT)
Date:   Thu, 19 Mar 2020 15:54:11 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, sboyd@kernel.org,
        georgi.djakov@linaro.org, saravanak@google.com, nm@ti.com,
        bjorn.andersson@linaro.org, agross@kernel.org,
        david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        rjw@rjwysocki.net, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dianders@chromium.org, mka@chromium.org,
        vincent.guittot@linaro.org, amit.kucheria@linaro.org,
        ulf.hansson@linaro.org, linux-kernel-owner@vger.kernel.org
Subject: Re: [RFC v3 00/10] DDR/L3 Scaling support on SDM845 and SC7180 SoCs
Message-ID: <20200319102411.oivesngrk7gy7vtw@vireshk-i7>
References: <20200127200350.24465-1-sibis@codeaurora.org>
 <19cf027ba87ade1b895ea90ac0fedbe2@codeaurora.org>
 <20200318034243.o2metmggzuah6cqw@vireshk-i7>
 <f6a7930a-4eaa-6982-88c6-b50773bee9d8@codeaurora.org>
 <ea4265f3f4b5a439d70d3c80bcc77b7f@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea4265f3f4b5a439d70d3c80bcc77b7f@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 19-03-20, 15:41, Sibi Sankar wrote:
> Viresh,
> Saravana's example does show a device
> with multiple opp tables but doesn't
> need multiple opp table support to
> land though (since it works fine with
> the current implementation). I am more
> interested  in understanding your/
> Stephen's/Saravana's stance on adding
> multiple opp-table support. Personally
> I feel its inevitable, since multiple
> qc drivers using interconnect opp-tables,
> routinely need vote on multiple paths in
> a non-trivial manner.

The OPP core doesn't support multiple OPP tables for a device and I
don't understand how it will. And so I have been waiting for a reply.

> > 
> > Could you please post a link to the discussion that you are referring to
> > here?
> > I looked at a few links posted in the cover letter as dependencies and
> > it seems
> > like the discussions are pending for *months* and not weeks but I
> > might have looked
> > at the wrong ones.
> 
> https://lore.kernel.org/lkml/20200114103448.odnvqawnqb3twst5@vireshk-i7/
> 
> Rajendra,
> Viresh is referring to ^^ one

Right, thanks.

-- 
viresh
