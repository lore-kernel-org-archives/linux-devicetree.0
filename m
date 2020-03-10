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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B851CC18E5B
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 17:05:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9112B222C3
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 17:05:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHm/SShv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgCJRFQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 13:05:16 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45397 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbgCJRFP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 13:05:15 -0400
Received: by mail-wr1-f65.google.com with SMTP id m9so7857832wro.12;
        Tue, 10 Mar 2020 10:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6OEUqmMP57cb74MhBgNDVNN+KyC7WBhjSIu721xvBNU=;
        b=VHm/SShvv2oKDxW/Ex9HZ/5D/Hlf5Ru68Xy1a7ESmyT/NhZvBUFu/A3bRF1NVV7qKM
         FKKiI1raEcI7niAr0wL+5WWU+U/NR0eWQExTMW9Pe0W7xoFg6xs5T++o1Nwy6TWWqnp8
         ThDf8+ulnumZ705uFuUJF8MgNzlGlelU+LlAYCL7n01kjG3+jLzk+7828jUgfNI4tgPU
         vlZUkQaf+mw8dLwWutKKEFha1Sj8QB1bzzyH1vn4fU2L3ME/bZebyD66+Dg8sDmDVhPE
         gstZH1y/ZBC7EE0fzENEr+JnK/a9kYxpKSNyIBo9v75WBuXd5+EyYbPJRRSTjkoeI7JA
         dL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6OEUqmMP57cb74MhBgNDVNN+KyC7WBhjSIu721xvBNU=;
        b=CuMeOJpEXSToyPi02CKzNheS9ZHCjh9oz9PG13Y9qs5R1z6XygAmhnkAlR4FUOCpBA
         uGE4m8nrvLJFoIyfzTssSCLTtXp/LS8kEW8zoO1AL5tpcxjl/xRLuM0asEviDoCNQePc
         KoRPZoYWfZwwwVdJ1HM2k+Ny0+mbuhf7fNzf8dEtOYc2tgIgRABE4wPoI3TtLRmmMzqV
         2JXFwMiFHThFgTH6Bd3v6T9nT6yADfWShLU56EPhYPNuWkBa2fqFeGq8WhS3EO9RN910
         F6WQzLSY/lMR5GvVd0cPwTPDR/Uyy7Lo7YgHkQUx/qy2xMxlh9jvMTlVtMaGigTxoDDY
         sm0A==
X-Gm-Message-State: ANhLgQ3AFsCB7NQdGE9tYFByonT+9Tb49w/GqxNRW0qJanKagn9wSw8A
        ELUflxPhLsX1NhxiMvrtFew=
X-Google-Smtp-Source: ADFU+vv+IEQslBSOgKdHxaft8X7ofDv4clakgjSuWe9FiCBWvzGCaoweilLbkexC2zw/U2MvtO+lhQ==
X-Received: by 2002:a05:6000:44:: with SMTP id k4mr13774361wrx.205.1583859911867;
        Tue, 10 Mar 2020 10:05:11 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id q13sm15604915wrs.91.2020.03.10.10.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 10:05:09 -0700 (PDT)
Date:   Tue, 10 Mar 2020 18:05:08 +0100
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
Subject: Re: [PATCH v5 1/8] clk: tegra: Add PLLP_UD and PLLMB_UD for Tegra210
Message-ID: <20200310170508.GA3079591@ulmo>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-2-thierry.reding@gmail.com>
 <9b343fd1-15df-409a-390f-e30fa6bbbfe7@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline
In-Reply-To: <9b343fd1-15df-409a-390f-e30fa6bbbfe7@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 07:19:59PM +0300, Dmitry Osipenko wrote:
> 10.03.2020 18:19, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Joseph Lo <josephl@nvidia.com>
> >=20
> > Introduce the low jitter path of PLLP and PLLMB which can be used as EMC
> > clock source.
> >=20
> > Signed-off-by: Joseph Lo <josephl@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/clk/tegra/clk-tegra210.c         | 11 +++++++++++
> >  include/dt-bindings/clock/tegra210-car.h |  4 ++--
> >  2 files changed, 13 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-t=
egra210.c
> > index 45d54ead30bc..f99647b4a71f 100644
> > --- a/drivers/clk/tegra/clk-tegra210.c
> > +++ b/drivers/clk/tegra/clk-tegra210.c
> > @@ -3161,6 +3161,17 @@ static void __init tegra210_pll_init(void __iome=
m *clk_base,
> >  	clk_register_clkdev(clk, "pll_m_ud", NULL);
> >  	clks[TEGRA210_CLK_PLL_M_UD] =3D clk;
> > =20
> > +	/* PLLMB_UD */
> > +	clk =3D clk_register_fixed_factor(NULL, "pll_mb_ud", "pll_mb",
> > +					CLK_SET_RATE_PARENT, 1, 1);
> > +	clk_register_clkdev(clk, "pll_mb_ud", NULL);
> > +	clks[TEGRA210_CLK_PLL_MB_UD] =3D clk;
> > +
> > +	/* PLLP_UD */
> > +	clk =3D clk_register_fixed_factor(NULL, "pll_p_ud", "pll_p",
> > +					0, 1, 1);
> > +	clks[TEGRA210_CLK_PLL_P_UD] =3D clk;
>=20
> Isn't it possible to auto-enable the low-jitter bit when necessary
> during of the rate-change based on a given clock-rate?

I don't think so. These new clocks (pll_mb_ud and pll_p_ud) are parents
for the emc clock, so they are needed to properly reflect the position
of the emc clock in the clock tree.

Thierry

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5nyMIACgkQ3SOs138+
s6EMCA//Uxo0Bgi/lGCwUNR+qekqxpV446rEudb/jWg4Kh7pFTMGgzA/YUE8sFUV
Q2y2URjCPwMRveAm1dE4gBq7UA/eLIYBBMl/9tmc8PVad14aOyoKuiDX3jYddvg7
/kXm+UZPC3HLCPuSZKpF34zadrI4ndEw9z22S8hWClGuaUYBegAApiOI28T5FSSX
ZrPydC1NjdkXPNxL5KLaCugVCbBP4J36UhjY9xOhAxCLb3MX5Qxwbh0BKJDe+7xw
l/b134bBjjaF8yIogH6PmSABg1bsL0K+aCzK3JVXvEmMJXZwl0rSeQFs0kZZRdND
yvMdV7RyvhnPvuplbMU3Mym3o/RfQB2XUzsPqj8g6yQqBokJdV5xyTJ60H7sqamW
Ag+5jrVpzud7nJLXMjBYteAsCMBMvOe9T4SknvruYNxpWAWsLDTkqoa0YQ1P7kvD
rT3aW0XDLCt9jyQ+bHjl5xhYgCbJdAVgdq9sRe8BBNcQOPCh9Fk8vIEJyglcRDJ4
flGMTeQTGvnugxfEzQ4auDqpm1EjWHB9M/CRCbRgvFdB/irb+N/J42xqIPQUzAa5
iFIq+4u9NfKAGKO+QONto4nHk2cnEMZaCA3DKXf1zQ/9T+/ELbDV8LbpxkUJZadB
4pWq0GsF2rjnAApsk8Uyo69TZyWLhxZFLjxhNDEJZZTHkLbHRTo=
=oCYd
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
