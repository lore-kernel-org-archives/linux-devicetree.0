Return-Path: <SRS0=2gCm=5I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F04AC4332E
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 11:06:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA88420788
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 11:06:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KL43WrYT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728026AbgCWLGR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Mar 2020 07:06:17 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45784 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727987AbgCWLGR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Mar 2020 07:06:17 -0400
Received: by mail-wr1-f67.google.com with SMTP id t7so11788473wrw.12;
        Mon, 23 Mar 2020 04:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PvaA9WErHPfhLzkoxic3oiXs7q2b8jdtV9hoK7AM6S0=;
        b=KL43WrYTI7twEj/ElGDXpP3z4rMkVQmiavtuO8E43tb0A1jiSZFqTFGw+Z9rt88KA0
         HLUcj0+mGIY741Fx7Qu16MrayKfc8YZsEbRjLfhJ9c+RGuIESIuOSlVhCAxEa+rO0xoe
         umC4lTvey0CxqQ/hse7eJEfAbX4NoGpq4rw4IRlAMkb6yqE6oD7r9OkthDgzmQDEHIyo
         ytE/bxH4kGUJRdQcOva84Pex07qX2lMFU3W3fs7Jx+niVvCzGkh0WC6Nvq4f64jCojPf
         rKIMQBJjiozsPim0+P7xtUx8YJmFyt1WZcOsHeyuUOgmOtEf0TnFAfCpq/ls81VokukE
         oKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PvaA9WErHPfhLzkoxic3oiXs7q2b8jdtV9hoK7AM6S0=;
        b=kLq4ZL/om8dhgKKToVsyKdwE1/y6lL1NFQ6YxEwnQq+0Un9UIXbTQ64WaSVjcvCLdI
         tpDqj8GGhccuzMAetTAmQHnXF9KTui+Fvyg0n+HvDGKGfNYie1ZL0MuOvSnZUMKxZe4z
         QBjh/gI8oWZaejjyDoJpr2jPuENta4j4DYZGDRNolObZYf+bBz0ThMQTX3Wf4mSDHKuM
         coCafUvke+BBwOYcgyDlFSJHZSFJMPEkG0o/sheySZStOycXh6xMQ2qhJSXTsA/rwIc8
         4rLu3agm0765P75FMRpW4jUtGN7HljGd9vuI2PQRDTc6pPaa+opVJXV3Tak2UOD5l1RK
         U5ZQ==
X-Gm-Message-State: ANhLgQ3Ijh8yAxfMa1Fum9I/Vhm9kfBJVTGBUFoln5ShpT8xb7rJL4C9
        /zo7Jjh5WP9L10lDopr6ih0=
X-Google-Smtp-Source: ADFU+vuP8WC1Z1+VeP4J2xlTB/CcaELAr/Oz4UztThDWUzq3KVBGIo7q2+7br3Tvbrtr8IlcXKy9Rg==
X-Received: by 2002:adf:e44a:: with SMTP id t10mr19226457wrm.322.1584961574704;
        Mon, 23 Mar 2020 04:06:14 -0700 (PDT)
Received: from localhost (pD9E51CDC.dip0.t-ipconnect.de. [217.229.28.220])
        by smtp.gmail.com with ESMTPSA id r9sm21658997wma.47.2020.03.23.04.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 04:06:13 -0700 (PDT)
Date:   Mon, 23 Mar 2020 12:06:12 +0100
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
Message-ID: <20200323110612.GE3883508@ulmo>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-4-thierry.reding@gmail.com>
 <3b583202-50d0-145c-d60f-91bd646008ad@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Rgf3q3z9SdmXC6oT"
Content-Disposition: inline
In-Reply-To: <3b583202-50d0-145c-d60f-91bd646008ad@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--Rgf3q3z9SdmXC6oT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 07:29:42PM +0300, Dmitry Osipenko wrote:
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
> > +EXPORT_SYMBOL_GPL(tegra210_clk_emc_attach);
> > +
> > +void tegra210_clk_emc_detach(struct clk *clk)
> > +{
> > +	struct tegra210_clk_emc *emc =3D to_tegra210_clk_emc(__clk_get_hw(clk=
));
> > +
> > +	emc->provider =3D NULL;
> > +}
> > +EXPORT_SYMBOL_GPL(tegra210_clk_emc_detach);...
> > +config TEGRA210_EMC
> > +	bool "NVIDIA Tegra210 External Memory Controller driver"
>=20
>=20
> I'd remove all the exports for now, given that the driver is built-in.

I was able to make the driver work as a loadable module, so I've kept
the exports where needed and made TEGRA210_EMC tristate.

Thierry

--Rgf3q3z9SdmXC6oT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl54mCQACgkQ3SOs138+
s6Fghw/9HFmA8d3ekqw+fFlSbracVyC8Jbzm7ovz/EMMhgzkKApEKD2G2L7GNFdZ
XQiWXYuI4SANsOCnbgunpoZqi5M/zh35NvbBqQoT6pJlS1WxabPWekofZGxX9WkJ
/oA5oD1gQhR3CpM+6QfgUH76surZ8LIgqlWDurqblrUeEWUftJuKa4xuhIj+7vwy
B4cZYF04OqrUl5dJXKiX9qUAb2T0i6GZb9UbWIdPtzFGpxN7WfBBjuta/nbKJCqi
Y4CkNqMDW3wqvj5zZrZN0/J+5SHQ2eJ26irWAn5Xrrd0N3xyIUy7/SetQ3hFsfAb
Gxd9WyQA8OWDdlhdkoEHoMLXX7xBmKG7PA2LakCQxguSw2+meQUfgM7JJqS1sMLY
xhqKLxu8GnMoTdwlh0LhoUAYgwYxfKrd+x+3h8qeGZAHju8nC+BrB5Pg/8gO4e3S
e64USYE4iF8tLbAhD3WYLO7xFLEHWdI+bW8lqvuTWXqXqkXA1bRFrCBidwODDkb1
rj8UuNJzhOzgB7A8us/of+PlabsIsJm4Pr7zqoBUm7LEv9x9BcDCcRRf7jl+4yE5
6lq+SF+f18powYYqdHkaIQCK3ldSfUYJp+iql2mmJSreDcVl10P8m3AW/HO5mRoH
do2qAyLmNX/4iNdEq5BnMtwMvgMqcfs6nWBayGmkpyjZhL+99YI=
=5knT
-----END PGP SIGNATURE-----

--Rgf3q3z9SdmXC6oT--
