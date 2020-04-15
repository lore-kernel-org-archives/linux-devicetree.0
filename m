Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6489C2BA19
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 23:35:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A28F32076A
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 23:35:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbs07HG4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729934AbgDOXfn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 19:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbgDOXfi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Apr 2020 19:35:38 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 279FCC061A0C;
        Wed, 15 Apr 2020 16:35:36 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id e26so2257353wmk.5;
        Wed, 15 Apr 2020 16:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3yhHiCLFkHALyeh9n0R+g91ZtL3ZmiOJYx7G3Acd2uE=;
        b=gbs07HG4V/IKn6V8g2AD2wilrTRYsbSeFe271v80vZurPTgdqencH8ctUgGfERhv1t
         qBnPynXX9mLJAfQ8TfIneuxPl9mB4Cvy3KQuiddCPqwz2v6sEUDgs8/0z0Y/2WHxPhAr
         5OcsNAJNh9xx4D+tuSIBF+UC5oxU2OUQx7LjddiaGs2WzxdZKAxoyHRQ7trRu25Ii+mo
         3ksN1xJZrXtUKjTXUvoFORg8kp5rA1MdTexsa5SxRE//IPnXhQcwtkl8pXNizXhDTX9O
         QsrIrbtuq34wy6gEtrYqTQFHLgx36DuppZZnnsZ6q+ejaemRsLypJKUWhNT9zmM4CunD
         1lUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3yhHiCLFkHALyeh9n0R+g91ZtL3ZmiOJYx7G3Acd2uE=;
        b=NUq7zt6mq9DN8OxiKwQwA78tRBIgh9oqsC4CaJeOk2+xl+qR7kqoBU2EQrVJwbJHot
         soeH7rTT6//yM6zmpr24uNEJrW4LnXSwRpfH9h+FKDvaimQ0H31ZWhd5IQMq2WIgqqST
         jd7wUaqlAFWlXeQ3cD2sogh9/BGBN9j8P6AJ0mDgpCgwhiqLNFVjK2XwfTU5ONtl1SSa
         fitQNQhZ6xLyzj3A4j1kdthGlR/yKBhABRo90Rl+MJc08w3kcjNRjkbogPao+FUoBiAX
         DKPerCkouIFgsDH1ocCE9w+H3wDC616wc3OCJbODphISWWAk7z6RiGfz8GqHPBR5N3Tz
         v6eA==
X-Gm-Message-State: AGi0PuaD6p8wGFb7VGd2C0m9XOqc96jz/aCZaCiGnys/AWwam+IHySgZ
        Lwu6Mp2WDkt3Ax8Rc1WI1a0=
X-Google-Smtp-Source: APiQypIiHqj2LxiVZTz3NAfRabiq9kyGk4NLhgDJx+t58Jb/8In6qOQg2YwYZUe6S3Y9vrypStN4nQ==
X-Received: by 2002:a7b:c399:: with SMTP id s25mr1613933wmj.169.1586993734863;
        Wed, 15 Apr 2020 16:35:34 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id h6sm1368044wmf.31.2020.04.15.16.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 16:35:32 -0700 (PDT)
Date:   Thu, 16 Apr 2020 01:35:32 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 02/14] of: reserved-memory: Support lookup of regions
 by name
Message-ID: <20200415233532.GA211822@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-3-thierry.reding@gmail.com>
 <20200415162449.GA1842@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
In-Reply-To: <20200415162449.GA1842@bogus>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 11:24:49AM -0500, Rob Herring wrote:
> On Thu,  9 Apr 2020 19:52:26 +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Add support for looking up memory regions by name. This looks up the
> > given name in the newly introduced memory-region-names property and
> > returns the memory region at the corresponding index in the memory-
> > region(s) property.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/of/of_reserved_mem.c    | 19 +++++++++++++++++++
> >  include/linux/of_reserved_mem.h | 11 +++++++++++
> >  2 files changed, 30 insertions(+)
> >=20
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>

Hi Rob,

thanks for the review. Do you want me to apply this and patch 3/14 to a
stable branch and send to you as a pull request? That way I could use
that same branch to resolve the dependency in the Tegra tree for the
memory controller driver patches.

Thierry

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6XmkEACgkQ3SOs138+
s6Ez0hAAhoJ+N1kIOrfHX3YiD1o4HnSvBdA5fzev2mOBfWSzcbDQtQuO7PYw6yCq
IeyEbUuehKpQL/OQASwHkJ4m3iRr8tH5PddGl1DF36Vu3bqAxr8opKZIi1S2hXHE
2iXFY48PzN9aDvLIilAylO12RtZoTD0yI30BpucJYhATovmkzvzNuhaJ8CDYjf07
4OJ0HoH7hOn9rhjHNQVq755OESyUTtRIqHxEw0150PJG33O1cjruRc9WgI5GVjO7
4MQSqFHmyOcfNWZZTins29E9Cnd/zy2nkj+YXsp7eBRG2QFjrlN+y7evCduhOdbP
moJzOF+e4dqEOZDwlVeqPni6UVFu4Zr5HWJw790osuG1oOCwB4NVpNRz34VjM7kD
nYoZaqIm9X5Foeus0Rl94cBreI0Bg1lCsM8CCoANE42t2NOlumnMsJoLWt4T+cBb
F5JoiSCC4JKIbuYedHI00W/9U6LcPqBcd/NZ2ZxYSVAibApDfG/APsy8a5gRLRgZ
460CNbf4e7p7lyN5c4l58DLJvEsT/jYd/ap09KZnUZmQgcfxAHmCVQUMFq+VIb2k
1gePNObVfuvOC6Q1KwGEcbgYlNKd/e6uGwn2FP5jzWYQr9Co8R8L+kRvIaHkuVl5
o7TOw5dujpA6zalLJnecmj8XrL5uGRTvE6AwpGujw1UgN4QTGVs=
=W/7i
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
