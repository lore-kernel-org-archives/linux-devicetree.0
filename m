Return-Path: <SRS0=LyHo=IE=linux.intel.com=heikki.krogerus@kernel.org>
Date: Thu, 17 May 2018 15:35:06 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v5 05/14] usb: typec: add API to get typec basic port
 power and data config
Message-ID: <20180517123506.GF11469@kuha.fi.intel.com>
References: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
 <1525307094-27402-6-git-send-email-jun.li@nxp.com>
 <c28a8352-e960-449b-e7c1-7965d340536e@gmail.com>
 <VI1PR0402MB3917CE86B45CBC1B6F7F576B899C0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
 <74e1c164-1652-75f4-409c-bd1c214bda4d@gmail.com>
 <20180516122527.GC11469@kuha.fi.intel.com>
 <33d02e76-bdf2-be50-68ec-9d520acdbe82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33d02e76-bdf2-be50-68ec-9d520acdbe82@gmail.com>
To: Mats Karrman <mats.dev.list@gmail.com>
Cc: Jun Li <jun.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "a.hajda@samsung.com" <a.hajda@samsung.com>, "cw00.choi@samsung.com" <cw00.choi@samsung.com>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>, Peter Chen <peter.chen@nxp.com>, "gsomlo@gmail.com" <gsomlo@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, May 16, 2018 at 10:55:36PM +0200, Mats Karrman wrote:
> Hi,
> 
> On 05/16/2018 02:25 PM, Heikki Krogerus wrote:
> 
> > Hi guys,
> >
> > On Tue, May 15, 2018 at 10:52:57PM +0200, Mats Karrman wrote:
> >> Hi,
> >>
> >> On 05/14/2018 11:36 AM, Jun Li wrote:
> >>
> >>> Hi
> >>>> -----Original Message-----
> >>>> From: Mats Karrman [mailto:mats.dev.list@gmail.com]
> >>>> Sent: 2018???5???12??? 3:56
> >>>> To: Jun Li <jun.li@nxp.com>; robh+dt@kernel.org; gregkh@linuxfoundation.org;
> >>>> heikki.krogerus@linux.intel.com; linux@roeck-us.net
> >>>> Cc: a.hajda@samsung.com; cw00.choi@samsung.com;
> >>>> shufan_lee@richtek.com; Peter Chen <peter.chen@nxp.com>;
> >>>> gsomlo@gmail.com; devicetree@vger.kernel.org; linux-usb@vger.kernel.org;
> >>>> dl-linux-imx <linux-imx@nxp.com>
> >>>> Subject: Re: [PATCH v5 05/14] usb: typec: add API to get typec basic port power
> >>>> and data config
> >>>>
> >>>> Hi Li Jun,
> >>>>
> >>>> On 2018-05-03 02:24, Li Jun wrote:
> >>>>
> >>>>> This patch adds 3 APIs to get the typec port power and data type, and
> >>>>> preferred power role by its name string.
> >>>>>
> >>>>> Signed-off-by: Li Jun <jun.li@nxp.com>
> >>>>> ---
> >>>>>   drivers/usb/typec/class.c | 52
> >>>> +++++++++++++++++++++++++++++++++++++++++++++++
> >>>>>   include/linux/usb/typec.h |  3 +++
> >>>>>   2 files changed, 55 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> >>>>> index 53df10d..5981e18 100644
> >>>>> --- a/drivers/usb/typec/class.c
> >>>>> +++ b/drivers/usb/typec/class.c
> >>>>> @@ -9,6 +9,7 @@
> >>>>>   #include <linux/device.h>
> >>>>>   #include <linux/module.h>
> >>>>>   #include <linux/mutex.h>
> >>>>> +#include <linux/property.h>
> > I don't think you need that anymore.
> >
> >>>>>   #include <linux/slab.h>
> >>>>>   #include <linux/usb/typec.h>
> >>>>>   #include <linux/usb/typec_mux.h>
> >>>>> @@ -802,6 +803,12 @@ static const char * const typec_port_types[] = {
> >>>>>   	[TYPEC_PORT_DRP] = "dual",
> >>>>>   };
> >>>>>
> >>>>> +static const char * const typec_data_types[] = {
> >>>>> +	[TYPEC_PORT_DFP] = "host",
> >>>>> +	[TYPEC_PORT_UFP] = "device",
> >>>>> +	[TYPEC_PORT_DRD] = "dual",
> >>>>> +};
> >>>>> +
> >>>>>   static const char * const typec_port_types_drp[] = {
> >>>>>   	[TYPEC_PORT_SRC] = "dual [source] sink",
> >>>>>   	[TYPEC_PORT_SNK] = "dual source [sink]", @@ -1252,6 +1259,51
> >>>> @@
> >>>>> void typec_set_pwr_opmode(struct typec_port *port,
> >>>>>   }
> >>>>>   EXPORT_SYMBOL_GPL(typec_set_pwr_opmode);
> >>>>>
> >>>>> +/**
> >>>>> + * typec_find_power_type - Get the typec port power type
> >>>> Why is this function called typec_find_power_type() and not
> >>>> typec_find_port_type()?
> >>>> It's called port_type in sysfs, having different names just adds confusion.
> >>>> (Otherwise I agree power_type is a better name but...)
> >>> We have "port type" before the power and data role separation,
> >>> this API name's intention is to reflect the power cap, anyway I
> >>> leave this to be decided by Heikki then.
> > I really hate the "*_type" naming. It was understandable when there
> > was no separate power and data roles defined in the specification, but
> > now that there are, it's just confusing. IMO we should not use it
> > anywhere.
> >
> > So to me typec_find_type() is just as bad as typec_find_power_type()
> > because it has the "type" in it. I wonder if this function is
> > necessary at all? If it is, then perhaps we can think of some better
> > name for it, name that gives a better hint what it is used for.
> 
> I reread this patch and tried to see it more in the context of the other
> patches and the existing code. The naming of the existing string tables
> doesn't help in getting this right, however I have a proposal:
> 
> typec_find_port_power_role() to get to TYPEC_PORT_SRC/SNK/DRP
> typec_find_port_data_role() to get to TYPEC_PORT_DFP/UFP/DRD
> typec_find_power_role() to get to TYPEC_SINK/SOURCE
> 
> and sometime, if the use should arise 
> 
> typec_find_data_role() to get to TYPEC_DEVICE/HOST
> 
> I think it is fairly comprehensible, *_port_* concerns a capability and
> without *_port_* it is an actual state. Plus it matches the names of the
> constants.

Well, there are now four things to consider:

1) the roles (power and data) the port is capable of supporting
2) Try.SRC and Try.SNK, i.e. the preferred role
3) the current roles
4) the role(s) the user want's to limit the use of a port with DRP ports

The last one I don't know if it's relevant with these functions. It's
not information that we would get for example from firmware.

I also don't think we need to use these functions with the current
roles the port is in.

If the preferred role is "sink" or "source", so just like the power
role, we don't need separate function for it here.

So isn't two functions all we need here: one for the power and one for
data role?


Thanks,

-- 
heikki
