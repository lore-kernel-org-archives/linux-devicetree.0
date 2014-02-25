From: Peter Chen <Peter.Chen@freescale.com>
Subject: RE: [PATCH v11 09/15] usb: phy: Add set_wakeup API
Date: Tue, 25 Feb 2014 02:03:26 +0000
Message-ID: <a887d9e37b63456d8e224196357f0460@BL2PR03MB226.namprd03.prod.outlook.com>
References: <1393208467-6355-1-git-send-email-peter.chen@freescale.com>
 <1393208467-6355-10-git-send-email-peter.chen@freescale.com>
 <530B9243.4020909@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <530B9243.4020909@cogentembedded.com>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "balbi@ti.com" <balbi@ti.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "festevam@gmail.com" <festevam@gmail.com>, "marex@denx.de" <marex@denx.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "m.grzeschik@pengutronix.de" <m.grzeschik@pengutronix.de>, "Frank.Li@freescale.com" <Frank.Li@freescale.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


 
> On 02/24/2014 05:21 AM, Peter Chen wrote:
> 
> > This API is used to set wakeup enable at PHY registers, in that case,
> > the PHY can be waken up from suspend due to external events, like vbus
> > change, dp/dm change and id change.
> 
> > Signed-off-by: Peter Chen <peter.chen@freescale.com>
> > ---
> >   include/linux/usb/phy.h |   16 ++++++++++++++++
> >   1 files changed, 16 insertions(+), 0 deletions(-)
> 
> > diff --git a/include/linux/usb/phy.h b/include/linux/usb/phy.h index
> > 6c0b1c5..c2c6f49 100644
> > --- a/include/linux/usb/phy.h
> > +++ b/include/linux/usb/phy.h
> > @@ -111,6 +111,13 @@ struct usb_phy {
> >   	int	(*set_suspend)(struct usb_phy *x,
> >   				int suspend);
> >
> > +	/*
> > +	 * Set wakeup enable for PHY, in that case, the PHY can be
> > +	 * waken up from suspend status due to external events,
> 
>     s/waken/woken/
> 
> WBR, Sergei
> 
> 

Thanks, will change.

Peter

