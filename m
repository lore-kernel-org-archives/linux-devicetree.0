From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH] ARM: shmobile: r7s72100: Enable L2 cache
Date: Mon, 6 Feb 2017 14:13:09 +0000
Message-ID: <SG2PR06MB1165ABE474EDB227522FCF148A400@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170202212000.10768-1-chris.brandt@renesas.com>
 <20170206082525.GB13441@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170206082525.GB13441@verge.net.au>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Simon,

On Monday, February 06, 2017, Simon Horman wrote:
> is it possible to apply the .dtsi and .c portions of this change
> separately and still get sane behaviour at each step?
>=20
> If so I would like to request that this patch be split into two patches,
> one for .c and one for .dtsi. This will allow me to apply the patches to
> separate branches which will in turn make it easier for me to get the
> change accepted.

OK, no problem.

I tried thinking about which way you guys would want it...I had a 50/50
shot...I picked the wrong one ;)


Chris
