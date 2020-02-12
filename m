Return-Path: <SRS0=LTWd=4A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9091DC2BA83
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 10:02:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68E1F20675
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 10:02:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728846AbgBLKCA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Feb 2020 05:02:00 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:48062 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728832AbgBLKCA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Feb 2020 05:02:00 -0500
Received: from [5.158.153.52] (helo=mitra)
        by Galois.linutronix.de with esmtpsa (TLS1.2:RSA_AES_256_CBC_SHA1:256)
        (Exim 4.80)
        (envelope-from <b.spranger@linutronix.de>)
        id 1j1oqE-0001Fd-LT; Wed, 12 Feb 2020 11:01:58 +0100
Date:   Wed, 12 Feb 2020 11:01:50 +0100
From:   Benedikt Spranger <b.spranger@linutronix.de>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     bage@linutronix.de, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 4/5] ARM: dts: sun7i: lamobo-r1: Split out commons
Message-ID: <20200212110150.2f09d7bf@mitra>
In-Reply-To: <20200210074525.xloszrupb37gcl6p@gilmour.lan>
References: <20200206113328.7296-1-bage@linutronix.de>
        <20200206113328.7296-5-bage@linutronix.de>
        <20200210074525.xloszrupb37gcl6p@gilmour.lan>
Organization: Linutronix GmbH
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//F7VZjI5cOjdfRPQJhU+G+9";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

--Sig_//F7VZjI5cOjdfRPQJhU+G+9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 10 Feb 2020 08:45:25 +0100
Maxime Ripard <maxime@cerno.tech> wrote:

> Looking at the board, it looks like it's just a daughter board to the
> lamobo-r1?
It is a daughter board.
=20
> If so, you can just include its DTS directly, there's no need to
> create a DTSI (an overlay is an option as well).
Weighing up to include a DTS and overriding nodes versus splitting
out the commons into a DTSI let to the latter:

Overriding DTB nodes is a mess since it makes it unnessesarily complex
to understand what happens and is hard to debug. I spend quite some
time of my life to get a clou, why a DTB of a board is messed up and
why changes got lost. Including DTS files is a matter of taste and none
of my flavors.

Overlay would be an option, if there is a way to load the overlay
without touching the bootloader or during kexec.

Regards
    Benedikt Spranger

--Sig_//F7VZjI5cOjdfRPQJhU+G+9
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAqI1USXos6PVrEqYjSQ2tYFsrE4FAl5DzQ4ACgkQjSQ2tYFs
rE7F0xAAkmKpqavwXysXpFqtV94q6Cp00+mhKzW0X8PZnkw+bM4PQw2FqD9UVhft
h6+/hIKs2sEb2bWx+RaupcthyGRjGTUq3PtO3619yMvG6Y+fUfIWDEmTMr1XnQaL
xmr98oXzlsgCLVfpfdSxsQ+ri8QQWx+TXBC34Qm9uFWY6B9JARhQ9BHvIcTfcZqr
Jhyk6dZnuzX/RnkyyYwh/kcpHF97Xn4G2X4yxZoYf7zj5L2wPYbBMtbPckWG9eQB
H/CqeO615mmIAEWptzvBS9mB93wEeOeZ8Mkab2ty2nRczFkXphyQ2JE2Wta2Q9fx
deFzv/SNMmQ5i9ILHpIrXSM3b+DVWmVBEl89ZBELAXhV9PRZqbfxxlNTFBs65EIz
sVJk+FR73tsh6j6T2iSoLD4CYxZzQWsxbSwGVgLvmT1RKrnNJhNMidcqzGXTNTh3
b9ed+xIMpbdPRioq9yUWV9zPDJpKM3pQWKIkn/Z/Aa1gnwnT4wvH6rPBjgVunKH6
m59TMXJbfEUjzEJiwqJ107l6bNijzE9twu0EXbR5d/1pQGjUfxtvEQKTxZyYi8td
LK8rXHOX7KbRI43voTa6VVzfrnM5T6W2h9pVR3UEC5JNpWyyWesZJEgjDUGMzCiw
MhFU86jfHNN7F8rUqmz1HpqHpSiQsFPC6CvEMyunuVnJ8wbHDHA=
=mXzV
-----END PGP SIGNATURE-----

--Sig_//F7VZjI5cOjdfRPQJhU+G+9--
