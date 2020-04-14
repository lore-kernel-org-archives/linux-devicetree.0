Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A5AC2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 14:45:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAA2A2076D
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 14:45:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dH1SVmnb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404543AbgDNOpb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 10:45:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404511AbgDNOp3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 10:45:29 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B78BC061A0C;
        Tue, 14 Apr 2020 07:45:29 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id o81so7667799wmo.2;
        Tue, 14 Apr 2020 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=S5LW6D/JcvIQbts8mNWNWJg+lFlcHdJhPjdhCsJJX+o=;
        b=dH1SVmnbLSEtE5Nag8z/s8FzhNR23uclW3TSHMu8V+do40TBTY1Z8sGsJUANArQbG3
         2V334Fe5n+zCW5Hq023W8cud2/enlRi6ZvMDhwNm96BF4r2uKn1N2DnHO8pa/cjI834n
         2WIZeqtYuv8pjKHOsYXEk3KH+SCw+2VshFn3QDBtcLuH4IBK6v+9UfvUbY8WE3hZxIzN
         dIGBwP5hMJbHBT4xwplhv25+Aqwlse4IT8/+lDPi4td0xIVZb2vt7C16AV9n0Igl2I9O
         Vxwbyw/uRWet/5A9UDnFutVGGet1EIvbShUHBOXlRzk2+pluD27vgscnwFfbnMZwIqeW
         iJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=S5LW6D/JcvIQbts8mNWNWJg+lFlcHdJhPjdhCsJJX+o=;
        b=TFTEpOCdqCdBf3yYM/E3vowhwUIuxL6LPKakrnWLpYlOdAUU4bve5vCJ3yjyKYiEDT
         NA753jKCQT3T6xmojmq01Qydth2Pv3YVJZBehDqfzh3IRgcgOzp0CHaSXxS4iqqC7Q9U
         gySQK7893jhoT9w+HIzYh1Dvg5/pDAe4ht3pOvpAwXj3giXv6XYz8S7N4740ilKpaEJH
         /K0XBLRf828WNtREWnryIMi7dlTJXsWxvDbaSH5wiRZJneCumJvZdfHSW7vcMtiZzRK+
         fGh9Wa4Mbp5ducrGu81kqljq5xAaCgeHmI9uEQlvil6W1G3onwEWf+XqR+7XDyCIasdy
         5TAQ==
X-Gm-Message-State: AGi0PubiDkz1XyOZ3GF6iKF+Op2bW9vgobfHaMPNKgW353V7x8CQU5wH
        ZXj8kH8ATCqa8gf2qxT9mWo=
X-Google-Smtp-Source: APiQypJydRRmPqeZPePM/ORVt+TFEv+iAXAOLY9ehjv1P9T718jiOAQJnqvWZKHsT/FYkPvGrPKKsQ==
X-Received: by 2002:a05:600c:2341:: with SMTP id 1mr175764wmq.153.1586875527952;
        Tue, 14 Apr 2020 07:45:27 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id f79sm18139610wme.32.2020.04.14.07.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 07:45:26 -0700 (PDT)
Date:   Tue, 14 Apr 2020 16:45:25 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
Message-ID: <20200414144525.GI3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
 <7b2f8a7c-94f1-08d0-b0ce-c61f4eb0a436@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VaKJWhUROU/xPxjb"
