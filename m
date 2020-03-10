Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C35D4C18E5B
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 17:10:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A82921D56
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 17:10:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTcvb/JX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbgCJRKa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 13:10:30 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43103 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgCJRKa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 13:10:30 -0400
Received: by mail-wr1-f67.google.com with SMTP id v9so16857056wrf.10;
        Tue, 10 Mar 2020 10:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uUt4O9JUVGJDyPbmYWUfeT3Xr3oSlBD8NwfayO4w4nw=;
        b=sTcvb/JXP52CznNkTOuLxZG2vO1nFKI6T67EVGtD4lbjeORkRct4rsYL2QlfTwChhI
         bVFv+LERnQ+rLHb3HUJsuSSCm4KxJI9QbFuWWsqmk7bcQAQ6N5o7rPq8oljV50ua+Efa
         qLZ21cMWKlj/D5Eyb8MvPTKWEoZ/qF/nHf5Pf57aCgckp8cEgpSR7wFRwDiHzQPyahXr
         Ry/5EI7AE2SlubZovFKjBWsuLg6WeI6AGR8dfQbPkWXRa8QRs+/3BxIEHZLkThCpLJ7m
         lufOX1ZyDwZIilWpgPHroSODYoUWPfvzUoCNqptp94JT9oJw2MeK4LWIYoEchJoHhdzm
         s/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uUt4O9JUVGJDyPbmYWUfeT3Xr3oSlBD8NwfayO4w4nw=;
        b=cQEysTyALodwQeMK1OVoMqCKFoPExsxtsqdi2EP1LnMSKy646Q+/VGYh5KsUCLK9bC
         364xpo+Cykfips+S3W8jcrMWbEnHlq1OjUzomac4cf2mBNdFQ0pal44bi3GFWkg3pzbJ
         ddR4Qz1GbutPBgYLq4BqGHsGttNyTABxImvAaeWPkr4lPnVufUwzg5xNNzrih5L7g5gs
         fKHm6dC1D2GYP8UhPdzyJQKWgTJzLnMzBBB0RTa+rIzvYkKn7U4UVGBWko2wNTjCBz5L
         PGtXiKQPEORoBc2xCHXUrAJ9KIAtLvmT6MiNVyi/NYBoWMEZTeKBIu7wDE0bhyptMAWr
         ybcA==
X-Gm-Message-State: ANhLgQ2Ydq51rtXJmRIDfxHCsciJHSVuWL910Hx0o3UPr6K5ovT4pbwF
        fzZAm8EearSVYjwtpTwGuVc=
X-Google-Smtp-Source: ADFU+vupdzEUJEXInMZxKKU+qF8R2hdKmy1x/T6mpdzFNC0oP8TleGCfPwxeKIkEvtH1vg8BplCFeg==
X-Received: by 2002:adf:f7c9:: with SMTP id a9mr28661493wrq.225.1583860227159;
        Tue, 10 Mar 2020 10:10:27 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id b203sm5222572wme.32.2020.03.10.10.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 10:10:25 -0700 (PDT)
Date:   Tue, 10 Mar 2020 18:10:25 +0100
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
Message-ID: <20200310171025.GD3079591@ulmo>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-4-thierry.reding@gmail.com>
 <88d18719-b6dd-98d0-e147-f89eed2f3f0c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bjuZg6miEcdLYP6q"
Content-Disposition: inline
In-Reply-To: <88d18719-b6dd-98d0-e147-f89eed2f3f0c@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--bjuZg6miEcdLYP6q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 07:26:28PM +0300, Dmitry Osipenko wrote:
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
>=20
> > +u32 emc_readl(struct tegra_emc *emc, unsigned long offset)
> > +{
> > +	return readl_relaxed(emc->emc_base[REG_EMC] + offset);
> > +}
>=20
> static u32 emc_readl()
>=20
> > +u32 emc_readl_per_ch(struct tegra_emc *emc, int type,
> > +			    unsigned long offset)
>=20
> static u32 emc_readl_per_ch()

I think something went wrong here during a rebase. These are actually
supposed to be part of the EMC driver patch and are no longer needed in
the clock driver.

Thierry

--bjuZg6miEcdLYP6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5nygEACgkQ3SOs138+
s6Go7BAAtIjGuj40OUzzPquQVnTWUkzR2TnhGUCRZwzN625caWOJH8hMCv7Djey8
1wKJoORtan933YKqVNLCtn6GsV8hnfyM9cZ3rQKnYvUbaNQPritrOlE1oq2lH+6B
9LKudhswinPgNaToOqVsxhQPGGsZBpAuN4+zTFmGniDHswCyGuV76CVDrUkyqSu4
CiF7BfCWitZPEJMLCgDrmhWPQxejAjmAsO/ce+VC+plvlDdCChlqoqT3yz+KjEPr
32YyEFZ9MWnrbqLh+UHm+JE5rs4eq++kDbgf86OZ8JaVmYSo1mz/Sl4kEEoLh6OV
39qfF+QHsqy7jLSVww8EF6pWmiKpEIryhb3Qil9FMwFhu+i9tpL2WZYaFZ6qOstX
HKZm9I/ABVIQzixvwlHoJhOroxno0nWpyP6HJzOdW8q7FAF9yvH9ZyEPwT1y2T1e
T/m8IztVMS1kjkDNIEgnIeeXRfiEBNj4lJAXR4W6maAmmQ+HS7ioLXvOEYsm43M1
076vcA8ZgtKM1sOgvbT4Nl3wgYsZcJ5iIkOUB0yUfqpid6EbN4JR1Fz8FjI2l2Ry
NjAftd3fA0CBWjMBY4JwdJmNilWiK7y84K6MH92+j6gh+YnuC8uHLxKqrOUBCoJQ
sYndXufYEVVgSa/Ci7hMw53zRxEaZ8bGooBkIsiFnw0hpF7sLpo=
=rt6T
-----END PGP SIGNATURE-----

--bjuZg6miEcdLYP6q--
