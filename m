Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9BFC2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:33:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A66D2076C
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586889224;
	bh=QVi3GHOtM9HnNc8DZIeBx67njjwcVQl+2dl2UO0jBrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=gmsC687gvqNAbfDYIayJN7ffkHe/r/MP0fQ+9I5RG5HxpksUiUDjKC5/+HimGJFwi
	 IWSwCRA3I2zP9qjtnlzgP+55W7bdz85khmpx/k0SaskDjrftuBPhueyHdjUQCiByls
	 9eGc7VCDtPv8JOfFezvr3HbEkHQ/zOys6Jou8Xe4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504044AbgDNSdn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:33:43 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35659 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504019AbgDNSdk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 14:33:40 -0400
Received: by mail-ot1-f68.google.com with SMTP id e20so726680otl.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y6fTbhAGjUqtEqIQeLbjwq2Y7LbkDLyubMZdyUKSgGo=;
        b=IRPMwcUpyhKKtTfihoxRO4t0ufPmVI0FlOpjx+wnAAf3m6iSs37mUvYflLC0R0SZwx
         71zNyJ+lkHNrDri4Zv1gUaR1Kz7lqf/KxHbKnIpi4QzoJyeM458VpmcYkNREv2BVHwxy
         98NmHAO3xU85jdQ9X7llY07mkXmaHBefKITJuILNK+6y79AW0Gar6TMpJFO5pme4SmS8
         WsFR0n1ke2Kcl8rFGwZVH9rI5kyzbdLChw7kRm3Jh/iHaZ3zJ31FUiUye/GYm3bFDfx5
         CFYKZZw70lCPU98stl82TouZzzkeHpQKYCUZx3ePnznUmT2R4opkqgIJ4DTuG0NZMcN3
         xXuA==
X-Gm-Message-State: AGi0Pua4HD9mgKly/XfG/Y4ZqfgsywPvVMBP5/Z6V4E8IPI7jwvcG/Uj
        QudiDg/sz0BTXqNhJ0uq04bOf3s=
X-Google-Smtp-Source: APiQypJNJEnuJ3469ro1N9gTXG4VstjQ/AHsekMbRu/t0zl+h1EdXCUm7BuvNnm4UDqqjuQb03vq2w==
X-Received: by 2002:a9d:17ec:: with SMTP id j99mr19228937otj.213.1586889219475;
        Tue, 14 Apr 2020 11:33:39 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n38sm994163ooi.21.2020.04.14.11.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:33:38 -0700 (PDT)
Received: (nullmailer pid 6699 invoked by uid 1000);
        Tue, 14 Apr 2020 18:33:38 -0000
Date:   Tue, 14 Apr 2020 13:33:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Nickey Yang <nickey.yang@rock-chips.com>
Subject: Re: [PATCH v2 14/36] dt-bindings: display: convert
 kingdisplay,kd097d04 to DT Schema
Message-ID: <20200414183338.GA6560@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-15-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-15-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed,  8 Apr 2020 21:50:47 +0200, Sam Ravnborg wrote:
> kingdisplay,kd097d04 matches the panel-simple-dsi binding.
> The only difference is that enable-gpios is now an optional
> property.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Nickey Yang <nickey.yang@rock-chips.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/kingdisplay,kd097d04.txt    | 22 -------------------
>  .../display/panel/panel-simple-dsi.yaml       |  2 ++
>  2 files changed, 2 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
