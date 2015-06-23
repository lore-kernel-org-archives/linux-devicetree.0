From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6] usb: common: add API to set usb otg capabilities by
 device tree
Date: Tue, 23 Jun 2015 14:56:06 +0300
Message-ID: <20150623145606.f3f617586c9253036c4d6022@ti.com>
References: <1434590302-18066-1-git-send-email-jun.li@freescale.com>
	<20150618103650.7c3d1b8ceb134388b0d8b093@ti.com>
	<20150618084747.GD15280@shlinux2>
	<20150618150748.db2217278ae71f01df625ff2@ti.com>
	<20150618133703.GF15280@shlinux2>
	<20150622124122.a3155a04430083b24d775aa4@ti.com>
	<20150622104535.GA25349@shlinux2>
	<20150622163256.418a1b05d9848a7342669fe4@ti.com>
	<20150622143638.GC25349@shlinux2>
	<20150623104328.5aac8e83bc23050c7541aee8@ti.com>
	<20150623083548.GD25349@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150623083548.GD25349@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

+ Kukjin, Stephen,

for board specific USB question.

On Tue, 23 Jun 2015 16:35:49 +0800
Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> On Tue, Jun 23, 2015 at 10:43:28AM +0300, Roger Quadros wrote:
> > > > 
> > > > If the dr_mode was "otg" for such case and we want OTG disabled then it is really the DT fault.
> > > 
> > > It's ID pin detect for dual role switch as many current OTG controllers have.
> > > not DT fault, its dt only has a dr_mode = "otg".
> > > 
> > > > We don't need to tackle this case. Just fix up the DT to dr_mode = "peripheral" if
> > > > OTG behaviour is not needed.
> > > > 
> > > OTG behaviour is not needed, so we need disable HNP/SRP/ADP. but dr_mode =
> > > "otg" as it already works fine with ID pin detect.
> > 
> > Do you know which platform has plain non-otg dual-role working as of today
> > with dr_mode set to "otg"?
> 
> I don't know.
> The dt property dr_mode is already there, and currently there are some platforms
> as its user, so I assume those platforms either are non-otg dual-role, or real OTG
> with HNP supported, I guess most are the former cases; chipidea is the later case.
> 
> > For TI platforms none of them have it working currently.
> > 
> So for Ti platforms, some enables non-otg dual-role function but do not use
> dr_mode = "otg"?

for TI we have only musb based and dwc3 based platforms. MUSB based are OTG.
dwc3 doesn't support dual-role or OTG yet so we use either "peripheral" or "Host"

> 
> For those only have non-otg dual-role platforms, no matter using dr_mode or not,
> we need keep it's real OTG disabled for legacy users after it's controller
> driver adds real OTG later.

I wouldn't even bother about platforms expecting dual-role behaviour
with dr_mode not set to "otg". That is just plain wrong and can't be supported.

These are the dts files having dr_mode == "otg".
I've sorted them as per Soc vendor and USB controller

Freescale:
----------
powerpc/boot/dts/mpc5121.dtsi:			dr_mode = "otg";
	compatible = "fsl,mpc5121-usb2-dr";
powerpc/boot/dts/asp834x-redboot.dts:			dr_mode = "otg";
	compatible = "fsl-usb2-dr"
powerpc/boot/dts/mpc834x_mds.dts:			dr_mode = "otg";
	compatible = "fsl-usb2-dr";
powerpc/boot/dts/mpc8349emitxgp.dts:			dr_mode = "otg";
	compatible = "fsl-usb2-dr";

arm/boot/dts/imx25-pdk.dts:	dr_mode = "otg";
	compatible = "fsl,imx25-usb", "fsl,imx27-usb";
arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard.dts:	dr_mode = "otg";
	compatible = "fsl,imx25-usb", "fsl,imx27-usb";
arm/boot/dts/imx27-eukrea-cpuimx27.dtsi:	dr_mode = "otg";
	compatible = "fsl,imx27-usb";
arm/boot/dts/imx27-phytec-phycore-som.dtsi:	dr_mode = "otg";
	compatible = "fsl,imx27-usb";
arm/boot/dts/imx27-pdk.dts:	dr_mode = "otg";
	compatible = "fsl,imx27-usb";
arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dts:	dr_mode = "otg";
	compatible = "fsl,imx35-usb", "fsl,imx27-usb";
arm/boot/dts/imx51-eukrea-mbimxsd51-baseboard.dts:	dr_mode = "otg";
	compatible = "fsl,imx51-usb", "fsl,imx27-usb";
arm/boot/dts/imx51-babbage.dts:	dr_mode = "otg";
	compatible = "fsl,imx51-usb", "fsl,imx27-usb";
arm/boot/dts/imx51-digi-connectcore-jsk.dts:	dr_mode = "otg";
	compatible = "fsl,imx51-usb", "fsl,imx27-usb";
arm/boot/dts/imx6dl-riotboard.dts:	dr_mode = "otg";
	compatible = "fsl,imx6q-usb", "fsl,imx27-usb";

Li, can you please comment on all the above Freesacle platforms?

STE:
---
arm/boot/dts/ste-dbx5x0.dtsi:			dr_mode = "otg";
	compatible = "stericsson,db8500-musb";

MUSB so legacy OTG.

TI:
---
arm/boot/dts/am33xx.dtsi:				dr_mode = "otg";
	compatible = "ti,musb-am33xx";

MUSB so legacy OTG.

arm/boot/dts/dra7.dtsi:				dr_mode = "otg";
	compatible = "snps,dwc3";	/* board dts overrides to dr_mode = "peripheral" or "host" */
arm/boot/dts/dra74x.dtsi:				dr_mode = "otg";
	compatible = "snps,dwc3";	/* board dts overrides to dr_mode = "peripheral" or "host" */
arm/boot/dts/am4372.dtsi:				dr_mode = "otg";
	compatible = "snps,dwc3";	/* board dts overrides to dr_mode = "peripheral" or "host" */
arm/boot/dts/am4372.dtsi:				dr_mode = "otg";
	compatible = "snps,dwc3";	/* board dts overrides to dr_mode = "peripheral" or "host" */

All these will eventually use dr_mode = "otg" with all 3 disable flags for simple dual-role operation.

Samsung
-------
arm/boot/dts/exynos5422-odroidxu3.dts:	dr_mode = "otg";
	compatible = "snps,dwc3";

I think that this board expects dual-role only behaviour. But that is not functional for DWC3.
Kukjin/Felipe, any comment?

Nvidia
------
arm/boot/dts/tegra20-seaboard.dts:		dr_mode = "otg";
	compatible = "nvidia,tegra20-ehci", "usb-ehci";
arm/boot/dts/tegra30-colibri-eval-v3.dts:		dr_mode = "otg";
	compatible = "nvidia,tegra30-ehci", "usb-ehci";

I couldn't find gadget side implementation for this.
Stephen, any comments on whether this board supports true OTG operation or just dual-role operation?

Cambridge Silicon
-----------------
arm/boot/dts/atlas7.dtsi:				dr_mode = "otg";
	compatible = "sirf,atlas7-usb";

I couldn't find the USB controller driver for this.

cheers,
-roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
