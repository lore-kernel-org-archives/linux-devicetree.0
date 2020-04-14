Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E36DC2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 14:34:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0AD720768
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 14:34:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pH8ZpxX8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390972AbgDNOeb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 10:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390961AbgDNOe3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 10:34:29 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5193BC061A0C;
        Tue, 14 Apr 2020 07:34:29 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id r26so14252249wmh.0;
        Tue, 14 Apr 2020 07:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GzDsay7ZtiUVlGJrHI4dwfbZX1amh97113yqGdPhgsI=;
        b=pH8ZpxX86b9a+zmBKSD6oQacbBLG6EAUwd7+HWjEleK6fQSx5ckspywSPxY2vX922b
         z2389d7IpkI72Wczr3fPFN0H/iR3Pl5H0p9fxAivAnLF7tDOVTWW/Fd76rEC+6SjAfI9
         x0Gx6wj5ly4Z97+t4Bw/08mXmnIzF+uMT5wunJPlBnqLPbSA+pvSlSNamOSyVzQobmn/
         b+avRlJr4Nt1HtcTkWxLQs/GWXSTMs5IQM/+tnalhXoN5HJrEHbeHXQzabW8ATh9Wi/y
         KJVNE7Dv063mAxV7P4Zmm9bCAPWqGul4/5K2BzJ6wQG/qUbBQf5XqI9TFV00PYFQbkj/
         RGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GzDsay7ZtiUVlGJrHI4dwfbZX1amh97113yqGdPhgsI=;
        b=QO/GSBRUQ8W6sWwSYbUU31ct7tt4V6erz78Q7oiUFGvuq9pL/hCgqXPXIE0kGUxECy
         ozDxeW2NmkTYrnreb2TKLgwCfgbIeVpZvrgXDcyS5SV75aUAdE35MdQm1A8tjCBdeFSM
         dL91x3uX2PpKlDY/mZtK3Nwds6XM3GeW0vengYa11hqiJPnerbVwzdVrY3NDJKP/SesX
         Kq04gveYSN27fBoxlp+rmvooK8a9EooH31a8TTbqypp94/m9n1t78oPbOGceUJMOtfv7
         m5Epjg3RpaMxc8wKj0tLbRIvy7HF5Fo1PxalnOTqTkSs0a96PXTzm/Jyx/YKY8PLBJbR
         nWCw==
X-Gm-Message-State: AGi0PuZBLMRtoRriSUvpqsZ84WbwRSMeV2avS/Dy8vcrNRcEyf/Wcglu
        d77XGjYjH9vFfOxXQ8VCKiw=
X-Google-Smtp-Source: APiQypKQlLXB+oj+GcW3+9i6c3fANKqXUMA8Cm07ep/LoWEiOgjrO70vfEfldPonvOpewJ6cfmC1dA==
X-Received: by 2002:a1c:dc8b:: with SMTP id t133mr145571wmg.117.1586874868078;
        Tue, 14 Apr 2020 07:34:28 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id q143sm19971427wme.31.2020.04.14.07.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 07:34:25 -0700 (PDT)
Date:   Tue, 14 Apr 2020 16:34:24 +0200
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
Message-ID: <20200414143424.GG3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-8-thierry.reding@gmail.com>
 <8dc000fb-8867-cf8f-8204-a9e1e79a4811@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pE2VAHO2njSJCslu"
Content-Disposition: inline
In-Reply-To: <8dc000fb-8867-cf8f-8204-a9e1e79a4811@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--pE2VAHO2njSJCslu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2020 at 09:24:31PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > +static long tegra210_clk_emc_round_rate(struct clk_hw *hw, unsigned lo=
ng rate,
> > +					unsigned long *prate)
> > +{
> > +	struct tegra210_clk_emc *emc =3D to_tegra210_clk_emc(hw);
> > +	struct tegra210_clk_emc_provider *provider =3D emc->provider;
> > +	unsigned int i;
> > +
> > +	if (!provider || !provider->configs || provider->num_configs =3D=3D 0)
> > +		return clk_hw_get_rate(hw);
>=20
> This still looks wrong to me. Nobody should be able to get EMC clock
> until provider is registered.

The EMC clock is mostly orthogonal to the provider. The provider really
only allows you to actually change the frequency. The clock will still
remain even if the provider goes away, it just will loose the ability to
change rate.

> This is troublesome, especially given that you're allowing the EMC
> driver to be compiled as a loadable module. For example, this won't work
> with the current ACTMON driver because it builds OPP table based on the
> clk-rate rounding during the driver's probe, so it won't be able to do
> it properly if provider is "temporarily" missing.
>=20
> ... I think that in a longer run we should stop manually building the
> ACTMON's OPP table and instead define a proper OPP table (per-HW Speedo
> ID, with voltages) in a device-tree. But this is just a vague plans for
> the future for now.

This code only applies to Tegra210 and we don't currently support ACTMON
on Tegra210. I'm also not sure we'll ever do because using interconnects
to describe paths to system memory and then using ICC requests for each
driver to submit memory bandwidth requests seems like a better way of
dealing with this problem than using ACTMON to monitor activity because
that only allows you to react, whereas we really want to be able to
allocate memory bandwidth upfront.

Thierry

--pE2VAHO2njSJCslu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6VyfAACgkQ3SOs138+
s6HofRAAia8TjCbY5zDBbRMouJEBKcUyaKEoUaUahRyFSZueh7M+Cbv/OqonijkR
LM4T1jYRzLNA6mhU+k0bDjFhM9NWnCxs5HAAr0uMk6pVdGXMyYnUtqps0mGfVJFd
q6M842aj7XYqZaQcamhCqTC62Bpi5ggbSLzkhV9nv1k5OKR06rXWYu//FAogjIKM
zVHansjaeBdsaeuWg4kvsx6su7IPAyVzYJCO05fooziHEKJjUzouzCkIDSXM6noQ
LhmnidHUVAOHw4Qit4/ccT3azEYYSEuOl1R2P9JyRgR9zvOxp3GJtIOC09KUjyP/
Z8EiLDKlgyMPi4Ev10njlhHjkJ9Sao/ICYYyfzika+RQtdILzCLhx4tIlxsu+Ahp
MOwUU4RYufFF3GGbeCrMd2qwPN15VdxhaiqWUeIlusBLiCSu/jXUdI0VRa06J4dv
wp0gkDdDQE+IxDms1sp3BCppQyMgf7wZvW+obCPTofwUFzs+uyUllZn8Mv9+2QKC
DGO30C2kk2NrA5XZASA/y0+6LQFAzNMIYl+TqKgKuusW3jHeSR1dzPmwl0v1qdb/
YqibANFqzqFbhSbR0JLlG30lZ1LW62AbKCVu6kiyz8xOm34bhQTCNlbtYkopfuHs
RfM7hq61jxfyqyCvwujvw3EIxfdMFwejUCX0vmfCHEfvF24bxQ4=
=V99P
-----END PGP SIGNATURE-----

--pE2VAHO2njSJCslu--
