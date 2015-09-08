From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v2 1/9] ARM: dts: imx6dql-nitrogen6x: add touchscreen
 support
Date: Tue, 8 Sep 2015 21:33:57 +0100
Message-ID: <20150908203357.GD21084@n2100.arm.linux.org.uk>
References: <1441645069-27263-1-git-send-email-gary.bisson@boundarydevices.com>
 <1441722886-22798-1-git-send-email-gary.bisson@boundarydevices.com>
 <1441722886-22798-2-git-send-email-gary.bisson@boundarydevices.com>
 <1441723760.3241.26.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1441723760.3241.26.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 08, 2015 at 04:49:20PM +0200, Philipp Zabel wrote:
> Am Dienstag, den 08.09.2015, 16:34 +0200 schrieb Gary Bisson:
> > This patch adds the different touchscreens that can be connected using
> > the displays available for this board.
> > http://boundarydevices.com/product-category/displays/
> > 
> > Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
> > index ad16dce..24b667d 100644
> > --- a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
> > +++ b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
> > @@ -284,6 +284,22 @@
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_i2c3>;
> >  	status = "okay";
> > +
> > +	egalax_ts@04 {
> 
> I'd prefer to use generic names for the nodes, such as "touchscreen@04",
> and "touchscreen@38" below.

ePAPR actually says that the node name should be the general class of
the device, and recommending that it should be generic:

2.2.1.1 Node Name Requirements
...
The node-name shall start with a lower or uppercase character and should
describe the general class of device.

2.2.2 Generic Names Recommendation
The name of a node should be somewhat generic, reflecting the function of
the device and not its precise programming model. If appropriate, the name
should be one of the following choices: ...

It would be nice if more bindings followed this.

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
