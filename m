Return-Path: <SRS0=V/11=AM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8172FC433E1
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 07:50:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6236B2073E
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 07:50:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s3vWfnzq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728415AbgGAHuP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Jul 2020 03:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728331AbgGAHuP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Jul 2020 03:50:15 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C94EAC03E97A
        for <devicetree@vger.kernel.org>; Wed,  1 Jul 2020 00:50:14 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q7so12547464ljm.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2020 00:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BK6LxcRRscqsnEluIPMx3er/wRY4fpMutYOWykUjzz8=;
        b=s3vWfnzqTWTwOUb5oa/2WEKziwyZzj5P21ho4P1IyINRBBNYpb5sRzdLP2skObVtce
         ivbDf8XMoC+QAkjxEBT0WtQ58ZuKaw27t7XvTi3rW25VVJJH/FwRc0EY3368hJixCYaM
         Z8Q9IK68mxFCDPiSXtl3aCA9E0tZhB6n3euJ65+MJM1jldE+RnVoGvM6SfzV188kugqu
         BGknh6a3NCrCbH0eppFCaZHHrhhsDyvDDb3N51tFAp3aUb2wNufBbUh0pQhpQvHxgCns
         orFgCtiZDeF+ppwNMX/J6Icgerpaii4OLN2Ydw76eQWP2rg9HSx/8yvoUvzWhKI2Hw25
         7DbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BK6LxcRRscqsnEluIPMx3er/wRY4fpMutYOWykUjzz8=;
        b=s+QXgJ2UM6Ccmqk1OKU7F11kiVvQaYxTkapNv7W7Fh6levgR/xqEptxR1n9jIyGQ86
         Rt7T6Ypt3ljNAXLTB8f4SORINHlSA+ggcIDlVacLyekK00+Bgs6rjAGT0G9BoqYj5/dy
         fkFSxYocFfTLvnx2VMw8Dlm0srgWcH3tsunMeS4x5NY/s2XSf/VHECDq1KexJ8lrgLGA
         QNXqb2KXwkwxYnaTFE+ONbT5FT9FbWN46mD5KwUfLLUuj9RYr9QpfZy+XMBEY0PbY/Rj
         SNM8Z87jD6Gev+ocpkYvw+FirW2XyIuYVHGqySObqD2GQswRezKPlzRd28w9OWUAnY/t
         W3QQ==
X-Gm-Message-State: AOAM5305owjUAonf8rPyprIee/NYGYnIj+4n18ZMOKi9pYDIZjy+UwSd
        wWVTGZ1a+9hMxc/ZreCZAkPoLhO6vfsSxCd+rCf4WQ==
X-Google-Smtp-Source: ABdhPJyDVgBP0COvfyAl2ABGdKqijtb4W240jklwI9mjQ/CSvLAJC8aqzhqumLuGWJRH5kaYpZDb17Vcges4Q5+E7mQ=
X-Received: by 2002:a2e:9c3:: with SMTP id 186mr13146317ljj.293.1593589813316;
 Wed, 01 Jul 2020 00:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200626005601.241022-1-megous@megous.com> <20200626005601.241022-9-megous@megous.com>
In-Reply-To: <20200626005601.241022-9-megous@megous.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 1 Jul 2020 09:50:02 +0200
Message-ID: <CACRpkdZAZauS19W7GTbhB4FgjrVtd2+RPx9cuLAac4s4vx234A@mail.gmail.com>
Subject: Re: [PATCH v5 08/13] drm/panel: st7703: Move generic part of init
 sequence to enable callback
To:     Ondrej Jirman <megous@megous.com>
Cc:     linux-sunxi <linux-sunxi@googlegroups.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Purism Kernel Team <kernel@puri.sm>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Samuel Holland <samuel@sholland.org>,
        Martijn Braam <martijn@brixit.nl>, Luca Weiss <luca@z3ntu.xyz>,
        Bhushan Shah <bshah@kde.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jun 26, 2020 at 2:56 AM Ondrej Jirman <megous@megous.com> wrote:

> Calling sleep out and display on is a controller specific part
> of the initialization process. Move it out of the panel specific
> initialization function to the enable callback.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
