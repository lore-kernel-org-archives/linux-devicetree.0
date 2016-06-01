From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: BCM5301X: Enable SPI-NOR on dual flash devices
Date: Wed, 1 Jun 2016 12:26:33 -0700
Message-ID: <574F36E9.6030400@gmail.com>
References: <1461740704-21501-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461740704-21501-1-git-send-email-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "open list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 04/27/2016 12:05 AM, Rafa=C5=82 Mi=C5=82ecki wrote:
> Commit 1b47b98acce2 ("ARM: BCM5301X: Add DT entry for SPI controller =
and
> NOR flash") enabled SPI-NOR device on routers using serial flash only=
=2E
> However there are also devices with two flash memories:
> 1) Small SPI attached flash used mostly for booting
> 2) Bigger NAND used mostly for storing firmware
> On such devices we still need SPI-NOR e.g. to access NVRAM data.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>

Applied, thanks!
