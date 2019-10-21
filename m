Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4822CA9EB7
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 13:50:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6EC20214B2
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 13:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571665840;
	bh=aEu1uJJTKafM7jVw7dAgeyLCE5JqgyFPy0YM24aRC+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=gVbigGHVo8uJBfzXfHYkjH312sRFQcJcEhnZ6FhNeJeTMrpSSyW0HS+IH8jn+8lHV
	 rxS8P+GchhxmMa6hMXBbM0O64IJFO2UYMBVwUhv1tgKvbRX1EwJWDBW0ZgLR6CkXoj
	 fAA6Q90YhpJ6/vRliYhdC1lh4fSYPeSVtHuWM7yE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727152AbfJUNuk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 09:50:40 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:41954 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727322AbfJUNuj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 21 Oct 2019 09:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=aEu1uJJTKafM7jVw7dAgeyLCE5JqgyFPy0YM24aRC+U=; b=a/rSfFvy+yPWsunq+u0NBQ2Sy
        7twL6/L0qz7NtWlv1zjGaLKz8G2pVtdWoW6piUuHvn3mOKxYv88pJ3BpV4xwYgm/G28mb+yi4u3Yn
        z1+d+NA8V5oeNKrw5nfJFsG0lE0la1gyxAP1NF8IDXh3sZFi6+j9TVlUZ5x9jAod0IDzs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iMY4w-0004GM-Cg; Mon, 21 Oct 2019 13:50:34 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 7719B274301C; Mon, 21 Oct 2019 14:50:33 +0100 (BST)
Date:   Mon, 21 Oct 2019 14:50:33 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     Tzung-Bi Shih <tzungbi@google.com>, gwendal@google.com,
        devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        cychiang@google.com, drinkcat@google.com, robh+dt@kernel.org,
        bleung@google.com, dgreid@google.com
Subject: Re: [alsa-devel] [PATCH v5 1/4] ASoC: cros_ec_codec: support WoV
Message-ID: <20191021135033.GF4691@sirena.co.uk>
References: <20191019070254.23870-1-tzungbi@google.com>
 <20191019143504.1.I5388b69a7a9c551078fed216a77440cee6dedf49@changeid>
 <659a3d1f-a8e1-268d-5e95-b328aeed601b@collabora.com>
 <20191021114303.GC4691@sirena.co.uk>
 <a4e1530a-b706-2a73-e0b3-ad56cf9085bc@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1Y7d0dPL928TPQbc"
Content-Disposition: inline
In-Reply-To: <a4e1530a-b706-2a73-e0b3-ad56cf9085bc@collabora.com>
X-Cookie: Why are you so hard to ignore?
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--1Y7d0dPL928TPQbc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 21, 2019 at 03:12:50PM +0200, Enric Balletbo i Serra wrote:

> Ok, I was off the latest two weeks so I didn't catch it :-(. I'll try to figure
> out the better way to avoid conflicts knowing that these are already queued.

So long as they're easy to resolve it shouldn't be an issue, Linus
doesn't super mind fixing things up.

--1Y7d0dPL928TPQbc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2tt6gACgkQJNaLcl1U
h9BF/wf8CTYyYmc413jqwsQxB9+4R2QOYPA9MG7qBRZ+z0NinvCl876PH7YNk9Tw
9CshD9oIKe3LRpyRsAHHlwI38yAAB0n4+/p1UYuQEB/bNoM9P85OIaH/Qj95GnO1
Pbm4y44PVUPv46aGRPSXt1RtkGVZhRVj4j/IOFu7JkQGT/ZnMHVpzwHAV4uCxlij
oQjH+C/lWeQsBxEBMio/5nryhSRRb3qXWQPGVSrSNLDci08llkQGGBc3A4jTQyKh
9k7QO5lopV2ThKdiQv8wSTc1lWTRxDWHORq0RgIrSQCMVrif9SA/hF4FAKRcLhyN
VSbdH6IbO1dzKpZmtq7z/nKI3l4AiQ==
=dZWZ
-----END PGP SIGNATURE-----

--1Y7d0dPL928TPQbc--
