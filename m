Return-Path: <SRS0=2gCm=5I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065E7C4332B
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 11:02:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C85B02070A
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 11:02:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5cxysHT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbgCWLC0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Mar 2020 07:02:26 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33262 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727987AbgCWLC0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Mar 2020 07:02:26 -0400
Received: by mail-wr1-f68.google.com with SMTP id a25so16488986wrd.0;
        Mon, 23 Mar 2020 04:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YQ2GBjATshIplvLJBnkEmU69ZuL9aT5IEeXUjRBrBsc=;
        b=M5cxysHT4r3SLET1JXdcrPb7r/OqqF39uk/3o4c/yNFn7rWgC2LuS3QIYsiWdIBEFv
         9JaF7/D9p30yfd1BMynaOETu93WomytHnw1m4A+J4iwTyodnulcmpsEKIxhLEq3QEMSo
         ZIge3jJlLIPLg3o5E2p9wDtKtAANlvlHK0MekgV3bDDq+fulOpfyEI66SsryMj19tqMU
         b8fN7dVyAdYJ/MKzcvppk8UX/qceBIdrwcWC38JIg2OyL2u6DWSaVv7OnRQVYyDZBGDD
         e3wlQs2fEYnTD34BTvhQWOr7dkumn4qGUNbkMy/LqE/EyCGMLcrnC9nobEUJmeBw+T59
         LJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YQ2GBjATshIplvLJBnkEmU69ZuL9aT5IEeXUjRBrBsc=;
        b=G1Hz6kYBCWmfmjSfO8ksJlXxZdH9VRHWzG1xJb+Q8DqGbU7yanC5J8d/h51w2412zA
         DFNmQMKU0iciqS9T15hYedW53lv34YlI7MpEXq5JVqWl9PRR10qWHz6Ht5v9ZS60yceS
         1hTqsqPzgOTSNoczjpXlqXOvL2oU7HxnjFjTwpKIKR2PzLJbU1suHXc3WnHgUciT+fB7
         ajM9IUu9wP9O71nYw+zzZlxsbm8FlsuybYvJQ6AB6K1G+BVaQg1up/jGpwjPrV9ZfMLP
         PeWmXmOIRdJVz8WZJb5VmCE3i3MdF8+wJlDTPjQ0IXJhOvvgjw53OAa/LwwxGL3dp+/Y
         JlGw==
X-Gm-Message-State: ANhLgQ3IsgNBQfIZoPUataPmZs78tzI2mmI+Vs6ksh67vRmDx6Zv+9vg
        IyfCUGS0ZTxaGXoDAhlGJks=
X-Google-Smtp-Source: ADFU+vuSpKlosvvv4uXBUKCBdshjKyNRNBYzyUj88SroU8xss08DtZUl+XMts+0GAZqW9SyYFilW8A==
X-Received: by 2002:adf:a21a:: with SMTP id p26mr29193441wra.102.1584961343825;
        Mon, 23 Mar 2020 04:02:23 -0700 (PDT)
Received: from localhost (pD9E51CDC.dip0.t-ipconnect.de. [217.229.28.220])
        by smtp.gmail.com with ESMTPSA id k133sm22340434wma.11.2020.03.23.04.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 04:02:22 -0700 (PDT)
Date:   Mon, 23 Mar 2020 12:02:21 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/8] clk: tegra: Implement Tegra210 EMC clock
Message-ID: <20200323110221.GC3883508@ulmo>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-4-thierry.reding@gmail.com>
 <7a4e0ab4-e17e-9e6a-2d30-d9a321be1dc8@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DSayHWYpDlRfCAAQ"
Content-Disposition: inline
In-Reply-To: <7a4e0ab4-e17e-9e6a-2d30-d9a321be1dc8@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--DSayHWYpDlRfCAAQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 08:03:05PM +0300, Dmitry Osipenko wrote:
> 10.03.2020 18:19, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Joseph Lo <josephl@nvidia.com>
> >=20
> > The EMC clock needs to carefully coordinate with the EMC controller
> > programming to make sure external memory can be properly clocked. Do so
> > by hooking up the EMC clock with an EMC provider that will specify which
> > rates are supported by the EMC and provide a callback to use for setting
> > the clock rate at the EMC.
> >=20
> > Based on work by Peter De Schrijver <pdeschrijver@nvidia.com>.
> >=20
> > Signed-off-by: Joseph Lo <josephl@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v5:
> > - major rework and cleanup
>=20
> ...
> > +#ifdef CONFIG_PM_SLEEP
> > +static int tegra210_emc_suspend(struct device *dev)
>=20
> The __maybe_unused attribute will be a bit cleaner than the #ifdef.

Done.

Thierry

--DSayHWYpDlRfCAAQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl54lz0ACgkQ3SOs138+
s6Gd3BAAuTyoEJ+JL1G9GWcOanhXD05YmbFew23yyyioslf+tvjbE65mIZ0quv65
wLcxow76yP90BL1pX3dIbBHxs+rfq9SGdDC6L8cwT/Vh01xMti0YmWOFmmYZV/fm
4l6OWJlwULsyaQh5q7blUqI5zX+OQ5cNPVNeO5HPpFrjhSrP7d0IbHYqcAcUo0b7
942u/zU1r/yySYXvzOs7nZZ5+gQ6m/vTzbodk/XDZbSWWKZ4PGmrw2FlfFzmWELX
7BoYGo8Y5fCynE7wqqFyPGOGlfr5ADydD5EhKr8ryBphTWNXHm8hL1I37o7RQ5w6
ycwZX8lIkJMeC0x3HINZSkstv2VrPdKTH9h01K9tI/zwjBrzO5dXrfjjo1oszRg3
caxfEzDNjUcO7qlZAJmLdspGU9iprnmXBg7TQQJ4p+tmfDkJjnHoh1+G8VmvXCIZ
pnwS+pU80DSdcHwGFPWMs6vXpqaw92QOmNt/btkWLe06y00S/oTYLuLZ+kqPnX54
JAppAovMhDk1U2PzesmMjzTdzLP8aneT+ScdfWPz+YjaMgoTGPY3+IYzVEaojL2K
WYVSjyfyx5cCjHIeWKI91Mg/N3y096aOo0kRiEgHgpIwccaGezkRH1cu8eWtMPY+
eTuE86Lh7LotXklg6Re46VNih9Q3SZDaVejoC1U9fdOjEpNqabQ=
=Gt4N
-----END PGP SIGNATURE-----

--DSayHWYpDlRfCAAQ--
