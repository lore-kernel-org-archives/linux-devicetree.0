Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51E5C2BB85
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:27:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82FA4206A2
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586888824;
	bh=1TysirMw11I9pCa2WnkXkkHBzl7dLatVDhwBrojwLQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=gGeHtsU3t5PjBr3QODQk81HJoVnE9aSJjhTREDZjwZnBtJSR0zSNdxWtChcguWVeZ
	 md68pEZVPKBd3crHLIKhiOQ1HwfO52dmh1yOtLM3lOALuDJgRHJrTbO5Sbq+6k2pRC
	 x67ludHOYiyy0jI2SWaPYtVIZPiT9CaemEm1qkLA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729696AbgDNS1D (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:27:03 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33286 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727959AbgDNS1B (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 14:27:01 -0400
Received: by mail-ot1-f67.google.com with SMTP id j26so460897ots.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HczkAF96PjV21rBKVlO4yLKLiFnAi9GZ2pzwLk82GEw=;
        b=Jkfk6HaXzqSTbNU2PZtnoVmMZewlL9NIi8qUKHLkslCNBvuNIOFxegMcQBIb0aNb38
         Ij5o/rJV1XX+rVheyDt/XCKX+hrzJk6q+OgrJEnjPzP1l/jzFKWOQpcjwgj1UNB9NY22
         w5EZNFAVpzlJaV0AF9hYyJZbhU+Bm8gHf8RFqLE/elV0m0D7uazujOwQThzAKJ5+WJrU
         hZblHTLUBGdcGSa7VnuE6k8p3gKlhLYroottOpzfVRrQSXKMtR8la09K8ypYcxaZ3iLu
         KzbM40TpguRqMY3YRB43xsJKfjBL/xkqo64klNG6pXG/eIYpoE+frsa+97e0xAle5Wfs
         5iEA==
X-Gm-Message-State: AGi0PuaTAuBE82V4iKZJaSBlntJVa6K9GJz86M9j/fQhDIt9ddA1NJL7
        5stEp+CHX8AfFwIsaPItmQ==
X-Google-Smtp-Source: APiQypInKn60D+JDi5ybryOxLFtnPcaRj9SBi73UtB6B/bEM0EeljKhTMwrxPAOXMnSm0qL8y3soPg==
X-Received: by 2002:a05:6830:17ca:: with SMTP id p10mr20146456ota.165.1586888819582;
        Tue, 14 Apr 2020 11:26:59 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k21sm419642otp.32.2020.04.14.11.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:26:59 -0700 (PDT)
Received: (nullmailer pid 20082 invoked by uid 1000);
        Tue, 14 Apr 2020 18:26:58 -0000
Date:   Tue, 14 Apr 2020 13:26:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 07/36] dt-bindings: display: convert ilitek,ili9322 to
 DT Schema
Message-ID: <20200414182658.GA19812@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-8-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-8-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed,  8 Apr 2020 21:50:40 +0200, Sam Ravnborg wrote:
> The .txt binding explains:
> 
> "
>     The following optional properties only apply to
>     RGB and YUV input modes and
>     can be omitted for BT.656 input modes:
> "
> 
> This constraint is not implmented in the DT Schema.
> 
> The original binding from the .txt file referenced
> properties that is included in panel-timing.yaml.
> 
> The properties in question are:
>   - pixelclk-active
>   - de-active
>   - hsync-active
>   - vsync-active
> 
> These properties was dropped in the conversion as they are not relevant.
> 
> v2:
>   - drop properties from panel-timing (Linus)
>   - drop use of spi-slave.yaml (Maxime)
>   - introduce unevaluatedProperties (Maxime)
>   - dropped unused properties (Linus)
>   - delete stray spaces
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../bindings/display/panel/ilitek,ili9322.txt | 49 -------------
>  .../display/panel/ilitek,ili9322.yaml         | 71 +++++++++++++++++++
>  2 files changed, 71 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
