Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42EFC2BB1D
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 23:11:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B346C2076C
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 23:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586905867;
	bh=lar7e9ixfTVXWH5yeTbqHfueeDmwWWHLgxgzFM2SNA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=VuaxLqFgiCoCTaVgzVKmkWqP2CAThfhC4d48dj1U8/KvOuafq+u4LqRDXLD00KuxP
	 u851egXSR/fLrfoW9+2Xyb9uMpnTYy7nC8NURdNbOwy21p5D5dowKZOv8GeFFzJse+
	 zpAVNSMmCruWho0A90FgTkwQxIP3Kpq6LEQH/RCc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441013AbgDNXLG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 19:11:06 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:46254 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731377AbgDNXLD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 19:11:03 -0400
Received: by mail-oi1-f175.google.com with SMTP id q204so11958016oia.13;
        Tue, 14 Apr 2020 16:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VwlQ6VCZgV5ka7iVLQq2H1q/L90kjoFQN48DbNs7kyk=;
        b=Wl2iKCeGgE1D9I9aNwR82AbvYEvFGkB49bwF4e/b7B13lp5p5JbBMA/x6mWxefXhhQ
         lZa2cz1GoXUVvToJW0JYEbTPx+DmlGrkPMGUK4gCLNd1ZCG3lJzSgUopXCfDs9e4u6ws
         qMD17ARJKLOwbk6ANFzmw3BGM3Mh7GuIYijkP3Tq07rznz0QWla2jFg8zLCLp3LSBqj4
         uDtLGadzVDeThB81L2oUiVT2nTTXxiO0Zpdcl/EXa7wVrsL66oqnVPYBjjkdEir0ONIY
         frGGEdYohQ0X+7Vdpl4jw1VP2lYgTQiz8ymliSjYlTDnt8D3TvNJ3L4amNYxseYvZENZ
         VZ6Q==
X-Gm-Message-State: AGi0PuYNSQjOm5PyHivOstN0Lfj0K53cDgQ0i/2K48K0wcDRUxAqNUj2
        n4oYOeUxKYrNHtz1XH0OSA==
X-Google-Smtp-Source: APiQypKCV80Py52kn0+PiM6nVbpJK4+Z+kN+SUuLi9kw5wkrmmpi+wDUYzmHfcVYyrFztmgZUUOjTA==
X-Received: by 2002:a05:6808:3a9:: with SMTP id n9mr16580256oie.124.1586905860910;
        Tue, 14 Apr 2020 16:11:00 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j186sm1188168oia.31.2020.04.14.16.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 16:11:00 -0700 (PDT)
Received: (nullmailer pid 5848 invoked by uid 1000);
        Tue, 14 Apr 2020 23:10:59 -0000
Date:   Tue, 14 Apr 2020 18:10:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mark Yao <mark.yao@rock-chips.com>,
        Sandy Huang <hjc@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH/RFC 5/6] dt-bindings: display: sun8i-a83t-dw-hdmi:
 Reference dw-hdmi YAML schema
Message-ID: <20200414231059.GA5789@bogus>
References: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405233935.27599-6-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200405233935.27599-6-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon,  6 Apr 2020 02:39:34 +0300, Laurent Pinchart wrote:
> Replace the reference to the DWC HDMI text DT binding with a reference
> to the YAML equivalent.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
