Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B4EC47E49
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 16:34:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6CE8D21872
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 16:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571762044;
	bh=Ie4TiRCIO0NjeGJTCu1VyZSFVSCCTY8wVDdO2XrDDFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=RcOGZnj5wQH4RnezJflv7h9BXDQyjRyt9SwE3ya88EKQpIDVurfocxUe6o4YGubgr
	 QHsYOPOfo6Qe2voQ7JA+bW+WLmyxXZyHhqtj2riT2TDVNPvPKl9Qtyq1DIWTcg85vq
	 368Rwa/wfOc0+XKQhxbJlSqeXt1hIMA/k2HTzeRY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389470AbfJVQeC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 22 Oct 2019 12:34:02 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:54650 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389468AbfJVQeC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 22 Oct 2019 12:34:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=nyzDq/0lBgrP1V0vJhRR2d0PdmHvSueDVtj1t2A9QsQ=; b=O8oSiseKvetTIFlb6z812RX4Z
        EuXLkMqUTTICFbRSRFOgLNrf/RE22k51vrUBXlfpul+Xlnb2ASx/3ik9ahAruGzALtQLQr1bKOwjc
        +oCUKogloqkNGZKdl6TwhMyx+50Ey0d/hY1b7x+4/SP5lXEo0ExGRTNSNpWCZdWA09Rmw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iMx6a-00071g-IX; Tue, 22 Oct 2019 16:33:56 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id A41CB2743259; Tue, 22 Oct 2019 17:33:55 +0100 (BST)
Date:   Tue, 22 Oct 2019 17:33:55 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4] misc: eeprom: at24: support pm_runtime control
Message-ID: <20191022163355.GJ5554@sirena.co.uk>
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
 <CAMpxmJUrY9YK==6Mf5MoRTUDwmXJ6v5EM-VLXCNXJ8ZNK+xHyA@mail.gmail.com>
 <CAAFQd5BEcE0m7Jg1ZnmrF+jwH6Yn8+vYqT1L2wc2zkZ5vRCRAg@mail.gmail.com>
 <CAMpxmJU_Vws0oGf+GQCEbs-NHFCniO8c2CbXrKy9oEVC_KUhMQ@mail.gmail.com>
 <CAAFQd5D=T+x7j+Lst8AQt0epLckPJv_bXtNGs3Dk=kbdbfw53Q@mail.gmail.com>
 <20191022111908.GC5554@sirena.co.uk>
 <CAMpxmJUtYjF7L7W_OG6AP6CuLeW_1JPcgNxyBj201GJKfb+H9w@mail.gmail.com>
 <20191022150346.GF5554@sirena.co.uk>
 <CAMpxmJUqapF79TuhAbGeaZbnjyHo=-gbb-MT-PkX829myU3kGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="g3RkK9jYN81zD2N+"
Content-Disposition: inline
In-Reply-To: <CAMpxmJUqapF79TuhAbGeaZbnjyHo=-gbb-MT-PkX829myU3kGQ@mail.gmail.com>
X-Cookie: Whip it, whip it good!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--g3RkK9jYN81zD2N+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 22, 2019 at 05:42:33PM +0200, Bartosz Golaszewski wrote:

> I'm just wondering if all boardfile-based systems actually do call it.
> I recently had to sent a fix for old DaVinci boards where the lack of
> this call caused one of the GPIO expanders to fail to probe.

Yeah, it's...  intermittent at best :/  This isn't a new thing in the
API and unfortunately we can't really tell where it's because the
constraints are currently half baked or because someone forgot to do it
so it's not safe to just make the changes blind.

--g3RkK9jYN81zD2N+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2vL3IACgkQJNaLcl1U
h9CKjgf9FUpIbMg2H3JqLe/0VTP+5xUadMmb9qs60cz8stjuvndvZP8lo7e6fwL/
BKWCCPpREQToa2LQz63D2t5NGbcCeJEtVwN/3fMRkqHT5ciiczSdACm1sHF3wQX5
tZ6kB7LZ69Me1kHnUvGkKFp56wfR6SwQvZMQ0L+v1yz896ewV3YTugq37LewJA2Y
dCY0SyHgAGtKj/nX1vcEQfMbLPUoPWdEmnoaTxMKXYpkIcV8YUmz6lfHGjvBOl30
G55OGQ58t0A8hyOB3xVofuQG1ya3Zsb+0aAOc13o9dZVDYG1S+AbXwGDAWo8N/LV
OgoBl39qP/tynqTa5WMUijx6LOnA1w==
=ELCZ
-----END PGP SIGNATURE-----

--g3RkK9jYN81zD2N+--
