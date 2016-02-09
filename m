From: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v3 1/3] mwifiex: register platform specific driver
Date: Tue, 9 Feb 2016 14:00:04 +0000
Message-ID: <5347bd8a22ab4fc78ccc5d5d80cbd4b0@SC-EXCH04.marvell.com>
References: <1454926528-17480-1-git-send-email-akarwar@marvell.com>
 <20160208215614.GB9036@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160208215614.GB9036@rob-hp-laptop>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org" <wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for your review.

> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Tuesday, February 09, 2016 3:26 AM
> To: Amitkumar Karwar
> Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Nishant Sarmukadam;
> wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Xinming Hu
> Subject: Re: [PATCH v3 1/3] mwifiex: register platform specific driver
> 
> On Mon, Feb 08, 2016 at 02:15:26AM -0800, Amitkumar Karwar wrote:
> > From: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> >
> > Platform device and driver provides easy way to interact with
> > device-tree-enabled system.
> >
> > This patch registers platform driver and reorganise existing device
> > tree specific code.
> > Corresponding device tree binding file is also created.
> 
> Wrap you lines at 72 columns.

Ack.

> > Signed-off-by: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > Signed-off-by: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > ---
> > v3: Don't update adapter->dt_node if mwifiex_plt_dev is NULL
> > ---
> >  Documentation/devicetree/bindings/mwifiex.txt      | 29 +++++++++++
> 
> This doesn't belong at top level of bindings. bindings/net/wireless/
> 
> Also, mwifiex is a linux driver name. Name it after the chips.
> marvell-sd8xxx?

Sure. I will rename as marvell-sd8xxx and move it to bindings/net/wireless/

> 
> >  drivers/net/wireless/marvell/mwifiex/Makefile      |  1 +
> >  drivers/net/wireless/marvell/mwifiex/main.c        |  2 +
> >  drivers/net/wireless/marvell/mwifiex/main.h        | 14 +++++
> >  .../net/wireless/marvell/mwifiex/platform_drv.c    | 59
> ++++++++++++++++++++++
> >  drivers/net/wireless/marvell/mwifiex/sta_cmd.c     |  6 +--
> >  drivers/net/wireless/marvell/mwifiex/sta_ioctl.c   |  2 +-
> >  7 files changed, 109 insertions(+), 4 deletions(-)  create mode
> > 100644 Documentation/devicetree/bindings/mwifiex.txt
> >  create mode 100644
> > drivers/net/wireless/marvell/mwifiex/platform_drv.c
> >
> > diff --git a/Documentation/devicetree/bindings/mwifiex.txt
> > b/Documentation/devicetree/bindings/mwifiex.txt
> > new file mode 100644
> > index 0000000..39b6a74
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mwifiex.txt
> > @@ -0,0 +1,29 @@
> > +mwifiex
> > +------
> > +
> > +Required properties:
> > +
> > +  - name : must be "mwifiex"
> > +  - compatible : must be "marvell,mwifiex"
> 
> The naming should be named after the actual chip.

Ok. How about having names as below?

+  - name : can be "sd8897", "sd8787" or "sd8797"
+  - compatible : must be "marvell,sd8xxx"

> 
> > +
> > +Optional properties:
> > +
> > +  - mwifiex,caldata* : A series of properties with marvell,caldata
> > + prefix,
> 
> mwifiex is not a vendor.

Got it. We will use "marvell,caldata*" here.

> 
> > +  		      represent Calibration data downloaded to the device
> during
> > +		      initialization. This is an array of unsigned values.
> > +
> > +
> > +Example:
> > +
> > +Tx power limit calibration data is configured in below example.
> > +The calibration data is an array of unsigned values, the length can
> > +vary between hw versions.
> > +
> > +mwifiex {
> 
> These chips are SDIO devices, right? This should be a child node of the
> SDIO controller.
> 

Yes. They are SDIO devices. We will have the node as child node of SDIO controller.

Regards,
Amitkumar Karwar
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
