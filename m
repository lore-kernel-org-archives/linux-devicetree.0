From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 2/2] usb: hub: use non-removable-ports DT property
Date: Mon, 18 Mar 2019 10:58:28 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1903181055310.1533-100000@iolanthe.rowland.org>
References: <yw1xlg1c1c3i.fsf@mansr.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <yw1xlg1c1c3i.fsf@mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 18 Mar 2019, [iso-8859-1] Måns Rullgård wrote:

> Mans Rullgard <mans@mansr.com> writes:
> 
> > Mark any ports listed in the non-removable-ports DT property as
> > hardwired. This is useful for boards with built-in USB devices
> > that cannot be (or have not been) marked as fixed in hardware.
> >
> > Signed-off-by: Mans Rullgard <mans@mansr.com>
> > ---
> >  drivers/usb/core/hub.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> 
> Any comments on these patches?
> 
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 3adff4da2ee1..44ac49a30be1 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -1328,6 +1328,9 @@ static int hub_configure(struct usb_hub *hub,
> >  	unsigned unit_load;
> >  	unsigned full_load;
> >  	unsigned maxchild;
> > +	struct property *prop;
> > +	const __be32 *cur;
> > +	u32 val;
> >
> >  	hub->buffer = kmalloc(sizeof(*hub->buffer), GFP_KERNEL);
> >  	if (!hub->buffer) {
> > @@ -1629,6 +1632,17 @@ static int hub_configure(struct usb_hub *hub,
> >  		}
> >  	}
> >
> > +	of_property_for_each_u32(hub_dev->of_node, "non-removable-ports",
> > +				 prop, cur, val) {
> > +		if (val < 1 || val > hdev->maxchild) {
> > +			dev_warn(hub_dev, "port number %u out of range\n", val);
> > +			continue;
> > +		}
> > +
> > +		hub->ports[val - 1]->connect_type =
> > +			USB_PORT_CONNECT_TYPE_HARD_WIRED;
> > +	}
> > +
> >  	usb_hub_adjust_deviceremovable(hdev, hub->descriptor);
> >
> >  	hub_activate(hub, HUB_INIT);
> > -- 
> > 2.20.1

This seems like a reasonable thing to do.  However, you should improve
the warning message; people who encounter it will have no idea what it
refers to.

Alan Stern
