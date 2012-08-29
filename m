From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v6 1/3] USB: chipidea: add imx usbmisc support
Date: Wed, 29 Aug 2012 10:55:14 +0800
Message-ID: <20120829025513.GB4011@b20223-02.ap.freescale.net>
References: <1346137109-32247-1-git-send-email-richard.zhao@freescale.com>
 <1346137109-32247-2-git-send-email-richard.zhao@freescale.com>
 <20120828145151.GJ10429@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120828145151.GJ10429-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: marex-ynQEQJNshbs@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 28, 2012 at 04:51:51PM +0200, Michael Grzeschik wrote:
> Hi,
> 
> On Tue, Aug 28, 2012 at 02:58:27PM +0800, Richard Zhao wrote:
> > i.MX usb controllers shares non-core registers, which may include
> > SoC specific controls. We take it as a usbmisc device and usbmisc
> > driver set operations needed by ci13xxx_imx driver.
> > 
> > For example, Sabrelite board has bad over-current design, we can
> > usbmisc to disable over-current detect.
> > 
> > Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > Acked-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> >  .../devicetree/bindings/usb/ci13xxx-imx.txt        |    5 +
> >  .../devicetree/bindings/usb/usbmisc-imx.txt        |   14 ++
> >  drivers/usb/chipidea/Makefile                      |    2 +-
> >  drivers/usb/chipidea/ci13xxx_imx.c                 |   64 ++++++++
> >  drivers/usb/chipidea/ci13xxx_imx.h                 |   28 ++++
> >  drivers/usb/chipidea/usbmisc_imx6q.c               |  162 ++++++++++++++++++++
> >  6 files changed, 274 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/devicetree/bindings/usb/usbmisc-imx.txt
> >  create mode 100644 drivers/usb/chipidea/ci13xxx_imx.h
> >  create mode 100644 drivers/usb/chipidea/usbmisc_imx6q.c
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt b/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
> > index 2c29041..5778b9c 100644
> > --- a/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
> > +++ b/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
> > @@ -7,7 +7,10 @@ Required properties:
> >  
> >  Optional properties:
> >  - fsl,usbphy: phandler of usb phy that connects to the only one port
> > +- fsl,usbmisc: phandler of non-core register device, with one argument
> > +  that indicate usb controller index
> >  - vbus-supply: regulator for vbus
> > +- disable-over-current: disable over current detect
> >  
> >  Examples:
> >  usb@02184000 { /* USB OTG */
> > @@ -15,4 +18,6 @@ usb@02184000 { /* USB OTG */
> >  	reg = <0x02184000 0x200>;
> >  	interrupts = <0 43 0x04>;
> >  	fsl,usbphy = <&usbphy1>;
> > +	fsl,usbmisc = <&usbmisc 0>;
> > +	disable-over-current;
> >  };
> > diff --git a/Documentation/devicetree/bindings/usb/usbmisc-imx.txt b/Documentation/devicetree/bindings/usb/usbmisc-imx.txt
> > new file mode 100644
> > index 0000000..97ce94e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/usbmisc-imx.txt
> > @@ -0,0 +1,14 @@
> > +* Freescale i.MX non-core registers
> > +
> > +Required properties:
> > +- #index-cells: Cells used to descibe usb controller index. Should be <1>
> > +- compatible: Should be one of below:
> > +	"fsl,imx6q-usbmisc" for imx6q
> > +- reg: Should contain registers location and length
> > +
> > +Examples:
> > +usbmisc@02184800 {
> > +	#index-cells = <1>;
> > +	compatible = "fsl,imx6q-usbmisc";
> > +	reg = <0x02184800 0x200>;
> > +};
> 
> i think we should have the devicetree-discuss Mailinglist in Cc: for
> that.
ccing devicetree-discuss ...

Thanks
Richard
> 
> Thanks,
> Michael
> 
> -- 
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
