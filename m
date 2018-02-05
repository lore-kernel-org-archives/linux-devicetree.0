From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx6q-bx50v3: Enable secure-reg-access
Date: Mon, 5 Feb 2018 13:27:00 +0800
Message-ID: <20180205052659.GA31354@dragon>
References: <20180115160722.17206-1-sebastian.reichel@collabora.co.uk>
 <20180202071819.GE25699@dragon>
 <20180202111004.mnv3elblyjxkbyzz@earth.universe>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180202111004.mnv3elblyjxkbyzz@earth.universe>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: Sascha Hauer <kernel@pengutronix.de>, Frank Li <Frank.li@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Ian Ray <ian.ray@ge.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 02, 2018 at 12:10:04PM +0100, Sebastian Reichel wrote:
> Hi,
> 
> On Fri, Feb 02, 2018 at 03:18:20PM +0800, Shawn Guo wrote:
> > + Frank
> > 
> > On Mon, Jan 15, 2018 at 05:07:22PM +0100, Sebastian Reichel wrote:
> > > From: Peter Senna Tschudin <peter.senna@collabora.com>
> > > 
> > > Add secure-reg-access on device tree include file for Bx50 devices
> > > to enable PMU and hardware counters for perf.
> > > 
> > > Signed-off-by: Peter Senna Tschudin <peter.senna@collabora.com>
> > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> > > ---
> > >  arch/arm/boot/dts/imx6q-bx50v3.dtsi | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
> > > index 86cfd4481e72..ccaaee83e2fa 100644
> > > --- a/arch/arm/boot/dts/imx6q-bx50v3.dtsi
> > > +++ b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
> > > @@ -43,6 +43,13 @@
> > >  #include "imx6q-ba16.dtsi"
> > >  
> > >  / {
> > > +	soc {
> > > +		pmu {
> > > +			compatible = "arm,cortex-a9-pmu";
> > > +			secure-reg-access;
> > 
> > I'm not sure this could be a board level configuration.  Shouldn't this
> > property just be added into pmu node in imx6qdl.dtsi?
> 
> This cannot become part of imx6qdl.dtsi for two reasons:
> 
> 1. It's not safe to be enabled on imx6qdl in secure state, see
>    excerpt from DT binding documentation below
> 2. We cannot enable it by default, since DTS format does not provide
>    a method to unset it in board files using a imx6qdl in secure
>    mode.
> 
> Here is an extract from the DT documentation for the PMU node:
> 
> - secure-reg-access : Indicates that the ARMv7 Secure Debug Enable Register
> 		      (SDER) is accessible. This will cause the driver to do
> 		      any setup required that is only possible in ARMv7 secure
> 		      state. If not present the ARMv7 SDER will not be touched,
> 		      which means the PMU may fail to operate unless external
> 		      code (bootloader or security monitor) has performed the
> 		      appropriate initialisation. Note that this property is
> 		      not valid for non-ARMv7 CPUs or ARMv7 CPUs booting Linux
> 		      in Non-secure state.
> 
> For B450v3, B650v3 and B850v3 it's safe to enable the bit and it
> improves debugging capabilities a lot.

Okay.  Then please label the pmu node in imx6qdl.dtsi and referencing
the node in board dts without duplicating soc node and compatible.

Shawn
