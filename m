Return-Path: <SRS0=PToE=Z3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DEFC43603
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 06:06:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 408CB22464
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 06:06:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="XnC1T960"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbfLEGGi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Dec 2019 01:06:38 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:58358 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725880AbfLEGGi (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 5 Dec 2019 01:06:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=dSBpaxwIFIt6XTXn2BVKEZT+C7a4WG7hO1oDu4g0lQU=; b=XnC1T96098DXSfUc1kQjc+opX
        ooXVR+JY2HBPWk/qL7yTfIZreq7mGSB7NGYY6mz0IoX6TxcQw4Cd2dunJtUPRP+B1foaXHBJgZv4N
        KZbSjEpyHvTdsnm64HgcAhdkMGm7KpM9JrSl8t3yLW0zZEZTfqVjebrCkhfVmXjhUaLGc=;
Received: from [185.238.219.17] (helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ickHZ-0002i1-4a; Thu, 05 Dec 2019 07:06:34 +0100
Received: from [::1] (helo=localhost)
        by eeepc with esmtp (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ickHN-0000Bm-8W; Thu, 05 Dec 2019 07:06:21 +0100
Date:   Thu, 5 Dec 2019 07:06:12 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH] ARM: dts: e60k02: fix power button
Message-ID: <20191205070612.27204646@kemnade.info>
In-Reply-To: <20191204123645.GL3365@dragon>
References: <20191111202959.24189-1-andreas@kemnade.info>
        <20191204123645.GL3365@dragon>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/e59ch/q73Ij1=hh=gGw_suC"; protocol="application/pgp-signature"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

--Sig_/e59ch/q73Ij1=hh=gGw_suC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Dec 2019 20:36:47 +0800
Shawn Guo <shawnguo@kernel.org> wrote:

> On Mon, Nov 11, 2019 at 09:29:59PM +0100, Andreas Kemnade wrote:
> > The power button was only producing irqs, but no key events,
> > Forced power down with long key press works, so probably
> > only a short spike arrives at the SoC.
> > Further investigation shows that LDORTC2 is off after boot
> > of the vendor kernel. LDORTC2 is shared with a GPIO at the pmic
> > which probably transfers the button press to the SoC.
> > That regulator off at boot, so "regulator-boot-on" is definitively
> > wrong. So remove that.
> >=20
> > Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info> =20
>=20
> Do you want this go into 5.5-rc as a fix?  In that case, we may need a
> Fixes tag here.
>=20
well, now there is=20
regulator: core: Let boot-on regulators be powered off
so the power button should work after regulator_late_cleanup()
is called but that is usually some time after userspace has started,
so it would be better to have that in. And of course dt should
correctly describe the hardware. That would be

Fixes: c100ea86e6ab ("ARM: dts: add Netronix E60K02 board common file")

BTW: I have not seen your 5.5 stuff in Linus' tree yet. Seems that Olof
has not sent his pull request yet or is there bigger trouble?

Regards,
Andreas

--Sig_/e59ch/q73Ij1=hh=gGw_suC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl3onlQACgkQl4jFM1s/
ye9lJhAArhjRzxxMavFXQf2PI+2ZJZ4rFZjFvJ75/UxnBDrNFslJ3WEeEnuIymQD
MRPwgn4qE57P4pj17WFRS+Xaw7BRRJ5sHjHSfWLsNZMlzhkEDviVx9zOIhQK6GJO
yxbZq2u0hthGAFM7nJ+Z38Z+j6E9dzQLpufmgFfrCzZaza1GYeJnQbwfUZSHtvjB
/NwXiA1M6ELlx3evtZ7P6Chi45SmXl4foy1zX4ESh46rR1uaLij1sOXJ7Tu5r54C
GgaxpdqqR1GtTWfZkF0sQvRmcxGXM+UZDyHFZ2c/Id/6MApQx1vibAyKY9zyHdp0
wc6tBEPKJHdts9H5rNwQrSwF9k50YlCphuTRtsJUsW3BiNxBmksTNBVfLM2AjiDO
rpL5OKfJqgUXeP5/sR/H1ZrlJWPMibSvK2C/F8XlkRzM1h54xcil523ymoCoJrc2
N72JzslVK83SI5gm4CrsRYnEXu+sMS5UbLbgU7zCJdC76PqhsM44hqtVGN1Faf7w
RB03MjZ2vnuQtk5k/Xn/nUJS5NFp4g0nburvcjSW/jpTPrdT7jhqafUzbazU70NU
OimIpJWZBghslhZLYaagOJJE/iLrzqe7Tns7UNzzQhKae+YAFtoutLPhV920XVab
1JSQ1Dtb9AQmLNPhIvXTKaRFpHVYzPlrJO4ICfJbt9ouTY9IrN4=
=m0VS
-----END PGP SIGNATURE-----

--Sig_/e59ch/q73Ij1=hh=gGw_suC--
