From: Peter Chen <peter.chen@freescale.com>
Subject: Re: [Patch v2 01/14] usb: doc: phy-mxs: Add more compatible strings
Date: Wed, 23 Oct 2013 14:17:22 +0800
Message-ID: <20131023061721.GD8534@shlinux1.ap.freescale.net>
References: <1382421528-17897-1-git-send-email-peter.chen@freescale.com>
 <1382421528-17897-2-git-send-email-peter.chen@freescale.com>
 <20131023055557.GE2839@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131023055557.GE2839@S2101-09.ap.freescale.net>
Sender: linux-doc-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: balbi@ti.com, rob.herring@calxeda.com, grant.likely@linaro.org, alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 23, 2013 at 01:56:00PM +0800, Shawn Guo wrote:
> On Tue, Oct 22, 2013 at 01:58:35PM +0800, Peter Chen wrote:
> > Since there are three mxs PHY versions, using three compatible
> > strings for them.
> > 
> > Signed-off-by: Peter Chen <peter.chen@freescale.com>
> > ---
> >  Documentation/devicetree/bindings/usb/mxs-phy.txt |    6 +++++-
> >  1 files changed, 5 insertions(+), 1 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/mxs-phy.txt b/Documentation/devicetree/bindings/usb/mxs-phy.txt
> > index 5835b27..912d4ad 100644
> > --- a/Documentation/devicetree/bindings/usb/mxs-phy.txt
> > +++ b/Documentation/devicetree/bindings/usb/mxs-phy.txt
> > @@ -1,7 +1,11 @@
> >  * Freescale MXS USB Phy Device
> >  
> >  Required properties:
> > -- compatible: Should be "fsl,imx23-usbphy"
> > +- compatible: there are three compatiable strings to stand for three
> > +mxs PHY verions.
> > +"fsl,imx23-usbphy": for mx23 and mx28
> > +"fsl,imx6q-usbphy": for mx6q and mx6dl
> > +"fsl,imx6sl-usbphy": for mx6sl and later mx6 soc serial
> 
> Also, please use string 'imx' rather than 'mx' for consistency.
> 

Thanks, will change your two comments.

-- 

Best Regards,
Peter Chen

