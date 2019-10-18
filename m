Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC853CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 17:22:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 95F53222CC
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 17:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571419347;
	bh=YEUqwXf68rAn5s1l3tXa9+Nk4NAT0bB7VwakuvjxaLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2AI8X+A0THp1ztA5fckmXw5XYqxNaHnu6QrdvmFXipf+HrR+n/weKEgfGjgZ/P+to
	 +L5+s8ck7hUIJdNzsPD1A6o8tgaBMIs5lqk3FDqTqN4T07FW+tbPZI6a82VHd5xwSf
	 IaJYpCm2y82WLAybsJkbWmYBHcgJbUhoZ/HQc5MQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393523AbfJRRW1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 13:22:27 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:54284 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406175AbfJRRW0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 18 Oct 2019 13:22:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=YEUqwXf68rAn5s1l3tXa9+Nk4NAT0bB7VwakuvjxaLs=; b=qqxu/nOj/LYHzT/4No5A2w9Bt
        14EqFiyq8GyiJfeDqnzchr+4WwrOpkqpkoRNH8VJqlWa6fu1u4KVKbzZjgy+CiWCXFlb7nqFwNaZx
        PDCha66YmI8vpPsvEE8MBWHbIQRHMMKZqc6vK0CPeX1afZCocWnikDGFMK8UFOt6POnjA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iLVxG-00049W-8Z; Fri, 18 Oct 2019 17:22:22 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 166FA2741DEA; Fri, 18 Oct 2019 18:22:21 +0100 (BST)
Date:   Fri, 18 Oct 2019 18:22:20 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, enric.balletbo@collabora.com,
        bleung@google.com, gwendal@google.com, drinkcat@google.com,
        cychiang@google.com, dgreid@google.com
Subject: Re: [PATCH v4 07/10] ASoC: cros_ec_codec: support WoV
Message-ID: <20191018172220.GC4828@sirena.co.uk>
References: <20191017213539.00-tzungbi@google.com>
 <20191017213539.07.I5388b69a7a9c551078fed216a77440cee6dedf49@changeid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vEao7xgI/oilGqZ+"
Content-Disposition: inline
In-Reply-To: <20191017213539.07.I5388b69a7a9c551078fed216a77440cee6dedf49@changeid>
X-Cookie: Smear the road with a runner!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 17, 2019 at 10:00:12PM +0800, Tzung-Bi Shih wrote:
> 1. Get EC codec's capabilities.
> 2. Get and set SHM address if any.
> 3. Transmit language model to EC codec if needed.
> 4. Start to read audio data from EC codec if receives host event.

This breaks the build:

ld: sound/soc/codecs/cros_ec_codec.o: in function `calculate_sha256.isra.15':
cros_ec_codec.c:(.text+0x119d): undefined reference to `crypto_alloc_shash'
ld: cros_ec_codec.c:(.text+0x11c1): undefined reference to `crypto_shash_digest'
ld: cros_ec_codec.c:(.text+0x11df): undefined reference to `crypto_destroy_tfm'
make: *** [Makefile:1094: vmlinux] Error 1

--vEao7xgI/oilGqZ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2p9MwACgkQJNaLcl1U
h9C6hQf/WgLMjwUC9ev2n7739zYINOiNlP2HiWhim675Y+ILwL3SO3kAdVwi+Ev5
IeBwkDqetGni8J+KbGWyYPE2LnmVjvOoCyH+6V8E/fHfkLPtXocG5UZL4DjVstTB
27MdU4tDUczYrk+mRVuaBnz9f8DHTIufhiaRiiO3r3QI8Kpf1ClZ/gnEez5b+y7T
lOPOFXopjOoH14AX3CztZbJjnGDJ9k5oFFMMkv7fjqtcnxbDHXCYs4cumAHYeqld
+8aHLp58m4Jcdjq3QYdaV1PTeJP2cGBRXsWoGiMJyYgcH5WALgdS3fLv+yIGSUx5
qbuLVXUou6jeu+irpsqUkcPm7JQzgw==
=MH7S
-----END PGP SIGNATURE-----

--vEao7xgI/oilGqZ+--
