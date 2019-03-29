MIME-Version: 1.0
Date: Fri, 29 Mar 2019 08:28:35 -0500
References: <20190328130937.3756-1-ckeepax@opensource.cirrus.com>
	<20190328174615.GA6068@bogus>
	<20190329092236.GL46536@ediswmail.ad.cirrus.com>
In-Reply-To: <20190329092236.GL46536@ediswmail.ad.cirrus.com>
Message-ID: <CAL_JsqJDp_AftJ_J-gpJ4Spt7vUi7PQ-0uidJYB0PPVKfrhJXg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] hwmon: lochnagar: Add device tree binding document
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Lee Jones <lee.jones@linaro.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, Linux HWMON List <linux-hwmon@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org, patches@opensource.cirrus.com
List-ID: <devicetree@vger.kernel.org>

On Fri, Mar 29, 2019 at 4:22 AM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Thu, Mar 28, 2019 at 12:46:15PM -0500, Rob Herring wrote:
> > On Thu, Mar 28, 2019 at 01:09:36PM +0000, Charles Keepax wrote:
> > > Lochnagar is an evaluation and development board for Cirrus
> > > Logic Smart CODEC and Amp devices. It allows the connection of
> > > most Cirrus Logic devices on mini-cards, as well as allowing
> > > connection of various application processor systems to provide a
> > > full evaluation platform. This driver supports the board
> > > controller chip on the Lochnagar board.
> > >
> > > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > > ---
> > > +Required properties:
> > > +
> > > +  - compatible : One of the following strings:
> > > +                 "cirrus,lochnagar2-hwmon"
> > > +
> > > +Example:
> > > +
> > > +lochnagar-hwmon {
> > > +   compatible = "cirrus,lochnagar2-hwmon";
> >
> > You don't have any resources in DT, the parent MFD driver can just
> > instantiate this child device.
> >
>
> + Lee Jones
>
> Lee, was very very keen for me to not mix mfd_add_devices and
> of_platform_populate in the MFD driver. As such we moved all the
> sub-drivers into DT. I agree it is a little odd that this exists
> only to bind in this driver but I think it is probably a bit late
> to change that. If we were going to have the MFD instantiating
> children directly a lot of the rest of the binding would have
> been done very differently.

Okay. This is why I don't like incomplete examples...

Reviewed-by: Rob Herring <robh@kernel.org>
