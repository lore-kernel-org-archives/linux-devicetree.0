From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM i.MX53: add dts for the TQ tqma53 module
Date: Wed, 9 Jan 2013 09:32:24 +0100
Message-ID: <20130109083224.GA15443@pengutronix.de>
References: <1357571760-487-1-git-send-email-s.trumtrar@pengutronix.de>
 <1357571760-487-3-git-send-email-s.trumtrar@pengutronix.de>
 <20130109034809.GA11790@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130109034809.GA11790-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 09, 2013 at 11:48:11AM +0800, Shawn Guo wrote:
> On Mon, Jan 07, 2013 at 04:16:00PM +0100, Steffen Trumtrar wrote:
> > From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > 
> > The tqma53 is an embedded module that has some features on board (e.g. emmc),
> > but mostly just provides access to them on its interface.
> > Going along with the imx53.dtsi, the tqma53.dtsi specifies the existing
> > devices and their pinctrl for this module. All devices that are not on the
> > module are disabled by default and need to be enabled in a baseboard DT.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/imx53-tqma53.dtsi |  207 +++++++++++++++++++++++++++++++++++
> 
> Please add the dtb target into arch/arm/boot/dts/Makefile.
> 
> ...

Ah, yes. Forgot that.

> 
> > +			usbphy1: usbphy@1 {
> > +				compatible = "nop-usbphy";
> 
> Is this compatible something kernel is actually using?
> 

It is used in mainline imx25.dtsi, but maybe got there by mistake. The according
patches are floating around for a while AFAIK, but haven't made it into mainline.

I am reworking the patch according to Saschas comment and will throw everything
out, that has no mainline driver. I will also include a baseboard .dts, that uses
this .dtsi.

Regards,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
