Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF3C0C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 16:30:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D11D20678
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 16:30:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brfTLqYG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391639AbgDNQ3d (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 12:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2391626AbgDNQ32 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 12:29:28 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD107C061A0E;
        Tue, 14 Apr 2020 09:29:27 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id o81so8082496wmo.2;
        Tue, 14 Apr 2020 09:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HjwUJ2rdgqk7yfPt/6aFb6AkYHLc65R6LzpvQtbTgLU=;
        b=brfTLqYGG2BTWixqKkzT/IZQhhwLyIIjRVWJkPw6XJgVe/kYdwXsLtmVcHniPG63bO
         R2o5oMmZrTHhbZGNtZTbdvikrtabvdRk6qHsXj/EkshAAe8E9CmYe+zbzcEZIEksJu7z
         u6K8+KQLVkVJwOR66ocfU+3vOVpquIrWUX+slENez2w+4guiG8Q3TbOUME1JLKCJMzA9
         diB/TM6KENrDCHy9cC9zH776QoOqZeBOD9L5Flgiv0COqOuRIshmrc7zocYW+XPAx1u2
         +6c466IVAMi7K0rd3VqldpHNwBTcWu2gH+VKoI2mJ7yE6yfanE1gEx+NvMEJeonfkk3k
         Ga5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HjwUJ2rdgqk7yfPt/6aFb6AkYHLc65R6LzpvQtbTgLU=;
        b=buo1qpr28+HriST4qZWCOrT04ek2R1zMWkOWEdzlA02Uuzc6kjGOv8N/5CteITHWtc
         ssHsKqlnuXEjAAOlkZua+86O/bfML/6DFAsL2jRY5ImboYvOdahrp0DqSaJgKEtlD7fb
         bvzeD7PS6onrV34RJ5GPMv+bbDX/lbUDF0xwueIVmehDrzFHDb04jTnOUnfMpuU+8YVr
         XkbWeoelAdEko18xvDciahB7zKDCdY/Q9nAigxzZs/k+Gh48BbOuZeDXML3kDxyMz0em
         2zWq19tr65jzKvrt5nWlxLjl0LXHxTgaApvLflTVbQAVe2yiqtA/Fw0SvoUvQNXm/sxM
         52Lw==
X-Gm-Message-State: AGi0PuYdUmEqinZLZIy0b8PxqPL/VADAk6rKyj9CkR8e2ciqecbwrpbq
        Tj5z+tQPI4Fi1TWpYoE42a0=
X-Google-Smtp-Source: APiQypIWJ1Z8mSk51/i+xtZdOYqdqReMtGC+Hc05PDoIRn91gT1uJcnTQD5NU03oRerofwjM62G5TQ==
X-Received: by 2002:a1c:f012:: with SMTP id a18mr624618wmb.41.1586881766494;
        Tue, 14 Apr 2020 09:29:26 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id m1sm14546851wro.64.2020.04.14.09.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 09:29:25 -0700 (PDT)
Date:   Tue, 14 Apr 2020 18:29:24 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 11/14] memory: tegra: Support derated timings on
 Tegra210
Message-ID: <20200414162924.GR3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-12-thierry.reding@gmail.com>
 <937a1aa6-473a-f6c5-729a-4f34e4ee3abb@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="juwRYO7N74otsfNI"
Content-Disposition: inline
In-Reply-To: <937a1aa6-473a-f6c5-729a-4f34e4ee3abb@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--juwRYO7N74otsfNI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 05:28:22PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > -enum tegra210_emc_dram_over_temp_state {
> > -	TEGRA210_EMC_DRAM_OVER_TEMP_NONE =3D 0,
> > -	TEGRA210_EMC_DRAM_OVER_TEMP_REFRESH_X2,
> > -	TEGRA210_EMC_DRAM_OVER_TEMP_REFRESH_X4,
> > -	TEGRA210_EMC_DRAM_OVER_TEMP_THROTTLE, /* 4x Refresh + derating. */
> > +enum tegra210_emc_refresh {
> > +	TEGRA210_EMC_REFRESH_NOMINAL =3D 0,
> > +	TEGRA210_EMC_REFRESH_2X,
> > +	TEGRA210_EMC_REFRESH_4X,
> > +	TEGRA210_EMC_REFRESH_THROTTLE, /* 4x Refresh + derating. */
> >  };
>=20
> What about to avoid all the unnecessary renamings?

Looks like I forgot to move the addition of this enum to a later patch.

Thierry

--juwRYO7N74otsfNI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6V5OEACgkQ3SOs138+
s6GedxAAjMev/glkxqVALMJ3js/+OL+6+tcWF8fwUwt8eeVSB90IejTNv+f0yaGL
agERwBMUH07L0WgF+jp+XFTuKAx1v5FhsF60B30Xh/PpxsMGh8M+nJ3EFDERkzCH
TVVKSuUrx/thQH6OF0Y+iWs1coXD113XNi8KcqNdcSPtSwo9tglvSF/Qb/PPS+4t
/F4+TSNfa3EZk1JZ0JOejJkfIXgJ+Hrkwp8vrhz6Oux7DuZ1vTX6A/ktYuqC+XX/
SDLpOPhnGnhU+BV54+39taQB7k/44cbmmfRgSNdeZUx1yznOAHnsUKvy3IRHq3Bf
8Z0R+2yHTxttx1hiZBMXt5g0Mbek4b5V6NSpWTdW2J6aPmMkiwrQke+M5o+PnYV5
hsB6YVj0qoFVciCfSR1lZSw0qB6e2RibSHkyHC8CiD4qJpJhBfOdXVVGJTLY8lbK
POz8E/LuDaOvCSJf7EhwZ4tUVMOJROzR6WSqaloObQ3s0Bgd0NpS/GWd/LqQLNi/
kFHoHWoFJ0WiuEzNuFjLJ+x/YGIzEChFK5KAPG05RFUyn78pvdmAdfUtMxxuD3cH
KPMzH6+J/1AhszE5mbSRaydbALB0wEMmE5K96anC9ufbe3zGxOKed2q4eYSA853m
gregdGClQ1FEUkDIBiubvqh2DzPhAYz7NnTdY6salzA4mQWoFu8=
=p4SC
-----END PGP SIGNATURE-----

--juwRYO7N74otsfNI--
