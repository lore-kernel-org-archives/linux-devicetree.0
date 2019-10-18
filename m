Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3A4CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 18:42:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B67820872
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 18:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571424163;
	bh=1zA/kcoIVok82OHMXldc2ogfVjj+Nv9tGJNM/8xB8Ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=rJb6OGOGHvKyj3C8/gJav+epVWyIXQSTPNSnB+y0zNQF+aK0O6krfrZ/hgyNeXKQA
	 8JFs6egb8w1NvDiOc4fjjWIkd+saIzF72OVoIgEEBF6PQOXWXX7047ZKhFCwzsl9bx
	 Q0nG3f+B8qUXqKdNidzJB4rqBsaTgzYcezWQ/0C0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbfJRSmn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 14:42:43 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:48416 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbfJRSmm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 18 Oct 2019 14:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=vL9H+9/RLGnQWWp4nUhHSA5PaWdyyUffShvgM8LDMQw=; b=Tnve+d6cDI8Zt/OhjcmA2pC2B
        tDtWgw88wNUXyjYVd3LYnu0U71Y3EnSrRuF/UzSDHC3Mkz15H34vWrDv0I1dRWhPNKQTJyVvs6d5L
        DtrIdEn68Ti7JG5oSfiFIH38nY42D5by6mMstgXo44qp2u3FrqLVFyhq0rNoPJxMmDN4A=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iLXCx-0004NN-21; Fri, 18 Oct 2019 18:42:39 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 4A2D42741DEA; Fri, 18 Oct 2019 19:42:38 +0100 (BST)
Date:   Fri, 18 Oct 2019 19:42:38 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     ALSA development <alsa-devel@alsa-project.org>, robh+dt@kernel.org,
        devicetree@vger.kernel.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@google.com>,
        Gwendal Grignou <gwendal@google.com>,
        Nicolas Boichat <drinkcat@google.com>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Dylan Reid <dgreid@google.com>
Subject: Re: [PATCH v4 07/10] ASoC: cros_ec_codec: support WoV
Message-ID: <20191018184238.GD4828@sirena.co.uk>
References: <20191017213539.00-tzungbi@google.com>
 <20191017213539.07.I5388b69a7a9c551078fed216a77440cee6dedf49@changeid>
 <20191018172220.GC4828@sirena.co.uk>
 <CA+Px+wXCjaP1uktHLffRCe2C1P_D21f2+A=HDdhutoGv-BVzZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PHCdUe6m4AxPMzOu"
Content-Disposition: inline
In-Reply-To: <CA+Px+wXCjaP1uktHLffRCe2C1P_D21f2+A=HDdhutoGv-BVzZQ@mail.gmail.com>
X-Cookie: Smear the road with a runner!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--PHCdUe6m4AxPMzOu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 19, 2019 at 02:39:20AM +0800, Tzung-Bi Shih wrote:

> Could you tell me how you get the .config (to enhance my local build
> tests next time)?  I tried randconfig several times but it seems not
> easy to hit the case (i.e. CROS_EC_CODEC=y but CRYPTO_*=n).

That one was caught using merge_config.sh to merge in the config below
then have a script that turns on all options in my subsystems and MFD.

CONFIG_COMPILE_TEST=y
CONFIG_OF=y
CONFIG_I2C=y
CONFIG_SPI=y
CONFIG_REGULATOR=y
CONFIG_SOUND=y
CONFIG_SND=y
CONFIG_SND_SOC=y
CONFIG_SND_SOC_ALL_CODECS=y
CONFIG_SPMI=y
CONFIG_NLS=y
CONFIG_SLIMBUS=y
CONFIG_CLK=y
CONFIG_DMADEVICES=y
CONFIG_PCI=y
CONFIG_ACPI=y

--PHCdUe6m4AxPMzOu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2qB50ACgkQJNaLcl1U
h9CgCAf+PKAGMjGbyNjrM3ul2W9lHj8LB2sFoTtX/ynPK4k9veA707e4TUD9jhK4
H/W7IVj6OgtizWbeQPgFvW2bHyZoc8KBqnrbvyWRf17KEwnuErupBw75uCRlP/S9
n/eh/YzFhgHNvUNfzwWAjmgCA4iw5pVf6lBWooDbbeDx2KVPl38Z//+1PgWP+cNy
1ZEdHTidjKewTdQoy8cqrRX0oQXzs2V05oYdvZssWklyTywANvANzsDS+/aapKCj
LbXwhygk2xImXq9XVHIPGmQmRCbLimEwWzhcMkykfmMF0NcJFUXmLMtr0lF3+PBa
WHyuO3Z/gbo293M87rP57al0ZXxkCQ==
=GT10
-----END PGP SIGNATURE-----

--PHCdUe6m4AxPMzOu--
