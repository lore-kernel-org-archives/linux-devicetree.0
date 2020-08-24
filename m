Return-Path: <SRS0=8UcW=CC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CE1C433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 19:49:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F127120706
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 19:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598298557;
	bh=mwscSKU6PEXC91lvhthJtvDN6yZmk6pyRkDdDWHNMjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=r8AYDwWlPtMG6dGN0mjDdy1yuakK2s68cjIr1YPUAEm2XWU4qn48ESsRDpyTR7xFa
	 1lcr5VB4BSSKVR7R5A8aoW8w5EQgAbSd8xhqpQOi4zFXoqLQLfsVDbOcNUT/qxoTgw
	 lAqRSHn1/x1Hl7P50WxBgjBXfObx8diuBRCCVoSI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgHXTtQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Aug 2020 15:49:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:51872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725963AbgHXTtP (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 24 Aug 2020 15:49:15 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 342F520706;
        Mon, 24 Aug 2020 19:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598298554;
        bh=mwscSKU6PEXC91lvhthJtvDN6yZmk6pyRkDdDWHNMjE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=unHmRmq5SzE2wUxKaRZVNXlbJunyWBVrwYm8Sosw6nG18Exlno4oGHKWx1QLCg1lN
         2WItwmNJaNTUoFLUJ6i3d5bctlz01NLYcjdTYJrtOEjGJhewcNBfajxu3y/E4wq0Ne
         zb+8EhZqZu85SzjqP+4/e6MXt1b/OtsHBPg2f0Uc=
Date:   Mon, 24 Aug 2020 20:48:40 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>, robh+dt@kernel.org,
        lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Gene Chen <gene_chen@richtek.com>
Subject: Re: [PATCH v3 2/2] regulator: mt6360: Add DT binding documentation
Message-ID: <20200824194840.GF4676@sirena.org.uk>
References: <1597910022-22617-1-git-send-email-gene.chen.richtek@gmail.com>
 <1597910022-22617-3-git-send-email-gene.chen.richtek@gmail.com>
 <20200820113015.GB5854@sirena.org.uk>
 <CAE+NS36C0AwbrFJdYGY6_n_g3DVitp_e1GfZUxjMbKu1bJ_t4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2FkSFaIQeDFoAt0B"
Content-Disposition: inline
In-Reply-To: <CAE+NS36C0AwbrFJdYGY6_n_g3DVitp_e1GfZUxjMbKu1bJ_t4w@mail.gmail.com>
X-Cookie: Weekend, where are you?
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--2FkSFaIQeDFoAt0B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 24, 2020 at 03:21:57PM +0800, Gene Chen wrote:
> > On Thu, Aug 20, 2020 at 03:53:42PM +0800, Gene Chen wrote:

> > > +  LDO_VIN3-supply:
> > > +    description: Input supply phandle(s) for LDO3

> > Only LDO3 needs a supply?

> LDO_VIN1/LDO_VIN2 is real MT6360 pin supply from VSYS to LDO1/2/3/5
> LDO_VIN3 is also real pin supply from BUCK2 to LDO6/7

So shouldn't there be a documented LDO_VIN1/2 then?

--2FkSFaIQeDFoAt0B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9EGZcACgkQJNaLcl1U
h9C+yQf+L9lKWcQ3xqYmQlPlgMYNCT+yaAkHdHpJM6dVTHnNOqyv/z73C/e/NU6N
JtvI9bR0aFytdFSRmSsfEhHmd0k2XzKAqqT66jzCLZTpT0BGtDxhQ+DLjaACr6Hm
n3wwxVJQx0ZpQd5zUijzCfHbStmLmPf8qHfiedPGYsdNZx2T76kAG4p9kDh3/sz0
tCW2DuMt2YGEbk8NGvCsZop7n7fCNQA6Ap1mdlJY7pa60ARNFxvLJHqYEDHZiLgB
cjbeVNOwKcT8ujUGvm2cRKL92qYi5b7xDHRGKqNgM0kJ3QWvzBgGDxNGak5IicVo
OGjqBFp7aLfwRU1KePiVK2qoXdKzxA==
=0Aah
-----END PGP SIGNATURE-----

--2FkSFaIQeDFoAt0B--
