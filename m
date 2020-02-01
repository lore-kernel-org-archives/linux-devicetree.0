Return-Path: <SRS0=GCsk=3V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A89C33CB7
	for <linux-devicetree@archiver.kernel.org>; Sat,  1 Feb 2020 01:35:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5148E20663
	for <linux-devicetree@archiver.kernel.org>; Sat,  1 Feb 2020 01:35:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lHXpZqYp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgBABfS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jan 2020 20:35:18 -0500
Received: from mail-pf1-f175.google.com ([209.85.210.175]:33918 "EHLO
        mail-pf1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbgBABfS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jan 2020 20:35:18 -0500
Received: by mail-pf1-f175.google.com with SMTP id i6so4361492pfc.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jan 2020 17:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:subject:to:cc:user-agent:date;
        bh=U72RowJ6aCblh4dJK9J4/UwBLNeATv6us11nr3tf6Rg=;
        b=lHXpZqYpZcfz6NhOploCg1vZtjIIzjhRoqPrNGU5nL0nCGSh00jmDACtW4L/Hb7pkj
         CRsYhFPYJiwvVAirbr7fXQ7ISvu+HBXuniUXcBrABX0b+snfR1UjDvQHNZI486dg74H1
         0HlgA6Olba7JRZAX35w4YHZipPHVcDx+H6rPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:subject:to:cc
         :user-agent:date;
        bh=U72RowJ6aCblh4dJK9J4/UwBLNeATv6us11nr3tf6Rg=;
        b=kg4TMz1CdHBFNKbMmQA68aRn0E9ojtWfEkHpmTwdnRLJVgr7rcA7x3Ar79ouQgx9d0
         AFAmlRX4++v0oFATlWMIuiS5fXqgUFbDNvtj5HkbSU03cr2QZSWzOEuFsD8O6uTH9m2j
         nynUYAttFV2vr/KMOH5e1qqBnE0raWuD2Y4RFS4Gs9bgSeVgNqI4RZE50XwJE62567Er
         OGha8DT84VMYkAoGJr/wCJ5IAs0/V4kdRgqrU49lcQ46+d0ktWXBHvMez8BGtr2276GG
         Sy8NM2hzqoOGwXv0nu+JKPs5qrfkAeptm+qSM0fJ+61YvXI8T8K0Cfq+N17u9cfSeKaM
         9U1w==
X-Gm-Message-State: APjAAAUP/iyhxSAsi/qFUXx8iOJ3OARAKT1WHqgjrZSOCHKTGnJtqSO1
        XTCdsoziC77UsdNFMVKRSEdYXg==
X-Google-Smtp-Source: APXvYqyEG+K19D8CcojLJbvauVd1sqrcsQn15vj4/zQRhrorfWTreQNyLMtSiBerleA0V6/1lIjQtg==
X-Received: by 2002:a63:e14b:: with SMTP id h11mr12780783pgk.297.1580520916023;
        Fri, 31 Jan 2020 17:35:16 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 13sm11375726pfi.78.2020.01.31.17.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 17:35:15 -0800 (PST)
Message-ID: <5e34d5d3.1c69fb81.b5d48.eb80@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5e174fec.1c69fb81.f3e14.8354@mx.google.com>
References: <20191217005424.226858-1-swboyd@chromium.org> <CAD=FV=UQAgd2R=ykTCnBZuOvFFKoWu4o-3Rq=GEdrc1KKSi9cQ@mail.gmail.com> <5e174fec.1c69fb81.f3e14.8354@mx.google.com>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] dt-bindings: tpm: Convert cr50 binding to YAML
To:     Doug Anderson <dianders@chromium.org>
Cc:     Rob Herring <robh@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>, Andrey Pronin <apronin@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 31 Jan 2020 17:35:14 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Stephen Boyd (2020-01-09 08:08:11)
> Quoting Doug Anderson (2019-12-17 09:45:02)
> > On Mon, Dec 16, 2019 at 4:54 PM Stephen Boyd <swboyd@chromium.org> wrot=
e:
> >=20
> > > +  spi-max-frequency:
> > > +    maxItems: 1
> >=20
> > This is not an array type.  Why do you need maxItems?  Should treat
> > like an int?  Do we have any ranges of sane values we can put here?
> > I'm sure that there is a maximum that Cr50 can talk at.
>=20
> From what I see looking through downstream sources my best guess for a
> max frequency is 1 MHz.
>=20

I'm leaning towards dropping this property. Is there any benefit? The
driver should know the max anyway.

