From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH V2] ARM: BCM5301X: Specify PHY of USB 2.0 in DT
Date: Fri, 22 Jul 2016 13:01:39 -0700
Message-ID: <5483f72a-1840-cde3-5d10-0b23e3f77fc9@gmail.com>
References: <1464808585-14996-1-git-send-email-zajec5@gmail.com>
 <1464811627-12218-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464811627-12218-1-git-send-email-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@armlinux.org.uk>, "open list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:BROADCOM BCM5301X ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 06/01/2016 01:07 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> Driver for Northstar USB 2.0 PHY was added in 4.7-rc1 by:
> commit d3feb4067335 ("phy: bcm-ns-usb2: new driver for USB 2.0 PHY on
> Northstar").
> It should be used to let EHCI platform driver init PHY.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>

Applied, thanks
--=20
=46lorian
