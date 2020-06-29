Return-Path: <SRS0=mth2=AK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67612C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 23:39:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4248A206F1
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 23:39:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j1hAeUKB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbgF2Xjb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 19:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728255AbgF2Xjb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 19:39:31 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64795C061755
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 16:39:31 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id l6so5603393pjq.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 16:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=diLby1jQ1r5s0GrclM6W1gx4YuiiZ4L1v+BDWKEqjA0=;
        b=j1hAeUKBloT3LJ5xydI90XP+hIAw2uQckAJBvJHdaPw9e3TmoCYvmHKKfb43MBFYqK
         ZOw7/LcDAnzSwhkaCKXlLr22p7YCA20mBAacYfXwL9ZaJHLTbsP5NIfOxfvDSqLF0zXi
         2IcSPq2uwn2GgnMHzrTLQJt+pDYhTSv19nddOMlb5dh1WV+fuLBRm3QruIUNN6xfTHzt
         9lM6lN8T4A55/YkUP/BgsUFDa628RchOrpZvH10fAs7wx0Uy0gDqv5yUncybkO/+0acm
         1L3bH2l4EVLTk1lEHTakfmNKdAdXK2YhIv3vUGVnCUfVj3HfhcwZDLE8ZtTEWQwkgq2D
         JOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=diLby1jQ1r5s0GrclM6W1gx4YuiiZ4L1v+BDWKEqjA0=;
        b=BODYLeZ8z2gWZ82BQ+ZS7u+AfBeo1CDjfPKwRP1K6bF7FeY+BYuh52qSR6PzjBWGe9
         XtlSMwaljXJBaz8yWjYR4lv3XbutBMk42v+MpDlKmyK3PWB09dyx25P83ATHYHa/CdNd
         9hNOFfiQBZF2zBoh2tMxEBpHQ72FFmLbAEo+zjGfTheFOZA8QQT6hr2/OmfC+0xsfpGp
         WNvXM2mEbeHtCiyJoqaXD3WjNHqwzMMsilXo3Gmb/v3D7lX4RHNvOcYUqsA+tWlRA/zy
         Wgz/WcyIpIjlGM70uRtu1HVt6s7B4cfGCCBhLLTVBYPZLSh7idn3ZR8Te/pbdhV+40yp
         v8lg==
X-Gm-Message-State: AOAM531zDI7mZwbTyYcpUS9759gpEl++WOqfXn1h0XZzmllVw3oWSedf
        Okjmaf7+b+4WHD5YM2H8O00=
X-Google-Smtp-Source: ABdhPJyFKVh8WTeL0w3Jgf32OyT+y1GtLuJwn/2Ji9+E5wJgd5sQ6iWhuAm53RH168CV+Qz5sBJgbQ==
X-Received: by 2002:a17:90a:c85:: with SMTP id v5mr18575772pja.114.1593473970906;
        Mon, 29 Jun 2020 16:39:30 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
        by smtp.gmail.com with ESMTPSA id f15sm669719pfk.58.2020.06.29.16.39.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 16:39:30 -0700 (PDT)
Date:   Mon, 29 Jun 2020 16:39:28 -0700
From:   Tao Ren <rentao.bupt@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     robh+dt@kernel.org, balbi@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: aspeed: Remove the leading zeroes
Message-ID: <20200629233927.GB25245@taoren-ubuntu-R90MNF91>
References: <20200629214027.16768-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629214027.16768-1-festevam@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jun 29, 2020 at 06:40:27PM -0300, Fabio Estevam wrote:
> Remove the leading zeroes to fix the following warning seen with
> 'make dt_binding_check':
> 
> Documentation/devicetree/bindings/usb/aspeed,usb-vhub.example.dts:37.33-42.23: Warning (unit_address_format): /example-0/usb-vhub@1e6a0000/vhub-strings/string@0409: unit name should not have leading 0s
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Thanks for the fix, Fabio!

Reviewed-by: Tao Ren <rentao.bupt@gmail.com>

> ---
>  Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> index e4e83d3971ac..8b019ac05bbe 100644
> --- a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> +++ b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> @@ -127,8 +127,8 @@ examples:
>                  #address-cells = <1>;
>                  #size-cells = <0>;
>  
> -                string@0409 {
> -                        reg = <0x0409>;
> +                string@409 {
> +                        reg = <0x409>;
>                          manufacturer = "ASPEED";
>                          product = "USB Virtual Hub";
>                          serial-number = "0000";
> -- 
> 2.17.1
> 
