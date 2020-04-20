Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B986AC3815B
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 14:40:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96B6220B1F
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 14:40:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="ufZchA3Y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="4mBxVLpw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgDTOkD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 10:40:03 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:40643 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726050AbgDTOkC (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 20 Apr 2020 10:40:02 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 5ACC05C0126;
        Mon, 20 Apr 2020 10:40:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 20 Apr 2020 10:40:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=PXh+J0spjajpstfYlJVLBegen5x
        1vPub81+/OQ14NPk=; b=ufZchA3YEU0q4bx7XGMFYwzGcFkO8xEWRqczsztkArr
        2R4KhCDcb1JNYLhMzEWZ63VsagHJCtPfO5uykwcIQRmjF228SxRdG4dzR4zKZIm1
        5UCRpfehIv6fx1J4nPCWAAFWo2UvUL7QI216ogujlDTOgEtDEwrn6BeehD3qFOHS
        8QxEIFELywYiOBeEdR5TfZH1H9yctlVeYQ5ho2H0kKZODfcEhpUN2+Sg9z0C8y4D
        Gnca1ZDdvYM/eiTJZ9DXaE8TPp8sQlbm28ieKM9q6raQt49zrE7UybaxkF0tY5Le
        H0IOgwMJstAbhzuJ+IFtGaasz8cUt7yoiRqhKUabiOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=PXh+J0
        spjajpstfYlJVLBegen5x1vPub81+/OQ14NPk=; b=4mBxVLpwXKEj7dteX1kJU9
        3Y5UhFhWhaWgIhLhglKQP4/9Dz1p8EzZXT1I2NcA+kBk7qMrcgRIOiy5qLFX5LIu
        LPxgs1CqMj7+N10okQKfd9lUh9pmWbVWL8Z6fNV0IMOsp2usM8jRmlkmG9hr9oES
        s0p8sl2CjoUlpH/wNBhwxSSRm+QF+fwMKmAfuecIFjwjSE/a+PV9otFwcbI/MDbA
        LrAq4f00WMolcCYkFl+l3sbumpLuo9oDc+94SQyUZkcvE/DN6oARDENEtwN4rgRR
        e5K6F0Z3YxZTXWH1IKtDmcJH30nf961j+dbvkCDaOBHErZo9Of2cZLp6y1C/foCg
        ==
X-ME-Sender: <xms:QLSdXjOctWb3R9tY3CVXYn6RD_VPwVFAnu9kynGrVrwuGBfZ-htojg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeefgdejlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QLSdXlDqCN_99v6KG6VwbYnyn3C290e6umaoo7BRsBUNWTSdeEwf-g>
    <xmx:QLSdXp_F2WTv8Nkp_tvAREiqEdrFZNPa-kM6GUwzRMWcq1wY6nJCjw>
    <xmx:QLSdXuGy6HLiH4EBVng6Ix-cpFfPe6eOT6QV70LrxVctW0VHllszFA>
    <xmx:QbSdXjDuuIV9lQaFtTUYtQw3soUWX_jrhBMLqSOyTb1TqQi8cGhYQQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 553F03280060;
        Mon, 20 Apr 2020 10:40:00 -0400 (EDT)
Date:   Mon, 20 Apr 2020 16:39:58 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH v2 2/4] iommu: Add Allwinner H6 IOMMU driver
Message-ID: <20200420143958.rdn3j27tu3umtkrh@gilmour.lan>
References: <cover.a31c229a83f1d92e6928ae2adb70887da0fd44b3.1582222496.git-series.maxime@cerno.tech>
 <6864f0f28825bb7a2ec1c0d811a4aacdecf5f945.1582222496.git-series.maxime@cerno.tech>
 <20200302153606.GB6540@8bytes.org>
 <20200401114710.doioefzmjhte7jwu@gilmour.lan>
 <20200408140649.GI3103@8bytes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ru45p6lp7fq34z3p"
Content-Disposition: inline
In-Reply-To: <20200408140649.GI3103@8bytes.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--ru45p6lp7fq34z3p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 08, 2020 at 04:06:49PM +0200, Joerg Roedel wrote:
> On Wed, Apr 01, 2020 at 01:47:10PM +0200, Maxime Ripard wrote:
> > As far as I understand it, the page table can be accessed concurrently
> > since the framework doesn't seem to provide any serialization /
> > locking, shouldn't we have some locks to prevent concurrent access?
>=20
> The dma-iommu code makes sure that there are no concurrent accesses to
> the same address-range of the page-table, but there can (and will) be
> concurrent accesses to the same page-table, just for different parts of
> the address space.
>=20
> Making this lock-less usually involves updating non-leaf page-table
> entries using atomic compare-exchange instructions.

That makes sense, thanks!

I'm not sure what I should compare with though, do you want to compare with=
 0 to
check if there's already a page table assigned to that DTE? If so, then we
should also allocate the possible page table before the fact so that we have
something to swap with, and deallocate it if we already had one?

Maxime

--ru45p6lp7fq34z3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXp20PgAKCRDj7w1vZxhR
xdskAQD8uW/heD6sz1jtgnc/STqZgTUkb5RbyrBeNlR9JoXflQD8Dyylg9C7Aacl
NQgNnyYDy8bej8v1c5S34GeYWpSv6ws=
=ieXK
-----END PGP SIGNATURE-----

--ru45p6lp7fq34z3p--
