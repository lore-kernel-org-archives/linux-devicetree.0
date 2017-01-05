From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCHv2 0/5] Support for Marvell switches with integrated CPUs
Date: Thu, 5 Jan 2017 19:46:43 +0000
Message-ID: <059c78eaa7dd40c9a46cb08616bae2eb@svr-chch-ex1.atlnz.lc>
References: <20170105033641.6212-1-chris.packham@alliedtelesis.co.nz>
 <6c6795d3-06ab-a4f0-78ad-5ecc78c1aa2f@gmail.com>
 <185147a37cab4d7eaea5f79d86cc9451@svr-chch-ex1.atlnz.lc>
 <20170105130945.GA18033@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Florian Fainelli <f.fainelli@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Jason Cooper <jason@lakedaemon.net>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>, Sudeep Holla <sudeep.holla@arm.com>, Juri Lelli <juri.lelli@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Laxman
List-Id: devicetree@vger.kernel.org

On 06/01/17 02:10, Andrew Lunn wrote:=0A=
>> I'd love to see a switchdev driver but it's a huge task (and no I'm not=
=0A=
>> committing to writing it). As it stands Marvell ship a switch SDK=0A=
>> largely executes in userspace with a small kernel module providing some=
=0A=
>> linkage to the underlying hardware.=0A=
>=0A=
> Is there any similarity to the mv88e6xxx family?=0A=
>=0A=
> If it was similar registers, just a different access mechanising, we=0A=
> could probably extend the mv88e6xxx to support MMIO as well as MDIO.=0A=
=0A=
No the prestera family of devices are considerably more powerful (and =0A=
complex) than the linkstreet devices.=0A=
