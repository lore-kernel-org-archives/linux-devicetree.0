Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8E4C33CA1
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 14:20:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 773702070E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 14:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578493201;
	bh=V+duQn/VKovNadbJEjkXvzNpkeGqObGQMkiV1LDtHjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=UITOLatmP+zPBMKTO1HVflkggjoFQF5f68j22g6syHbUiIVcUpaSF8t0LCtzGjrU6
	 +xZ4ikTcOttvTZnMDYtHQpAW4vdBwldUarB+Rd/AfI8UZauJFQuHjG+EHR2KgwzSyC
	 EDCmK8p3QafdWpNvid0c1eW1neOwsRRPHz1DoKKY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgAHOUA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 09:20:00 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34138 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727487AbgAHOT7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 09:19:59 -0500
Received: by mail-ot1-f67.google.com with SMTP id a15so3743319otf.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 06:19:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2PhRz0nUJob4vAB21QqyJ21zXO0DDwIbBt2aXu/jUhk=;
        b=GO6vFTfXb2Q/ULG5oONL3SpfVMeSgFGcm0HlpDRxuEG1EgCDHbPwkoC2b90liEsNHE
         Qh+W2yUHlYW9Gz6Haepbq602Z86gAbJWv/o+l/QjMHJPEC0vv+bZVMqjYJuQKT9PuYZ9
         dpw6SyFWyemVUlV5OymSOCiEnsFRx8I8bTMempqzkGRpO1uaj/SS733Cu96D6HqUaQWY
         OjcVnMSSwf/bhY8i72Ie3uerYpUFtYCB6wznTfIYAknFp6sAJ+uGIu25cDfny7f9k7D/
         5xvxlwDKNfzKka6R9QCiL6CAyKGgnulnW3n2LDqdN664ep+mnaK2963R9ynGOMf89Vaq
         azVg==
X-Gm-Message-State: APjAAAVzjyZ0NE8kruehPZvjPl1pdOgYynuSGb2NBOX2GKmOsx8bQT0g
        cFa6cL+lM0h4QY11+gIHN4Q+6P4=
X-Google-Smtp-Source: APXvYqygGGM7ibGnbcS1jm2g5K738GCbMZmDO4g5uw7sQ2tTmZl7tGvWOwPMp5dSU/ZjR+w6AORNvw==
X-Received: by 2002:a9d:7984:: with SMTP id h4mr4358711otm.297.1578493197918;
        Wed, 08 Jan 2020 06:19:57 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l17sm1175667ota.27.2020.01.08.06.19.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 06:19:57 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22001a
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 08:19:54 -0600
Date:   Wed, 8 Jan 2020 08:19:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Mark Rutland <mark.rutland@arm.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH 1/3] dt-bindings: Add vendor prefix for Chrontel, Inc.
Message-ID: <20200108141954.GA4574@bogus>
References: <20191220074914.249281-1-lkundrak@v3.sk>
 <20191220074914.249281-2-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191220074914.249281-2-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 20 Dec 2019 08:49:12 +0100, Lubomir Rintel wrote:
> 
> Chrontel makes encoders for video displays and perhaps other stuff.
> Their web site is http://www.chrontel.com/.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
