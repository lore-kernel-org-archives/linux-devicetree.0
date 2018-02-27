From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: RE: [PATCH 0/2] arm: Support for Renesas RZ/N1D (R9A06G032)
Date: Tue, 27 Feb 2018 13:10:36 +0000
Message-ID: <HK2PR0601MB1393B2D7E0C96590482C3726F5C00@HK2PR0601MB1393.apcprd06.prod.outlook.com>
References: <1519647518-15579-1-git-send-email-michel.pollet@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519647518-15579-1-git-send-email-michel.pollet@bp.renesas.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>
Cc: Michel Pollet <michel.pollet@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>Michel Pollet <michel.pollet@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Hi Simon,

On 26 February 2018, Michel Pollet wrote:
>=20
> This series adds the plain basic support for booting a bare
> kernel on the RZ/N1D-DB Board. It's been trimmed to the strict
> minimum as a 'base', further patches that will add the
> rest of the support, pinctrl, clock architecture and quite
> a few others.
I spoke to Magnus about helping to get the RZ/N1 patches upstream.
We're trying to sort out making the device manual and board schematics
available, hopefully it won't take too long. We're also trying to sort out
access to a board... that might take a bit longer.

btw, what do you want to do about shmobile_defconfig? Should we add
any changes needed for RZ/N1 to it? Note that only one IP block is the
same as R-Car.

Thanks
Phil
