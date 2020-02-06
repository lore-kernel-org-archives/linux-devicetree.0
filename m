Return-Path: <SRS0=gpjL=32=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88ABEC2D0B1
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 13:57:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C9DC214AF
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 13:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580997443;
	bh=BY3bAmfDGpjwi1ZC/nQxJs5fLqd4G6irce8OC6djfEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ZeU2Pbh/pAROBPQC+RV46YaR88cYj4BR6dNrhQOyvtR5IxWJxPjtFx7gvTb6XzPIG
	 /2ZQcDTaLmM+B7EaM5VkCB7TM/EfepcP+1zYn/l0G8sAMB9Bh0tKwMzy3EK10/n1K6
	 0dHDIHTjJlo6ZQGPKEG34wggqMuxMIUjJ8oaaLZI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgBFN5X (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Feb 2020 08:57:23 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:48438 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727566AbgBFN5W (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Feb 2020 08:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=BY3bAmfDGpjwi1ZC/nQxJs5fLqd4G6irce8OC6djfEA=; b=h1BSwCcLlgimk6Oh3na09vu/N
        AbeV6VNbvypZMJ77dtITNE6feYpGs3nzvQ6YOFFredtdIeVKhbrW6GAZkBdPIHoxS2SbWCUBfUzSG
        SiiXB0bFFLqXUm+Sl79j8fgCaHIktc6HeQdPXZAt8eHrQpqugIU9jadLOG+04x/pKALtU=;
Received: from fw-tnat-cam2.arm.com ([217.140.106.50] helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1izheg-0002Jg-TW; Thu, 06 Feb 2020 13:57:18 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id 8977ED01D7F; Thu,  6 Feb 2020 13:57:18 +0000 (GMT)
Date:   Thu, 6 Feb 2020 13:57:18 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     lgirdwood@gmail.com, heiko@sntech.de, alsa-devel@alsa-project.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, pgwipeout@gmail.com
Subject: Re: [PATCH 2/3] ASoC: rockchip: Make RK3328 GPIO_MUTE control
 explicit
Message-ID: <20200206135718.GQ3897@sirena.org.uk>
References: <cover.1580950046.git.robin.murphy@arm.com>
 <29a846da33c02df64eca62b5fa0f3884652f788f.1580950046.git.robin.murphy@arm.com>
 <20200206114606.GM3897@sirena.org.uk>
 <ad2c941a-9724-510e-959f-3cca3cab1dc2@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="k1RcuuA4CmYq3pph"
Content-Disposition: inline
In-Reply-To: <ad2c941a-9724-510e-959f-3cca3cab1dc2@arm.com>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--k1RcuuA4CmYq3pph
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 06, 2020 at 12:36:04PM +0000, Robin Murphy wrote:
> On 2020-02-06 11:46 am, Mark Brown wrote:

> > This makes sense but it is an ABI break so is going to need
> > quirking for existing boards that unfortunately rely on the
> > existing behaviour.

> I guess the existing (mis)behaviour could be predicated on an
> of_machine_is_compatible() check for Rock64 boards - it's ugly, but should
> do the job if you feel it's more important to be 100% strict about not
> regressing supported systems for any possible kernel/DTB combination.

Yes, that's what I'm suggesting - we don't need to be exhaustive
but having an obvious place for people to put the quirk in if
they are affected is much better practice than just silently
letting things break.

--k1RcuuA4CmYq3pph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl48Gz0ACgkQJNaLcl1U
h9Dqlwf/e9pbZnoHIpXKjbaTLD0JTMQR2bflNKfkFgJa4HN0EBmRU/2zzjhQsMBj
FwXbRw0mbFlfh8DvJcHwjp9Nt+DzRk084QZm1xjXyIdok04lxQCq0/XwBENKJGUp
icw2FFpQGCVQJRixdXMaY0M0woDlf8GF/gk+KkNrJWvtD3JYD3pbaNqDO3Sfg4C/
ECfMVskfkS0XSKhcMWqbmFBf8ImMABUOu8qV6oWbEmxRlmjMxv28pNjXi+L96X83
qZ9St2FvccCApJ7twkomusHVtpw62Cpwy0OOwxOFIjEWTHXzhyAH/vFtPmMJwZJJ
vHRSZAgaioZ451LfVRCV/L6YnOeigg==
=S0B3
-----END PGP SIGNATURE-----

--k1RcuuA4CmYq3pph--
