Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2AFC2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 15:48:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 287D5206D5
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 15:48:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBCuPhLf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440921AbgDNPsI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 11:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2440919AbgDNPr5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 11:47:57 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C513C061A0C;
        Tue, 14 Apr 2020 08:47:57 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x25so13514769wmc.0;
        Tue, 14 Apr 2020 08:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dtEhtg3V0XhnUJ3vLOoW6oMCs8PMCorqBPl+EaqQeLI=;
        b=BBCuPhLf+ty7IXCYq+5AILovgI5KqRQjdXB1eqO18/Exqs4SaPcTL32yZTYLQbvrwo
         PEINDwuUgnEQBA6ie3Kuno5Aa6Smiap4YEis+5Et1XK/Q07C5m8XemAL4iSVHEtqP+eT
         3tpjW/6Bm1fhwqtCGMiWLwriytiXBtxgsBOGhFMsiPpHh7DMhnBhnmWyQm+KD4rcomQJ
         WObLKL/MiwexLbBYoFTIc5aP4Vuw+oW9S0JPsJ8opujJ99JTw2rFLoS5tyhRfP5586A3
         PSbSxPI6ZF/M6TLx/x24kBhYoz/SM+pFBhwK4ivQtVeJXbyyS4TgNZ4EoTI912nlYhUi
         x7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dtEhtg3V0XhnUJ3vLOoW6oMCs8PMCorqBPl+EaqQeLI=;
        b=OFUEnXmJV++QjVnA4q0yKNsdxrhaj+FGeWr4S82gAgk4w2+S1suKqq9CNs0A8xRv+b
         Bx1nZZJAdKW8m93b0r1Fh3zyhnAykYLp4jDTG2owN3KL7VA0InktoDosNdGmxku9ZKas
         jhbz1y2k1v2uEFh1N5awMHmGrsObLJZRyDsciL2KK4E/qBwHZ+sx39Qog4HZMiNZxBbk
         /refS+WQNj71D604CwhPQhObPRjT2bOEnNfrlaK+5tL29yLC6ep6WEZSrFzr7rI+438+
         474LBJxlbTsafsBiSvZtTOz+GNAvITfiHdLDJyFbeHZSZ1+8nJMJ9ZLtgAYjZyghN4R7
         H5/Q==
X-Gm-Message-State: AGi0PuYAoMRgnw+ykD9bipN9/VX+b2jOQ0oNrKLqjpDwX8TogX7i9Y32
        HrY97we9shbSUrUFXq8JImw=
X-Google-Smtp-Source: APiQypL+nMY5gY9tIEHLtexZ8cB50IQWLclIQoRNELFR2lKge7Lg0909hOyuaODL8bt6tAMRiSrlpQ==
X-Received: by 2002:a7b:cb59:: with SMTP id v25mr517878wmj.13.1586879275890;
        Tue, 14 Apr 2020 08:47:55 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id 19sm11461613wmo.3.2020.04.14.08.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 08:47:54 -0700 (PDT)
Date:   Tue, 14 Apr 2020 17:47:53 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 11/14] memory: tegra: Support derated timings on
 Tegra210
Message-ID: <20200414154753.GQ3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-12-thierry.reding@gmail.com>
 <7f23f140-4c56-3d9a-946e-f29bc569f40c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zfSPj0+0wxNpTjLN"
Content-Disposition: inline
In-Reply-To: <7f23f140-4c56-3d9a-946e-f29bc569f40c@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--zfSPj0+0wxNpTjLN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 02:44:16AM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >  	tegra210_emc_debugfs_init(emc);
> > =20
> > +	cd =3D devm_thermal_of_cooling_device_register(emc->dev, np, "emc", e=
mc,
> > +						     &tegra210_emc_cd_ops);
> > +	if (IS_ERR(cd)) {
> > +		err =3D PTR_ERR(cd);
> > +		dev_err(emc->dev, "failed to register cooling device: %d\n",
> > +			err);
>=20
> > +		goto detach;
>=20
> I think it's not really worthwhile to fail whole EMC driver because of
> the failed CDEV.

Well, we do kind of need this cooling device mechanism in order for the
memory to continue to operate properly at high temperatures. It's also
very unlikely that this will ever fail, so I don't see any harm in
making this mandatory.

Thierry

--zfSPj0+0wxNpTjLN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6V2ykACgkQ3SOs138+
s6EAeA/+IsxKWQvGh2RYgVTWhjjt4UXdnCKicikH4x5BNbL8tXenzOzKPEmGNWD5
Ts2RFpne3QaRGscpN0bTZry+XjKv8UHoInOHgYZtd1KyS1+yJUbgZYeoHBA87Z+P
bF7X/Pq8ZJPhqgvn6dAuNO2GWl/EpR9h5ne+TI7cEL84bqgAfaqRQjdqnyJdnc6X
gg2eP8U7dff0CO9jR4JJHt1PckFrb/r6cwsCg9WlYbu+MBXj8mCXJzo0PvXHM9ea
uLVXjEDdN8RV9kqypiiDiLpWxdaDBZqwD14yvdOfTYSXW/S/Ai8txPjlD2NqaqJE
v+WikKx5xk3wUx4ul+v21cj3Xm1IClxl30UULyvznZGm5MqNHf/Nh+t/2ehgVslS
CyzybTooPUv5qDkvlOPV+0ipG4UEask6NU80mNE90f27g9d5JhghOD2OgFKjiNLH
hhzBwzz2innAetUGUI92suwYpXf3MyJqLnXdS9aGOQTT/lS68zMYRzCQvNwebT1K
RzRzzPIywb2oegonGMCc6Y2aokC3dMmlyXaAkzmZD4rgjGjU8Q4i4iAvgqgAsRzu
ZJdWtLqmc9IzFjWLDS1ThvojvXWSqtp/o08teaSw8Wv259svK8sfOm5/2K5zFKdk
AmE9XGUvw/1zolMRomOMUkvvbDH9M7vBzeQbQqPwBBHAnz75HO8=
=4S/7
-----END PGP SIGNATURE-----

--zfSPj0+0wxNpTjLN--
