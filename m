Return-Path: <SRS0=m/6z=3Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFCAC32771
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 23:42:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3149F2467B
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 23:42:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KEEfsaPz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgA0Xm1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 18:42:27 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:40244 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbgA0Xm1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 18:42:27 -0500
Received: by mail-pj1-f68.google.com with SMTP id 12so169090pjb.5
        for <devicetree@vger.kernel.org>; Mon, 27 Jan 2020 15:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4jR3NEZ7x+Jvx3U2TQ49TKGsznRacov85tgmCkWAaLs=;
        b=KEEfsaPzSnHMeqMLqqLF/rKhOnk1MsLgBr28dnqCs8OF9PTkJ+kGeggRfhXfPW8AdM
         5ignS2E0kGnVhslgsBP8y2I9j5uYqsgB/RjhpdR6fqQN3cHxjGgEp3OwCIYullOj2y5g
         x1loPleyzV88AC/BVEIpNRNXMByZ94VY3QKAjX6PPGnMgCchseaNbLqYu9raH41h6jxu
         qxpD3/1hqBM5jHPTxqKIHNdcOObFQsr7HrQo6E8lr2n1h2riX6kKDEq+FcaDAZLdUIYd
         BGbZf2NJM0rhl/BD/e5neNmcLeRSrbC4bnz9hgkuxwxL4j2O4bk1WtwRxabeG082RSm9
         ZDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4jR3NEZ7x+Jvx3U2TQ49TKGsznRacov85tgmCkWAaLs=;
        b=CG9eH131Q8xejZTz1UlMT5y9AZJgezMXtGWDBi2DpoUtw8gi+IpMBE7X2e1jaScNb0
         f++frklbbPVT4DcOB/nO5dlaE8N2g+bfpnsnaIyrCmRGl6oNqgNoOPr5qndz7oQdB1rE
         IuK2eG5mrVlMMXlLpX0NZP3TLUhZSOTDxlHbr8qSRbRU+SFMCIxExh3WRPXPf48NYtJN
         7K6/XFq2aWPkE1/VtH0YX7/KIgEapt1XYrLibPXYtnxjOKr188FTZhinF4A9tplqQMTp
         UAOt4+UrU6ksk0XCBCg3SfDUnCbrFXCpfniyd06IKAakctvoKepQYwn8fi6f20cy/Ag4
         MEZA==
X-Gm-Message-State: APjAAAXwgNwjBUspPkS5qpa9qQ2MoqwtWJm9Yr1y+n3pSP9YmNbAq02K
        Rr8Smx4CN+jM5Obbx5pBKVjK5Q==
X-Google-Smtp-Source: APXvYqz6tLIUsXV5Wb/Oi6Sc3Ql3UOYy6wK2oscK/U9I/+KHFO2ncIizEywoPt17c47xcms2lkjbpA==
X-Received: by 2002:a17:90a:3aaf:: with SMTP id b44mr1344980pjc.9.1580168546572;
        Mon, 27 Jan 2020 15:42:26 -0800 (PST)
Received: from yoga (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id p18sm325420pjo.3.2020.01.27.15.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 15:42:26 -0800 (PST)
Date:   Mon, 27 Jan 2020 15:42:23 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Kalle Valo <kvalo@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ath10k@lists.infradead.org
Subject: Re: [PATCH 0/2] ath10k: Enable QDSS clock on sm8150
Message-ID: <20200127234223.GA202699@yoga>
References: <20191223054855.3020665-1-bjorn.andersson@linaro.org>
 <20200127184037.3BFB620CC7@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200127184037.3BFB620CC7@mail.kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon 27 Jan 10:40 PST 2020, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2019-12-22 21:48:53)
> > On SM8150 the WiFi firmware depends on the QDSS clock ticking, or the system
> > will reset due to an NoC error. So this adds an optional clock to the ath10k
> > binding and makes sure it's enabled while the WiFi firmware needs it.
> 
> Hopefully this isn't a requirement in production firmware? Seems
> wasteful to keep the debug clk enabled in the field when nobody is
> debugging anything.
> 

I'm confused about this as well, but I'm told that it was fixed
post-8150.

Regards,
Bjorn
