Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55AFDC2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:58:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 286562076B
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586890728;
	bh=mzqmXZwWcjLn1fqvRjFNq+jNJfOMWMRovEF7bTcwTT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=eJUDKmX843yuGryuChL48dAI7o9A3KPk5kJHTdkcJYEvsbQcci4PdwPnWKqiaqxP4
	 ph8JuOL70JxPstnAp0Vmbb/JAGVTKHF8y6Ub2nzrHHoe0FtRHcXHMlSotVy0TDQF8Y
	 +tVgRE03D8K3tEK+t5+d60iDSKNikwe/nRrp6Dlc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504526AbgDNS6n (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:58:43 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:45532 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504523AbgDNS6c (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 14:58:32 -0400
Received: by mail-ot1-f68.google.com with SMTP id i22so728304otp.12
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Yng5I6SxhHzfkzr2Hr0xo1uj8i038bsOL/UPbVnFotM=;
        b=lMXllEEA4EFDxiJ79EiKjxe5c90MbwZiTe8oPo/YA6pzE5ev6947YMxLzhQBbVCNz9
         +ARFn7HRcILe/gFF8CCqlOH98M3J6WEeZBH/B8YImCS5j8Slms97+l8A0mtuVh6UNd1B
         VVeyD08AUkI/yjsZBa7qgstArCVhFeQ4A4pgeE2MV5CzE3OECR2bVSvDSy0cYd3OF529
         FsAzN4Ouug1PEj0urufpe6v2PnccUH1ztpff3eTaB0t0vS2ItaYsdD9WQ68k5r2R68PJ
         DrbplxcVR6iva/Mc7X0YUH8Z96K2aB5bK4kUygyUvillWLsIjAha7qx4QJITmpIaG082
         mx/w==
X-Gm-Message-State: AGi0PuYa0xaveE/q+Yx05KFvYTSlGtRjjfanITy2plvSVO34a20loCOd
        PzLlg2FdLpXCB7emrq6pDg==
X-Google-Smtp-Source: APiQypJAXLhCXOxbvzoI0+y87beqq2cSSLCYqoDH1f37RG8woHymrKR90IKI0Ay88yoSJW1lCaVPjA==
X-Received: by 2002:a05:6830:11d8:: with SMTP id v24mr20303578otq.258.1586890711805;
        Tue, 14 Apr 2020 11:58:31 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 85sm803962oie.17.2020.04.14.11.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:58:31 -0700 (PDT)
Received: (nullmailer pid 15450 invoked by uid 1000);
        Tue, 14 Apr 2020 18:58:30 -0000
Date:   Tue, 14 Apr 2020 13:58:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v2 31/36] dt-bindings: display: convert sharp,ls037v7dw01
 to DT Schema
Message-ID: <20200414185830.GA15392@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-32-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-32-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed,  8 Apr 2020 21:51:04 +0200, Sam Ravnborg wrote:
> v2:
>   - Add min/maxItems to mode-gpios (Rob)
>   - Fix bug in description, mode is up to three gpios (Rob)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/sharp,ls037v7dw01.txt       | 43 ------------
>  .../display/panel/sharp,ls037v7dw01.yaml      | 68 +++++++++++++++++++
>  2 files changed, 68 insertions(+), 43 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
