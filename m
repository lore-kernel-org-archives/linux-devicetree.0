Return-Path: <SRS0=V/0G=F3=linux.intel.com=heikki.krogerus@kernel.org>
Date: Mon, 5 Mar 2018 11:53:46 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2 03/12] staging: typec: tcpci: support port config
 passed via dt
Message-ID: <20180305095346.GB10598@kuha.fi.intel.com>
References: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
 <1519645759-12701-4-git-send-email-jun.li@nxp.com>
 <20180226140604.GD25535@kuha.fi.intel.com>
 <VI1PR0402MB3917FFA57640C5B4B7030FA789C10@VI1PR0402MB3917.eurprd04.prod.outlook.com>
 <20180227110302.GE25535@kuha.fi.intel.com>
 <VI1PR0402MB39176A73FBA147B7F1153EA389DA0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR0402MB39176A73FBA147B7F1153EA389DA0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
To: Jun Li <jun.li@nxp.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "a.hajda@samsung.com" <a.hajda@samsung.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "yueyao@google.com" <yueyao@google.com>, Peter Chen <peter.chen@nxp.com>, "garsilva@embeddedor.com" <garsilva@embeddedor.com>, "o_leveque@orange.fr" <o_leveque@orange.fr>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Mar 05, 2018 at 08:53:00AM +0000, Jun Li wrote:
> > On Mon, Feb 26, 2018 at 02:30:53PM +0000, Jun Li wrote:
> > > > > +	child = of_get_child_by_name(tcpci->dev->of_node, "connector");
> > > > > +	if (!child) {
> > > > > +		dev_err(tcpci->dev, "failed to get connector node.\n");
> > > > > +		return -EINVAL;
> > > > > +	}
> > > >
> > > > Why do you need separate child node for the connector? You will
> > > > always have only one connector per tcpc, i.e. the tcpci already
> > > > represents the connector and all its capabilities.
> > > >
> > > This is my original idea, my understanding is Rob expects those
> > > properties should apply for a common usb connector node[1], that way I
> > > need add a child node for it, sorry I didn't make the dt-binding
> > > patches come first in this series, please see patch 10,11.
> > >
> > > [1]
> > >
> > https://emea01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpat
> > >
> > chwork.kernel.org%2Fpatch%2F10231447%2F&data=02%7C01%7Cjun.li%40
> > nxp.co
> > >
> > m%7Ce37ed8b084374e241d2e08d57dd1b02a%7C686ea1d3bc2b4c6fa92cd9
> > 9c5c30163
> > >
> > 5%7C0%7C0%7C636553261972212376&sdata=hSNiAfXoTTzK3TjjkjWo7OJL7
> > %2B3gDHT
> > > I8NO0FQviDd4%3D&reserved=0
> > 
> > But was the idea really to put properties like the TCPC capabilities under the
> > usb connector child node? That will force us to extract the same properties
> > in two different methods in every USB Type-C driver. One extracting them
> > from DT, and another from other FW interfaces and build-in properties.
> > 
> > To avoid that, let's just expect to get these properties in the node for tcpc,
> > not the usb connector child.
> 
> I misunderstood it's better to put typec props under connector node in all cases
> so we can have a unified typec description. As Rob comments that's only required
> for multiple connectors for one controller, not for simple connector like my case,
> I will put those props under tcpc node.

Hold on! I was not considering multi-port PD/Type-C controllers.

I'm wrong about the child node forcing us to have two methods for
extracting the properties in the drivers. It does mean we can not use
device_property* functions as the child node is not (yet) bind to any
struct device, but we can still use fwnode_property* functions, which
is fine.

So it actually does make sense to define those properties for the
"connector" node instead of TCPC parent. They are generic "Type-C"
properties (right?), so we may want to use them with multiport
devices as well.


Br,

-- 
heikki
