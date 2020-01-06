Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B13C33C9E
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 22:16:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B7D02080A
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 22:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578349007;
	bh=fu2DqfrbuFaGWXKt9NCaBaBO2DiLlEmXWK2BMRTlfzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=T9jdtWNqlSVFqnk5e3l6Wszv3QRq8Nyq5CtA3zq9bJ/Ooqs0AVWbOr6j1Xh7ccs8y
	 HOpPn1Pzv/s5ixw41XSVNOu2+ZSwTNEbT9tiVW8+8V4X842fOPf4heGuu77jR8C5Wd
	 O14PxRfgOAi8MVDAfsIo/LRtQGsHAQ9IbdB2g8CM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgAFWQr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 17:16:47 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35161 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbgAFWQq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 17:16:46 -0500
Received: by mail-ot1-f65.google.com with SMTP id i15so5944381oto.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 14:16:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JawZyvCEqxbxDbUWcz/6qCJtFgFJJZ6Kq0F51D4TyLs=;
        b=A0oEYsVlpSML9oeZ7k80QnJTMPjkJv+n86CmNmh2gYD2XlsWHHlRi1AmSd4fvhUT2g
         MnJYcNj8SryKToTYBkf//eHTATdu7e09KHL71tyFRFjyMyJ/fTKR6z67FsV6oZe5QXPy
         NYsP8lCD2/RcibOPHrLAlbhK/JtRLj6yF5Fg3W2t2MneLJOoGOrDFXOeXNIHP9Uuh3WM
         Qx8VHaJRTDhKaOj4NFM1AbtKtUEClk+g0AqhkmNZoK80tDzLUveRSwB3DCLaIzAS5kig
         Czasy1n83SVa4DwR1viwYioBlvwt5AYYBW79E+yoZ6rOKDOgdvtgd20FUMO0DTTAEtGk
         Vdxw==
X-Gm-Message-State: APjAAAU/Bp48ToM3l9BiN9QjwVArN9cWIRU7ml4NzA0yZLvOLFoav7mT
        kmHFML1sMcHCX1BqIULMrivv/4Q=
X-Google-Smtp-Source: APXvYqx79k7IRvBqwRJoYYJwA9BTtv+PZ7Sz0+4J2407EIuNwBb+m2GS7tzmZes5oiOzpRD5dnI6Nw==
X-Received: by 2002:a9d:6f07:: with SMTP id n7mr114407603otq.112.1578349005692;
        Mon, 06 Jan 2020 14:16:45 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id v4sm4202777otf.7.2020.01.06.14.16.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 14:16:44 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22043f
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 16:16:43 -0600
Date:   Mon, 6 Jan 2020 16:16:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kamil Debski <kamil@wypas.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 01/20] dt-bindings: Rename Exynos to lowercase
Message-ID: <20200106221643.GA31683@bogus>
References: <20200104152107.11407-1-krzk@kernel.org>
 <20200104152107.11407-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200104152107.11407-2-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat,  4 Jan 2020 16:20:48 +0100, Krzysztof Kozlowski wrote:
> Fix up inconsistent usage of upper and lowercase letters in "Exynos"
> name.
> 
> "EXYNOS" is not an abbreviation but a regular trademarked name.
> Therefore it should be written with lowercase letters starting with
> capital letter.
> 
> The lowercase "Exynos" name is promoted by its manufacturer Samsung
> Electronics Co., Ltd., in advertisement materials and on website.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. New patch
> ---
>  .../devicetree/bindings/media/exynos-jpeg-codec.txt         | 2 +-
>  Documentation/devicetree/bindings/media/exynos5-gsc.txt     | 2 +-
>  Documentation/devicetree/bindings/media/samsung-fimc.txt    | 2 +-
>  .../devicetree/bindings/media/samsung-mipi-csis.txt         | 2 +-
>  Documentation/devicetree/bindings/phy/samsung-phy.txt       | 6 +++---
>  5 files changed, 7 insertions(+), 7 deletions(-)
> 

Applied, thanks.

Rob
