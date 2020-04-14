Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B541BC2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:59:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90A4920771
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586890791;
	bh=yKeZJy9HxGuwYVEd1u4BtEEBIjIWYtfUUAsTVmN2cN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=pPeo35PDQ8p7uyNz33MnsFgRNcmq4I6/flbzhdYNpK+i8T0mok0WYAWkqMgLI+EIW
	 H3HxIKUMWf7lRKFxByGHLXX3n4YDawAxY3mInOAFRTBFvSpMhvDYk8vkyCKzmuCjbz
	 2yTNHKbn/gxNlLbCq4iHLsjMMg6SWyLec7aNrWio=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504564AbgDNS7r (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:59:47 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34921 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504560AbgDNS7d (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 14:59:33 -0400
Received: by mail-oi1-f196.google.com with SMTP id b7so8817195oic.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5u7BxuFqo0AsKPaehfCrl3JV4bPrvYynDN6TrrNgOp0=;
        b=rrSG0Njy4g2iW7zmats6KC83Q8yig8oapP+3OKvoyHVSwIWr+DhjE3eZs41Rh9j9Q+
         70y0ctrVwHZTnU3lBUS2QE1tbwozPRmc8oerSq8cKur6jNk0b4kMzIPtRdc8HCbrHDeA
         5hzoRqsJmCRu9TcdgmPGugleJ7fn9TBIjIJvlemMKbJOxb4r/HKCvoC4WAYKQhDwE/VU
         rqKTt7WsE0a4+30a6qCGLu2A46d0pqr6rwHi/R3PHzpbOS7E5wJin4va+EbyGdsyUotr
         zokQDvBlQcXCopWwPkK07tohLM53RkM9qHa6DNc58dtsmHyrKCYsMqzXn7va8e+UdN7R
         fVig==
X-Gm-Message-State: AGi0PuauxlS5u5IWoGp74bmE/0yjO3SkAZ8fqQARhhAyDRWYY+YwFAar
        pAthSdmipEF2D9d4y5sV6w==
X-Google-Smtp-Source: APiQypIYSZeiObdDTXu+7PV3q0cY3+ppv2j+7b915oM8YtOruly96BaIfJiq4M1y0bN1I5jirrtJ9A==
X-Received: by 2002:aca:4243:: with SMTP id p64mr16808259oia.21.1586890772851;
        Tue, 14 Apr 2020 11:59:32 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 26sm6359408oot.25.2020.04.14.11.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:59:32 -0700 (PDT)
Received: (nullmailer pid 16956 invoked by uid 1000);
        Tue, 14 Apr 2020 18:59:31 -0000
Date:   Tue, 14 Apr 2020 13:59:31 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v2 32/36] dt-bindings: display: convert sharp,lq150x1lg11
 to DT Schema
Message-ID: <20200414185931.GA16898@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-33-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-33-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed,  8 Apr 2020 21:51:05 +0200, Sam Ravnborg wrote:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/sharp,lq150x1lg11.txt       | 36 ------------
>  .../display/panel/sharp,lq150x1lg11.yaml      | 58 +++++++++++++++++++
>  2 files changed, 58 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
