Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9015C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 19:43:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 973F6207F5
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 19:43:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lGILnOI2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730032AbgG1TnB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 15:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729918AbgG1TnA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jul 2020 15:43:00 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F8CC0619D4
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 12:43:00 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b186so1267438pfb.9
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 12:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=vnxwi5iPCJkQKF4flCKDFiMcmGVkTk/FZPhjrVn7vQ8=;
        b=lGILnOI2EA2ePNYpXzRAJhVcrhFB5Z+3mS7RTR0wzoPvklGepKua58mr9TZ3zuL0VU
         dYg64ioAyhPP6TnZY+ZxqgWDb5liZYowK2t4+fhaQCN+o5WeoEU0z4A6AXz1+4TQ3fnr
         Zbge8OACGr5Fj8DXtHimT1BBBOOPSv4jI1IKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=vnxwi5iPCJkQKF4flCKDFiMcmGVkTk/FZPhjrVn7vQ8=;
        b=rrTGLcpPo2BC7X8XSLItClyfX0CSlvOyXl1aDoJ5f3m7h51EqaFxmcVDBRiLwJKG3u
         QK01xoQlobM/ApooXCsOp4VJ6XSYZbWwk6yrremXcFbey36XuxpEjhfOu7MBq+Xp2Qkb
         RaypW1zwi4Y303cFhc8ghl6TvvnBLvSgW5+7la7MjmQ5rdWQl9EAiRhTfKCXSLmpndbR
         zOwI5T6/bQUVt1eKuYtzMJP9FPnyzhsj7drPQ54X3CSl+yXnPXRfmk4PawtveS2D4y6u
         OQMXP3LJBdHIMmEEHDReedfxMLGkYxVscHXoCCUX8KdJrji/WorJI3JTh/H6DAqLpwtw
         koaA==
X-Gm-Message-State: AOAM532kYe2YtlNH71va7acwpmg6ezpa7dYWrdRxWRIZGN4bCEavKh6F
        zIRWBpjYl3acl8iFO10Rn8vf5w==
X-Google-Smtp-Source: ABdhPJx/Gpp+X34yyUGrc2pTEF69GOO3vQr5iwhFpQeyJ7MgTI61ZKxOdL1srQX1mC2VDW9ZhI+mXQ==
X-Received: by 2002:a62:2e45:: with SMTP id u66mr1993692pfu.121.1595965380254;
        Tue, 28 Jul 2020 12:43:00 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id o11sm19315046pfp.88.2020.07.28.12.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 12:42:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200728091057.2.Idb6af9292f18f54be0b62cede52b481063738707@changeid>
References: <20200724183954.1.I2e29ae25368ba8a72a9e44121cfbc36ead8ecc6b@changeid> <20200728151258.1222876-1-campello@chromium.org> <20200728091057.2.Idb6af9292f18f54be0b62cede52b481063738707@changeid>
Subject: Re: [PATCH 02/15] iio: sx9310: Update macros declarations
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Daniel Campello <campello@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Enrico Granata <egranata@chromium.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org
To:     Daniel Campello <campello@chromium.org>,
        LKML <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Date:   Tue, 28 Jul 2020 12:42:58 -0700
Message-ID: <159596537832.1360974.10421899531703700889@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Daniel Campello (2020-07-28 08:12:45)
> Follows spec sheet for macro declarations.
>=20
> Signed-off-by: Daniel Campello <campello@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
