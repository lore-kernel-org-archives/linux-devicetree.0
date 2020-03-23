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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E26C54FCE
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 11:00:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F0FC2077D
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 11:00:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBGMIJ+n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbgCWLAb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Mar 2020 07:00:31 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44359 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727974AbgCWLAb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Mar 2020 07:00:31 -0400
Received: by mail-wr1-f68.google.com with SMTP id m17so7477075wrw.11;
        Mon, 23 Mar 2020 04:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sadhhHKl37kodrpSVYR2LnIwtVMN2BKSE6OvR4D241Q=;
        b=VBGMIJ+nSe8j7N65h6/fTgP+fPgV4ZqrJIg0hTtEsehn7H9BA+8gYR2xAzFM/ZKpAY
         5vcm87vEKYZKCAA7Lgym+BF7/rTBHBJm4sCJ0XY0u5b+A585h8xmdhz29PWUx7Zr5Qbe
         5LrMyMqhWTEwT37cAEMAhQS6JnSOXxX1vei7h/SZZtBsq1nM4ao5uuGdbjfPlo/GU86m
         ZyaligkLWyB07qOg/zprBUD3g7RkRagKW2HEzd2dScXXFgb3heV3NbEWmTNqI7OmQe4A
         J/NJjFnOdOOAbm6e92Tequk0LEYcX0b2LLFefWBlEknJ9xc5LdfMoL9hUu5LSmZ4TZJl
         dVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sadhhHKl37kodrpSVYR2LnIwtVMN2BKSE6OvR4D241Q=;
        b=cJHilCPyl34mLT3TnycS8Sf5XphGrojyWhrYfF3FhuaUWx8Tb5dIFj+cso973VGJkA
         79XHO63gyWdMzMjTqoJyQilvbxhxWzV7uLxphhjduie6ZNYkwAr2ZYa3BFqRVSgPkx/y
         Li6dsg7Vutg3mN63pQyROT9DPtQ+Qdr3wUSvcnAxT5A4YdBGffCHzyEFxm+JqOoZyALA
         fGMl5Gv1bBsxCqXiCFwboaOKfTG+93Ratqs2HGOce0ma9qPfc2C0X9yL+f1f/kzWKPEv
         22bChJB4mcF+wLw4az9W4S7PA9gm/il7OGppTa7j+bm01CDFhANfE0G6xRppbNOQc1b/
         HOZA==
X-Gm-Message-State: ANhLgQ3OxgPzby+vLgmosudQ22udoe1grhDJ5xW8AvOtrJyK7Mb7aLcy
        geV7J+7IQXnopb9MlAAq1cA=
X-Google-Smtp-Source: ADFU+vs23hQHjnsNpDugZtYful1vTGeawfdBFZ++4cAXCzh6x7Z59NoWJpJId2Y1TDOMh6OIOUhwYg==
X-Received: by 2002:adf:eec7:: with SMTP id a7mr29025432wrp.405.1584961229361;
        Mon, 23 Mar 2020 04:00:29 -0700 (PDT)
Received: from localhost (pD9E51CDC.dip0.t-ipconnect.de. [217.229.28.220])
        by smtp.gmail.com with ESMTPSA id k18sm22461158wru.94.2020.03.23.04.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 04:00:27 -0700 (PDT)
Date:   Mon, 23 Mar 2020 12:00:23 +0100
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
Message-ID: <20200323110023.GB3883508@ulmo>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-4-thierry.reding@gmail.com>
 <a5c9e3d6-2b65-ec93-d8f1-7c7680092e53@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline
In-Reply-To: <a5c9e3d6-2b65-ec93-d8f1-7c7680092e53@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 08:44:38PM +0300, Dmitry Osipenko wrote:
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
> > +static u8 tegra210_clk_emc_get_parent(struct clk_hw *hw)
> > +{
> > +	struct tegra210_clk_emc *emc =3D to_tegra210_clk_emc(hw);
> > +	u32 value;
> > +	u8 src;
> > +
> > +	value =3D readl_relaxed(emc->regs + CLK_SOURCE_EMC);
> > +	src =3D (value >> CLK_SOURCE_EMC_2X_CLK_SRC_SHIFT) &
> > +			CLK_SOURCE_EMC_2X_CLK_SRC_MASK;
>=20
> What about to use a generic FIELD_GET/PREP()?

Done.

> > +static int tegra210_clk_emc_set_rate(struct clk_hw *hw, unsigned long =
rate,
> > +				     unsigned long parent_rate)
> > +{
> > +	struct tegra210_clk_emc *emc =3D to_tegra210_clk_emc(hw);
> > +	struct tegra210_clk_emc_provider *provider =3D emc->provider;
> > +	struct tegra210_clk_emc_config *config;
> > +	struct device *dev =3D provider->dev;
> > +	struct clk_hw *old, *new, *parent;
> > +	u8 old_idx, new_idx, index;
> > +	struct clk *clk;
> > +	unsigned int i;
> > +	int err;
> > +
> > +	if (!provider || !provider->configs || provider->num_configs =3D=3D 0)
> > +		return -EINVAL;
>=20
> Why all these checks are needed? I don't think it ever could fail,
> couldn't it?

This could fail if no EMC provider is attached, which happens, for
example, when the EMC driver is not loaded.

>=20
> > +static int emc_table_lookup(struct tegra_emc *emc, unsigned long rate)
> > +{
> > +	int i;
>=20
> unsigned int
>=20
> Same for all other occurrences in the code.

This was fixed automatically after I fixed the rebase issues.

Thierry

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl54lsQACgkQ3SOs138+
s6EeQQ/9G63M1xZHwIQsmIIdgaOw5YN+TMj2fb5Fy/mSYOOmDYJyyyRe3dx4GvEn
9HJ1jk7vLe54qYlncIy/Iq30OOZ9GfDKOQsebE/hc4j6EEa4h2VO8kRwUVWjTAer
+DykULLJpXnDOki2OeMkPx5ZRQe21SQ4NNDNcnyI1e3yHv9dNsa6lkjp1+rYshAi
SghXsdNd3yrgWYuAInyKifrPBt3VS8oeezB36G2sRRkgoWlxrYrk11R1rHmvi8vR
r5OzzniI25NLqkDpaEOQCsjYxeyqT7tr/9W6R1lmpxhcNtKT3puIA4/jYosGIRm2
9i7olnK19urr93jkXS+ljzj8jA6zWNMNGkORPHL/H7HT3wFxS42jEt0dyOUiat/E
oGN188QLQqi8grfb1qp+yeN6Gzrz9CkXNKJkC9Id3cqV1S2mqGtr9t5iDzNxYCR3
N9OtxnOK238OIEzFyeApm099w7D6ly1/yeDAUps278bbeul9sID8CCH0XGmavk5g
9ALun6d42DG1iagOafD3Reyqstw/vOItJg689zPC5aSC9MVXuTEs/Trqh2Rlgrg4
xOJe+9epTCemM8e8hAlXkA1I/t8vpV8RuDwj8KJ6QpdBaCRjxy9fYzpmDwpwvrnL
81TWT8PZbKw4IqXO/b9Yc/sjtiL4K5nPAVQVQx0d+NnjFRrLADk=
=j0rX
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
