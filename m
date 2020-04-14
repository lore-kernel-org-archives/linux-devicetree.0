Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A45C3815B
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 13:55:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 265F5206A2
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 13:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586872506;
	bh=3Ovo8Wi8H981/oit9LBxX6faX8yu1uj0s30jaGhqVeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=cN7cppgYBFyF4sFA3mb1toHmlIf35cg+k3MT6EF3jnfGmu9rYelJ1OPik1w74jAI+
	 Sh9l6r7T/VEfEPdtdseRYMg26j1/Wbw8iYLRd2gxCOB/91xnLPPbQj06aoKka7kRk7
	 uMamljfZgWiBxulKCFFKGulG2pAQNSyvmtS3ugX8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388299AbgDNNzF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 09:55:05 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41583 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388218AbgDNNzD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 09:55:03 -0400
Received: by mail-ot1-f68.google.com with SMTP id f52so12817035otf.8
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 06:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YU+s8KJHPoG+5CMXLSiMUkq8GexUSBLCLmbjRLZ/BS4=;
        b=oR5jP6KR9kK3nd3VSCGc/tvdnomXHR8hLZXVIuaAi6YobkB6yW1FCBGOSGp1lpIeEg
         Vm8wqB6eWD/Je67I6kt5wzjEUMRQk9W06/yhF9R0jmivhtSAmcsWdeDVAqYBXrxFHtrx
         yDkJH4eky3UeLkmHikjVpcjT/zXbS9aHwZy0YR+rjNti+ZSnQeMiBVpOBdU9GtEKJV9k
         pDRC75Yw2m33EWW8CmIQEsHXDeu4weQWYFqOseArVWgQxJKI7KoJKRhKU+wpoEnCYCKb
         WxXaSF5Mv3LVuyzL6zuV/dfDutOSKH7yqZcQCwtLhZ7OAG/GGZZBZvv0p3zpK6TaPIeA
         t0bw==
X-Gm-Message-State: AGi0Pubk2jhuc5thPaG+jYGUu6sa5KoEBcbQVytLXUQ86PP+lEqjdE7i
        2XGbur3xz01dNcTqkOpp2Q==
X-Google-Smtp-Source: APiQypKFcSonmodklDfiIz6RAoA+hZrCMZcKJ7Z3HFE8/a4fOuWjcDA1laurqKUpYI+jQDGmF1f+wA==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id e14mr286700otj.91.1586872502734;
        Tue, 14 Apr 2020 06:55:02 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h11sm6127563ooj.17.2020.04.14.06.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 06:55:02 -0700 (PDT)
Received: (nullmailer pid 28083 invoked by uid 1000);
        Tue, 14 Apr 2020 13:55:01 -0000
Date:   Tue, 14 Apr 2020 08:55:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: display: allow port and ports in
 panel-lvds
Message-ID: <20200414135501.GA22903@bogus>
References: <20200412132139.11418-1-sam@ravnborg.org>
 <20200412132139.11418-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200412132139.11418-2-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Apr 12, 2020 at 03:21:39PM +0200, Sam Ravnborg wrote:
> Both port and ports names may be used in a panel-lvds binding
>   port - for a single port
>   ports - if there is more than one port in sub-nodes
> 
> Fixes the following warning:
> advantech,idk-2121wr.example.dt.yaml: panel-lvds: 'port' is a required property
> 
> advantech,idk-2121wr.yaml needs several ports, so uses a ports node.
> 
> v2:
>   - Use oneOf - makes the logic more obvious (Rob)
>   - Added Fixes tag
>   - Added port: true, ports:true
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh@kernel.org>
> Fixes: 8efef33eff50 ("dt-bindings: display: Add idk-2121wr binding")
> Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  .../devicetree/bindings/display/panel/lvds.yaml        | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>

One nit below...

> 
> diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> index d0083301acbe..a5587c4f5ad0 100644
> --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> @@ -96,12 +96,20 @@ properties:
>        If set, reverse the bit order described in the data mappings below on all
>        data lanes, transmitting bits for slots 6 to 0 instead of 0 to 6.
>  
> +  port: true
> +  ports: true
> +
>  required:
>    - compatible
>    - data-mapping
>    - width-mm
>    - height-mm
>    - panel-timing
> -  - port
> +
> +oneOf:
> +  - required:
> +    - port
> +  - required:
> +    - ports

Should be indented 2 more spaces. It only matters for any scripted 
processing we do on the files.

Rob
