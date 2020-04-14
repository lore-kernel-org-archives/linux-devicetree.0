Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5B3C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:51:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33ED32074D
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586890278;
	bh=eqrhHkPOHegXhACAfMDsjknbohiyeP44WlWduF5g9TE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=H+39k/BCkbDZa/I2tsruCYhF9PVPepjVTpfqY7PocGaUPNvUtHIr6/v372rit/Gly
	 H8FwxVAhuDiC7BWzjBPvNyxmr8gRHzhXdDb4VL57IwHtSjD9XTkgFsVqCUQnkeyrKN
	 VCLuNBaVKtuTXqgFiyS59J8vTjZbv6qBI/AwkCJQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504463AbgDNSvR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:51:17 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38968 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504444AbgDNSvO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 14:51:14 -0400
Received: by mail-ot1-f67.google.com with SMTP id x11so754724otp.6
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=raTWEup8fmKQExYZrBvEOi6xqIpPvBYCwGUHV8bR+o4=;
        b=j9odoVLSC11mlUvoV1lTORBBPF/CrUCt6qlzzuZPBPQ/rSYLaIOrSgLgBoCXZizS2u
         vqa+lcHTiR6EeWO+LHpXXKsQO1qk/9Vn7rZ+81yEjevlRqfJ5BcDysARFFvUzKJObE8L
         H6wB/n4cdVsjFK3avrtbOybS3mJ1Jz625q60lU9GFWhWldPn0wtUiciY1l73JoCal4jV
         /Iig4ZBCqWwjDyG7/OpMp1QkqfkKYnEV9Pp1jPKB7smTT8JudA73TR7c6aMn882Zn+70
         oS4wKEg8vPYW8NEYp4ebpNo3+ltMGcxlcPPqWT6d6prrW38EHvJdWpOZTSXV3WIo7JzJ
         yMzA==
X-Gm-Message-State: AGi0Pua0O3EwBL2JBlp+JuDkifYotOgIJX25pZYL9xYypKTnXg1FZcDo
        4NAClB31frPvoPl/3ZM4QQ==
X-Google-Smtp-Source: APiQypImkltWUAAeN+b/so7FfCNZ37nToUuwwwDbT8q/KQPG1mg4+ZhHbz5Xr6LcVwyMthM9+X2CEw==
X-Received: by 2002:a4a:be89:: with SMTP id o9mr13383278oop.20.1586890272229;
        Tue, 14 Apr 2020 11:51:12 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t203sm441256oib.52.2020.04.14.11.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:51:11 -0700 (PDT)
Received: (nullmailer pid 4562 invoked by uid 1000);
        Tue, 14 Apr 2020 18:51:10 -0000
Date:   Tue, 14 Apr 2020 13:51:10 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <mripard@kernel.org>,
        Marek Belisko <marek@goldelico.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v2 24/36] dt-bindings: display: convert toppoly panels to
 DT Schema
Message-ID: <20200414185110.GA4465@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-25-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-25-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed,  8 Apr 2020 21:50:57 +0200, Sam Ravnborg wrote:
> v2:
>   - dropped use of spi-slave.yaml (Maxime)
>   - added unevaluatedProperties (Maxime)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Marek Belisko <marek@goldelico.com>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../bindings/display/panel/tpo,td.yaml        | 65 +++++++++++++++++++
>  .../bindings/display/panel/tpo,td028ttec1.txt | 32 ---------
>  .../bindings/display/panel/tpo,td043mtea1.txt | 33 ----------
>  3 files changed, 65 insertions(+), 65 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/tpo,td.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
