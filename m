Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3C6C38A29
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 14:37:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E7302064A
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 14:37:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwPLG9Bh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390996AbgDNOhE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 10:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390985AbgDNOhC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 10:37:02 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77586C061A0C;
        Tue, 14 Apr 2020 07:37:02 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id a81so14196475wmf.5;
        Tue, 14 Apr 2020 07:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KA4DIsropTxxePLrlrvPba68I+rBV9yWm4kCLt//0G8=;
        b=GwPLG9BhM6Xv1cIvRlRS/kLL1JSrcTOAnlRT73NoQiu4DKr3+DE3yjbAr9/gQJ/Pzp
         kHM3cwi0ZQaKX2uAMqWAkvOnw6y4dapC9GbfV2EzQ4m9zbcT70a1Y44VteFpb4RvxmVF
         ngkPwZ+eKgaIjYggCjVoIhtcyFeN6y1S+38DnJ6vVpiVTJ+SG3mtf5umYDdSPV+mxYjy
         ygGvoKQ2SCULOGGCaW7UmuUWCaD/SyCM85SvQKxRwuD2BnP5V5lywjhw/rQjRO+E9rnX
         snOIZJ3kXuONHaC3uM+iv3QR9ossS67ixMiiUW18MIhF3uFPbCsxYXLSQ7L7/prmZZ09
         4zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KA4DIsropTxxePLrlrvPba68I+rBV9yWm4kCLt//0G8=;
        b=t1BiEju30MwEZj6jzG6ZMFkAetjFjU+9gCmfXk35snbcTpSnZ2W84sonoHXO10Msli
         H0xShoEO3TFGTtgN7P3dRvA559ItDjHuR8XAYUJnQTR4sxsWHYiw71hI+s/skX6a1FFV
         kHANhIpRTxKhAifH24r3/TJ+cQVR7RnxCLLOoepRVYoYFcjnaj5I5sHzzmoD2Rp83cqd
         hN6R+MSTh0GCg0cWu/pcBD+IYHw0m433QJrLDkUx+R8XW56k3YrHjTnmO3uuSmQUsI0V
         i1WlBf8Kee2GAl3HmDPRAfY8E/oKbpOMHbFud9oghMmalEkKqrHrMlc1vj3epvEySZAR
         cJIg==
X-Gm-Message-State: AGi0PuZL+DYe/GgVgBsBrpBgN7nK6gzQzyM9KnsxmRKYe8eu5T67w9TR
        BSbLm/ZhaiFO1yhMTYh2aqEun0Rq
X-Google-Smtp-Source: APiQypIApqddZ8ciqzIvMTEdxD09J053jicytMvQKVner9xgHA7T1aScQ5k5I2qvUQWkROkiqs1NkQ==
X-Received: by 2002:a7b:c84f:: with SMTP id c15mr170558wml.166.1586875020975;
        Tue, 14 Apr 2020 07:37:00 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id h10sm21602190wrq.33.2020.04.14.07.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 07:36:59 -0700 (PDT)
Date:   Tue, 14 Apr 2020 16:36:58 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 07/14] clk: tegra: Implement Tegra210 EMC clock
Message-ID: <20200414143658.GH3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-8-thierry.reding@gmail.com>
 <0e040cf9-56cf-dd44-3523-ff4c82fb1f2c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LiQwW4YX+w4axhAx"
Content-Disposition: inline
In-Reply-To: <0e040cf9-56cf-dd44-3523-ff4c82fb1f2c@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--LiQwW4YX+w4axhAx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 11:49:18PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > +int tegra210_clk_emc_attach(struct clk *clk,
> > +			    struct tegra210_clk_emc_provider *provider)
> > +{
> > +	struct clk_hw *hw =3D __clk_get_hw(clk);
> > +	struct tegra210_clk_emc *emc =3D to_tegra210_clk_emc(hw);
> > +	struct device *dev =3D provider->dev;
> > +	unsigned int i;
> > +	int err;
> > +
> > +	if (!try_module_get(provider->owner))
> > +		return -ENODEV;
>=20
> Is the EMC driver module bumping its own refcount by itself?

Hm... this doesn't really look useful in retrospect. Yes, the EMC is
effectively grabbing a reference to itself.

> In the other patch I already suggested that the EMC module should be
> disallowed to be unloaded once it has been loaded, seems you're already
> doing it. Correct?

Interestingly, it all seems to work fine if I unload the module at
runtime, not sure why I'm not prevented from unloading the module.

Thierry

--LiQwW4YX+w4axhAx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6VyooACgkQ3SOs138+
s6F8fRAAltMFYycla8aI7eycjfxbMe6paTuQsQQyz+jPcJ+aDCABF8qrJ/fRjvBA
AmzsAdBfdqmyB/Rc3h/y6yVkwn1HxakFOpPl18se88ca4dHLmjkzbFEq0Cf1zAjX
EHzbheMPL4wN5EXukjpRedTg0u4TxaxpFq5YxtXqsy1JJvHrWeDszygAJTrhQi96
ly9ouXCvOtJvYnAM+6Cbu8T13m5MYYPmFTEeyx7v9ca5Lb/eYFzpDFjjY2cpfI+a
1T+Z/bT/c2ELi2n26IuPggymoXoMjDKJZVB7P8HMPAERzU7904qEhG3xIPQl/Gds
lJkKAinQBWzmSUe158uzOhzWrWA+rLgB77kBU01NRt8IhaF3sLjPO+08lAfR9+8J
ccFcoT8GDLE/PMipQMMWwm/kzwuTF+qTAFZDVxJgTiVyu4H7whWiCiHCEMx5KKI/
gpP9ps9jIjhWXlMgC4pnmdB8XFUzlyjYXnRhy/wYso3OZwDGqpc75TKC1sI3MUfC
pS3OaFbyw73VaVgR+EZnTcyW/skXB1dOpOw/ur2npBx2Yh5gycNpxL3JrfSWXyDj
V5J/how06Ci2WbIVB0wjJB7/qAafLD7OVViRC54JH48yUmtRwlF1ZF6D5dgMRU60
ffrfvRHDBhncixdMOW6dsbo+1tFjHbZA2wmCS1Ock8kqjFvYXiM=
=UIdh
-----END PGP SIGNATURE-----

--LiQwW4YX+w4axhAx--
