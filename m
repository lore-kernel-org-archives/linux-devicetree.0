Return-Path: <SRS0=vUhH=HW=suse.com=oneukum@kernel.org>
Message-ID: <1525339063.12348.4.camel@suse.com>
Subject: Re: [PATCH v5 01/14] dt-bindings: connector: add properties for
 typec
From: Oliver Neukum <oneukum@suse.com>
Date: Thu, 03 May 2018 11:17:43 +0200
In-Reply-To: <VI1PR0402MB3917DA4B3789475540E38E4989870@VI1PR0402MB3917.eurprd04.prod.outlook.com>
References: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
	 <1525307094-27402-2-git-send-email-jun.li@nxp.com>
	 <1525332431.12348.1.camel@suse.com>
	 <VI1PR0402MB3917DA4B3789475540E38E4989870@VI1PR0402MB3917.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Jun Li <jun.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux@roeck-us.net" <linux@roeck-us.net>
Cc: "gsomlo@gmail.com" <gsomlo@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>, "a.hajda@samsung.com" <a.hajda@samsung.com>, "cw00.choi@samsung.com" <cw00.choi@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Am Donnerstag, den 03.05.2018, 08:35 +0000 schrieb Jun Li:
> Hi
> > -----Original Message-----
> > From: Oliver Neukum [mailto:oneukum@suse.com]
> > Sent: 2018年5月3日 15:27
> > To: Jun Li <jun.li@nxp.com>; robh+dt@kernel.org;
> > heikki.krogerus@linux.intel.com; gregkh@linuxfoundation.org;
> > linux@roeck-us.net
> > Cc: gsomlo@gmail.com; dl-linux-imx <linux-imx@nxp.com>; Peter Chen
> > <peter.chen@nxp.com>; shufan_lee@richtek.com; a.hajda@samsung.com;
> > cw00.choi@samsung.com; devicetree@vger.kernel.org;
> > linux-usb@vger.kernel.org
> > Subject: Re: [PATCH v5 01/14] dt-bindings: connector: add properties for typec
> > 
> > Am Donnerstag, den 03.05.2018, 08:24 +0800 schrieb Li Jun:
> > > +Optional properties for usb-c-connector:
> > > +- power-role: should be one of "source", "sink" or "dual"(DRP) if
> > > +typec
> > > +  connector has power support.
> > > +- try-power-role: preferred power role if "dual"(DRP) can support
> > > +Try.SNK
> > > +  or Try.SRC, should be "sink" for Try.SNK or "source" for Try.SRC.
> > > +- data-role: should be one of "host", "device", "dual"(DRD) if typec
> > > +  connector supports USB data.
> > 
> > Hi,
> > 
> > is this really correct?
> > 
> > Can one implement a device that can operate as either DFP or UFP, but not
> > implements the dynamic role switch that a DRP must support?
> 
> You mean a port with DRD on data but not DRP on power?
> 
> The data-role is newly added as the data role is not coupled with power

No, I meant data role. As far as I can tell for a DRP you need to
implement the detection logic described in chapter 4 of the spec.
I can see no reason why you couldn't build a port that can be switched
between the data roles but not implement that logic.

	Regards
		Oliver
