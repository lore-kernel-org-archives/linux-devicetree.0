From: Peter Chen <peter.chen@freescale.com>
Subject: Re: [PATCH v5 08/15] usb: phy-mxs: Add implementation of
 nofity_suspend and notify_resume
Date: Mon, 9 Dec 2013 17:00:42 +0800
Message-ID: <20131209090041.GA5291@shlinux1.ap.freescale.net>
References: <1386570664-6713-1-git-send-email-peter.chen@freescale.com>
 <1386570664-6713-9-git-send-email-peter.chen@freescale.com>
 <52A57FE0.5030009@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52A57FE0.5030009@pengutronix.de>
Sender: linux-doc-owner@vger.kernel.org
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: balbi@ti.com, shawn.guo@linaro.org, rob.herring@calxeda.com, grant.likely@linaro.org, alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 09, 2013 at 09:31:28AM +0100, Marc Kleine-Budde wrote:
> On 12/09/2013 07:30 AM, Peter Chen wrote:
> > Implementation of notify_suspend and notify_resume will be different
> > according to mxs_phy_data->flags.
> > 
> > Signed-off-by: Peter Chen <peter.chen@freescale.com>
> > ---
> >  drivers/usb/phy/phy-mxs-usb.c |   55 ++++++++++++++++++++++++++++++++++++++---
> >  1 files changed, 51 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> > index 0ef930a..e3df53f 100644
> > --- a/drivers/usb/phy/phy-mxs-usb.c
> > +++ b/drivers/usb/phy/phy-mxs-usb.c
> > @@ -166,8 +166,8 @@ static int mxs_phy_suspend(struct usb_phy *x, int suspend)
> >  static int mxs_phy_on_connect(struct usb_phy *phy,
> >  		enum usb_device_speed speed)
> >  {
> > -	dev_dbg(phy->dev, "%s speed device has connected\n",
> > -		(speed == USB_SPEED_HIGH) ? "high" : "non-high");
> > +	dev_dbg(phy->dev, "%s device has connected\n",
> > +		(speed == USB_SPEED_HIGH) ? "HS" : "FS/LS");
> 
> What about creating a mxs_phy_dbg() function that adds the "HS" "FS/LS"
> prefix when printing?
> 

No, sometimes, there is no speed information when we want to debug
mxs phy.

-- 

Best Regards,
Peter Chen

