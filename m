Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60818C352BE
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:23:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 420A720774
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586888636;
	bh=Yh75TxemuboOUtSfCaE8Q9u+OcXZY0KoWEGT9b27TY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1Tv0DByLm6JO2VHCvIO8GScZjL5mrIEh5BH1J52KsiqQ3jrUIXK2muHXrMEhbydPp
	 BD+gs/Yyf/rI/bNZZdZLp11I+OQUT7ocDdUgTsiXqQzcBPoXPLOjidK7HCOuBy/T3p
	 StO1d1MIjkz3Ma0GnewIBOAlLEQzgkDcaOPYCV6E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503866AbgDNSXv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:23:51 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42521 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503864AbgDNSXt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 14:23:49 -0400
Received: by mail-ot1-f68.google.com with SMTP id l21so632944otd.9
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vE8vmZI0BB9tFkvbTeYrvpIJ3QhmUUq6yg01errvdiI=;
        b=iovj8isWKOBQVCVK2ZNEQ1odqorEfBaB2cKxB2SGY1fB8EQiCJgjlgND5rKQ9qLjxF
         olxoXuJQDk6ClPocjClMahZbEKXzCVZr00WbKGLQ+F3cGDR1SctNhXW0trKB0siNMPp0
         /52Op47ICTtB0EIaA0Z9LZvq5DB3QBoeeOorbsmoOSFsr66SrI7aOzIyWvmK8FSKvdpy
         k5Rx3Lhrp7V9PHvDGgfyyPEq1givBnrpkXaAhWzRvcSKf57sIOZI9Pc7UY1BSdbEHiU6
         cmQe67Yjs8upRg4TdScQrGi0jXTBxiPtV4cH6SiqmMToa+/DcqfsQpXRt8jFDlwrRIcZ
         /rGQ==
X-Gm-Message-State: AGi0Pubhu1LakMIpaDnEoUwAIfXfg4T526ulqMVorWcgWVsY4SUR3BPD
        A7XA+zp5U9SJPZpbsb9jIA==
X-Google-Smtp-Source: APiQypIxJTGIaG1krNnZWqAF9NmqWlxqIU/qCQ1d0ZpuL4DOEynXczR+G/xrRg6Cpl5ZzN0+IvkwEA==
X-Received: by 2002:a9d:6b13:: with SMTP id g19mr9443493otp.249.1586888627995;
        Tue, 14 Apr 2020 11:23:47 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q12sm5656192otn.43.2020.04.14.11.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:23:47 -0700 (PDT)
Received: (nullmailer pid 10828 invoked by uid 1000);
        Tue, 14 Apr 2020 18:23:46 -0000
Date:   Tue, 14 Apr 2020 13:23:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 05/36] dt-bindings: display: convert
 arm,versatile-tft-panel to DT Schema
Message-ID: <20200414182346.GA10724@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-6-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-6-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed,  8 Apr 2020 21:50:38 +0200, Sam Ravnborg wrote:
> v2:
>   - Fix entry in MAINTAINERS
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/arm,versatile-tft-panel.txt | 31 -----------
>  .../panel/arm,versatile-tft-panel.yaml        | 51 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 52 insertions(+), 32 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
