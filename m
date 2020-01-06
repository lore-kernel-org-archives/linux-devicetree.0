Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA98C33C9B
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 23:10:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E03182080A
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 23:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578352226;
	bh=BkZKUX/cpoo7IJJEV3bZ+RToEQBlRYbggq0crq/6d2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=QJkilUdHYQPjp8H5ACz0TNIy+xd7wiHFg41+crxqeIdvP9RzfePt4xHBYjadU1Lxd
	 3qX5/Vhuj2KPdrfYTs0yVsz1/QJcUCmd1BJFgVNhLGpy7IdCQTfEQWE6kdVHdAqZVw
	 3jsLZNTMn6DS96/KAJP3BkeCeNvnHK2yW3W9dUhU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgAFXKZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 18:10:25 -0500
Received: from mail-yb1-f193.google.com ([209.85.219.193]:37676 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgAFXKZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 18:10:25 -0500
Received: by mail-yb1-f193.google.com with SMTP id x14so22820982ybr.4
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 15:10:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=t+t1eROLK9g0HiqH07fHsSxCWd48TLqA6FF38j0G2gc=;
        b=UeEJqHb4Qn6T/voZlqxzlqT8bZRafonqVgtaUcagPfR0nhCzbBHY9RMtB3bY8PRvz0
         8PncoQYZJe1g/vMEimeHFTRcqxRF4NOZ34Z1dm2E3JZ+OONxux0YY+x0UgJoiBb9hToy
         D3+u7WktgRO4Rb+gSNdGv1FbRGMHKQrL+iBqlMxkvDDLUY+xK9huzwfqKF2I0iifz9RW
         l7vZGDSzLQ3dDLXCbnkG6Eg3tUvCPwZdJXahmG0wFGxzl6qzmndRhRT3M8PXX1MCK1QJ
         A7B5tucFGULeKoW+5kwqnYq1R44pb0qkd30o4RGQpMur9XLtms3WqGlshih1gCqifbFw
         GO+A==
X-Gm-Message-State: APjAAAWcztWZYSZyuXOvt17dyCVjpsFuShp3siHdx97cn5q1izZONj8r
        RAQMFbbBmtv6Trwj8W9APG2cma7y2A==
X-Google-Smtp-Source: APXvYqxh9aq1oSIbsezYB1xYbrnTg7iHsxd9GHOr65YtTuc2H3sG8Las9LwcXmihJsdTNlvyEBu14g==
X-Received: by 2002:a25:b78d:: with SMTP id n13mr54621421ybh.431.1578352223671;
        Mon, 06 Jan 2020 15:10:23 -0800 (PST)
Received: from rob-hp-laptop ([2607:fb90:1cd7:d95f:3549:d84c:9720:edb4])
        by smtp.gmail.com with ESMTPSA id y129sm28458584ywd.40.2020.01.06.15.10.20
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 15:10:22 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2209ae
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 17:03:01 -0600
Date:   Mon, 6 Jan 2020 17:03:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        sanm@codeaurora.org, sivaa@codeaurora.org, manaf@codeaurora.org,
        Rajeshwari <rkambl@codeaurora.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: thermal: tsens: Add configuration in
 yaml
Message-ID: <20200106230301.GA12602@bogus>
References: <1578317369-16045-1-git-send-email-rkambl@codeaurora.org>
 <1578317369-16045-3-git-send-email-rkambl@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578317369-16045-3-git-send-email-rkambl@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon,  6 Jan 2020 18:59:29 +0530, Rajeshwari wrote:
> Added configuration in dt-bindings for SC7180.
> 
> Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
