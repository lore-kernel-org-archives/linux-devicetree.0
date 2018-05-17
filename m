Return-Path: <SRS0=LyHo=IE=linux.intel.com=heikki.krogerus@kernel.org>
Date: Thu, 17 May 2018 17:24:20 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v5 05/14] usb: typec: add API to get typec basic port
 power and data config
Message-ID: <20180517142420.GH11469@kuha.fi.intel.com>
References: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
 <1525307094-27402-6-git-send-email-jun.li@nxp.com>
 <c28a8352-e960-449b-e7c1-7965d340536e@gmail.com>
 <VI1PR0402MB3917CE86B45CBC1B6F7F576B899C0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
 <74e1c164-1652-75f4-409c-bd1c214bda4d@gmail.com>
 <20180516122527.GC11469@kuha.fi.intel.com>
 <33d02e76-bdf2-be50-68ec-9d520acdbe82@gmail.com>
 <20180517123506.GF11469@kuha.fi.intel.com>
 <VI1PR0402MB39179F63BCF3E605443D877389910@VI1PR0402MB3917.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR0402MB39179F63BCF3E605443D877389910@VI1PR0402MB3917.eurprd04.prod.outlook.com>
To: Jun Li <jun.li@nxp.com>
Cc: Mats Karrman <mats.dev.list@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "a.hajda@samsung.com" <a.hajda@samsung.com>, "cw00.choi@samsung.com" <cw00.choi@samsung.com>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>, Peter Chen <peter.chen@nxp.com>, "gsomlo@gmail.com" <gsomlo@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, May 17, 2018 at 02:05:41PM +0000, Jun Li wrote:
> Hi Heikki,
> 
> > > I reread this patch and tried to see it more in the context of the
> > > other patches and the existing code. The naming of the existing string
> > > tables doesn't help in getting this right, however I have a proposal:
> > >
> > > typec_find_port_power_role() to get to TYPEC_PORT_SRC/SNK/DRP
> > > typec_find_port_data_role() to get to TYPEC_PORT_DFP/UFP/DRD
> > > typec_find_power_role() to get to TYPEC_SINK/SOURCE
> > >
> > > and sometime, if the use should arise
> > >
> > > typec_find_data_role() to get to TYPEC_DEVICE/HOST
> > >
> > > I think it is fairly comprehensible, *_port_* concerns a capability
> > > and without *_port_* it is an actual state. Plus it matches the names
> > > of the constants.
> > 
> > Well, there are now four things to consider:
> > 
> > 1) the roles (power and data) the port is capable of supporting
> > 2) Try.SRC and Try.SNK, i.e. the preferred role
> > 3) the current roles
> > 4) the role(s) the user want's to limit the use of a port with DRP ports
> > 
> > The last one I don't know if it's relevant with these functions. It's not
> > information that we would get for example from firmware.
> > 
> > I also don't think we need to use these functions with the current roles the port
> > is in.
> > 
> > If the preferred role is "sink" or "source", so just like the power role, we don't
> > need separate function for it here.
> > 
> > So isn't two functions all we need here: one for the power and one for data
> > role?
> 
> Take power as an example, can we use one function to only look up
> typec_port_types[]? as capability(typec_port_type) and state(typec_role)
> are different enum, and the allowed strings are different.
> 
> static const char * const typec_roles[] = {
> 	[TYPEC_SINK]    = "sink",
> 	[TYPEC_SOURCE]  = "source",
> };
> 
> static const char * const typec_port_types[] = {
> 	[TYPEC_PORT_SRC] = "source",
> 	[TYPEC_PORT_SNK] = "sink",
> 	[TYPEC_PORT_DRP] = "dual",
> };

Where out side the class code we need to convert the current role, the
"state", with these functions?


Thanks,

-- 
heikki
