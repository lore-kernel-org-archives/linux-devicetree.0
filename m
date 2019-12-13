Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166C2C43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 10:30:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8154B206DA
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 10:30:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="gW9j/8ws"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbfLMKaa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 05:30:30 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35957 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfLMKaa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 05:30:30 -0500
Received: by mail-wr1-f67.google.com with SMTP id z3so6082227wru.3
        for <devicetree@vger.kernel.org>; Fri, 13 Dec 2019 02:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MW5Zie9YB0PL/+73229K4MQ5EabrfJmWqqvKiyi55ZA=;
        b=gW9j/8wsNp4IM0Jiyq3lMOqqEAuOi9Ql72oIJrDEHg0kC1IfWAqPsUXX585RtN+bxp
         TIVe8BB6lz6T4CcZo8QAjZ/wnuEaUBJLHWxabM2ODQY633YIsz5Ux7WXSz8AZ7NPGOIK
         qo3jLccGJ8yqPvIhtaNMMt6pcAIw5KPl6him4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MW5Zie9YB0PL/+73229K4MQ5EabrfJmWqqvKiyi55ZA=;
        b=n2WLRStdXipfZ9PeJcKosYrduXCEi3zA+Nr2ZYr4J37ufKZMuccmEbJFAskZ9VlPju
         Xe7LGZCqf/DvpKPaGxRlQyyIh4tyUu7dfBNqc3sXNSx5IsM+oUReycKXEjMXn2USu3hz
         tnHAKyJANSyTzij3a3/rlHcKyYxYUOsiqfLAQOtB9tjKOLwYX07SmrGgCM7Y2Txx6UWG
         9ze1jla9PFsCNyWTHxYB0o2gmw7vkuL8GViFhv7jM7idTx8XFxH/RGe6dJ1xLy/Bh90X
         XUgDic6tq2NKIoRj5kOOiIJZ65hB2VIJxvL5db/g/itgP7qM26V6K7VEcxZk8UtEE/bY
         IT5Q==
X-Gm-Message-State: APjAAAU4XbM/rsQBF0Kkzz9r3FH7IlWqr2LY4QMsJPsxTlh4OYrIbUNR
        qolcxwKIGx4VHf8ud4jEpZAZbg==
X-Google-Smtp-Source: APXvYqyI4U5+ACQOcPaVzoLD3INSXA2p09Bfcn2xpGoA/cyWYIWcbwgJC6V20ZUZ8g7cgZ5bgsAfTA==
X-Received: by 2002:adf:e290:: with SMTP id v16mr12441091wri.16.1576233027546;
        Fri, 13 Dec 2019 02:30:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
        by smtp.gmail.com with ESMTPSA id j130sm4983543wmb.18.2019.12.13.02.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 02:30:26 -0800 (PST)
Date:   Fri, 13 Dec 2019 11:30:24 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jyri Sarha <jsarha@ti.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        yamonkar@cadence.com, praneeth@ti.com, sjakhade@cadence.com,
        robh+dt@kernel.org, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
        laurent.pinchart@ideasonboard.com, subhajit_paul@ti.com,
        sam@ravnborg.org
Subject: Re: [PATCH v3 5/5] MAINTAINERS: add entry for tidss
Message-ID: <20191213103024.GH624164@phenom.ffwll.local>
References: <cover.1576158368.git.jsarha@ti.com>
 <09da3a37ca59bb45bef62f2335a191985363d393.1576158368.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09da3a37ca59bb45bef62f2335a191985363d393.1576158368.git.jsarha@ti.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Dec 12, 2019 at 03:52:01PM +0200, Jyri Sarha wrote:
> Add entry for tidss DRM driver.
> 
> Version history:
> 
> v2: no change
> 
> v3: - Move tidss entry after omapdrm
>     - Add "T:     git git://anongit.freedesktop.org/drm/drm-misc"
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  MAINTAINERS | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 741e3f433f6e..e89fbfb1ce06 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5559,6 +5559,17 @@ S:	Maintained
>  F:	drivers/gpu/drm/omapdrm/
>  F:	Documentation/devicetree/bindings/display/ti/
>  
> +DRM DRIVERS FOR TI KEYSTONE
> +M:	Jyri Sarha <jsarha@ti.com>
> +M:	Tomi Valkeinen <tomi.valkeinen@ti.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +F:	drivers/gpu/drm/tidss/
> +F:	Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> +F:	Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +F:	Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
> +T:	git git://anongit.freedesktop.org/drm/drm-misc

Is the plan to also move other TI drivers over (like tilcdc) or just an
experiment to see what happens? Asking since if eventually omapdrm moves
that might be a bit much (or at least needs a discussion first).
-Daniel

> +
>  DRM DRIVERS FOR V3D
>  M:	Eric Anholt <eric@anholt.net>
>  S:	Supported
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
