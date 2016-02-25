From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 1/5] ARM: bcm2835: Define standard pinctrl groups in the gpio node.
Date: Thu, 25 Feb 2016 14:24:50 -0800
Message-ID: <8737sga0nh.fsf@eliezer.anholt.net>
References: <1456425661-26123-1-git-send-email-eric@anholt.net> <1456425661-26123-2-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1456425661-26123-2-git-send-email-eric@anholt.net>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Eric Anholt <eric@anholt.net> writes:

> The BCM2835-ARM-Peripherals.pdf documentation specifies what the
> function selects do for the pins, and there are a bunch of obvious
> groupings to be made.  With these created, we'll be able to replace
> bcm2835-rpi.dtsi's main "set all of these pins to alt0" with
> references to specific groups we want enabled.

Sigh.  The host I've been using for relaying SMTP apparently decided
this week that it doesn't like half my mail.

I'll be off fixing this, so for now if anyone wants to look at the
series it's just in my repo:

https://github.com/anholt/linux/tree/bcm2835-dt-gpio

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWz38yAAoJELXWKTbR/J7o0bEQALU42s42kUTV89f6DBbFN0In
qPMDph4CUPw0a2Im5ZL0aQOZFSmlTJzhtYu5BI/QfPL5UHSPWUK+23nzcy5AmEW9
nyKGrP1ywcjU6raFSbBNvipOufjjrVEWXFslD217/FnsxIdX1TkMoeQ6BIAZFXsf
tP4lquMbkOqz8t8a99rNoIAR8ernuP4YdNEnWc8CZPtTdLDP6+XUzNZ6T2mtwO3a
FyhZ/NCOSBNz8mQ4MS1z0+mm6h+knLINpJRDdmFwxhszVvTyb1dPe9KiLOiyUyyH
a3lNKplqk7X7II2cvlsMrw9buCniDj393oKtbDnrpYe7nUZXE0LAdzJPEGZJ/Gng
2f6ESmiR8GeM2/jUSlLW0TENwUPi6OygyCGuqJ4R76IpgEJMRroK8VzqRdSau5ab
MCmIkBz4SHrEDRaIM2LjYqh1N6Ff8AtXyxJUbs5H7aRLkGhzuw68358qC39IVhMw
VfL7uwpR6iC17Hu4VxS2UHCzvldTe4RmUXwpoy4+9IfXCWm9uLknvgvy92v/0JF/
gLAy0DJxKk1MGSvlC53n7Ojcf2tlkRJFVMrlfnMhGZriKjG53SYwdTC15ebtcglN
T1EhgLY4FJiEwv5wro7SF+2RZXbLH1wg/56T1PmOvwVZNi45EUsspmQ0LeLkWYkz
C8f7qB/BChfrrk+ppxp9
=yLdW
-----END PGP SIGNATURE-----
--=-=-=--
