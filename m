From: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v4 1/3] mwifiex: register platform specific driver
Date: Mon, 29 Feb 2016 14:04:44 +0000
Message-ID: <6e3955140c3d46e0ab3094432ae941ec@SC-EXCH04.marvell.com>
References: <1455614079-4263-1-git-send-email-akarwar@marvell.com>
 <20160218143803.GX9654@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160218143803.GX9654@rob-hp-laptop>
Content-Language: en-US
Sender: linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org" <wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Cathy Luo <cluo-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Thursday, February 18, 2016 8:08 PM
> To: Amitkumar Karwar
> Cc: linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Nishant Sarmukadam;
> wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Cathy Luo; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Xinming Hu
> Subject: Re: [PATCH v4 1/3] mwifiex: register platform specific driver
> 
> On Tue, Feb 16, 2016 at 01:14:37AM -0800, Amitkumar Karwar wrote:
> > From: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> >
> > Platform device and driver provides easy way to interact with
> > device-tree-enabled system.
> >
> > This patch registers platform driver and reorganise existing device
> > tree specific code. Corresponding device tree binding file is also
> > created.
> >
> > Signed-off-by: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > Signed-off-by: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > ---
> > v3: Don't update adapter->dt_node if mwifiex_plt_dev is NULL
> > v4: Corrected the 'name' and 'compatible' property names.(Arnd
> Bergmann and Rob
> >     Herring)
> >     Patch description wraped in 72 columns(Rob Herring)
> >     Moved DT binding file to bindings/net/wireless/(Rob Herring)
> > ---

Thanks for reviewing mwifiex and btmrvl patch series.
We are working on a updated version which will address your review comments.

Regards,
Amitkumar
