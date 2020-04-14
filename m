Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18579C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:30:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED6512082E
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586889024;
	bh=WruKfOX2gQJwGPU8ovFrtYcmMygMh0Jj6s1jfLprNZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=dXHwt09X7wXiXkrjV2+INU0VUxx5Ym+n9wRoxbKBj64eAMxnX8pyA84sqePFBqmlZ
	 qxyGPqWgZ1IS1ovYVGa8nyaxJtCn1RCnc6XMFv5BxiDwwxrIQjvmrXKq3hCV8X+dIm
	 cdwAjeejQD8DzsVM7k3IoYBv9CeMA32lqbRS2ljU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503994AbgDNSaT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:30:19 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41125 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504034AbgDNSaS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 14:30:18 -0400
Received: by mail-oi1-f193.google.com with SMTP id k9so11295103oia.8
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qH846DX8SuZHIg4MDwM4mGfj6vm/yMN7Fl0H1/gCSbs=;
        b=tolN4zZ+BKcdR4MIPHyDX8Gqp1wTqIAvJHek+vcaDF0XS7GbI0sfkyqn0SFg/n710I
         RTqq4Jzn3Cp1RN9bGtc5ANJRcdX+0uBq6CLoQJnpciiRdQFzuLbqfilgkWI83KYeFDYF
         Q+TdmirYCY5eSqCT2Xq7RD2SZ5973BdjyyXO9zngAW5yMGIrAxLFNgXHxYJ/44oHkCZJ
         gOBv9KAYcj6mdB+drVeDmfhK7q+QyFsVdX1pvuT6/q+jeMF+PvP5gYSCqUHSOIdPsX5f
         ACav43NQdFw5Q7jcih8+j/I8jKD5fqyt3IUhcFt53/M2HMshpEWCRMXr4ElEpdlIQtem
         mU4g==
X-Gm-Message-State: AGi0PubW4qTR89YPYEu3ewY70RN4y9XMj79m0TU3xBizMHl1vB4Y5TCs
        7I2HghcoQ5x1dHKooWu4Ig==
X-Google-Smtp-Source: APiQypJDFx8EXF6c/4XmAxCmXZFTT5v01zGCk2LK8Zby1AxQ3UiHpf9oFhFZ5t/v3UT1FNQib8lX8g==
X-Received: by 2002:aca:488a:: with SMTP id v132mr16774171oia.166.1586889016479;
        Tue, 14 Apr 2020 11:30:16 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f1sm6363852ooj.38.2020.04.14.11.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:30:15 -0700 (PDT)
Received: (nullmailer pid 29259 invoked by uid 1000);
        Tue, 14 Apr 2020 18:30:15 -0000
Date:   Tue, 14 Apr 2020 13:30:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Lin Huang <hl@rock-chips.com>
Subject: Re: [PATCH v2 10/36] dt-bindings: display: convert innolux,p097pfg
 to DT Schema
Message-ID: <20200414183015.GA29198@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-11-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-11-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed,  8 Apr 2020 21:50:43 +0200, Sam Ravnborg wrote:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lin Huang <hl@rock-chips.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/innolux,p097pfg.txt         | 24 --------
>  .../display/panel/innolux,p097pfg.yaml        | 56 +++++++++++++++++++
>  2 files changed, 56 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p097pfg.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p097pfg.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
