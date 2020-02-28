Return-Path: <SRS0=Dihy=4Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFFEC3F2D2
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Feb 2020 15:13:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 30DD12469D
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Feb 2020 15:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582902801;
	bh=F3zdByQIKN7XMYu5LbyWm7srbXTTmLdOEB4M/SS8g8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=R+oWzHDsAA7s/1KSBTdWASulBFJWG92JPY8kDJO+DvdJ6ua0s5ZC3awb2l6sdTlcM
	 gONBpB9ZOjTNgWxL2HTpenumAtAx7TYQ4zypnB4jzvf25EDCFsw/MdyB59RWtC//88
	 yNPoEo/KTrRAq3l/Kl4ovI/f/B9LMj98Hv0FJ77w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgB1PNU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Feb 2020 10:13:20 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42042 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbgB1PNU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Feb 2020 10:13:20 -0500
Received: by mail-ot1-f67.google.com with SMTP id 66so2840277otd.9;
        Fri, 28 Feb 2020 07:13:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zWo4qKuY/7ed4cYkYmCoOxOnA9Dj1w1J7SKejk3R5Z8=;
        b=f8a2ptHfbp7rG9/fdH0kYvy1uAUYE9EKzsVx6gsNhiHbbU5Wrtr6ZJrEFQsN3RFzKw
         8XCEPUdA9TGH0g2aDc0HusgYSuvfZt3kfUbrteFlxn2GwXf6MkNlo3K34cPlHV3CrOVn
         Vnjm+SsXs743JLPk/3N4WDP9Q2K+XzP1cyZ0s+Rvna4RYHmaLPUBHgn/CFJ+27PPuCne
         6P/UqdNFrlK0dH4rsZZ2J43mKaTf900ve/qeGPJVOx97NsbqqyU84DyJAvC5SLMxjgNm
         rlBZXQkGWzMCgopsfr+fjZg4jD2aXCSefCTHY0ZJo0J5mgSEPyfZGfDM4dvLNmUZkLGo
         qfMQ==
X-Gm-Message-State: APjAAAV8vn7RCWZfh4L/Tt6f2HvB/QHhXuFRBvba/wsEXK47L5gI027O
        nRqDoRWC+rZv8hO5H0EXkA==
X-Google-Smtp-Source: APXvYqyIDBoCrTlnHsHo2ZWFLHbyIgEN0Y3a+LU5KpD+GDt608oltIOTk0QNBmppbKHbi9r4/mPT0A==
X-Received: by 2002:a9d:6e02:: with SMTP id e2mr3884732otr.194.1582902799599;
        Fri, 28 Feb 2020 07:13:19 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l207sm3264961oih.25.2020.02.28.07.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 07:13:18 -0800 (PST)
Received: (nullmailer pid 4200 invoked by uid 1000);
        Fri, 28 Feb 2020 15:13:17 -0000
Date:   Fri, 28 Feb 2020 09:13:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     peng.fan@nxp.com
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de,
        jassisinghbrar@gmail.com, leonard.crestez@nxp.com,
        o.rempel@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, m.felsch@pengutronix.de, hongxing.zhu@nxp.com,
        aisheng.dong@nxp.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: mailbox: imx-mu: add fsl,scu property
Message-ID: <20200228151317.GA404@bogus>
References: <1582546474-21721-1-git-send-email-peng.fan@nxp.com>
 <1582546474-21721-2-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582546474-21721-2-git-send-email-peng.fan@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Feb 24, 2020 at 08:14:32PM +0800, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add fsl,scu property, this needs to be enabled for SCU channel type.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Documentation/devicetree/bindings/mailbox/fsl,mu.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/fsl,mu.txt b/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
> index 9c43357c5924..5b502bcf7122 100644
> --- a/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
> +++ b/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
> @@ -45,6 +45,7 @@ Optional properties:
>  -------------------
>  - clocks :	phandle to the input clock.
>  - fsl,mu-side-b : Should be set for side B MU.
> +- fsl,scu: Support i.MX8/8X SCU channel type

What's the type for this?

Perhaps update the example.

>  
>  Examples:
>  --------
> -- 
> 2.16.4
> 
