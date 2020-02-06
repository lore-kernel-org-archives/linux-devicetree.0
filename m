Return-Path: <SRS0=gpjL=32=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E3F7C2D0B1
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 11:46:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA6E121741
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 11:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580989577;
	bh=bUWREdoU4He/YcftlGWMKWe1bWizb7OK/93Il52hoRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Hm5GFiByZZnkCigLpHvWkr7Zl0E5Wxg5sZe2VFlGl2lzECCLkXuW6fmeE9BpvxmVh
	 xpp/d1Zk0FlJfO1oJEdF99cG6PJqiBozPBVbzHDks98VBjUuHVAkPHjRh3TAFQeYpe
	 RVCsOLhlvt1o5F8JgNao/BOknM2yrMrlRdef4/7M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbgBFLqR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Feb 2020 06:46:17 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:53782 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727111AbgBFLqR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Feb 2020 06:46:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=bUWREdoU4He/YcftlGWMKWe1bWizb7OK/93Il52hoRA=; b=B39UPjFUyfKnLbO50oBTfJTAi
        OjSPf4Oa2MILokP3IeooB2GgH2JBR7HTcQiOILxSIbOaTeADKvN447l0n/rQFND70+EhoStAUkM1p
        E64X6U6M6O3hRUNn3F0zdQIeKni+FuDS/srt/WReqeNGEcXCshkm1h4eWO2fkYMjVkUo4=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51] helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1izfbj-0001YB-Cl; Thu, 06 Feb 2020 11:46:07 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id CD968D01D7F; Thu,  6 Feb 2020 11:46:06 +0000 (GMT)
Date:   Thu, 6 Feb 2020 11:46:06 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     lgirdwood@gmail.com, heiko@sntech.de, alsa-devel@alsa-project.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, pgwipeout@gmail.com
Subject: Re: [PATCH 2/3] ASoC: rockchip: Make RK3328 GPIO_MUTE control
 explicit
Message-ID: <20200206114606.GM3897@sirena.org.uk>
References: <cover.1580950046.git.robin.murphy@arm.com>
 <29a846da33c02df64eca62b5fa0f3884652f788f.1580950046.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+F2yqQIdYdj7GirX"
Content-Disposition: inline
In-Reply-To: <29a846da33c02df64eca62b5fa0f3884652f788f.1580950046.git.robin.murphy@arm.com>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--+F2yqQIdYdj7GirX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 06, 2020 at 01:07:12AM +0000, Robin Murphy wrote:
> The RK3328 reference design uses an external line driver IC as a buffer
> on the analog codec output, enabled by the GPIO_MUTE pin, and such a
> configuration is currently assumed in the codec driver's direct poking
> of GRF_SOC_CON10 to control the GPIO_MUTE output value. However, some

This makes sense but it is an ABI break so is going to need
quirking for existing boards that unfortunately rely on the
existing behaviour.

--+F2yqQIdYdj7GirX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl47/H4ACgkQJNaLcl1U
h9DSgAf/fI2jTkBLGwfZiU8QU+VXIx/+BPEpU9gRjE/WwtBF2zlRRy3WLOiYqQ5Y
Y+Jgt8z1POzBClW3R1EYdRfuno7LdCv0Uw6x3N5lGI48qRilCVvtfDq7wUkMqsCT
o6WrsChoeB3VFYsyKSD/ZKjA2Zxie2VYH4actQ/kdat4TeYXyIVQ/IcEZsMZXPmL
RydsLYzjOLFElnxNVA8FlHbumD9t1u0qRvCW9G0ASdoNa1IHA0AeYUoVBFo2/yGo
5AQ5AZNMfjrTfpvzRbg7zyQdztURC/VUqnqk+dSFOzZ8SC91lj7mw9IC1+9dRF5R
1GxdYx+sA24Phw4T+p07RZO9aUY6xw==
=pHJO
-----END PGP SIGNATURE-----

--+F2yqQIdYdj7GirX--
