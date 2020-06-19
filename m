Return-Path: <SRS0=bA0P=AA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A20E8C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 06:45:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B7152080C
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 06:45:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+i/3gXS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbgFSGpz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 19 Jun 2020 02:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbgFSGpw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 19 Jun 2020 02:45:52 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26732C06174E;
        Thu, 18 Jun 2020 23:45:52 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id f7so8999823ejq.6;
        Thu, 18 Jun 2020 23:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AEDd6hxbLbIBkD6d8B+e/wTQavBsFlwRrIYg3M0sa6I=;
        b=V+i/3gXSzTHb0HDLDeAxUJys8lXcNwm3nsiJEMPouuljyv876n/pArPh/CjdnuS4D/
         YIxQSky94uO6iD53jqMO1vqARQGR8EvqFU5Vgf4sOOPi2C1Bxsz+fSXfqnL4U0n9SYlK
         sKM4cvlIzeezf34Zd3u8q/Qs1yMb8M9gcuEQBe1Q9dsgd2IlCJtWBgoPLpEvHzMWklDN
         BZaJI8YjtLckW6Tk7Iw1SQtuo6vvoDBDr0pnMGFu9r905kDmwvunWKkONToZ75jzL3MV
         lqEEOn0gz6ML67iqlYfOLtdRrRqkJrSJXpGsNPxRVPkma14F0Ku1ru5zKgCOOxdc4Aq4
         F15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AEDd6hxbLbIBkD6d8B+e/wTQavBsFlwRrIYg3M0sa6I=;
        b=NmAoeWjI/3mAajnzJI9EK+3ntS/foQQmyTMfxPegvrGsIe4lIwYaQoi/SeDZ2+pHFl
         f5bXUj0Ozu4TIn9W/52CEKkLznjdoPc3yBRKx5JEvrvpdf7l5026v+TJQ2ogVOGeUk1a
         48PGJsvkjdOdHBMQgCP6Bcr6Qd8wKS7Elvok29cqWGk9BijLPwL0RHS1Y8HFm5GiypLw
         9yHXdf0poIG32VnsVYiZRuSrVc3bmbCe3XmznwdqARP2Hr0zijkl0ez4Z6Uum8QT2Zuw
         +8i6YgSueRB5E4Xb7M7NH7FSLoDFocFAE/bqZnK2MC5AO3H7wxHHmshwyuKSF2MZ6Fs7
         Hp9Q==
X-Gm-Message-State: AOAM531l6klkNWGtg6SyGBSIXKTf3BcwbLNaViYLhoSdbrZhGPyMzDoz
        brdttjWpRaOT7HZnPkNlgoVWqdVO
X-Google-Smtp-Source: ABdhPJyfB2ZTCQwmqjB4sOChObRXViuNjxdAcxapInEo0FKgva+KAs/lmhSCN72uPVsLQAynWE7G8g==
X-Received: by 2002:a17:906:4b50:: with SMTP id j16mr2364772ejv.415.1592549150942;
        Thu, 18 Jun 2020 23:45:50 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id n25sm3971417edo.56.2020.06.18.23.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 23:45:49 -0700 (PDT)
Date:   Fri, 19 Jun 2020 08:45:48 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 26/38] dt-bindings: pci: iommu: Convert to json-schema
Message-ID: <20200619064548.GB3704347@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-27-thierry.reding@gmail.com>
 <20200618023457.GA3343853@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8P1HSweYDcXXzwPJ"
Content-Disposition: inline
In-Reply-To: <20200618023457.GA3343853@bogus>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 08:34:57PM -0600, Rob Herring wrote:
> On Fri, Jun 12, 2020 at 04:18:51PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Convert the PCI IOMMU device tree bindings from free-form text format to
> > json-schema.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../devicetree/bindings/pci/pci-iommu.txt     | 171 ------------------
> >  .../devicetree/bindings/pci/pci-iommu.yaml    | 168 +++++++++++++++++
> >  2 files changed, 168 insertions(+), 171 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/pci/pci-iommu.txt
> >  create mode 100644 Documentation/devicetree/bindings/pci/pci-iommu.yaml
>=20
> This needs to come before you use it.

Good point, I'll reorder it.

Thierry

--8P1HSweYDcXXzwPJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7sXxwACgkQ3SOs138+
s6E2QhAAhmMVuu7UBgGoT0iLKZpZr7XBF43fJFTpH8OD9A9cHbiHatTNkoLvaXxy
U+TNMBNF1lWTH/939YvPEaVv4uH7Y7YspcUnTqaSDGGMJgySh9+3uPAauXsZUUow
Xcelnw41elrHbj+kEJTocUjT4WjvcO2YlHHsMX29nVYzi2FylR7BqJa90zbleJaV
K3bQge5K0Q7Xgjnn8dEUwHlo6wlYRwBAQmLx3bVmXwKp9nVIz8LXPIJSTMz4HlmQ
87kpEKDt5GCVjhRbcFlDZ0aZhKtim7t+xPGC9CqqS7R+chXvu6IsCIPNr6GJOcFk
dPHfwq3ftGQTytp/fLW+eN85ooKrEVqoQ9bSJqD+L5IPIYumnItYmOTImt90Yrm2
eE6MIpL1hgZeYOz/QlTAxCl/bbjY+tFX/RN3sN4cJZivKBaD8FveH5TPMP7CdzEW
K6gx/yoRmw4PYw1+L1VLIjJFqI97IZwD+jYiJXhUOMcWVt55jtppT/agalacI8+Y
E7+upZwgooxkedU2yKNj0g6gFMqT41UhY3VgptgSHNpGX8BZuJO4QzjAZxU7+SvX
6kdnrSiLyuDz+BY1COVjWji3hjYhCYgJ1jeq1HY6UiVLsCk7cKMt5J6Y/oYfyN49
OkoryNOt/kaQKPpLvF++n2H4EsPMMX/xNhiw6vSQ9aeny7doZzw=
=3bjo
-----END PGP SIGNATURE-----

--8P1HSweYDcXXzwPJ--
