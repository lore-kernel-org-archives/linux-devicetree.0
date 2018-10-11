Return-Path: <SRS0=EJCs=MX=gmail.com=dmitry.torokhov@kernel.org>
Date: Wed, 10 Oct 2018 17:52:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH resend v2 1/2] Input: touchscreen DT binding - add
 touchscreen-min-x and -min-y properties
Message-ID: <20181011005243.GC173303@dtor-ws>
References: <20180731111958.20043-1-hdegoede@redhat.com>
 <20180731111958.20043-2-hdegoede@redhat.com>
 <20180803003101.GA118981@dtor-ws>
 <6f1b0575-87e7-3443-9080-5abfd8e6c726@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f1b0575-87e7-3443-9080-5abfd8e6c726@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, robh@kernel.org, devicetree@vger.kernel.org, linux-input@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Hans,

Sorry, now I was being slow as well.

On Thu, Sep 20, 2018 at 07:31:43PM +0200, Hans de Goede wrote:
> Hi,
> 
> I completely missed this mail earlier, sorry.
> 
> Thank you Benjamin for pointing this out to me.
> 
> On 03-08-18 02:31, Dmitry Torokhov wrote:
> > Hi Hans,
> > 
> > On Tue, Jul 31, 2018 at 01:19:57PM +0200, Hans de Goede wrote:
> > > Some touchscreens, depending on the firmware and/or the digitizer report
> > > coordinates which never reach 0 along one or both of their axis.
> > > 
> > > This has been seen for example on the Silead touchscreens on a Onda V891w
> > > and a Point of View mobii TAB-P800w(v2.0).
> > > 
> > > This commits documents 2 new touchscreen properties for communicating
> > > the minimum reported values to the OS: touchscreen-min-x and -min-y.
> > > 
> > > This commit also drop the (in pixels) comment from the documentation
> > > of the touchscreen-size-x and touchscreen-size-y properties. This comment
> > > suggests that there is a relation between the range of reported
> > > coordinates and the display resolution, which is only true for some
> > > devices. The (in pixels) comment is replaced with "(maximum x coordinate
> > > reported + 1)" to mirror the language describing the new touchscreen-min-x
> > > and -min-y properties.
> > 
> > I am concerned that people will not read the documentation carefully and
> > will treat it as true size, since it is what in the name. Maybe we
> > should say that it is size of usable area, in device units, and that
> > maximum reported coordinate is "touchscreen-min-x + touchscreen-size-x -
> > 1"?
> 
> Not sure what you mean with "true size" but in the implementation
> from this series, the maximum coordinated reported is (touchscreen-size-x - 1)
> not (touchscreen-min-x + touchscreen-size-x - 1) as you suggest.
> 
> Basically what this series does is set:
> 
> input_absinfo.minimum to the new touchscreen-min-x value (or 0 if not specified)
> input_absinfo.maximum to touchscreen-size-x - 1 as we've always done.
> 
> So the usable range / the range mapping from one screen edge to the other is:
> 
> touchscreen-min-x - (touchscreen-size-x - 1)
> 
> Which matches with the dt bindings doc after this patch, which
> reads after this patch:
> 
>  - touchscreen-min-x		: minimum x coordinate reported (0 if not set)
>  - touchscreen-min-y		: minimum y coordinate reported (0 if not set)
>  - touchscreen-size-x		: horizontal resolution of touchscreen
> 				  (maximum x coordinate reported + 1)
>  - touchscreen-size-y		: vertical resolution of touchscreen
> 				  (maximum y coordinate reported + 1)
> 
> I hope this clarifies things and if you want to change anything let
> me know.

Right, except that my concern is that people do not read documentation,
and therefore will not realize that touchscreen-size-x is not the "true"
what I called it, or what you call usable range, but rather maximum
coordinate (-1).  IOW I am concerned that if we have a device with
640x480 screen for example, and touch controller reporting coordinates
with offset of 20, someone will specify:

touchscreen-min-x = 20
touchscreen-size-x = 640 (because that's their screen size)

and will not notice for some reason and later quirk it in their
software.

So I was asking if we should accommodate this, and actually set up max
on axis as "touchscreen-min-x + touchscreen-size-x - 1". It will still
be compatible with current bindings (having effectively min of 0), but
to me better reflects the name of the parameter - size of the screen.

Please let me know if this makes any sense to you.

Thanks.

-- 
Dmitry
