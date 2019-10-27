Return-Path: <SRS0=8gXo=YU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B2FCA9EBC
	for <linux-devicetree@archiver.kernel.org>; Sun, 27 Oct 2019 21:30:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E1F72070B
	for <linux-devicetree@archiver.kernel.org>; Sun, 27 Oct 2019 21:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572211826;
	bh=xMsLPLGZy0p7S7etueqNsf6fSlrnF7QtUoMUTi/pyQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KUlqaPecVctp+kJcVdkI9H2zi63HmsPp6g0Ba9EYKldFMg9VHdKA+97F/iP/WP0IU
	 ZCPwp88Li0IaF+re2YzzGyohzBLyCUVV2s3RV217hrEz/2V8PhqMI6+IU0ptu97JUh
	 fIDC+d/rg1w5Uxcu/wUSzGlwxORhfyd35VI7W7KA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731361AbfJ0VSy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 27 Oct 2019 17:18:54 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34629 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731353AbfJ0VSy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 27 Oct 2019 17:18:54 -0400
Received: by mail-ot1-f67.google.com with SMTP id m19so5492676otp.1;
        Sun, 27 Oct 2019 14:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4Z4POmfBxnTve/TeFe6tVda3gui3lY2BxTRhRLHONkA=;
        b=ef75i9HuJ3Ugls11Gr2jNvMCIW+57av3+a1jKOBx7jujzfD5pzkIMqqaDeEwFuDWlu
         608dMTqOkNT3AyjQ5Q2Y7k8mPO2FZzDu0ZN6v2qV0lPgaURpNzo8UB8MaCuFMe/OK9T1
         R15RszrdIUjSHbtQKQhapeSnTYZkxtwyJfFWIQNvpTYP8bFXnhyy7pRZJXJii3whFplE
         lGG7gZZvpCchGvFRYWBD0mLIaU6ekgmXADCldv9mWBK4sMaLoH32hUb/h15/+xWAPoIp
         aNh9Ee0Wy45PwSRacm9UyBTN5Z2SXl/aPf7UkDCyBIJ0sSH1ocPkSUrvMEHrQ0vkupNR
         atwA==
X-Gm-Message-State: APjAAAWnKf9cBOx0LmHfeHDRnJnO1xo6mHUFVqqXuot52rrsEaHkHFX5
        B6GZbXFd5KIf6vLvHA50hA==
X-Google-Smtp-Source: APXvYqxP+8+IsnyDDEo4vxPfx9BV8dQnee0SNZsJJyYEUINTujZCr3Z3GuqYJD04PWCinrxyAq9mDg==
X-Received: by 2002:a9d:5907:: with SMTP id t7mr10720393oth.118.1572211133556;
        Sun, 27 Oct 2019 14:18:53 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p7sm1742681oth.50.2019.10.27.14.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2019 14:18:52 -0700 (PDT)
Date:   Sun, 27 Oct 2019 16:18:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 2/4] media: dt-bindings: rcar-csi2: Add R8A774B1 support
Message-ID: <20191027211852.GA955@bogus>
References: <1571137078-28922-1-git-send-email-biju.das@bp.renesas.com>
 <1571137078-28922-3-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571137078-28922-3-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 15 Oct 2019 11:57:56 +0100, Biju Das wrote:
> Add the compatible string for RZ/G2N (R8A774B1) to the list of supported
> SoCs.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,csi2.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
