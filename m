Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E56C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 23:43:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1F9120774
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 23:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594338197;
	bh=fyy2/YR43n0NOjQe39oUAToCkJskE7vhmchvPsctquw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=FbP/JJF3pV0evXgkpKLTIN5AXSuVwQ5u6iKCNwOa+cFJPRZGoiAFFWKMRz/UcFKAE
	 h+ViwM2BhyZnefYwnydNnVKunpewncIlAj8UkA4xfnI064iKpgkTfOZd/naJftVFWp
	 Tyj6iArIiX3VctUcE8tHDaVRAoCynq31FsAcWfSE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbgGIXnR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 19:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgGIXnQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jul 2020 19:43:16 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14DFDC08C5DC
        for <devicetree@vger.kernel.org>; Thu,  9 Jul 2020 16:35:28 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id x9so3554179ila.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2020 16:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i3ZcByxD5sOUYO6BTypFXW0gx63ZZKNk26gPN7JuiwM=;
        b=NYDiLm+4muiliLrkHV7CPeI4lsakE+RAahVgf7EF2N6KJS7wdfWhh8pEb+38uEPfGB
         Ys9H6QaxGeupAK5haaZ1d6LKCbGPClxIvm9430HjmRZXXcPVIeD0jrKPljRKRHklFazQ
         ewfl9RfCevuNzGUb2i5IH/hXtpUlAh+WjzoTZz0lpgzA6k9XxCTuSMwYpEFZu5IwiGV1
         KKxQX+VOx7pPJXzUe2hVY7VChDwv4RDJXDQPKPbObqB5fY/lkbRqmr/IajQ/eZ8XjJ0q
         ncsho8JpRKyQ6YBzAQ3WZ6JYOQVNi7YkmB/7Bc3PBxhaIkuslDECb4vHc02Dg8+vxWKI
         loJw==
X-Gm-Message-State: AOAM531e/C/khqTcvIQG2XE0+gTaosWAgBDrHHUAIaRlliNA+e2OVglq
        4mqBQWQe0gmoRWm70BAVVw==
X-Google-Smtp-Source: ABdhPJxq31uOZ27XEzh3iNJeV1tgVEOymKY4HNIG5EXUF7FCriA+2zULBD6JRgXW/bW+3AZ5LRef8A==
X-Received: by 2002:a92:4b08:: with SMTP id m8mr46961305ilg.150.1594337727391;
        Thu, 09 Jul 2020 16:35:27 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id b2sm2596006ilf.0.2020.07.09.16.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 16:35:27 -0700 (PDT)
Received: (nullmailer pid 1110597 invoked by uid 1000);
        Thu, 09 Jul 2020 23:35:25 -0000
Date:   Thu, 9 Jul 2020 17:35:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Chris Zhong <zyw@rock-chips.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: convert innolux, p079zca to
 DT Schema
Message-ID: <20200709233525.GA1110544@bogus>
References: <20200704102806.735713-1-sam@ravnborg.org>
 <20200704102806.735713-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200704102806.735713-2-sam@ravnborg.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, 04 Jul 2020 12:28:04 +0200, Sam Ravnborg wrote:
> As the binding matches panel-simple-dsi, added the compatible to the
> panel-simple-dsi list.
> With this change enable-gpios is now optional.
> 
> v2:
>   - It is a DSI panel, add it to panel-simple-dsi (Rob)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Chris Zhong <zyw@rock-chips.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/innolux,p079zca.txt         | 22 -------------------
>  .../display/panel/panel-simple-dsi.yaml       |  2 ++
>  2 files changed, 2 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
