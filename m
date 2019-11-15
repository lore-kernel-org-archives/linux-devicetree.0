Return-Path: <SRS0=ud5f=ZH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49243C432C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 16:12:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1954E20740
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 16:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573834339;
	bh=a6s56JhDtI/Y8dfJlPMurASdhnGwtfFYnXMKce5BDck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=GZETakK1W3GV+OB2yqRCvLrVWrDwlttyXSUq5O5PWdUiRAN4GeshHXmRlU6mLgsDY
	 rLcf9ZQZZKrTZQu210eSaUD4nd8YDvs9VOYAgD0fHqCs/Voxlav1vDWTcQMT0auzSk
	 s7SEYA3VhM0QPJA45DLmXWd7vUE3INRx4+u7pxWA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbfKOQMS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 Nov 2019 11:12:18 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:47824 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727543AbfKOQMS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 Nov 2019 11:12:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=a6s56JhDtI/Y8dfJlPMurASdhnGwtfFYnXMKce5BDck=; b=Ut9of72IPWl8JG6PSw0cbyGcq
        V5VGrWD0LG8ozMn4a0iykI3QVN+VCBw0Qbb9jf/0RTWjOh3y4fDurcGw4Dyjx9kC/2qOaIQ2NjlT9
        lTGDgrAVBkhvMZJGoN++ErkymbDqCh6LYWydTPR6QzcgUlKEUDodKBuTu7FSrb57dykag=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iVeCh-0000fv-CY; Fri, 15 Nov 2019 16:12:11 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 6529A27429D2; Fri, 15 Nov 2019 16:12:10 +0000 (GMT)
Date:   Fri, 15 Nov 2019 16:12:10 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, KCHSU0@nuvoton.com,
        thomas.fehrenbacher@siedle.de, kernel@pengutronix.de,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: nau8810: add aux input control, available on
 NAU8812
Message-ID: <20191115161210.GB4210@sirena.co.uk>
References: <20191115160819.15557-1-m.felsch@pengutronix.de>
 <20191115160819.15557-4-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline
In-Reply-To: <20191115160819.15557-4-m.felsch@pengutronix.de>
X-Cookie: Tell me what to think!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 15, 2019 at 05:08:19PM +0100, Marco Felsch wrote:

> This commit adds the support to control the aux-port on the nau8812
> devices. We don't need to differentiate the aux-port registers since
> those bitfields are set to '0' on the nau8810 devices [1,2].

It'd still be better to only register these controls if the device isn't
a nau8812 so that userspace doesn't see them.

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3OzlkACgkQJNaLcl1U
h9CzJAf/bweQhNi628v9qYg/EgvL3C6EqcxHS3yI139L2K4AVDVNomczL+iq/fRY
vDW1oFgcRDy98yNCgFL27Vjn+ocGIE0/7dirr5sjVKriS7HKlVpaMDdgKBqKN/TF
qcJtJ9fCYPL1IYyIT3LR8isCPQFxgzc6m5AIGAbKwFuTNlH0hK7fGuR2ZcNP9J/j
lF22G2iRZicU24GZTdDE27xAtvyKl9hLwkxrH3Ren1T2xuP6ouc78jN0fs9bzLxO
MapAv1vEoZPinvILQW8elIgkWn4jjCjszjDqYTMg7qoQTvw8c/UkYDi8Xky+oA1u
sO/YhdTe6+7pTnW5+Ngvl8TLVjyXPw==
=xfur
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
