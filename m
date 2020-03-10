Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E225C10F27
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 17:08:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 486D720848
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 17:08:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IpS92EZQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgCJRIh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 13:08:37 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36029 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbgCJRIg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 13:08:36 -0400
Received: by mail-wm1-f68.google.com with SMTP id g62so2256016wme.1;
        Tue, 10 Mar 2020 10:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9tdh9Yd52OQvaS2+AWdpar84Y/IP3rkZCtKpcX/Lims=;
        b=IpS92EZQo9F96PT8IBgtBF1aag+gazu9GI7DdFAaBQ2URBR0VpPc8ZUisPH3v5fWqe
         bvJrsTqkoP2bEs8k5BaCAS3ReSxnj6pizCTj3G+jXg5Mits8GbdyVRTnp5qZtHsGEmjx
         s7NgNuInY2FGoPsvNcnTKcXxaNJbVzS2dtKRCDVfS5t5NSBRSmLhAvTWf2cs9dwUzzU4
         BGXPGNjDEi4Kb/gJBnW00HL5ixYt9xyDLT4sJSry5GxW/LX2xOHZvpQ3eT5/zELS3Onj
         aDxAxSMY22NzNSRvNvMrgBRkTyaTjFcqA5veE6psOwNGQCwGq9pg8bcmbSMuPqnKwWt8
         8rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9tdh9Yd52OQvaS2+AWdpar84Y/IP3rkZCtKpcX/Lims=;
        b=AS5djW2m2XWiHTRHDKzt5Zl/b5O999iTjhVoeejFpWFZtX7ASvWHe0UBHIKbzyKazC
         ZjnFgkFFULE1k81axJyTO7rl+1BJZ7EXxNubcGGD8BNn2AQ3zmhI2eEkNqxakUevBKq/
         bVPNiAdzPqHo+TgregN3x1fAEKWIzr5OC5Jh2mCtveFz/4JIzp5xoAwCKUNuSqZtMhGU
         jT4u+4Ispz7AwEnitG5hMk9E/P2B4vizjdwm2qCdsdkpCowNSfCn/k/KtNnAnYevIjZA
         V1ax/X7uhy0pEwV13+6aF0sHU8EXrgmJElVA3tClk0XcJ/jcSTS9KH2aS4mkp05gp+9u
         wj8w==
X-Gm-Message-State: ANhLgQ1sX7iYxVUAm4FysAZeY5JHOiHVOXjLx7idt7D/PPkdt9SvfQo+
        plK09w3hnvDxWe+DIJnDTJdzT7y2
X-Google-Smtp-Source: ADFU+vsaplm8JtjPK+Of2pJYXAco9+bzPuIKNcX6ycOK9ZGemGiwCbVuSMLr1ZTRtCKSwkkytjg9Rg==
X-Received: by 2002:a1c:cc06:: with SMTP id h6mr3186159wmb.118.1583860114315;
        Tue, 10 Mar 2020 10:08:34 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id v20sm15560037wrv.17.2020.03.10.10.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 10:08:33 -0700 (PDT)
Date:   Tue, 10 Mar 2020 18:08:32 +0100
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
Subject: Re: [PATCH v5 2/8] clk: tegra: Export functions for EMC clock scaling
Message-ID: <20200310170832.GC3079591@ulmo>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-3-thierry.reding@gmail.com>
 <8e1f11e9-a95a-500f-ff44-6f44ad990863@gmail.com>
 <1ac24caf-e4c1-b20e-4c3d-97b328a97ea5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7gGkHNMELEOhSGF6"
Content-Disposition: inline
In-Reply-To: <1ac24caf-e4c1-b20e-4c3d-97b328a97ea5@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--7gGkHNMELEOhSGF6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 07:16:15PM +0300, Dmitry Osipenko wrote:
> 10.03.2020 19:13, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 10.03.2020 18:19, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> From: Joseph Lo <josephl@nvidia.com>
> >>
> >> Export functions to allow accessing the CAR register required by EMC
> >> clock scaling. These functions will be used to access the CAR register
> >> as part of the scaling sequence.
> >>
> >> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >> ---
> >> Changes in v5:
> >> - remove tegra210_clk_emc_update_setting() which is no longer needed
> >>
> > ...
> >> +EXPORT_SYMBOL_GPL(tegra210_clk_emc_update_setting);
> > ...
> >> +extern void tegra210_clk_emc_dll_enable(bool flag);
> >> +extern void tegra210_clk_emc_dll_update_setting(u32 emc_dll_src_value=
);
> >> +extern void tegra210_clk_emc_update_setting(u32 emc_src_value);
> >=20
> > Why these exports are needed given that the EMC driver is built-in?
> >=20
>=20
> Also, seems changelog doesn't match the patch itself.

I don't understand. These functions access the EMC clock's registers in
the CAR.

Oh... are you referring to tegra210_clk_emc_update_setting()
specifically? Yes, it looks like I forgot to remove the implementation
for it. I only removed the prototype.

Thierry

--7gGkHNMELEOhSGF6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5nyY8ACgkQ3SOs138+
s6FE0g//Yhx1IIFBW0cnxGdopt71ts3wwH28AgKUyvq0sqSSrXWDcQ4rzkMotYBS
Q+sqXngUYZxTMuMJNxnOWs9GHE6jWAcUJYQVX1yZL5LRkraSL9GHZQkKA2UYpxU6
juV+JuOnUNMzb3Q9JtbZbxxRIgh+Sc90/ikKsMHaHzK5womAbxy1WDIrddBplgpq
VqtprZ5a7mQU4pi8i199lOEPhxuTX9AecjGthoplAOuCQtWrwIg+vYX1DdJkC5W9
j3IJeVryWM5KgJMx1PEmOE8+/66o1jcp4WACHK+cuNYc243vjMsAqi0AE3Ypyj9+
EbQ0YvZReoY9SIKQ7pyUg4lAgeSkf9E84e8+EWXXvm4g1+e5DqVbjxBJwsdWBK2b
ubflw4Wq5wsDWTT33Vqt2yXSEYNQETUckPjb8n3+Wh53BfeSMxKFvNhtDOwWGiMB
XI5JzInL10lMiXiB9z3/W/xC3C8roZRop9ihtvG8ImbpjHmkH+apWmcKpiKsIF7u
FNLjHK5G2hHJG+zamTFb2LVh3Btj/ZNmdMp0k49qR4W38FyEKPY9J0WKQGC+npnj
w7DS4a1Hw43+h1gbPZi0T+MzRc7zH74qHE9po7RyHBeQSEI5oCX/uVhDsZ7o2tyq
ELLmiPSibKQWaxcm3lloD8Duwqv0HUsnH+6zmnWiPFJPhHvmlw8=
=1/1K
-----END PGP SIGNATURE-----

--7gGkHNMELEOhSGF6--
