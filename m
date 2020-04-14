Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51875C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 17:14:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 291E620737
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 17:14:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwqKKPpg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407588AbgDNROe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 13:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2407566AbgDNROc (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 13:14:32 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F621C061A0C;
        Tue, 14 Apr 2020 10:14:32 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id e26so13876818wmk.5;
        Tue, 14 Apr 2020 10:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4s7/P9MzS+AHwYX5Ehx+WXBD5Ss1A0suZC9xBAAs4Nc=;
        b=SwqKKPpgIQXGa11LiDYPKpl7R21xtiSkDEGqlBD+OZOodqg33J5O/dkr7MA83PEOJJ
         rIhPMl+vek5+Rkmy/gjIwgWBxPWFrSViI2WvMwIktb7NfwOevGqWGL8Wq9XYhTZRjR/i
         juSZz+B7nVyBxPg8M0WaYrKXu+o4X11QygyRvl3lay3Py5Yb3KOxiQytqXDCVAo/2WnC
         Gbe4xAqhDb7ItwVHbl0hce6A7brSLUFlkiD5u5l4T61upiKg33WBCaz3R2pBRF60aLIU
         0qUwE2/86/KHp8dY+h0lqxaMtupayO9jH+RJIHQtKFzIJLkAhtt/0CF8+UIgCArE6GPG
         pVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4s7/P9MzS+AHwYX5Ehx+WXBD5Ss1A0suZC9xBAAs4Nc=;
        b=KY60oiTzhVsA8ttS4S2cv56PGra7940qTi0VVCjrN9kGell2WTgt6IccXxw9wpHbij
         JDiYY9BC1M8ZjQmz0d/b3Q6tmkjulJajFH+iC9yjeBLLt2/XVvkXdu6RMJ2RbsWcOY/X
         +iaShr11Tz0r4xcc+j57LQYczhpLexxo/nSYyeiGSO8yiAJLG4VbUJhbciaX4YpeTbLU
         Vg1nYTnIfvDUnO2VNOXGniHoUoTqTopAjOJ0JlfBmMNtud8GCLewg93yG3sXxXg+IdEq
         WxdY8AfP8n9M2Ir+ZuR7/Gk+68nIKRI7C8LguuSN9M3tvxhU6tKZ8ARZuInAp7UjodAF
         j9IA==
X-Gm-Message-State: AGi0PuaDP/pYcRX2mnBHw+YUC49TTCsvIlzkn76auFwwoowYZ1jRBqHs
        gV5spZeAvRnz9AusaE/1Qv4=
X-Google-Smtp-Source: APiQypJEZqr9oXe9t7ABpK1+x84U9UtGQAUsE7LsFqCeUnsT3lRe9eKk6hMreCgAYXXHKbiO+8Klzg==
X-Received: by 2002:a7b:c247:: with SMTP id b7mr822062wmj.35.1586884470950;
        Tue, 14 Apr 2020 10:14:30 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id h13sm8773634wrs.22.2020.04.14.10.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 10:14:29 -0700 (PDT)
Date:   Tue, 14 Apr 2020 19:14:29 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH v6 04/14] clk: tegra: Rename Tegra124 EMC clock source
 file
Message-ID: <20200414171429.GC15932@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-5-thierry.reding@gmail.com>
 <a7209708-6e67-5885-5935-2db3d92174e8@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5G06lTa6Jq83wMTw"
Content-Disposition: inline
In-Reply-To: <a7209708-6e67-5885-5935-2db3d92174e8@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--5G06lTa6Jq83wMTw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2020 at 07:48:12PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > This code is only used on Tegra124, so rename it accordingly to make it
> > more consistent with other file names.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/clk/tegra/Makefile                          | 2 +-
> >  drivers/clk/tegra/{clk-emc.c =3D> clk-tegra124-emc.c} | 0
> >  2 files changed, 1 insertion(+), 1 deletion(-)
> >  rename drivers/clk/tegra/{clk-emc.c =3D> clk-tegra124-emc.c} (100%)
> >=20
> > diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
> > index 1f7c30f87ece..dec508ef2ada 100644
> > --- a/drivers/clk/tegra/Makefile
> > +++ b/drivers/clk/tegra/Makefile
> > @@ -14,7 +14,6 @@ obj-y					+=3D clk-tegra-audio.o
> >  obj-y					+=3D clk-tegra-periph.o
> >  obj-y					+=3D clk-tegra-fixed.o
> >  obj-y					+=3D clk-tegra-super-gen4.o
> > -obj-$(CONFIG_TEGRA_CLK_EMC)		+=3D clk-emc.o
> >  obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         +=3D clk-tegra20.o
> >  obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+=3D clk-tegra20-emc.o
> >  obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         +=3D clk-tegra30.o
> > @@ -22,6 +21,7 @@ obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+=3D clk-tegra20-emc=
=2Eo
> >  obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+=3D clk-tegra114.o
> >  obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+=3D clk-tegra124.o
> >  obj-$(CONFIG_TEGRA_CLK_DFLL)		+=3D clk-tegra124-dfll-fcpu.o
> > +obj-$(CONFIG_TEGRA_CLK_EMC)		+=3D clk-tegra124-emc.o
>=20
> What about to rename CONFIG_TEGRA_CLK_EMC to CONFIG_TEGRA124_CLK_EMC as
> well?

Yeah, I could do that.

> Also.. maybe the CONFIG_TEGRA_CLK_EMC isn't really needed at all and the
> TEGRA124_EMC of memory/tegra could be re-used here?

Sounds like that should work... let me see what I can do.

Thierry

--5G06lTa6Jq83wMTw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6V73QACgkQ3SOs138+
s6GEsg/+IZcdQCLTqDBB8dWq8+IHcYR4MKibWV3/XPcYJ29XjUgSohR1ne4jlJrB
7WeB32SUULUOpmRtHw45hF5htbJYHa2Mxwpqv6NGAyXf+A2Xxls2mKzfqNcujijj
J9ewU0PuBJfvWLjSKGYQtYmIyj73M68NUCJVUaDZ3hbv5INljFNyUN2wuwMzo1L1
jFOfe+O2YBBr157WZlMZLqIDInAEvZUSVYF80KtOdJUw8jU1uh2zP8ufgD6S6ZGt
TuMdHIUyEy9qwFldgwEy2nXBIAIiHWtDDHUDatdn/A8PWw+Auqd0v2XKktucqv4S
+Lq3BG3jCNk54vOWiBjJIDTxF/CrAP03myqF19tNO3OfRLffTjLah1qp//sj//lU
hbq/XEslGhwOzCUvKXawY8RO8yuSGgKDuwV6aSEDNW6Oo0sbCHrMcLFWu2dNR3Gk
KdwiyZFeo0xLH8/P+pIJ+V7xpMnRJpKhYlRrnHl94qt6Gum2LSlQXVATklZHcBoE
1eV5NBovcpH9Eq4FJWFlkkT2VWcLrWam0UF1LG6gBHllWJBXhBvX95k2Yfb3gF4m
Zh2V92hkPa0ZzU3pdNEu8Qlcbm78yAMYHSrN+oNnV7bbbnePkYEiJCauKt+uihB8
UhUFxei8DW+O9tT1MI0QFaPln6dXzUdhr102o4CevKkD9kDft4U=
=ednv
-----END PGP SIGNATURE-----

--5G06lTa6Jq83wMTw--
