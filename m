Return-Path: <SRS0=+O1R=4O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53AB6C4BA13
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 16:57:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2ACCC2468C
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 16:57:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSj8QK91"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727647AbgBZQ5v (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 26 Feb 2020 11:57:51 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40564 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbgBZQ5v (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 26 Feb 2020 11:57:51 -0500
Received: by mail-wr1-f68.google.com with SMTP id r17so1841098wrj.7;
        Wed, 26 Feb 2020 08:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LTnKsoB4AHL0Snl7rS1+dxo+f9zUGTx20/bjCtbZfUk=;
        b=jSj8QK91Bei3ZtBRSgP4/M6DmJg58SFTDJVi+oWjJXWyUlc5PdKVwDjpzJc+GsAUsl
         s1VyRMNUgwK4V8TwQY58z+xHiSgYufvbUSaeypVa59Uwe+2V9cjPWog4c6tl88dz7IgO
         /rDhKI8l6YJugDDiNnHpDDCFYz5PKS/MTM/cginoQYKfuVuvzagbhe5ZzAyP2LyMBlnv
         fedkAuixsBtj902DvH35CarLsdXtNv7W8EDOTSus+8gW7auqLfWsJclci9iVhD3qU6VV
         vuDj3eKdgJvwOZGsI/NYGqtwbLYeVqY0SfB+aSKpMDWhLi3hlF2uuB7F6u0LwJTF3dq/
         kdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LTnKsoB4AHL0Snl7rS1+dxo+f9zUGTx20/bjCtbZfUk=;
        b=fUZ1B59KovS+kz7au1H5iaz7s4iWU8ypU8h8eP8Q8xhF8qdqGVfsLHRbWLCjRJgJxr
         eBR73sxgrgAoR88T2QGDXdabBeuhZcADWUeB3dps5T4mdDrcDALs8tNKZIymIQ3fpykx
         rNFfibRBGW6TzPoasfy7+ckUTb0Kp3mWZeC27h+5aVqhQbmtx0OudL7s2lRYPc4O/X2f
         iyHM8ir6obKkdJpibCW+9kr5aY0w3dorOrFVYeRkImeA9d+R8rAEA5kwxKAoc4ZbcVnT
         HplGUn5R8nHkzN+I1KYx0Nlsk/2p5mcS6HEbWFfRkW8RpqPPkplWtDePyh0DuBfPSZCX
         faoQ==
X-Gm-Message-State: APjAAAVIGOMjjDL6M4RWunQMn0iU/VvUoUGL2dbt1r1zBIp48xQPNvZ7
        B6PhmOtKvGS/Vgbzaw99A9k=
X-Google-Smtp-Source: APXvYqxjn0zIyssHpKxJ/ktrsS1gyu41mZpxUcjjEzpuIwUXcZtYIMToPnprQ4nt5hXpLsBAHHBEww==
X-Received: by 2002:a5d:4b91:: with SMTP id b17mr6363630wrt.325.1582736269484;
        Wed, 26 Feb 2020 08:57:49 -0800 (PST)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id d4sm4082431wra.14.2020.02.26.08.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 08:57:48 -0800 (PST)
Date:   Wed, 26 Feb 2020 17:57:46 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joseph Lo <josephl@nvidia.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V4 4/8] memory: tegra: Add Tegra210 EMC clock driver
Message-ID: <20200226165746.GA818759@ulmo>
References: <20190529082139.5581-1-josephl@nvidia.com>
 <20190529082139.5581-5-josephl@nvidia.com>
 <403181d4-100b-679e-b1d8-c052c6d1f3ac@gmail.com>
 <2f9722b4-df92-546b-9659-3b02768bbe41@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <2f9722b4-df92-546b-9659-3b02768bbe41@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2019 at 10:45:01AM +0800, Joseph Lo wrote:
