From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v2] clk: si570: Add a driver for SI570 oscillators
Date: Thu, 19 Sep 2013 13:59:38 -0700
Message-ID: <86ee8eea-7a98-443b-a156-46f3db1f9678@CO1EHSMHS031.ehs.local>
References: <1379544219-23579-1-git-send-email-soren.brinkmann@xilinx.com>
 <20130919131712.GB24088@roeck-us.net>
 <6401b71c-8c18-4735-8b40-9692cd788336@VA3EHSMHS037.ehs.local>
 <20130919164438.GA7461@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130919164438.GA7461@roeck-us.net>
Sender: linux-doc-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Mike Turquette <mturquette@linaro.org>, Grant Likely <grant.likely@linaro.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Hyun Kwon <hyunk@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 19, 2013 at 09:44:38AM -0700, Guenter Roeck wrote:
> On Thu, Sep 19, 2013 at 09:01:01AM -0700, S=C3=B6ren Brinkmann wrote:
> > On Thu, Sep 19, 2013 at 06:17:12AM -0700, Guenter Roeck wrote:
> > > On Wed, Sep 18, 2013 at 03:43:38PM -0700, Soren Brinkmann wrote:
[...]
> > > > +	if (of_property_read_bool(client->dev.of_node,
> > > > +				"temperature-stability-7ppm"))
> > > > +		data->div_offset =3D SI570_DIV_OFFSET_7PPM;
> > > > +
> > > Just noticed that you dropped platform data support. Doesn't matt=
er much for me
> > > right now, but in my previous company we used the chip on an x86 =
system which
> > > does not support devicetree. Would be nice to keep it and derive =
platform data
> > > from devicetree data if provided, like other drivers do it.
> > I'll look into this. The issue I have with that is, I can hardly te=
st it
> > since we only use this on Zynq which uses DT. So, I'd rather prefer=
 to
> > not include it unless somebody volunteers to test it.
> >=20
> Fair enough. I can not test it myself anymore, and my previous employ=
er
> now has a strict non-contributions-to-linux policy, so I guess they w=
on't
> test it either or at least not publish any test results. Leave it out=
=2E
>=20
> > > The 7ppm option is only relevant for si570/si751 and not supporte=
d on
> > > si598/si599. You should mention that in the bindings document and=
 check for it.
> > Right, I'll add a note in the doc. And ignore it for devices this d=
oes
> > not apply.
> >=20
> I would bail out, but that is your call.
Correct me if I'm wrong, but in general drivers do not test for
unsupported properties. So, in case we have one of the supported 59x
device, we should not test whether a (unsupported) property is present,
just to fail in that case, IMHO.

[...]
> > > > +	if (!of_property_read_u32(client->dev.of_node, "clock-frequen=
cy",
> > > > +				&initial_fout)) {
> > > > +		err =3D clk_set_rate(clk, initial_fout);
> > > > +		if (err)
> > > > +			dev_warn(&client->dev,
> > > > +					"unable to set initial output frequency %u: %d\n",
> > > > +					initial_fout, err);
> > >=20
> > > No bailout ?
> > >=20
> > > Also it seems that this generates two error messages, once in the=
 code which
> > > experiences the error and once here.
> > I remove the message here.
> >=20
> > >=20
> > > Maybe it would be better to just bail out and return the error.
> > > After all, something is seriously wrong and the system won't oper=
ate
> > > as specified.
> > I do more think of a spurious error (typo in DT prop giving an f ou=
t of
> > range,...)  and a driver actually controlling this clock generator =
later.
> > In that case later calls to clk_set_rate() might succeed and everyt=
hing's
> > fine or the driver can handle the error. In case of using this devi=
ce as
> > a fixed clock, bailing out here might make more sense though. I'd p=
refer
> > leaving it like this.
> >=20
> A typo in dt data isn't really a spurious error, and it would be easy=
 to fix.
> I would suggest to bail out; this ensures that the devicetree data is=
 correct.
Okay, bailing out it is.

	S=C3=B6ren