Content-Disposition: inline
In-Reply-To: <7b2f8a7c-94f1-08d0-b0ce-c61f4eb0a436@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--VaKJWhUROU/xPxjb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2020 at 10:00:13PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > +static void tegra210_emc_debugfs_init(struct tegra210_emc *emc)
> > +{
> > +	struct device *dev =3D emc->dev;
> > +	unsigned int i;
> > +	int err;
> > +
> > +	emc->debugfs.min_rate =3D ULONG_MAX;
> > +	emc->debugfs.max_rate =3D 0;
> > +
> > +	for (i =3D 0; i < emc->num_timings; i++) {
> > +		if (emc->timings[i].rate * 1000UL < emc->debugfs.min_rate)
> > +			emc->debugfs.min_rate =3D emc->timings[i].rate * 1000UL;
> > +
> > +		if (emc->timings[i].rate * 1000UL > emc->debugfs.max_rate)
> > +			emc->debugfs.max_rate =3D emc->timings[i].rate * 1000UL;
> > +	}
> > +
> > +	if (!emc->num_timings) {
> > +		emc->debugfs.min_rate =3D clk_get_rate(emc->clk);
> > +		emc->debugfs.max_rate =3D emc->debugfs.min_rate;
> > +	}
> > +
> > +	err =3D clk_set_rate_range(emc->clk, emc->debugfs.min_rate,
> > +				 emc->debugfs.max_rate);
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to set rate range [%lu-%lu] for %pC\n",
> > +			emc->debugfs.min_rate, emc->debugfs.max_rate,
> > +			emc->clk);
> > +		return;
> > +	}
> > +
> > +	emc->debugfs.root =3D debugfs_create_dir("emc", NULL);
> > +	if (!emc->debugfs.root) {
> > +		dev_err(dev, "failed to create debugfs directory\n");
> > +		return;
> > +	}
> > +
> > +	debugfs_create_file("available_rates", S_IRUGO, emc->debugfs.root, em=
c,
> > +			    &tegra210_emc_debug_available_rates_fops);
> > +	debugfs_create_file("min_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
> > +			    emc, &tegra210_emc_debug_min_rate_fops);
> > +	debugfs_create_file("max_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
> > +			    emc, &tegra210_emc_debug_max_rate_fops);
>=20
> I assume you used the checkpatch before sending the patches, no?

I have a pre-commit hook that runs checkpatch, but for some reason it
was disabled. Fixed these to be numeric now.

> I sent out a patch recently to make the permissions readable, please
> take a look if you haven't seen it yet.
>=20
> https://patchwork.ozlabs.org/patch/1254301/

I've applied this now.

Thierry

--VaKJWhUROU/xPxjb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6VzIUACgkQ3SOs138+
s6FpRRAAk0TEKZBPjG+SsTHg1xIN9BMOUI9LqXdMGnagdaP0yEi/mTRNkmrsImxZ
awLe6BQXHKI9FGW/mrjyB1d3Ly+FQSerx04N5iwg6imigOmaTXRyuy4gXuEH6+D1
R4U84Jnx74lntZsS3aqcg/P1gNborKoirVl1xkcvn/mJ4K+BhFBq3NqbgyKJ7xGa
51izgm0mPVSldljky86GBwHfYiyirLXF4K6+Qg3Is1m40p01z3jhrUGYXtnD0cOr
29VnWLSpJs+Qrzs0Fy9Q66C3h5f+ZeshjDCdQJorVDbaiXp8+7YIUW1LPCZcwUrI
tCBxKuzyi7KpFpZmno/li8nOEv+ByqEcg3fF0SrDton95JKMuK/WplZJsVisQ/lN
8SQePeIzU005hN5GwnPfoQVMqLsMqans4M0lh+qRtdzqX4JlH1aBjHsG6UHPcwQb
7ePg54J49LruLhrDaipx5YMZ+zfRuidiat4l5lxvtgxoKImx2iKXRS+w0X1kNVX5
byOLywrBi5wNbAz5G4nsCwA67f3JuB+M5m6VA48MoY3NANz4AdRtE3gcsmmgK2Ac
rM+asAhZyI3p+b1iQujqDdRBE5FvOBFEkS3CwZzZ5kl+wdFTdWPXVDwGYbCKS7NR
bH9mSiKbX48G/8pq6m4xFteYGr91cstkAwv1o7Km4Pe1vsOZN54=
=WHMF
-----END PGP SIGNATURE-----

--VaKJWhUROU/xPxjb--
