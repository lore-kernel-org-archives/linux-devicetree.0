Return-Path: <SRS0=rjyW=3U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEB8C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 14:25:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B44120CC7
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 14:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580480715;
	bh=DTTFB4hezcnZxTo9Bf5UOlSZBplaNAEang91YJ4jsIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=SdfP9rnqhYh3H3Wt+qpThI6Jsy8XyH5DrpDP38nSyay8Vhxg0+H7Lg9HwgH08O1Ea
	 ByLegqONyrb9DFIPH3gfKGsoJjTHkISELnmmVgZor0BEZ7+Ft8Xis5+5jLNDCkM0FC
	 ZFmfJVaFxtSJADuHhpuGj2qgS/QSWAhbanH3Qesw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbgAaOZO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jan 2020 09:25:14 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43428 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728730AbgAaOZO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jan 2020 09:25:14 -0500
Received: by mail-oi1-f193.google.com with SMTP id p125so7365468oif.10
        for <devicetree@vger.kernel.org>; Fri, 31 Jan 2020 06:25:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CY7J+IlecaG8nz6DPJS4G/LtHnWj0sEM0OBoR5NJd0k=;
        b=M8pKfzUWqM2Bw6PwAaf00k94ijIt3W1JwN023HeLUqw5TX5EMshJ7BqSN6sBP5XZek
         JaZRrIf2b0NzD/oqXK9lJrk1wdCKAi9EGF6GbbT/bVpOntaWE01zFeQMvhlvk98tcgAT
         QaI2XUsQygc+fvlHfjbURZJVCdcsNQCXF9EnhMMJz47hORbiIJ+Ktvk/9DCOZt2oig9m
         GGyEjoSj8Lfn/b+Q99l/URyuAfqvqMPUwuTLA06XE5czb9CBX5xRxIi0I4yDj7BjvKdc
         3f7pm5oMeJN6xSrYZMpfXHK7I+fj33VJRK8KpKaZoE7MaDOV12jj8TW2RDRfIfNiL0Pn
         vyUg==
X-Gm-Message-State: APjAAAUS82bLmitH+6gmAdNM9gQI1WehRBD4LAmMcwFThZ7vUBlIpuhA
        02UFsLjt4NNZ8WGxCljjcg==
X-Google-Smtp-Source: APXvYqwP4UCqynTaGuEXM1pVcinpeQ7FXXcHK8C275p9lQJe8/rqR+GKzHezIpMqcGLexQe+mA4tIw==
X-Received: by 2002:a05:6808:315:: with SMTP id i21mr6201353oie.139.1580480713686;
        Fri, 31 Jan 2020 06:25:13 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d131sm2709089oia.36.2020.01.31.06.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 06:25:13 -0800 (PST)
Received: (nullmailer pid 7140 invoked by uid 1000);
        Fri, 31 Jan 2020 14:25:11 -0000
Date:   Fri, 31 Jan 2020 08:25:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     michael.srba@seznam.cz
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: Re: [PATCH v3 1/2] dt-bindings: display/panel: add bindings for
 S6E88A0-AMS452EF01
Message-ID: <20200131142511.GA6222@bogus>
References: <20200130203555.316-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200130203555.316-1-michael.srba@seznam.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 30 Jan 2020 21:35:54 +0100, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> This patch adds dts bindings for Samsung AMS452EF01 AMOLED panel, which makes
> use of their S6E88A0 controller.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
> Hi,
> I recall now that tabs cause a syntax error in yaml, should be easy to check 
> in checkpatch.pl?
> I hope there are no more embarassing oversights left.
> 
> Changes in v2: use yaml format for the binding
> Changes in v3: fix oversights too embarassing to admit here
> ---
>  .../panel/samsung,s6e88a0-ams452ef01.yaml     | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml: $id: 'http://devicetree.org/schemas/display/panel/samsung,s6e88a0-ams452ef01#' does not match 'http://devicetree.org/schemas/.*\\.yaml#'
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.example.dts] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1231597
Please check and re-submit.
