Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C49EC3F2C6
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 17:13:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 734792146E
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 17:13:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtPPrB9r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgCJRNo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 13:13:44 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40047 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgCJRNn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 13:13:43 -0400
Received: by mail-wr1-f68.google.com with SMTP id p2so16086804wrw.7;
        Tue, 10 Mar 2020 10:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X1PUxwFQA8c9j51WnRi6Nm8Fu/nPospzhRaCoQrGYvE=;
        b=TtPPrB9rIchoH0ODp+e06tmGnlJKRBp5681b2S8QU1VoLl8Mr8uKXciqfBJruLy5kO
         72t0joEWFQBFNs5WVYkF3GtcrXID7z15k3HvjhWWmkpyOEUuI4Fz2rM4sMfJLpAX2ZIh
         ee+UtCDyPFhgPYaA6Nc76uS1g1WT1FLdyqSwdst3IBSI0gCpd+lSkgETpBjny3QWDTuU
         pzAY08DkKsmszrhUyyNCM2Pnu2zl9Vm7OS5+i7YFpoMii1TAgOtcl43QrNauVcNKsC+T
         I8M42kxFSviaxuPBKxtloPYIsdqb/f0Ure4AuVxYXmBW6haXnrOk+YCO4yiJ4swpZKDH
         H8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X1PUxwFQA8c9j51WnRi6Nm8Fu/nPospzhRaCoQrGYvE=;
        b=Ru+Gp9qayQk8WtNZEmEHODNfEFOLCSuRabst0JGMuzeeK5aK1xZZjK/plE1EXlAXzx
         WAU6vc2zGRHdT4uTriaTkJReoGn/1abFvBcnnfbplzYt0f1HmhG6+gAVekdOePOuss0P
         QpR/V+opwqJDnjqTOYQnwWn09evvRbPwvsqtQRBa4lQ7BRq+VjpFK7d7VL2V7W5oAExL
         jYhmGo84/xvukOpBAW5BhfZZpDBCEUmLB8PhJKHq7ijcWtXcFphAw0bIlnHw+wFTgN7Y
         iaWuXrYY7kR4mPmSUUsYSktZ0pYIgNiniZWuMxMGSQVX7xSy1ONsUvFnbEAfOVwI9mux
         87mw==
X-Gm-Message-State: ANhLgQ3ER6Zx/oAEfTqfBf6G5LraAxa6eOyRKN+zghwhCZhwdJI8MiG7
        /09S6V/VPr6lmp2rVq8y+R0=
X-Google-Smtp-Source: ADFU+vv082ivAK2kV9o82i+Lh/FeTPGbh6XmML1p2AierlRN9G266AFBkNd8zghr+Sy639X9cISJTA==
X-Received: by 2002:a05:6000:370:: with SMTP id f16mr22278312wrf.9.1583860420748;
        Tue, 10 Mar 2020 10:13:40 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id t18sm5049212wml.17.2020.03.10.10.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 10:13:39 -0700 (PDT)
Date:   Tue, 10 Mar 2020 18:13:38 +0100
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
Subject: Re: [PATCH v5 5/8] memory: tegra: Add EMC scaling support code for
 Tegra210
Message-ID: <20200310171338.GF3079591@ulmo>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-6-thierry.reding@gmail.com>
 <4ea3a96f-52cb-4eab-cf92-932f6882ad85@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NGIwU0kFl1Z1A3An"
