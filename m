From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND PATCH V2] devicetree: Dialog Semiconductor consolidate
 existing vendor prefixes to standardise on 'dlg'
Date: Tue, 26 Aug 2014 10:33:12 +0100
Message-ID: <20140826093312.GI9574@lee--X1>
References: <201408221446.s7MEkNVF001775@swsrvapps-01.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201408221446.s7MEkNVF001775@swsrvapps-01.diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Opensource [Steve Twiss]" <stwiss.opensource@diasemi.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Arnaud Ebalard <arno@natisbad.org>, DEVICE TREE <devicetree@vger.kernel.org>, Florian Vaussard <florian.vaussard@epfl.ch>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Guenter Roeck <linux@roeck-us.net>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jason Cooper <jason@lakedaemon.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Jonathan Cameron <jic23@kernel.org>, Kumar Gala <galak@codeaurora.org>, LINUX ARM KERNEL <linux-arm-kernel@lists.infradead.org>, LINUX KERNEL <linux-kernel@vger.kernel.org>, LINUX SH <linux-sh@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Brown <broonie@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Martin Fuzzey <mfuzzey@parkeon.com>, Pawel Moll <pawel.moll@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Samu
List-Id: devicetree@vger.kernel.org

On Fri, 22 Aug 2014, Opensource [Steve Twiss] wrote:
> From: Steve Twiss <stwiss.opensource@diasemi.com>
>=20
> This patch series updates the device tree vendor prefix for
> Dialog Semiconductor.
>=20
> Various methods are currently used throughout the kernel: 'diasemi',
> 'dialog' and 'dlg'. Others have also been suggested.
>=20
> This patch set aims to consolidate the usage of the vendor prefix to
> use a common standard. The prefix 'dlg' is used.
>=20
> Acked-by: Simon Horman <horms+renesas@verge.net.au>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Shawn Guo <shawn.guo@freescale.com>
>=20
> Signed-off-by: Steve Twiss <stwiss.opensource@diasemi.com>
>=20
> ---

[...]

> Hi Lee,
>=20
> This is a resend according to requests for e-mail reformatting and re=
moval
> of '[]' in From: and Signed-off-by: tags. There are no patch alterati=
ons
> from RFC V2.
>=20
> I have got the Ack for the two remaining files r8a7790-lager.dts and
> r8a7791-koelsch.dts because of the previous request for SHMobile to A=
ck
> their part of the patch.
> - http://www.spinics.net/lists/arm-kernel/msg349289.html
> - https://lkml.org/lkml/2014/6/11/273
>=20
> I think this is it. But, if I am missing anything or there are proble=
ms, can
> I get a quick explanation in the reply so I can fix it and move forwa=
rds
> please?
>=20
> In full:
> Acked-by the following people so far:

When you say "so far", does that mean you're missing Acks still?

If you have the full-set I will apply this and send out the necessary
pull-request(s).

[...]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
