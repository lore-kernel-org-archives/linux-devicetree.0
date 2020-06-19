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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9945EC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 06:47:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7559320707
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 06:47:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e27f0Mv5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbgFSGr1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 19 Jun 2020 02:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbgFSGr0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 19 Jun 2020 02:47:26 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 387A9C06174E;
        Thu, 18 Jun 2020 23:47:26 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id q19so9005398eja.7;
        Thu, 18 Jun 2020 23:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aYh3QJBGDceAWewT21svvooU12QuB26cFY9/+JujTaQ=;
        b=e27f0Mv5BG4dBbv+Zt2o7Gwe3pEbk052UhkplSASDtJlzkahk+DmnGoLwfqd9wXiQ5
         TVU/mISvPdhFtNj1SYkqrozx9EFMHCsYG7TXHHyZuZUyWfrtqPR3i7BTz8vnoHiFcgw6
         hTj1g1PiT04Smw9XSkY88f7qa444+Rmr5XQyNXj241fWI7yxwNcHs5XRgRfEaxlDb6M9
         4iX+XtGvp4jAlq0FCf3CViuhWgAue0cpt7ZoSRf1oCknmJfdHGabCdqdRQc3xkrYzL3D
         lfm8trkrX1SPnuK1pEAbBvdnrq6EeT9xHWR0fHv+Pb68zd2z0vg/NBp7UlrizMxSexxd
         9OlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aYh3QJBGDceAWewT21svvooU12QuB26cFY9/+JujTaQ=;
        b=m/DRNm46fa8X3hh/TBMUdCCpmnCVzFU+dM9t+at3lE49LH2LpjOBK8b8RtT4SpKQcE
         uHKszpYsyryQviOdONluyuSt+dp5ARHAu5eBE9233d2YiD6XCLo11e1hsZLeW6Fs02K2
         bxinveKIIimIIuAxBycGQ1kTXh4DbA9YiPxlYLObbb1QHyoLORf7EBWgV99nJdVrfCkg
         prbjAoHvRYTr9q0f8UUSt80R0ZqwCCTILzHdjhgK+eRe1e9t+xuk2wgVBaboIV2zp6DV
         aw+cTzwk1SOL4W0+8KeSi2K6ocR7enYm31XWJMZgw+Oow9CPLRBs3IIdc/plgshTY7Z8
         iEpw==
X-Gm-Message-State: AOAM532uyeSY+m1dUciq0Rmq3euicRzNbkwdeRoXVH5N1x2EY/icWV06
        WGokb1h49RtxpGghejd8DZ8=
X-Google-Smtp-Source: ABdhPJxFJ6hkmNFXg+E/0RqgU9ExPduxi4aaCH3kOnJ6/kzYDOU5XM1JFpJ+B5o+8YqWBUxkWkyrwQ==
X-Received: by 2002:a17:906:e4b:: with SMTP id q11mr2224081eji.302.1592549244989;
        Thu, 18 Jun 2020 23:47:24 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id ck11sm4092237ejb.41.2020.06.18.23.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 23:47:23 -0700 (PDT)
Date:   Fri, 19 Jun 2020 08:47:21 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 28/38] dt-bindings: phy: tegra-xusb: Convert to
 json-schema
Message-ID: <20200619064721.GC3704347@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-29-thierry.reding@gmail.com>
 <20200618023826.GB3343853@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UPT3ojh+0CqEDtpF"
Content-Disposition: inline
In-Reply-To: <20200618023826.GB3343853@bogus>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--UPT3ojh+0CqEDtpF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 08:38:26PM -0600, Rob Herring wrote:
> On Fri, Jun 12, 2020 at 04:18:53PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Convert the Tegra XUSB pad controller bindings from free-form text
> > format to json-schema.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../phy/nvidia,tegra124-xusb-padctl.txt       |  778 -----
> >  .../phy/nvidia,tegra124-xusb-padctl.yaml      | 2800 +++++++++++++++++
> >  2 files changed, 2800 insertions(+), 778 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra1=
24-xusb-padctl.txt
> >  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra1=
24-xusb-padctl.yaml
>=20
> This one I definitely think should be split up into multiple schema=20
> files. There's very little shared.

Okay, I think I can do that. It's going to be a little annoying because
then there's going to be at least four bindings to check, but I don't
think it'll be all that bad. Once the bindings are merged I think I'll
end up mostly running dtbs_check anyway, in which case the number of
files doesn't really matter.

Thierry

--UPT3ojh+0CqEDtpF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7sX3kACgkQ3SOs138+
s6Egew/9EzD8qcEWgHXg7fK3vbgWMrGJF0FD7ME0KjVm246lue0ANPyN/msSik3s
5Go0h5B1Ett33kf7SVCOU5qGzn7rbNu96Mws1W6dC/pSYOxZF2ngapcOwwHmpeTa
qx9QZLwRHSFOb2JwRkrdEJ2aPBJ8LiBwM/N0gfB9FqTfRDKWbhxyB8bj4hp3VXlL
Etru8tiNZuNT7MyakGP4eaKpMW/+gQfO/CPON7VCyYSn+BXPMlifPbZqr+47Ycve
zktBi3NLQv8MjmTdE2FO9b7rpL+n+vuEifHDMMncoMsn3arNz5u7tYB0TdgBAKST
w9hbQvUyeZJYVax6w9VRQOSU/xBOGTHTjZyL11ie8DylOHfPAQJJm59l50Klq+iq
JO6xksk0X3Lyh1DHV4yM4amyEQYq7zv3vUkiWfdWlb1uaj/DqRZwTPgug2iMxr1w
qRySdQHZvoqh+Dugo9a9NQCOgXXvjQ1gl+LDx1cA463gs8kZ/iN5ZTPQuh2HlW8k
VJsF6E8rVnzxCZKV0YEqSortSIPq+7eVLB3RuhKvO/FgklhFyYpwTGg9dDSrbUhw
im0YWx5lVNjf49LqacvD5wZ+lwO5eREyFwrDK/EWfvSuX8I8UVWmCHZDZcaYzlTe
ad7J6gC8W3mZWj8HudXnhlKpH9pMGXuDVu/akaowuIF0VCpYng4=
=iqzA
-----END PGP SIGNATURE-----

--UPT3ojh+0CqEDtpF--
