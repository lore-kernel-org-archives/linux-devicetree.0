From: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v3 1/2] bluetooth: btmrvl: register platform specific
 driver
Date: Tue, 16 Feb 2016 10:06:29 +0000
Message-ID: <fc36aec9296c4552acdd8bdf055d9180@SC-EXCH04.marvell.com>
References: <1454927231-17662-1-git-send-email-akarwar@marvell.com>
 <20160208220509.GA20229@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160208220509.GA20229@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org" <wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Tuesday, February 09, 2016 3:35 AM
> To: Amitkumar Karwar
> Cc: linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Nishant Sarmukadam;
> wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Xinming Hu
> Subject: Re: [PATCH v3 1/2] bluetooth: btmrvl: register platform
> specific driver
> 
> On Mon, Feb 08, 2016 at 02:27:10AM -0800, Amitkumar Karwar wrote:
> > From: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> >
> > Platform device and driver provide easy way to interact with
> > device-tree-enabled system.
> >
> > This patch registers platform driver and reorganise existing device
> > tree specific code.
> >
> > Signed-off-by: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > Signed-off-by: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > ---
> > v3: Add NULL check for 'btmrvl_plt_dev'
> > ---
> >  Documentation/devicetree/bindings/btmrvl.txt |  8 ++--
> 
> This needs to move somewhere else.
> 
> >  drivers/bluetooth/Makefile                   |  1 +
> >  drivers/bluetooth/btmrvl_drv.h               | 16 ++++++++
> >  drivers/bluetooth/btmrvl_main.c              |  8 +++-
> >  drivers/bluetooth/btmrvl_platform.c          | 60
> ++++++++++++++++++++++++++++
> >  5 files changed, 88 insertions(+), 5 deletions(-)  create mode 100644
> > drivers/bluetooth/btmrvl_platform.c
> >
> > diff --git a/Documentation/devicetree/bindings/btmrvl.txt
> > b/Documentation/devicetree/bindings/btmrvl.txt
> > index 58f964b..25b804b 100644
> > --- a/Documentation/devicetree/bindings/btmrvl.txt
> > +++ b/Documentation/devicetree/bindings/btmrvl.txt
> > @@ -3,7 +3,7 @@ btmrvl
> >
> >  Required properties:
> >
> > -  - compatible : must be "btmrvl,cfgdata"
> > +  - compatible : must be "marvell,btmrvl"
> 
> While the new name is less worse than the old one, I'm not inclined to
> take any changes for this binding because it is problematic. Given you
> don't care this is an incompatible change, then the binding can be
> completely redone.
> 
> It should reflect the actual chip name (e.g. sd8???) and be a child node
> of its connection to the host (a UART). See UART slave discussions.
> 
> >

I have corrected the name as per your inputs for WLAN driver and submitted updated version.
The connection here is not via UART. It's through SDIO bus. We will add it as a child node of MMC in DTSI config file.
Let me know if you have any further comments for the improvements.

Regards,
Amitkumar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
