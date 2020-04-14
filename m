Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C600C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 19:02:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BC2C206A2
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 19:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586890927;
	bh=PRhKVvlY5MH1874q13v0f9MAJxY+eCyP/8WOHYGImFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=m2/8ucnFYUxqPkpGm7MF7R6srNaAeJ5gHek3Ici5ZsfjVhYIgc2kWn16OAAQeTny4
	 2IO8T94aIqU4w/BBHckksxX6ess6go3KzUIfbbYpfWmay/kgeEQ/KJS9y/lIq7GHCm
	 kb07h9E8f/KBlCalTISUPV1y/MjzLUhw7Yx1E1ow=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504600AbgDNTCG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 15:02:06 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33240 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504595AbgDNTCE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 15:02:04 -0400
Received: by mail-ot1-f68.google.com with SMTP id j26so583828ots.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 12:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fVsJ/IpNtOe7JY6gD72HJPhizF5o8XDQ0yjiN57z3vc=;
        b=E/P7qASnLdaLr/p2fZEnvq2iiHiHAbwPIOVAyHqhDLMNM5u/PpdQ4PmClV6wIO0zE3
         WpCCaD0kMTJJXqB6VMZQY7pNfhxL7qPndiIRW2jPVjUdGtF6n+KcAn4n54umlTzBkbIc
         7DoPOW3iHuafqLHYL7RWAbIm9lrGqavjiE8EszZ+yX4qZomBaYL8hWktErUNWKGqbLef
         HCvPYAZvP//2wO9gxcYniscooHQJ/qsbce/1gqIJPI1B9wNHUiDWjHMKX0GufaoasLiH
         QxR68d9nLQvbZoYLKO2aThqX4FsRA4IVCOafro/zCiUKn+uqViUXUesUyWL4+USc8tvI
         +rcw==
X-Gm-Message-State: AGi0PuaeEqeaDY+tGp6FiOY8cLhOVHbHmneivYgm6YD7YIPolB6tFDmP
        7+Acpjkxae0tPRP9rDRYFQ==
X-Google-Smtp-Source: APiQypILqwT3dhOpwh9VY5s+DJSVmbD6BlnKbynfjgY02fGMBYiRFnqODaivjXYVSuPLc8XkiDLkow==
X-Received: by 2002:a4a:a11a:: with SMTP id i26mr19678661ool.87.1586890922350;
        Tue, 14 Apr 2020 12:02:02 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j186sm1031487oia.31.2020.04.14.12.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 12:02:01 -0700 (PDT)
Received: (nullmailer pid 21017 invoked by uid 1000);
        Tue, 14 Apr 2020 19:02:01 -0000
Date:   Tue, 14 Apr 2020 14:02:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 36/36] dt-bindings: display: move DSI panels to
 panel-simple-dsi
Message-ID: <20200414190201.GA20959@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-37-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-37-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed,  8 Apr 2020 21:51:09 +0200, Sam Ravnborg wrote:
> Tomi noticed that several DSI panels was wrongly
> described in panel-simple.yaml.
> Move them to panel-simple-dsi.yaml where they belong.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  .../bindings/display/panel/panel-simple-dsi.yaml          | 8 ++++++++
>  .../devicetree/bindings/display/panel/panel-simple.yaml   | 8 --------
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
