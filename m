Return-Path: <SRS0=cCmK=2Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573F7C2D0C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Dec 2019 23:05:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 298F620828
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Dec 2019 23:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577401543;
	bh=xx8IVfTSEYUnYKpyZb9vih8DbCGFjoA+IJdDDCFCOR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=xLuu8tz3POYhCs+dLlvv21uEOk+PX0Xo5gpqe8YCBJLDsU65agKZRrnv6Rwyayr85
	 oUv5l0c+JyEqznVn56yRD5NXLvKXa6blmW7bjip+LeuGC/FT81In76THAKXSdIHpPK
	 ac0eJt9adIVdHE+jtllCBxCJgiUPdpNYViKn+9p0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbfLZXFm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Dec 2019 18:05:42 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:36591 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbfLZXFm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 26 Dec 2019 18:05:42 -0500
Received: by mail-io1-f66.google.com with SMTP id r13so14332823ioa.3
        for <devicetree@vger.kernel.org>; Thu, 26 Dec 2019 15:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=imgyGn/vI3sOKO/lqcgXhV7wHKIVnLu9LpWSLgK7bp0=;
        b=sJhCTturuGBuCYQgkJSrrCNRAK7a/YWAU/38LR5zAojUKj76dsLOSNf9NmW8bAQZ3H
         VvYV+y8T8IqkrizEvL3qJog2vCeRE7DeBOVhreAWz6FHryy8BT9UrKUuieu1jrybtZ9L
         ecJYfhbPlFW4YwPIdjMQXsYyjE+D1ezV3ZAhy2+H15KEP+4c6GkHKz8D6nsShbNE7Okt
         0+0IoFDrry8PF1mdLdhDipa7pKXYMisDQ6hMLfgTrCD/sxIaqzCUP60mDyP3hNzdrvjD
         qJVKDFeMCdm7qL5POAD+uqTRkOnUmdxE5TV64trzYPHMAC6C5UPw77UCTSOx2+dQsjqs
         83Kw==
X-Gm-Message-State: APjAAAVlf/GaZRV/35+l3UxmpU7M7dpM9DyWUsEyV2hf1xg4o8FnWvqF
        vuTr1dYfcBoO8id6bcJS9eq4IzI=
X-Google-Smtp-Source: APXvYqzzd/SKxgFH/Acu/B8yvxJvabyFoe0NxQ0KfqhRMA6IlaNk7WPvJEMGFQpDB90WP7IjMWWc+w==
X-Received: by 2002:a6b:7e02:: with SMTP id i2mr32354074iom.172.1577401541660;
        Thu, 26 Dec 2019 15:05:41 -0800 (PST)
Received: from localhost ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id a82sm12581790ill.38.2019.12.26.15.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 15:05:40 -0800 (PST)
Date:   Thu, 26 Dec 2019 16:05:40 -0700
From:   Rob Herring <robh@kernel.org>
To:     Jyri Sarha <jsarha@ti.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com,
        peter.ujfalusi@ti.com, bparrot@ti.com, praneeth@ti.com,
        yamonkar@cadence.com, sjakhade@cadence.com, sam@ravnborg.org,
        robh+dt@kernel.org, maxime@cerno.tech
Subject: Re: [PATCH v5 1/5] dt-bindings: display: ti,k2g-dss: Add dt-schema
 yaml binding
Message-ID: <20191226230540.GA1959@bogus>
References: <cover.1576857145.git.jsarha@ti.com>
 <a89be75beefdc4e9ab5f194495b49f3538c9fc5e.1576857145.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a89be75beefdc4e9ab5f194495b49f3538c9fc5e.1576857145.git.jsarha@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 20 Dec 2019 17:55:09 +0200, Jyri Sarha wrote:
> Add dt-schema yaml bindig for K2G DSS, an ultra-light version of TI
> Keystone Display SubSystem.
> 
> Version history:
> 
> v2: no change
> 
> v3: - Add ports node
>     - Add includes to dts example
>     - reindent dts example
> 
> v4: - Add descriptions to reg and clocks properties
>     - Remove minItems when its value is the same as maxItems value
>     - Remove ports node
> 
> v5: - itemize reg and clocks properties' descriptions
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  .../bindings/display/ti/ti,k2g-dss.yaml       | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
