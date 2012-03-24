From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v2 1/1] ARM: imx28: add basic dt support
Date: Sat, 24 Mar 2012 19:01:19 +0000
Message-ID: <20120324190119.B5E643E0ACD@localhost>
References: <1332513070-5400-1-git-send-email-b29396@freescale.com>
 <201203231543.54588.marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201203231543.54588.marek.vasut@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Vasut <marek.vasut@gmail.com>, Dong Aisheng <b29396@freescale.com>
Cc: devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, s.hauer@pengutronix.de, shawn.guo@freescale.com
List-Id: devicetree@vger.kernel.org

On Fri, 23 Mar 2012 15:43:54 +0100, Marek Vasut <marek.vasut@gmail.com> wrote:
> Dear Dong Aisheng,
> 
> > From: Dong Aisheng <dong.aisheng@linaro.org>
> > 
> > This patch includes basic dt support which can boot via nfs rootfs.
> > 
> > Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>
> > ---
> > ChangeLog v1->v2:
> >  * Some fixes addressed Rob's review comments.
> >    Remove using of OF_DEV_AUXDATA.
> >  * Remove mac address from dts file
> >    Currently we use the mac address got from uboot to work.
> >    Will submit a p separate atch using prom_update_property to fix this
> >    issue for driver based on suggestions from Grant and Lothar.
> >  * rename mxs-dt.c to mach-mxs.c which is supposed to support mx23 dt
> >    too in the future.
> >  * add compatible string "fsl,imx28" per Sascha's suggestion
> >  * add more devices in dtsi file
> >    For those devices still not in use, set the state to "disabled"
> >    by default.
> > 
> > For other patches i sent with this in the first series like mmc and sdma
> > dt support, i will send out them separately since this patch does not
> > depend on them and does not block you to run dt via nfs rootfs.
> > ---
> >  Documentation/devicetree/bindings/arm/fsl.txt |    4 +
> >  arch/arm/boot/dts/imx28-evk.dts               |   35 +++
> 
> Isn't this supposed to be "mx28evk.dts"?
> 
> >  arch/arm/boot/dts/imx28.dtsi                  |  358
> > +++++++++++++++++++++++++ arch/arm/mach-mxs/Kconfig                     | 
> >   8 +
> >  arch/arm/mach-mxs/Makefile                    |    1 +
> >  arch/arm/mach-mxs/clock-mx28.c                |    4 +
> >  arch/arm/mach-mxs/mach-mxs.c                  |   69 +++++
> >  7 files changed, 479 insertions(+), 0 deletions(-)
> >  create mode 100644 arch/arm/boot/dts/imx28-evk.dts
> >  create mode 100644 arch/arm/boot/dts/imx28.dtsi
> >  create mode 100644 arch/arm/mach-mxs/mach-mxs.c
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/fsl.txt
> > b/Documentation/devicetree/bindings/arm/fsl.txt index 54bddda..9f21faf
> > 100644
> > --- a/Documentation/devicetree/bindings/arm/fsl.txt
> > +++ b/Documentation/devicetree/bindings/arm/fsl.txt
> > @@ -1,6 +1,10 @@
> >  Freescale i.MX Platforms Device Tree Bindings
> >  -----------------------------------------------
> > 
> > +i.MX28 Evaluation Kit
> > +Required root node properties:
> > +    - compatible = "fsl,imx28-evk", "fsl,imx28";
> > +
> >  i.MX51 Babbage Board
> >  Required root node properties:
> >      - compatible = "fsl,imx51-babbage", "fsl,imx51";
> > diff --git a/arch/arm/boot/dts/imx28-evk.dts
> > b/arch/arm/boot/dts/imx28-evk.dts new file mode 100644
> > index 0000000..5402495
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/imx28-evk.dts
> > @@ -0,0 +1,35 @@
> > +/*
> > + * Copyright 2012 Freescale Semiconductor, Inc.
> > + *
> > + * The code contained herein is licensed under the GNU General Public
> > + * License. You may obtain a copy of the GNU General Public License
> > + * Version 2 or later at the following locations:
> > + *
> > + * http://www.opensource.org/licenses/gpl-license.html
> > + * http://www.gnu.org/copyleft/gpl.html
> > + */
> > +
> > +/dts-v1/;
> > +/include/ "imx28.dtsi"
> > +
> > +/ {
> > +	model = "Freescale i.MX28 Evaluation Kit";
> > +	compatible = "fsl,imx28-evk", "fsl,imx28";
> > +
> > +	memory {
> > +		device_type = "memory";
> > +		reg = <0x40000000 0x08000000>;
> > +	};
> > +
> > +	ahb@80080000 {
> > +		ethernet@800f0000 {
> 
> fec@... would be more readable, but I think this was decided before to be like 
> this?

ethernet@... is the correct naming.

> 
> > +			phy-mode = "rmii";
> > +			status = "okay";
> > +		};
> > +
> 
> [...]
> 
> > diff --git a/arch/arm/mach-mxs/Makefile b/arch/arm/mach-mxs/Makefile
> > index 908bf9a..8328c45 100644
> > --- a/arch/arm/mach-mxs/Makefile
> > +++ b/arch/arm/mach-mxs/Makefile
> > @@ -7,6 +7,7 @@ obj-$(CONFIG_PM) += pm.o
> >  obj-$(CONFIG_SOC_IMX23) += clock-mx23.o
> >  obj-$(CONFIG_SOC_IMX28) += clock-mx28.o
> > 
> > +obj-$(CONFIG_MACH_MXS_DT) += mach-mxs.o
> >  obj-$(CONFIG_MACH_STMP378X_DEVB) += mach-stmp378x_devb.o
> >  obj-$(CONFIG_MACH_MX23EVK) += mach-mx23evk.o
> >  obj-$(CONFIG_MACH_MX28EVK) += mach-mx28evk.o
> > diff --git a/arch/arm/mach-mxs/clock-mx28.c
> > b/arch/arm/mach-mxs/clock-mx28.c index 5d68e41..88ed30c 100644
> > --- a/arch/arm/mach-mxs/clock-mx28.c
> > +++ b/arch/arm/mach-mxs/clock-mx28.c
> > @@ -671,6 +671,10 @@ static struct clk_lookup lookups[] = {
> >  	_REGISTER_CLOCK("imx28-fb", NULL, lcdif_clk)
> >  	_REGISTER_CLOCK("mxs-saif.0", NULL, saif0_clk)
> >  	_REGISTER_CLOCK("mxs-saif.1", NULL, saif1_clk)
> > +	/* for DT */
> > +	_REGISTER_CLOCK("80074000.serial", NULL, uart_clk)
> > +	_REGISTER_CLOCK("800f0000.ethernet", NULL, fec_clk)
> > +	_REGISTER_CLOCK("800f4000.ethernet", NULL, fec_clk)
> 
> Wasn't the DT stuff supposed to be more symbolic? Aka. this seems weird.

Indeed.  It is a symptom of the common clock and DT clock bindings not
being merged yet.  Expect this to be able to be removed in a couple of
kernel releases.

g.
