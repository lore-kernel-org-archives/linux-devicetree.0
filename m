Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80424C352BE
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 15:40:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5FFEA20678
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 15:40:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSs78mzV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440641AbgDNPj7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 11:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2440636AbgDNPjx (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 11:39:53 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA616C061A0C;
        Tue, 14 Apr 2020 08:39:52 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id a201so14141889wme.1;
        Tue, 14 Apr 2020 08:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=U8GTwHnMm7fOWiSJPOBSV6m2y2+1A4gg/neQHtMHeu4=;
        b=gSs78mzVUPzzb0Vtyt4Lc1QixoWe7H7cf6B6egjWdVtHb9B5L6NVmzrZUx9t7dQODf
         G3pnNRIkj73wSgRSASKAOjVj3VmsRNMftpE/15acQ6ThjmXwFcdpr8l52NAUxS9Xy0DX
         a1QBBW5FV+oPu87GsBA6+e4EqYf06QE7qk/mVvM7O4uox1MJqh2jtGye7KQxgFhEidzW
         qr5hAxjM8ekqexWSqATS4QqfcNot12W2p2P4RopdGtg6taxyDROuXe0QYS1Dmrx0tn6b
         7cFTDr8bkjCs/a7bR5D8Drfwl6HpJ6GjdwVogV5LtVeV5LU9yXArXZiK9MpiGzegagS8
         e2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=U8GTwHnMm7fOWiSJPOBSV6m2y2+1A4gg/neQHtMHeu4=;
        b=RVEKvIAF4ctdfQ73OVJowPk4rZCXvVFx1bLJevlhsbDUa0ixaesWeMRcvWs/g1QieJ
         Rii81HoBj00d7SNLQxzLl7Bj6RHzVOMnUPyXLybWXBXARy+SPETxxumDg7aPF9FImuSv
         9++cNRZVjdHv7GqHLU1sC2tUR622Yi0XI7FMNThdogMIE6ExD6Ulg3ytLYp4Qe+9Ja/8
         7O7IQg0D6MBAU1nmqt+bS8krpSD/nLedylkzsflt5Gcg91HHIPglv+jvPUt9qcdecWDe
         AQDPGd5lBuBynz9hFMmRw2PFfWpLJHEGQtebWP1H/9aRM8i0gEeiDbLnz+3Gi57wzuQL
         WsPg==
X-Gm-Message-State: AGi0PuZrr6bNqKuauPZ0ILiixMRyC3wqRkVLAafWJwFVm/CUO7KpiCz9
        PQ4lVNO6rCUZH66051yuXFg=
X-Google-Smtp-Source: APiQypK/HbILUE64zYGJ4iCNavoetIFjifDKWsRL8QZtl/ZK/muMlXMnhBuOMRFkXujuT8XNkoTovQ==
X-Received: by 2002:a7b:c642:: with SMTP id q2mr466521wmk.41.1586878791725;
        Tue, 14 Apr 2020 08:39:51 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id t67sm20474257wmg.40.2020.04.14.08.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 08:39:50 -0700 (PDT)
Date:   Tue, 14 Apr 2020 17:39:49 +0200
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
Message-ID: <20200414153846.GN3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
 <14cfd13a-5fde-f167-64cb-a61cba119a97@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0fZkDq/H4AmqaB8D"
Content-Disposition: inline
In-Reply-To: <14cfd13a-5fde-f167-64cb-a61cba119a97@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--0fZkDq/H4AmqaB8D
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 05:26:23PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > +static int tegra210_emc_table_device_init(struct reserved_mem *rmem,
> > +					  struct device *dev)
> > +{
> > +	struct tegra210_emc *emc =3D dev_get_drvdata(dev);
> > +	unsigned int i;
> > +	void *table;
> > +
> > +	table =3D memremap(rmem->base, rmem->size, MEMREMAP_WB);
> > +	if (!table) {
> > +		dev_err(dev, "failed to map EMC table\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	emc->timings =3D (struct tegra210_emc_timing *)table;
>=20
> No need to cast the void.

Indeed, looks like I can get rid of that table variable altogether.

Thierry

--0fZkDq/H4AmqaB8D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6V2UUACgkQ3SOs138+
s6GmYg//WAKvtCE2533jvRwm9viWE7gIwO4+5Qc+gBHrtYeZc/s1jQZHipianYQu
9kbwBh6XO6UgeyzaaK7f3qQQrgjyy3zqy8dyINW6FgQBBJndPDTzN45cZ3rjVpoZ
FMnnJotiX/1tl+YBkMbr84hh1ZYDucuH/BktLynsv/nowYs/0gAMExQs/wShOWz6
E7+D4uddL567mbQLN/ssHJb5HysMLNwAIMg2IeFa+kUXq9gC/x3PbstpRCeY9L7r
/gCwTnWGRscH9JT6Cyw1qoSr00CX5jZSXP2A4dY81YsGyfmNqJsrkd+X+oemqV27
oBTJFFZvTY2ShEP8AXKyP91BUzSsECpY7iPYM0ji7a1l4avpFBJCrKOHkhHZukUZ
+VAWpr2XnQgeJtHMz6dAfFJQyPw+KPEhdRFMgqcZYUzYFiVe0b3W4D1WIkl50oJL
rFLUGhnjgpGhnNezkWwHN1NYbgf+GsCe2gkk99IKLHAnfj/ds2sUNOZD7qIVrTAm
6Otq32sdI3T2T0BeRkY/ysF5ChkASMGjmD6xkDGFrk9Ddz94WNPa+wwrCiUnrr4e
Ceu/4HxF8ncU63g+f7N35dpfdZZpb/qWwrfFkDtEZ48tVf4fkKBs8YKyzuPliGIM
dAt7FZL3/mTm3l263IjkJuYarBBB+Ggs/hR4NB/ulB0oleeCD1A=
=MoN0
-----END PGP SIGNATURE-----

--0fZkDq/H4AmqaB8D--