Content-Disposition: inline
In-Reply-To: <4ea3a96f-52cb-4eab-cf92-932f6882ad85@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--NGIwU0kFl1Z1A3An
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 07:43:12PM +0300, Dmitry Osipenko wrote:
> 10.03.2020 18:20, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Joseph Lo <josephl@nvidia.com>
> >=20
> > This is the initial patch for Tegra210 EMC frequency scaling. It has the
> > code to program various aspects of the EMC that are standardized, but it
> > does not yet include the specific programming sequence needed for clock
> > scaling.
> >=20
> > The driver is designed to support LPDDR4 SDRAM. Devices that use LPDDR4
> > need to perform training of the RAM before it can be used. Firmware will
> > perform this training during early boot and pass a table of supported
> > frequencies to the kernel via device tree.
> >=20
> > For the frequencies above 800 MHz, periodic retraining is needed to
> > compensate for changes in timing. This periodic training will have to be
> > performed until the frequency drops back to or below 800 MHz.
> >=20
> > This driver provides helpers used during this runtime retraining that
> > will be used by the sequence specific code in a follow-up patch.
> >=20
> > Based on work by Peter De Schrijver <pdeschrijver@nvidia.com>.
> >=20
> > Signed-off-by: Joseph Lo <josephl@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v5:
> > - major rework and cleanup
> >=20
> >  drivers/memory/tegra/tegra210-emc.c | 1952 +++++++++++++++++++++------
> >  drivers/memory/tegra/tegra210-emc.h |  893 +++++++++++-
> >  2 files changed, 2390 insertions(+), 455 deletions(-)
> >=20
> > diff --git a/drivers/memory/tegra/tegra210-emc.c b/drivers/memory/tegra=
/tegra210-emc.c
> > index 80ea14d1e6ce..4ea8fb70a4fd 100644
> > --- a/drivers/memory/tegra/tegra210-emc.c
> > +++ b/drivers/memory/tegra/tegra210-emc.c
> > @@ -1,6 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  /*
> > - * Copyright (c) 2015-2019, NVIDIA CORPORATION.  All rights reserved.
> > + * Copyright (c) 2015-2020, NVIDIA CORPORATION.  All rights reserved.
> >   */
>=20
> Would be nice to avoid all the unnecessary changes, like the one above
> and then all the code's removals/reshuffling.
>=20
> Such that a new patch was a clean addition to a previous patch, instead
> of a re-write.

I think this is the result of me messing up a rebase. The EMC driver
changes added in the clock driver patch should've been in this patch,
which would've made this a clean addition. I'll reshuffle the code
for the next revision.

Thanks for pointing that out.

Thierry

--NGIwU0kFl1Z1A3An
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5nysIACgkQ3SOs138+
s6HEAA//QmK3t4ukt87828r7Nv2SwiHTTaa2Ye2D+MviiW5gQGuejM71cG0f1yVD
pRfZtF83Vw0y8rITa25HiCjM+qCBk8ZaHMgokgXgSPW1t3Ata4aoCnjyGlFfNSGX
SM8DmMt7zFLdoVgjV4oWgk16CnbwamqmCvTGLrIObnvilJMD1EGaJpAgliom5DJt
VHsxit2CGv2jsEkHsBvqpUq2Vfe959FiiCQoQwyf8uYaMM7RWhYKTTDGhi0y0Wdb
Xktq0/448CK9QW2jj/rWfmFLCOt0NnuYK3rFf3ldtDsYkFfUu4iqn5rt3u9XxqCo
+1g8vUzEc+1peAUeTSO/GjtiTEx2qcE2W0yx2AikAejEM/qNwR5VopkInSclClKl
Cv5JAg10mHFJCySzZqTiKojCgllnj/WHvgN3UJER+hYsBQ3Vx1qTAQ2gVymlHVyq
2ee70J8KN5sQj43sQ+4WlwjtrtT03ORmdLCwL6gUhQZM/JfblDIJ0YE8Cvd+QMWk
utuXITH33f+CJcu7OrYOapFUqwTyyXOyXbJpnegYlYtqoygZ8GRWsr1aIIAP3Nht
0yGpo0lxdGeAt6jqqYgABOMwWphCsJ5ihofV5RhecXyFAVlLt+9HlWgXH9LSKONl
fD/QqzKMIPOWdmBkSfavRfK1pb+hqFcHlwpoin67t1H026CexQs=
=+3N+
-----END PGP SIGNATURE-----

--NGIwU0kFl1Z1A3An--
