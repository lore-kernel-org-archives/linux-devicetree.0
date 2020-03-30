Return-Path: <SRS0=ov7W=5P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18933C43331
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 23:36:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DBDCF20771
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 23:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585611370;
	bh=lIHtkGyBDHA+6hRH9LkM+pr5mxMuR+A+Padnd3jRJjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=hepwDVWTq/80MgTGmnJrzunQ95fODarTsjX7qPK3pPv9w6xgwIPEnN8/Z8v5pz6h8
	 NGFOVHouCL62utsAHEVb1S2yhTvi+zpXoqUs6bkB7ERKyIbznbqo6CkZDqGJ5BM0uq
	 n0VnqQOskiOBYIVrlCdN3FrxpXncqSWJ1uWsCF6o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729196AbgC3XgK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 30 Mar 2020 19:36:10 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:36632 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729019AbgC3XgK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 30 Mar 2020 19:36:10 -0400
Received: by mail-il1-f194.google.com with SMTP id p13so17631023ilp.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2020 16:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tJ+W7PqwUd2b7HgYvn+6ChbsLdM7I8DUrq+Ppe8N+dY=;
        b=oRdRjtGmMFbVzcheQQ8TIEyYo2Q/60+MSt9NPNpmFZpuWMBfA8On3LNcZoHWIFwBpP
         qgz+GbwA2o3YpsySEDnnqDc/JuqosqobZmlsuUQ+zhhN7kcSsNGLc3KiJRtBd4HEWJWq
         WsRLKlkeqqdBQuzhj8fU1VB9q6yNBX8ytvg6JiCtSW9zrTbBI7t8x35Dd0pplpTlUMRQ
         vVXF2YgJzSOQnwoEVvS4tFgFue45GCUlb1zE1BlZDQUa4FwvqEzQaRpv3Na/WppHSq0u
         N5TLjakySqwDRPPnIrhnfWEqkM1XYUvnC3XgBp3BptGb/PxIBFdDZtwr3l093cRwZmwI
         Mpbw==
X-Gm-Message-State: ANhLgQ184R14dxMUIN7RLgf0v3r5gdH8e0R/7BCkl+ApNNfGR8BeGduZ
        VDCse6TamzKSdZ/JztHDCatDYfg=
X-Google-Smtp-Source: ADFU+vvGVNjMyzziYVF8jnwDOh234bqURGx5XRuXxyEu2xIE/sbpj1Tt2vpIK+1C3hue/9w3VRHeGw==
X-Received: by 2002:a92:774b:: with SMTP id s72mr12999244ilc.61.1585611369386;
        Mon, 30 Mar 2020 16:36:09 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id o76sm5335923ili.18.2020.03.30.16.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 16:36:08 -0700 (PDT)
Received: (nullmailer pid 6527 invoked by uid 1000);
        Mon, 30 Mar 2020 23:36:06 -0000
Date:   Mon, 30 Mar 2020 17:36:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/2 v3] bus: Add DT bindings for Integrator/AP logic
 modules
Message-ID: <20200330233606.GA6429@bogus>
References: <20200320134524.52140-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320134524.52140-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 20 Mar 2020 14:45:24 +0100, Linus Walleij wrote:
> This adds YAML device tree bindings for the Integrator/AP
> logic modules. These are plug-in tiles used typically for
> FPGA prototyping.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Put proper ranges around the addresses managed by the
>   LM bus, 0xc0000000-0xffffffff as
>   <0xc0000000 0xc0000000 0x40000000>
> - Put unit name on the first LM bus bus@c0000000 in the
>   example in the bindings.
> - Drop leading zeroes in the unit names of the devices
>   in the example.
> ChangeLog v1->v2:
> - Fix Logical->Logic spelling error
> - Set generic names for bus and serial
> - Just map the addresses 1:1 and use empty ranges, as the
>   LM's don't really translate the address.
> - Provide proper DMA ranges: the LM modules see the RAM at
>   the system-wide alias @80000000 rather than 1:1.
> - Drop the reg from the bus node (we just need the ranges)
> - Make the regexp for the bus node such that @address is
>   optional, as we don't require any reg on the node
> ---
>  .../bindings/bus/arm,integrator-ap-lm.yaml    | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
