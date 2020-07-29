Return-Path: <SRS0=UHbD=BI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 721EFC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 08:42:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F4D32076E
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 08:42:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HE7sii7h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgG2ImS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jul 2020 04:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2ImS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jul 2020 04:42:18 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E5DC0619D4
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 01:42:18 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id f9so1713507pju.4
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 01:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=aXoZD/sjDpEWgC90G0tbRlSg3ouqwk6Z53e9x6lUnWY=;
        b=HE7sii7hRjjmvwiQRJOVtVBeV9zc60V2y/ZRFYjWEIauLK/87smb8yCZAcQZQ7eLeH
         /PNdn74/kEGw5U9SoetNDcwWg9KOtEh4SqEn4EQxKvxB4p+v4qaC/0xNeCp02ANp+Mkh
         RRYhLZbrw9FAEJ1p5c/tNj9pejdsXD352HmNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=aXoZD/sjDpEWgC90G0tbRlSg3ouqwk6Z53e9x6lUnWY=;
        b=G2E1EUsfvXpBaQ2pYG7eLK+x/5/Q0pS94kXkoQvvd19Y6Q6cwtm6FKwRC+SeUXZtGt
         ssoiF0VKquk/u2GmPppDyIOlXJU8cL2HKgEAptjGDM6p2kIi0Xvi5kvXNVeejbFOm95O
         aLmdMx8VYmox11YJh+rQl8dIhmTB5Soeup1d3yqmp8FSuuubzXOxDbVh2xGrnJeLzb/b
         /G+w9rdY0LBSjoHLgv1erCe6Ke7iv76R8msukyEqiHEhy4TOJZnVBGbomrgFwjo/ykkO
         +M3YPPqewJO2k2XOwR76KVFBHPGGCYP2p+nXdZ+YjpIpgIG/oOwaseLpNFL47gxYpQqm
         4HMw==
X-Gm-Message-State: AOAM532PwjuNtvzgrNo9G3F9d71JZ0Zx48Z09vmDHrtr5DaRFuzX1xd9
        kVDzfJC1h0FV8cjrZeUvwT9YNQ==
X-Google-Smtp-Source: ABdhPJz1X/KuaL0DEpVO+OTg+AJlQykKUWOCJVQK39D8e0v6ixdTAsLkfpq/NI9BVxB0c1I9xGaRXg==
X-Received: by 2002:a17:90a:fa8c:: with SMTP id cu12mr8917242pjb.229.1596012137807;
        Wed, 29 Jul 2020 01:42:17 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id y198sm1591486pfg.116.2020.07.29.01.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 01:42:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200728170317.v2.10.I071b118136317d3ff77fc598079f21e4ed0e347f@changeid>
References: <20200728151258.1222876-1-campello@chromium.org> <20200728230520.2011240-1-campello@chromium.org> <20200728170317.v2.10.I071b118136317d3ff77fc598079f21e4ed0e347f@changeid>
Subject: Re: [PATCH v2 10/14] iio: sx9310: Simplify error return handling
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Daniel Campello <campello@chromium.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Enrico Granata <egranata@chromium.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org
To:     Daniel Campello <campello@chromium.org>,
        LKML <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Date:   Wed, 29 Jul 2020 01:42:15 -0700
Message-ID: <159601213589.1360974.3536496595430081422@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Daniel Campello (2020-07-28 16:05:16)
> Checks for non-zero return values to signal error conditions.
>=20
> Signed-off-by: Daniel Campello <campello@chromium.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

The mutex_lock, unlock, wait, lock, check wait, unlock sequence can be
improved in another patch.
