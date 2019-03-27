Return-Path: <SRS0=o39O=R6=gmail.com=rjwysocki@kernel.org>
MIME-Version: 1.0
References: <20190316113605.12928-1-sakari.ailus@linux.intel.com>
 <CAJZ5v0iNA3VVV_W+wSSJ0wzuByNUwpiEcMatuOT+f7dvQtPBkw@mail.gmail.com>
 <CAJZ5v0hqzBiLWLCPa5tnTzbayNZ5HOy=gxt_VU_0QQFjHbt6hA@mail.gmail.com> <20190327100250.xjdgg5o3sk5puzx3@paasikivi.fi.intel.com>
In-Reply-To: <20190327100250.xjdgg5o3sk5puzx3@paasikivi.fi.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 27 Mar 2019 11:38:39 +0100
Message-ID: <CAJZ5v0gG3grvECRcan4N2KpWwb+ODvR9wPzd4NYbGm+n4SpzWQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] device property: Add fwnode_graph_get_endpoint_by_id
Content-Type: text/plain; charset="UTF-8"
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 27, 2019 at 11:02 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Rafael,
>
> On Wed, Mar 27, 2019 at 10:42:23AM +0100, Rafael J. Wysocki wrote:
> ...
> > > > + */
> > > > +enum fwnode_graph_get_endpoint_flags {
> > > > +       FWNODE_GRAPH_ENDPOINT_NEXT      = 0x00000001,
> > >
> > > BIT(1) ?
> > >
> > > > +       FWNODE_GRAPH_DEVICE_DISABLED    = 0x00000002,
> > >
> > > BIT(2) ?
> > >
> > > > +};
> >
> > Actually, enum types are not particularly suitable for flags in my
> > view, because something like
> >
> > FWNODE_GRAPH_ENDPOINT_NEXT | FWNODE_GRAPH_DEVICE_DISABLED
> >
> > is not really defined within the enum type, for example.
> >
> > It's better to #define the flags IMO and use unsigned int as the type.
>
> Enums can have better kerneldoc documentation; that's been the reasoning to
> make flags fields enums in e.g. V4L2 kAPI. In C it's still valid use of
> enums even if the value isn't any value listen in an enum as such.
>
> Anyway, I'll switch to #define and make the comment just a regular comment
> if you prefer that.

I do.

I did something like that with device links flags, for example.