> On 5/29/19 9:26 PM, Dmitry Osipenko wrote:
> > 29.05.2019 11:21, Joseph Lo =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > This is the initial patch for Tegra210 EMC clock driver, which doesn't
> > > include the support code and detail sequence for clock scaling yet.
> > >=20
> > > The driver is designed to support LPDDR4 SDRAM. Because of the LPDDR4
> > > devices need to do initial time training before it can be used, the
> > > firmware will help to do that at early boot stage. Then, the trained
> > > table of the rates we support will pass to the kernel via DT. So the
> > > driver can get the trained table for clock scaling support.
> > >=20
> > > For the higher rate support (above 800MHz), the periodic training is
> > > needed for the timing compensation. So basically, two methodologies f=
or
> > > clock scaling are supported, one is following the clock changing
> > > sequence to update the EMC table to EMC registers and another is if t=
he
> > > rate needs periodic training, then we will start a timer to do that
> > > periodically until it scales to the lower rate.
> > >=20
> > > Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
> > >=20
> > > Signed-off-by: Joseph Lo <josephl@nvidia.com>
> > > ---
> > > v4:
> > > - remove the statistic data in debugfs
> > > - add tegra210_clk_register_emc API to make it compatible with the ca=
se
> > >    if the kernel still uses the older DTB which doesn't have EMC node.
> > >    And the MC and EMC clock can still be registered successfully.
> > > v3:
> > > - address almost all the comments from the previous version
> > > - remove the DT parser of EMC table
> > > - The EMC table is passing as a binary blob now.
> > > ---
> > >   drivers/memory/tegra/Kconfig        |  10 +
> > >   drivers/memory/tegra/Makefile       |   1 +
> > >   drivers/memory/tegra/tegra210-emc.c | 671 +++++++++++++++++++++++++=
+++
> > >   drivers/memory/tegra/tegra210-emc.h | 156 +++++++
> > >   include/soc/tegra/emc.h             |   2 +
> > >   5 files changed, 840 insertions(+)
> > >   create mode 100644 drivers/memory/tegra/tegra210-emc.c
> > >   create mode 100644 drivers/memory/tegra/tegra210-emc.h
> > >=20
> > > diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kcon=
fig
> > > index 4680124ddcab..9d051bcdbee3 100644
> > > --- a/drivers/memory/tegra/Kconfig
> > > +++ b/drivers/memory/tegra/Kconfig
> > > @@ -26,3 +26,13 @@ config TEGRA124_EMC
> > >   	  Tegra124 chips. The EMC controls the external DRAM on the board.
> > >   	  This driver is required to change memory timings / clock rate for
> > >   	  external memory.
> > > +
> > > +config TEGRA210_EMC
> > > +	bool "NVIDIA Tegra210 External Memory Controller driver"
> > > +	default y
> >=20
> > This is not enough since you're leaving possibility to disable
> > compilation of the driver, but the compilation will fail because of the
> > unresolved symbol (tegra210_clk_register_emc).
> >=20
> > > +	depends on TEGRA_MC && ARCH_TEGRA_210_SOC
> > > +	help
> > > +	  This driver is for the External Memory Controller (EMC) found on
> > > +	  Tegra210 chips. The EMC controls the external DRAM on the board.
> > > +	  This driver is required to change memory timings / clock rate for
> > > +	  external memory.
> >=20
> > Either TEGRA210_EMC Kconfig option shall be always force-selected for
> > T210 or you should move all the clk-related code into drivers/clk/tegra=
/.
> >=20
> > Could you please give a rationale for having EMC clock code within the
> > EMC driver?
>=20
> I didn't have a specific reason for that initially, just wanted the clock
> code and EMC driver together for easier maintenance.
>=20
> But considering the fix in v4, that makes it backward compatible with the
> case if the kernel uses the older DT without EMC node, I think it's better
> to move the clock code into the clk folder now.

I looked into this a bit and I don't think this is actually worth it.
The problem is that, as opposed to Tegra124 and earlier, the sequence
for changing the EMC frequency is much more entangled. The bulk of the
programming will be on the EMC side, with the code occasionally calling
into CAR code to set the parent clock and some other flags.

So there's going to be some interdependencies regardless of where the
clock code actually lives. I can try to split this apart, but I don't
have very high hopes that the end result will be any cleaner than the
version here.

Thierry

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5Wo4YACgkQ3SOs138+
s6FCXA//bWBXN7bSyzNc46zqWag8Is1uVhZgTR0H59XJTfsxw4K+6eDOpVcVCmLa
0cSrwEsh+4ggJuXovFA7ISWgbgRMM9eL+tv8gxtWheXtuPco2OzUfLGSe+rE7fCn
/boebHLd+04IRklVz0BkjmwtLVmzbTAMGV1SRc75Wz0eg9AqEoVNMBYEHnyZ3Z+n
po6Spd1ITGZdAZ1H3UA4UhGusFmDGDOLEbQPTSOs2iSRYFr08PJngqv28fsLTNnn
eXm8f97NJedT5LhgQNxA2jZE9Frg6YBO8bgikL0UpCP3hMW8F3lXA0F4Rf8Nt+ZM
sX3H0WXs3iwFcr7KzK2QGWntXKWhUpjNiZtrjgo+wXuzeMxOSgcfgC/DskEuSFHk
IQvKAxM2W2iyh6QfiZhUpDzF1rHY3RggAEWsLpXGqzTizfiXUu1yb1SEQuC7wxmg
lawIhYSMykcVb6+m/TUuN+FxbFSeofft9xA4hMa33OoQ9M3NlljppxsgR1YRijGy
/YdClu/Jibzt+qKmRHtkjWYMe9VvAeLhMpr1W7aadFp5+vSGACVHn+DB9c6SGQoZ
oU9FMiSEnfgwV6rbTO7NegUHWNbnqHDzFk4dl21ZGOYIbgvTA4sUq/R0HxqdNoks
ejGKyBWQ/H7hFdR3IQ6EvvnqWuvQymbHp/Sua9oIDb9s3vTWn3Q=
=BuGo
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
