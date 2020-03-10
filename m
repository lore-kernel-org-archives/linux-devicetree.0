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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AD4C3F2D0
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 17:06:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA71521D7E
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 17:06:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yada3ftE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgCJRG3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 13:06:29 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37553 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbgCJRG3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 13:06:29 -0400
Received: by mail-wr1-f67.google.com with SMTP id 6so16876476wre.4;
        Tue, 10 Mar 2020 10:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XrGRKIT36erQNGi90+/pLC99u3bWc1O21GG8hCOkNRE=;
        b=Yada3ftEE8092Q/Iq3Od7CZNxgDKFJnhOarNP27TG1WVDy8KOdU8r2+jts0mtjT85D
         i4XhuAD7EBj/6w8DtUBahPLCgjSPVbs9YKyPQv+LdLVF9bPNDbvmVOhz3nflUiPPwGqM
         yDl/Xsp65Bi06576qVsZu9OOM6hhlu5dEwzDV4RavFqpsCOr2s886xnmNnID8tv/Cl7Q
         8PgjglWXRu+Ca9BFwKdRe2WMurY3quL4OoRjgbNwchfH6Uohp+0RiGtLjhDyDV30jB0A
         wlMuagEd48v1UhhFnfbO6OSWJ0dOUY3xF+l2/xKEMiScMqvlfUVsMnGmqqC0rTkjlq4S
         cYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XrGRKIT36erQNGi90+/pLC99u3bWc1O21GG8hCOkNRE=;
        b=jGtVneotiQ5XPOU7MS9JXWcufJQnR5pOu9NbtC2Sw+eFd6bIrUOh+Q5N+sBVBElh8v
         WXi2FWnV4+28iO3LpwACBQjRVkIePKYy7rGxay7qMFH4vU9yU6EbzyW+Tgd/tnmajRO6
         qI/JITLP77zpC3VRXRQe6oMCRiNfuUvUAarqLHlRwyfiFKPyA5L2vZczh39XvyV1Akbn
         q1PmFFfl8Ubg8853Ig4uDpQGyRDf2fsij46AtrlVPK7qlB1pDi+/frxHKN9Xl0VRyvT9
         KljiPFBGKRKE323FQnoD33SnOg1XYQBiyfHfBA3aJTSOzbaBg+rXmis+ypHDD/dKah3M
         B45A==
X-Gm-Message-State: ANhLgQ04cokA3gPxlqTQWuDqghK0PP3jhhaI+FQcptcE2O8a0fDze9tF
        twF6YhDBeJux28oZNPnPEIA=
X-Google-Smtp-Source: ADFU+vtKX71Iaq0ZvODPt8uubjEReGxoUwFjE6wgsU7zyGOLz4NnXKO+RjMXHD0yGlA1A8JZDboy2w==
X-Received: by 2002:a5d:522f:: with SMTP id i15mr17949131wra.231.1583859985628;
        Tue, 10 Mar 2020 10:06:25 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id d18sm4073319wrq.22.2020.03.10.10.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 10:06:24 -0700 (PDT)
Date:   Tue, 10 Mar 2020 18:06:23 +0100
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
Message-ID: <20200310170623.GB3079591@ulmo>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-3-thierry.reding@gmail.com>
 <8e1f11e9-a95a-500f-ff44-6f44ad990863@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Content-Disposition: inline
In-Reply-To: <8e1f11e9-a95a-500f-ff44-6f44ad990863@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 07:13:25PM +0300, Dmitry Osipenko wrote:
> 10.03.2020 18:19, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Joseph Lo <josephl@nvidia.com>
> >=20
> > Export functions to allow accessing the CAR register required by EMC
> > clock scaling. These functions will be used to access the CAR register
> > as part of the scaling sequence.
> >=20
> > Signed-off-by: Joseph Lo <josephl@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v5:
> > - remove tegra210_clk_emc_update_setting() which is no longer needed
> >=20
> ...
> > +EXPORT_SYMBOL_GPL(tegra210_clk_emc_update_setting);
> ...
> > +extern void tegra210_clk_emc_dll_enable(bool flag);
> > +extern void tegra210_clk_emc_dll_update_setting(u32 emc_dll_src_value);
> > +extern void tegra210_clk_emc_update_setting(u32 emc_src_value);
>=20
> Why these exports are needed given that the EMC driver is built-in?

Let me try if I can make the driver tristate. Given that it's fairly
large it may be better to keep that as an option.

Thierry

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5nyQ8ACgkQ3SOs138+
s6FOXhAAocJcbbDxFJK3TvLJTTuZlywjEwIb3UcWO1BERHW2K7hEx8rNt2UqhoGu
EoqVqjO7HnXaOT++1BbSFSRP3ye4ErmWyQcSRKSObSl20m+lGvWgvv1Chk8jCJha
uJ47NctrQMiBD0lb/Ip7vup/4Qqi6WjJpLNfvct92NFTGty6TuwFAV39r4L874wd
yEryO/AwteBrAClEMLH8SS+bZwHSWy5jCHuirgGxe0ck29Hx5kBUb4HAmiMQxJH3
v0dNrkzAXl+dd98s93uI7ocOWtiKjQWJiQJ8mSDVLnmClkiPjFnRDvgu3TkbAQEh
BLAgRFgmaCTmKvdD8LBlA88W0DVP3J5bx6iQKMOrYvJ95PmntiDtURq4rmXRXl/v
BX7KUlkV3eXTLkukY2r/z4uHOhOCdo1LD6/12jzezVLSA32Uw6QXeyuDa2Cg7Hc6
C99avAx0XUVVjGr++9yY1Rn3jpLEvBsAWk6tjNNXn2a/5+l5ygCjvDfZeOKl//j8
6Mcsw4ML1Lj/CV52+YM2rtAwXr3hRCpwGHPEN9K5i+mozudHb4TOV3Yt3KTEGUW/
3rdlIPacpzyQmM8+xUp2E4oF4PqGqgp2wllYb8NNC7MFXDzp1JwXUvCAVabOnaw3
xqcijH1JXc4rsCeUVNMD4rE/PQkrq0mFfPMd8Jv4I9RqY4FkZPI=
=x6Nz
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--
