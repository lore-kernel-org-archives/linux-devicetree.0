From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 2/2] ARM: BCM5301X: Fix NAND ECC parameters for D-Link
 DIR-885L
Date: Wed, 6 Jul 2016 19:44:26 -0700
Message-ID: <577DC20A.1050906@gmail.com>
References: <1465199036-24366-1-git-send-email-zajec5@gmail.com>
 <1465199036-24366-2-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465199036-24366-2-git-send-email-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@armlinux.org.uk>, "open list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:BROADCOM BCM5301X ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Le 06/06/2016 00:43, Rafa=C5=82 Mi=C5=82ecki a =C3=A9crit :
> This device uses BCH-1 instead of BCH-8. This fixes ECC errors and ma=
kes
> NAND usable with brcmnand.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>

And also applied, thanks!
--=20
=46lorian
