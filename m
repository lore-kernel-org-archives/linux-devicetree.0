Return-Path: <SRS0=UHbD=BI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EB8C433E3
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 00:52:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3A9F2083B
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 00:52:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MMe+jKln"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730884AbgG2AwD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 20:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730871AbgG2AwC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jul 2020 20:52:02 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E40C0619D4
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 17:52:02 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t15so1149398pjq.5
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 17:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=QDhTYDygqkx2ntO2vI3Axdh1bIOd/5JCuYmPgDBl4yk=;
        b=MMe+jKlnCKMx2FZO2VsiHo6y4GEpAHlUeDHRMx1F/oUmucRd/y+r9xzP9h6Vq0eamu
         CfSVX2GRjk4mf64O4JVyRwznmz/0c9k2ZakIFljBpRsL8/GbIsBi+5Loow1P05U4PVec
         /Fmf8SjsfMUpx8mwOZiiu9Pffhfyw+V0rF6v0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=QDhTYDygqkx2ntO2vI3Axdh1bIOd/5JCuYmPgDBl4yk=;
        b=iB3ioJL2bSA/KG2Odhw4gL8f8wwmhwdVBF2HO4qPrzE80IvvmecZfa2hVn4YQuG+9G
         MsxexPTwKce8HJuhp0/GfmgmGsulBCSlKrlaGjj1Zpp2XadqoT1rlg7iddhEHT44gy4V
         nClSTbFl5X1YChWGA3Qt3HKJt32OPjnCzFUF74B57Bg7EsdmFdVd58GpS97HYRl6w2f+
         kks2kXdSk/kaookgSPxV+oDEa2ANYTDWwWIXvt9HtKKyMW5v/7V9rBtVqu+DnobJrACP
         FTHHApWj3C/Zu2XteEKhYS7aWHX5JjklGs7Ai6Jh6HMUlhbxAyLq0azK+gPO1XBfh5nt
         LrIw==
X-Gm-Message-State: AOAM530O2BIpIpSej0Zi2uCqdOTXqPObFxONg3buSRdFIU3/t2yrk8Hb
        NTfL620cjzhc414btvj7S+Rp/bjj1Oo=
X-Google-Smtp-Source: ABdhPJwFIViyzzaw1zwGz4VKn+OZfiPXzZ8B1s7e1/ksJAwnJak+2VeK+SEraxPEVFQ/T7f0GoEf+A==
X-Received: by 2002:a17:90a:8918:: with SMTP id u24mr6547623pjn.7.1595983922147;
        Tue, 28 Jul 2020 17:52:02 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id b12sm222345pga.87.2020.07.28.17.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 17:52:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200728170317.v2.1.I0925046377211b8b6f06764857f03b4ab592bddb@changeid>
References: <20200728151258.1222876-1-campello@chromium.org> <20200728230520.2011240-1-campello@chromium.org> <20200728170317.v2.1.I0925046377211b8b6f06764857f03b4ab592bddb@changeid>
Subject: Re: [PATCH v2 01/14] dt-bindings: iio: Add bindings for sx9310 sensor
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Daniel Campello <campello@chromium.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Rob Herring <robh+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-iio@vger.kernel.org
To:     Daniel Campello <campello@chromium.org>,
        LKML <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Date:   Tue, 28 Jul 2020 17:52:00 -0700
Message-ID: <159598392022.1360974.10427547361260648765@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Daniel Campello (2020-07-28 16:05:07)
> Adds device tree bandings for sx9310 sensor.

s/bandings/bindings/

Not sure why I didn't notice this before.

>=20
> Signed-off-by: Daniel Campello <campello@chromium.org>
> Cc: Hartmut Knaack <knaack.h@gmx.de>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> [swboyd@chromium.org: Add both regulators and make them optional]
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>=20
> Changes in v2:
>  - Added #io-channel-cells as a required property

Thanks!
