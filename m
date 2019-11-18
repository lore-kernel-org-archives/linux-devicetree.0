Return-Path: <SRS0=UR7X=ZK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4A9C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 Nov 2019 21:36:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 038FF22312
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 Nov 2019 21:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574112973;
	bh=BcmFMKCqwkZ7PbtxLJ7E3eW806yhzv8RRrkkGWZm2hM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ur1ikSjvrzCvOGkmhNagw7t0wJpAQN3fIZSYC3ErNA/ymkqyOcj118HPuAGbq7WJL
	 ziRd69uo5BKUwD80APKfaMlnzU/QVg1gtNyRWuKIVufEHAIzOXYj/CjVFHNnTbUA4O
	 yJXOoVDhY/AMDhhqOgOBCouIccEinC7tCw0HJmUM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbfKRVgM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 Nov 2019 16:36:12 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34810 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfKRVgL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 Nov 2019 16:36:11 -0500
Received: by mail-ot1-f68.google.com with SMTP id 19so6002796otz.1;
        Mon, 18 Nov 2019 13:36:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/0BIKn+o96RBSpk8ZHTuKqS7BjRkQHseFrb4HN/n6hM=;
        b=MtJhOo9S0T9DsAlXODgiUB/T+Myj/hDg3VMMAUbFHohti0Tow+6PiAxTikiuOfhuiv
         xLK41J0wNKUofsXpIFvMksusPW+2b4NH3qqdVpDWcVAp4T9yj2FaCOFE+94h2JNsklSV
         8f77YWh201KLfj8B0VeWrf5uxcjuXcZFtW4BUqwocQhMmfZUsKRp9QJdh7k8n7N/8RNO
         sRz4qy95OdWQLAUEm430B6tDc2EY2ziq3ME3LX26BFITKwBiWpoCK0XxiH5AtwVarN2K
         koVk121I3AVkUEEzWKFtGFgMvwJDjFYnYMVF5KOObIKfhHw6s3gUc6PmSVg2xwK0tiCW
         N56w==
X-Gm-Message-State: APjAAAVWptX0hDjvledoPJrAEesn35np33ToNTvUx2VsVGV5OCSd+2sf
        HEIKSJ3qAIz30jQ4HWhf4A==
X-Google-Smtp-Source: APXvYqwmIGg/mph+M+CHBdotYlMsPFBa2R7uinZCHzD9Ud0o5hIMrJlVslhdtsHPYuitryawEvTPaw==
X-Received: by 2002:a05:6830:224c:: with SMTP id t12mr1012564otd.299.1574112971130;
        Mon, 18 Nov 2019 13:36:11 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n204sm6495968oig.15.2019.11.18.13.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 13:36:10 -0800 (PST)
Date:   Mon, 18 Nov 2019 15:36:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Peter Rosin <peda@axentia.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v4 02/13] dt-bindings: display: bridge: lvds-transmitter:
 Document powerdown-gpios
Message-ID: <20191118213609.GA1484@bogus>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573660292-10629-3-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 13 Nov 2019 15:51:21 +0000, Fabrizio Castro wrote:
> Add documentation for property powerdown-gpios. The property is
> optional.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v3->v4:
> * New patch
> ---
>  .../devicetree/bindings/display/bridge/lvds-transmitter.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
