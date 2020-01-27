Return-Path: <SRS0=m/6z=3Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6988C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 12:21:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 72CF9214AF
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 12:21:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Etag/tQW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730568AbgA0MVV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 07:21:21 -0500
Received: from mail-wm1-f41.google.com ([209.85.128.41]:36143 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730392AbgA0MVV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 07:21:21 -0500
Received: by mail-wm1-f41.google.com with SMTP id p17so6825273wma.1;
        Mon, 27 Jan 2020 04:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jfdmZBVSX19FEw5yOEkD12e0Hmklt63OBqY1Uq1ogjM=;
        b=Etag/tQWSZzjwp7fErrnD47npD+xrFY7eRvMGXjgmRcpA5GJ+SAKJg5zrQZpDzsq6z
         lnodclySYNJKWWHmzpWPnwhBOJUfCMZNpMfSqNu6ieg03jQQgJ/xdp6rNb/joJNezWIe
         a/32S/Hod/rQZ1/FxVK8t5bcyIXr+1TndFmIvYQYQjkyrHRkuG5H4D2LyNr8qMqHVIxo
         DaghnUQ7Md+yHyiiquj/UZ9nKyHfvIrJPK+MSpkr55zZ3ixEEaPPEiJ54zsnlgXarrw4
         RUy0ZDa3ayfyw+Ru7aLDMbKNL22hLIqwAftW2RAPW55R4ydLBMK0QV8sPwXZJNsAgkNi
         gf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jfdmZBVSX19FEw5yOEkD12e0Hmklt63OBqY1Uq1ogjM=;
        b=QVOpfMFgCwkapFHMUFUmz3yao1IpNxCist/vaPGRIWx8powg347q22e76cA8t8F3nN
         j20Cd00lQMrWlVszexA6ckPS9MaS7+p2wfKDV8X78Khu8Pt0VR1pp3X3m6dh601tzvVM
         tZHRTWvckAUlLxJ3Vz+uevGb1JZuDAoSqus6INgfWPNbl2NkGel5t1MuIpUAY4SirKk2
         Ox8lYlQIbeQ/QQcoYSuPdItKrb7EBJ9rchJMwH3LPpplJLf2ny1RGu9sVq4OMsXGGp4L
         q7ETQXOcxjnFZrAmEXTutbJVM47h5GPNhcpsdcFLcDYbqD44MeSo45vyrhDlEjxAfifw
         nBUw==
X-Gm-Message-State: APjAAAWJIvxC6bjfBJVUrFP62DjZ8Jnac+tCFz2rEHJW7V4OyMkguayq
        SuzUkXUmvbV3bD+5gSxz3iWK64Er
X-Google-Smtp-Source: APXvYqyiM/PxVXRFr0gtTSlefJaemdd7mmRPyWmc0/TExQwi1WuKYndfyX0meYAG8OLuUUKzVeLsnw==
X-Received: by 2002:a05:600c:cd:: with SMTP id u13mr13241426wmm.24.1580127678588;
        Mon, 27 Jan 2020 04:21:18 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id f1sm18118801wmc.45.2020.01.27.04.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 04:21:17 -0800 (PST)
Date:   Mon, 27 Jan 2020 13:21:15 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
Message-ID: <20200127122115.GA2117209@ulmo>
References: <20200114181519.3402385-1-thierry.reding@gmail.com>
 <20200114181519.3402385-2-thierry.reding@gmail.com>
 <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
 <20200120150605.GA712203@ulmo>
 <57c37b3c-1473-d444-db59-8c6650241188@gmail.com>
 <20200121141027.GE899558@ulmo>
 <83d94918-bc01-131b-924c-9750767d3b29@linaro.org>
 <20200121155432.GA912205@ulmo>
 <ffc22502-0e7e-522c-543d-0e74cc25f4b1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline
In-Reply-To: <ffc22502-0e7e-522c-543d-0e74cc25f4b1@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2020 at 11:12:11PM +0300, Dmitry Osipenko wrote:
> 21.01.2020 18:54, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Jan 21, 2020 at 05:18:43PM +0200, Georgi Djakov wrote:
> >> On 1/21/20 16:10, Thierry Reding wrote:
[...]
> >>> I'm not sure if that TEGRA_ICC_EMEM makes a lot of sense. It's always
> >>> going to be the same and it's arbitrarily defined, so it's effectively
> >>> useless. But other than that it looks good.
> >>
> >> Well, in most cases the target would be the EMEM, so that's fine. I ha=
ve seen
> >> that other vendors that may have an additional internal memory, especi=
ally
> >> dedicated to some DSPs and in such cases the bandwidth needs are diffe=
rent for
> >> the two paths (to internal memory and DDR).
> >=20
> > Most chips have a small internal memory that can be used, though it
> > seldomly is. However, in that case I would expect the target to be a
> > completely different device, so it'd look more like this:
> >=20
> > 	interconnects =3D <&mc TEGRA186_MEMORY_CLIENT_BPMPR &iram>,
> > 			...;
> >=20
> > I don't think EMEM has any "downstream" other than external memory.
>=20
> The node ID should be mandatory in terms of interconnect, even if it's a
> single node. EMC (provider) !=3D EMEM (endpoint).

I don't understand why. An ID only makes sense if you've got multiple
endpoints. For example, a regulator is a provider with a single endpoint
so we don't specify an ID.

By its very definition an ID is used to identify something and we use it
with a phandle to create a unique pair that identifies a resource within
whatever the phandle represents, with the goal to differentiate it from
other resources within the same provider. However, if there's only one
such resource, the ID becomes redundant because the phandle without an
ID is already unique and there's no need to differentiate with an extra
ID.

Thierry

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4u1bYACgkQ3SOs138+
s6Gc9Q/xAbTzlbVUZDwoUkdCgx0LHuENIKE8SYi31wA3sfDcgTLs0sSih/Esx8cQ
FsHqpY2r+loug6SkIWG0nlZOiXEUmms/Em5r0oahW9lLMcP+Y5OpzJN4BTPZHoOM
uEHXdbJRs+NDdM6AUNpXbamcdvMST1DXpigjCkxTfFmGQQzrDrugSQvGpRtaO/WE
yYxxrxnzfUFhv8FVDtXlxS0KI5yb2TJmdI80abFfKV/sshPFH9tIeEDIwdKDRbUx
GuOYXFKBrK8S3A0PxJwlUJQa3yxc4700nnMdK4vUDNKtSTCfs2UB2vktYkJ+QpsR
24lKzwqeBG+XLJMAm6cOzmrSyiX72Iuw73qth8orFuZXeBWqQixN/fdTFoMXv9AY
dNo+190g0DXIGIrMayljP7R7oBI3NlnKYbc80DwjzdSf10KaXFjgYr1FONy84j7Y
hKLeN7NuDK+LliNBa/W6/s7YApcQf99RnuzaG3sBrIdDrQuvA/ldk8giCD71qO4+
ypE1ZyI6ec0a7Az0Xgsj/oW/HApiPcUs3f/rlv6cSTxb4+KtFvUmrkf6jaopmOxY
mL556GqiwB7h434VdAt7tLQdDflmDno8wIzxljL1slPllsjyhpQo1kyXZsrG6mMc
elQn4W7wy1O9AG6iIiCiXnnAyYEiNbDqaHaJTGFRjCFWrz3mXA==
=MdJR
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
