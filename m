From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCHv2 7/8] ARM: dts: imx6: add support for more Ka-Ro
 electronics modules
Date: Thu, 31 Mar 2016 08:29:44 +0200
Message-ID: <20160331082944.3f604423@ipc1.ka-ro>
References: <1457424244-14549-1-git-send-email-LW@KARO-electronics.de>
	<1457424244-14549-8-git-send-email-LW@KARO-electronics.de>
	<20160331061023.GO28207@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160331061023.GO28207@tiger>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Dan Williams <dan.j.williams@intel.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Vinod Koul <vinod.koul@intel.com>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, 31 Mar 2016 14:10:23 +0800 Shawn Guo wrote:
> On Tue, Mar 08, 2016 at 09:04:03AM +0100, Lothar Wa=C3=9Fmann wrote:
> > Add support for the following i.MX6 based modules from Ka-Ro
> > electronics GmbH:
> > TX6S-8034:
> > Processor    Freescale i.MX 6 Solo, 800MHz
> > RAM          256MiB DDR3 SDRAM
> > ROM          128MiB NAND Flash
> > Power supply Single 3.1V to 5.5V
> > Size         31mm SO-DIMM
> > Temp. Range  industrial grade (-40=C2=B0C/-25=C2=B0C to 105=C2=B0C =
Tj)
> >=20
> > TX6S-8035:
> > Processor    Freescale i.MX 6 Solo, 800MHz
> > RAM          512MiB DDR3 SDRAM
> > ROM          4GiB eMMC
> > Power supply Single 3.1V to 5.5V
> > Size         31mm SO-DIMM
> > Temp. Range  industrial grade (-40=C2=B0C/-25=C2=B0C to 105=C2=B0C =
Tj)
> >=20
> > TX6U-8033:
> > Processor    Freescale i.MX 6 Dual Lite, 800MHz
> > RAM          1GiB DDR3 SDRAM
> > ROM          4GiB eMMC
> > Power supply Single 3.1V to 5.5V
> > Size         31mm SO-DIMM
> > Temp. Range  industrial grade (-40=C2=B0C/-25=C2=B0C to 105=C2=B0C =
Tj)
> >=20
> > TX6Q-1036:
> > Processor    Freescale i.MX 6Quad, 1GHz
> > RAM          1GB DDR3 SDRAM 64-bit
> > ROM          8GiB eMMC
> > Power supply Single 3.1V to 5.5V
> > Size         31mm SO-DIMM
> > Temp. Range  Extended Consumer Grade (-20=C2=B0C to 105=C2=B0C Tj)
> >=20
> > Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
> > ---
> >  arch/arm/boot/dts/Makefile             |   4 +
> >  arch/arm/boot/dts/imx6dl-tx6s-8034.dts | 249 +++++++++++++++++++++=
+++++++
> >  arch/arm/boot/dts/imx6dl-tx6s-8035.dts | 246 +++++++++++++++++++++=
++++++
> >  arch/arm/boot/dts/imx6dl-tx6u-8033.dts | 248 +++++++++++++++++++++=
++++++
> >  arch/arm/boot/dts/imx6q-tx6q-1036.dts  | 295 +++++++++++++++++++++=
++++++++++++
> >  5 files changed, 1042 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/imx6dl-tx6s-8034.dts
> >  create mode 100644 arch/arm/boot/dts/imx6dl-tx6s-8035.dts
> >  create mode 100644 arch/arm/boot/dts/imx6dl-tx6u-8033.dts
> >  create mode 100644 arch/arm/boot/dts/imx6q-tx6q-1036.dts
> >=20
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefil=
e
> > index 072294f..71b5cd3 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -320,6 +320,9 @@ dtb-$(CONFIG_SOC_IMX6Q) +=3D \
> >  	imx6dl-sabrelite.dtb \
> >  	imx6dl-sabresd.dtb \
> >  	imx6dl-tx6dl-comtft.dtb \
> > +	imx6dl-tx6s-8034.dtb \
> > +	imx6dl-tx6s-8035.dtb \
> > +	imx6dl-tx6u-8033.dtb \
>=20
> imx6dl-tx6u-8033.dtb should go after imx6dl-tx6u-801x.dtb?
>=20
Of course. I obviously missed this when dropping the patch to rename
the dtb files which you rejected.


NB: There is no need to quote the full original mail when you have no
further comments on the remaining part. This would save people
from having to scroll through the mail needlessly looking for further
comments.


Lothar Wa=C3=9Fmann
