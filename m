Return-Path: <SRS0=NEUt=R6=linux.intel.com=sakari.ailus@kernel.org>
Date: Wed, 27 Mar 2019 12:02:50 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v2 1/1] device property: Add
 fwnode_graph_get_endpoint_by_id
Message-ID: <20190327100250.xjdgg5o3sk5puzx3@paasikivi.fi.intel.com>
References: <20190316113605.12928-1-sakari.ailus@linux.intel.com>
 <CAJZ5v0iNA3VVV_W+wSSJ0wzuByNUwpiEcMatuOT+f7dvQtPBkw@mail.gmail.com>
 <CAJZ5v0hqzBiLWLCPa5tnTzbayNZ5HOy=gxt_VU_0QQFjHbt6hA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hqzBiLWLCPa5tnTzbayNZ5HOy=gxt_VU_0QQFjHbt6hA@mail.gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Herring <robh@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Rafael,

On Wed, Mar 27, 2019 at 10:42:23AM +0100, Rafael J. Wysocki wrote:
...
> > > + */
> > > +enum fwnode_graph_get_endpoint_flags {
> > > +       FWNODE_GRAPH_ENDPOINT_NEXT      = 0x00000001,
> >
> > BIT(1) ?
> >
> > > +       FWNODE_GRAPH_DEVICE_DISABLED    = 0x00000002,
> >
> > BIT(2) ?
> >
> > > +};
> 
> Actually, enum types are not particularly suitable for flags in my
> view, because something like
> 
> FWNODE_GRAPH_ENDPOINT_NEXT | FWNODE_GRAPH_DEVICE_DISABLED
> 
> is not really defined within the enum type, for example.
> 
> It's better to #define the flags IMO and use unsigned int as the type.

Enums can have better kerneldoc documentation; that's been the reasoning to
make flags fields enums in e.g. V4L2 kAPI. In C it's still valid use of
enums even if the value isn't any value listen in an enum as such.

Anyway, I'll switch to #define and make the comment just a regular comment
if you prefer that.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
