Return-Path: <SRS0=lTJX=SA=opensource.cirrus.com=ckeepax@kernel.org>
Date: Fri, 29 Mar 2019 13:59:43 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v4 1/2] hwmon: lochnagar: Add device tree binding document
Message-ID: <20190329135943.GM46536@ediswmail.ad.cirrus.com>
References: <20190328130937.3756-1-ckeepax@opensource.cirrus.com>
 <20190328174615.GA6068@bogus>
 <20190329092236.GL46536@ediswmail.ad.cirrus.com>
 <CAL_JsqJDp_AftJ_J-gpJ4Spt7vUi7PQ-0uidJYB0PPVKfrhJXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJDp_AftJ_J-gpJ4Spt7vUi7PQ-0uidJYB0PPVKfrhJXg@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, Linux HWMON List <linux-hwmon@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org, patches@opensource.cirrus.com
List-ID: <devicetree@vger.kernel.org>

On Fri, Mar 29, 2019 at 08:28:35AM -0500, Rob Herring wrote:
> On Fri, Mar 29, 2019 at 4:22 AM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> > On Thu, Mar 28, 2019 at 12:46:15PM -0500, Rob Herring wrote:
> > > On Thu, Mar 28, 2019 at 01:09:36PM +0000, Charles Keepax wrote:
> > > > Lochnagar is an evaluation and development board for Cirrus
> > > > Logic Smart CODEC and Amp devices. It allows the connection of
> > > > most Cirrus Logic devices on mini-cards, as well as allowing
> > > > connection of various application processor systems to provide a
> > > > full evaluation platform. This driver supports the board
> > > > controller chip on the Lochnagar board.
> > > >
> > > > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > > > ---
> > > > +Example:
> > > > +
> > > > +lochnagar-hwmon {
> > > > +   compatible = "cirrus,lochnagar2-hwmon";
> > >
> > > You don't have any resources in DT, the parent MFD driver can just
> > > instantiate this child device.
> > >
> >
> > + Lee Jones
> >
> > Lee, was very very keen for me to not mix mfd_add_devices and
> > of_platform_populate in the MFD driver. As such we moved all the
> > sub-drivers into DT. I agree it is a little odd that this exists
> > only to bind in this driver but I think it is probably a bit late
> > to change that. If we were going to have the MFD instantiating
> > children directly a lot of the rest of the binding would have
> > been done very differently.
> 
> Okay. This is why I don't like incomplete examples...
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thank you, and apologies for that. I do not think it will
always be possible to include all the functionality in the
first sending, certainly from a code perspective. But we could
look at least to include some stubs/as much as we can foresee in
the binding document. Would that be the sort of direction you
had in mind?

Thanks,
Charles
