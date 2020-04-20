Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4DE2C3815B
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 18:43:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D4E12074F
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 18:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587408229;
	bh=olQuPn8361J0Q3JaWU5P2rxD0JudqTjTWp8tJXTS66Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ZdrnNkfmGMlKR+NUAx0sdzOMPjbrgR518fqr0hGLXEe80E7tLhMN3MAPSstyQFOAl
	 RW0Fr5NuRv7i22MGmCzgqbdc/UUSV1iyebihQIBFSnIFWTu9KhttRHQktwCSzqTedu
	 guTspuOKdeHAb0VPkRRoDn3NUcJwr9vhlbC60k6k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgDTSnt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 14:43:49 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33850 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgDTSnt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Apr 2020 14:43:49 -0400
Received: by mail-ot1-f67.google.com with SMTP id 72so2607396otu.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 11:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dz2IRzb2aQKWCSo1yDOq/Bg3xUcblLFiI3vUh+v9Ahg=;
        b=B/pdwlA64u0vPtKvZDx32pPfDg1SZbYLcyLT5cP7xsU/rVLpPYkhIkbp28hWhVv9xZ
         YoFsLYOFXF+8yys+kiahU8aKu3pYiLk+FXNLJgbwdz4TLiMAh3G+dQ/DwDMD7mVwKG57
         R0DncA2vzBhRc3xvV7fxl6HCz4mpRapkpw+diNYE8h6LUZ4KXvmMW3wopMBgPsceJzLj
         X0T7y68TGU3nZBsFqYzIf8WoN5/lrdOdnOyG0waSCXRZviE/Qcru/uUfUYKgV7f4n+jI
         yDfDpKkW4NRrZqiILENFw+EimkJSHMeFhK4IHbgemK6yaVU2g0pD2pvs3enbKf/C/vwO
         CjzA==
X-Gm-Message-State: AGi0PuZSYZydLxU0PQeMfxHtWQGStDa1AhR9PPdiKxuY+8wWIl44IDgC
        4FbagDrKtplTBWthVsGQ+A==
X-Google-Smtp-Source: APiQypJacM9Mp3Jhi8sMpzV92OyGyCiJaYdelbg5r2DMr3hLXSpT0H55qGv4Yut0KPWXFsRFeco8Mg==
X-Received: by 2002:a05:6830:138c:: with SMTP id d12mr3323171otq.310.1587408228381;
        Mon, 20 Apr 2020 11:43:48 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 76sm107954otg.68.2020.04.20.11.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 11:43:47 -0700 (PDT)
Received: (nullmailer pid 23028 invoked by uid 1000);
        Mon, 20 Apr 2020 18:43:46 -0000
Date:   Mon, 20 Apr 2020 13:43:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     tangjianqiang <wyqt1985@gmail.com>
Cc:     Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org,
        Tang Jianqiang <wyqt1985@gmail.com>,
        tangjianqiang <tangjianqiang@xiaomi.com>
Subject: Re: [PATCH] of: fix the warnings from command line.
Message-ID: <20200420184346.GA22859@bogus>
References: <1586507524-3987-1-git-send-email-tangjianqiang@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586507524-3987-1-git-send-email-tangjianqiang@xiaomi.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 10 Apr 2020 16:32:04 +0800, tangjianqiang wrote:
> Gerrit will complain with this warnings:
> ERROR: (foo*) should be (foo *)
> 
> Signed-off-by: tangjianqiang <tangjianqiang@xiaomi.com>
> ---
>  drivers/of/fdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks.

Rob
