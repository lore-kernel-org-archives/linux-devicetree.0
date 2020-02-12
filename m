Return-Path: <SRS0=LTWd=4A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F5BC2BA83
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 11:20:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2655E2073C
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 11:20:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbgBLLUO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Feb 2020 06:20:14 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:48307 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgBLLUO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Feb 2020 06:20:14 -0500
Received: from [5.158.153.52] (helo=mitra)
        by Galois.linutronix.de with esmtpsa (TLS1.2:RSA_AES_256_CBC_SHA1:256)
        (Exim 4.80)
        (envelope-from <b.spranger@linutronix.de>)
        id 1j1q3v-0002je-Hf; Wed, 12 Feb 2020 12:20:11 +0100
Date:   Wed, 12 Feb 2020 12:20:01 +0100
From:   Benedikt Spranger <b.spranger@linutronix.de>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     bage@linutronix.de, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 5/5] ARM: dts: sun7i: Add Linutronix Testbox v2 board
Message-ID: <20200212122001.4fb6c2b7@mitra>
In-Reply-To: <20200210075628.2oaa4xnvkwoxkpr6@gilmour.lan>
References: <20200206113328.7296-1-bage@linutronix.de>
        <20200206113328.7296-6-bage@linutronix.de>
        <20200210075628.2oaa4xnvkwoxkpr6@gilmour.lan>
Organization: Linutronix GmbH
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3ij+6FO.z58yxY1IzCULKMI";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

--Sig_/3ij+6FO.z58yxY1IzCULKMI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 10 Feb 2020 08:56:28 +0100
Maxime Ripard <maxime@cerno.tech> wrote:

> > +// SPDX-License-Identifier: GPL-2.0-or-later
>=20
> Using a double license would be great, otherwise other projects
> licensed under something else than the GPL might not be able to use
> it.
I don't get it, why GPL v2 is not adequate here...

> > +	leds {
> > +		compatible =3D "gpio-leds";
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&led_pins_lamobo_r1>;
>=20
> You don't need the pinctrl nodes at all for GPIOs
I did not agree on that:
The pincontrol configuration depend on the bootloader if you omit the
configuration here. That may sufficient in most cases, but can cause
unexpected behaviour after updating the bootloader or using kexec.

The A20 datasheet mentioned:
"For various system configurations, these ports can be easily
configured by software. All these ports can be configured as GPIO if
multiplexed functions not used. 32 external PIO interrupt sources are
supported and interrupt mode can be configured by software."

I cannot simply check, if the pin was used otherwise.=20
Therefore adding a pincontrl for a defined state of a pin seems
reasonable.

Regards
    Benedikt Spranger

--Sig_/3ij+6FO.z58yxY1IzCULKMI
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAqI1USXos6PVrEqYjSQ2tYFsrE4FAl5D32IACgkQjSQ2tYFs
rE7dtQ//ZRxqwnU5PmQQG9vV89FTtGRyM8utnzHUxMW0NwTxplLdaUZtMMbiGRc9
4zSzVFXp4HTC4bWNAtgsTs9T+9evXd12CrGO6WFPwVRQya4VY6m56VSUAvSPKu9x
V6ie3qA1CBwnMW1tw6212o7O8Xt4/SKtK5W2ojmGfkNn2y2gwnfsOt8LwC1akAjG
VaBubLhKJ0VOxRy8t4UuxvknFcf0iGNvz+bdlE7dYN9LuUIe9OoeHmHirk6I2qxH
8xQIbj0stxh0or3xztvqz5IgG0FYCTsZGacB5jAXEdQLcEdb4MAiv2kCEkN53HW6
3ZyX7Gb10Rdc49k9zxnfjELXiZRTiBTDDNQwwufFbXR9HGb6qKQ8LFTs4SZZdvKP
nnaE6J/7vuJ8DAaDwqsZkAO4J7M6WBIIBra+KPJeJLicv17wqmwaTfhnSnMCo08S
Ih5m9OoTjvLmrHYwy/G8iCpuLWsw1bbMWfie54a4LZ+JspxqiTv2gUf850Bkubmp
OWkEw2aF15qDwOpxbn+d+8WPb+z++3JPXJvAHCuFQ1zmVPouwIeyjmBCAd22Z/U0
XySOTag6DHHYRSnhWITbMfe0Cx6Vrn5SanIkDthw8jcWjK+iKEnPQcx/QlQl7LQn
l76eSymHIe2ADcrFS/n7QM3Ul7blMtPSVoQLkkRsb4Ag0cGKIF8=
=B6am
-----END PGP SIGNATURE-----

--Sig_/3ij+6FO.z58yxY1IzCULKMI--
