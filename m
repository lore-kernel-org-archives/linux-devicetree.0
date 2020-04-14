Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11B0C38A29
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 14:54:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFAA62078B
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 14:54:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQDGtbOF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405339AbgDNOys (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 10:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405331AbgDNOyq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 10:54:46 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38DDAC061A0C;
        Tue, 14 Apr 2020 07:54:46 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id h9so14666316wrc.8;
        Tue, 14 Apr 2020 07:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cx/An3FrYpvsA3Jo+TX90hd+pBWFVDPUJAu6kOERHiM=;
        b=pQDGtbOFHglLib4MrJQ3AZdvm9iFmmTkqVo50rcVd2ZP0weofC494Uw9u2Cs87pZst
         zLA8VKZgh2BJPGE3jmZ7RhqsK+ocgUpB/W2Z39t9Oy28epKam0ChWs3AC3NX9OZh2x54
         l1mbvGQwC+mlkEvswNNa0GWg2APmw3QIiUKecxSfcfP9qJVZyS0P+neT6xprHQvPShxi
         QCcauAj33LQdsb+49mMhBnyjBm9ZfQ3vnNKHlTisturVOxMMEAPnINVbFr5CciwxQUmB
         SqS6fZJn1SvSmXZ5f4GEqd//UUptcup+XkU8E11hAAxigjQUxbETytxpOFhsnky8oYuH
         gMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cx/An3FrYpvsA3Jo+TX90hd+pBWFVDPUJAu6kOERHiM=;
        b=KAQ2iP+tv9BDUa8ZQfIR73HN/gVzztmejxVcAywiVubp6YvHDgHn9ksNtwMD4z+0vo
         68zwPKeacr5C6fh3qoxPtnOIYNd0Ru0tNEjMqxT3MSLlPZNkQCJyg6Ck0w5LoeKGWvyY
         3xz7X26zQczXZQls27A/Vw8Do1htjD+IPJLCQGz1tn0Exz8KLX8wz5aCBObh0e3qLA9D
         b3YPIb2h0nWTnNcuZ5ivtVzrkSlZjDydPx+fuV5gdcgjtrpeT9E5VlAk68Gfux5yuROz
         JTEISEDp3o3ICIIEIylyUjZeUQid7N+yOKtJ75uDI4L950msNexQ9sdl5u6AsEJdD5xH
         MRnA==
X-Gm-Message-State: AGi0PuamMjqZF5QK6tpZro/RL4PPzfK32uiHCwDrpsooIcqeru+EPw7S
        Y+jaDEWh5YtiNn9UcBf6JO0=
X-Google-Smtp-Source: APiQypKhWP6c2ZqXCCHUc5zNd3KCJ2EYnMaDh0pr3xp87FB6fK/p/Kq9K1noTp6aNMqnCUiSbaIPjQ==
X-Received: by 2002:a5d:49cb:: with SMTP id t11mr10499248wrs.91.1586876084678;
        Tue, 14 Apr 2020 07:54:44 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id z11sm19615784wrv.58.2020.04.14.07.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 07:54:43 -0700 (PDT)
Date:   Tue, 14 Apr 2020 16:54:42 +0200
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
Message-ID: <20200414145442.GJ3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
 <a9afb1b5-3141-4923-c7fa-194228081e1b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QxN5xOWGsmh5a4wb"
Content-Disposition: inline
In-Reply-To: <a9afb1b5-3141-4923-c7fa-194228081e1b@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--QxN5xOWGsmh5a4wb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2020 at 10:16:46PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > +static int tegra210_emc_set_rate(struct device *dev,
> > +				 const struct tegra210_clk_emc_config *config)
> > +{
> > +	struct tegra210_emc *emc =3D dev_get_drvdata(dev);
> > +	struct tegra210_emc_timing *timing =3D NULL;
> > +	unsigned long rate =3D config->rate;
> > +	s64 last_change_delay;
> > +	unsigned long flags;
> > +	unsigned int i;
> > +
> > +	if (rate =3D=3D emc->last->rate * 1000UL)
> > +		return 0;
>=20
> Couldn't all the rates be expressed in Hz? Then you won't need all these
> multiplications by 1000.

The EMC table is generated with kHz and I'd rather not change the values
in those entries. There's only a few cases where we need to convert from
one to the other, and they are always only when we compare a CCF rate to
the EMC rate, so I think it's fairly explicit when it's needed.

> > +	for (i =3D 0; i < emc->num_timings; i++) {
> > +		if (emc->timings[i].rate * 1000UL =3D=3D rate) {
> > +			timing =3D &emc->timings[i];
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (!timing)
> > +		return -EINVAL;
> > +
> > +	if (rate > 204000000 && !timing->trained)
> > +		return -EINVAL;
> > +
> > +	emc->next =3D timing;
> > +	last_change_delay =3D ktime_us_delta(ktime_get(), emc->clkchange_time=
);
> > +
> > +	/* XXX use non-busy-looping sleep? */
> > +	if ((last_change_delay >=3D 0) &&
> > +	    (last_change_delay < emc->clkchange_delay))
> > +		udelay(emc->clkchange_delay - (int)last_change_delay);
> > +
> > +	spin_lock_irqsave(&emc->lock, flags);
> > +	tegra210_emc_set_clock(emc, config->value);
> > +	emc->clkchange_time =3D ktime_get();
> > +	emc->last =3D timing;
> > +	spin_unlock_irqrestore(&emc->lock, flags);
> > +
> > +	return 0;
> > +}
>=20
> I'd suggest to check how much time invocation of ktime_get() takes, at
> least it came to a surprise to me in a case of the tegra-cpuidle driver.
>=20
> It may be well over the emc->clkchange_delay.

I assume that at least each invocation would take roughly the same
amount of time? Since we only use the value to compute the time since
the last clock change the result should always be valid. In the worst
case if ktime_get() really takes that long we may be waiting longer
than we need to, but that wouldn't be all that bad either. Changing
the EMC clock rate isn't something that you want to do a lot.

> ...
> > +static int tegra210_emc_probe(struct platform_device *pdev)
> > +{
> ...
> > +	emc->clkchange_delay =3D 100;
> > +	emc->training_interval =3D 100;
>=20
> Not sure why these aren't a constant with the code.. ?

The idea is to make them easily tunable without having to go hunt for
them later on. We don't use them in a lot of computations, so making
them constants isn't going to buy us a lot. Also, none of these code
paths are really hot, so I like the flexibility that this gives us in
being able to quickly tweak if we ever need to without having to worry
that we'll forget a location.

Thierry

--QxN5xOWGsmh5a4wb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6VzrIACgkQ3SOs138+
s6FSURAAuHIkM76l/aW376GVZabPFaDTft8S6fSnvsPAacz3OhBF4M0kAK/SjSoq
ce97F/3HY63ernpSMN5gvmnWUi9KU7xdFYUrn3xdRGMk9art6jtN4yzut8Q8oaec
iu6lXrNqDGY9NzngDbmz0GBLjQSxg8oA67TJ5Cl4mL8TWwFFfkUO8+VZzO/xkc3k
rNQgmFbMOKKMecFlDRSHHXBEVOFzLfduRplsi+7bm6S2Qb0Cw2KQvAFBCgKEXgRi
zfz17e3hP03jD3wkmW58MswKBnqvj2aDunaU+rbSxYKQVwen4M81KKt7pryc2V+z
XzBD9DJDjmkW5Cn4AGs3oYuDfzgojT9eoS/I3HshHbACqeIIpIauUpLxtYMEsF2A
KCcHLwZ1G8XUDG1uD8f54eJkL7VidI+vecLpiR069NfDpF6wg1jq4RFWKorUeUd9
05wT5ZfHmzy+aOHh738jOfI6ddmNUTygueMzQKmKCUCLPeq+lxL3Yg5FVkYiQVQu
/rqOlEZNolYcfU2x5C32i0qf0Tx4Dwzsad66wgvC0QpJmMqrVWKEXySGHF76tvvQ
7VdSm6ThYSQNQ4Xhz71+g2hCNNu2/1U+gkpBarP+crQ7nt8zAxR6jZl9hgfDfYq5
S0hZ8vQvEwGMLv/qXWdlQzycOFUl0dNe81DcENQGt7HMCAdRXBs=
=NhUM
-----END PGP SIGNATURE-----

--QxN5xOWGsmh5a4wb--
