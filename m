From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RFC PATCH] [media]: of: move graph helpers from
	drivers/media/v4l2-core to drivers/of
Date: Sat, 8 Mar 2014 11:54:32 +0000
Message-ID: <20140308115432.GW21483@n2100.arm.linux.org.uk>
References: <1392119105-25298-1-git-send-email-p.zabel@pengutronix.de> <CAL_Jsq+U9zU1i+STLHMBjY5BeEP6djYnJVE5X1ix-D2q_zWztQ@mail.gmail.com> <20140217181451.7EB7FC4044D@trevor.secretlab.ca> <20140218070624.GP17250@pengutronix.de> <20140218162627.32BA4C40517@trevor.secretlab.ca> <1393263389.3091.82.camel@pizza.hi.pengutronix.de> <20140226110114.CF2C7C40A89@trevor.secretlab.ca> <1393426129.3248.64.camel@paszta.hi.pengutronix.de> <20140307170550.1DFB2C40A0D@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140307170550.1DFB2C40A0D@trevor.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robherring2@gmail.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Philipp Zabel <philipp.zabel@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 08, 2014 at 01:05:50AM +0800, Grant Likely wrote:
> On Wed, 26 Feb 2014 15:48:49 +0100, Philipp Zabel <p.zabel@pengutroni=
x.de> wrote:
> > Or two separate display controllers with two parallel outputs each,=
 a
> > 4-port multiplexer, and an encoder (e.g. lvds):
> >=20
> > 	,------------------.
> > 	| display    [port@0]--.   ,-------------.
> > 	| controller [port@1]-. `-[port@0]       |
> > 	`------------------=B4   `--[port@1]  mux  |
> > 	,------------------.   ,--[port@2]       |    ,-------------.
> > 	| display    [port@0]-=B4 ,-[port@3] [port@4]--[port] encoder |
> > 	| controller [port@1]--=B4   `-------------=B4    `-------------=B4
> > 	`------------------=B4
>=20
> Similar question here, how is the above complex assembled into a logi=
cal
> device? Is there an overarching controller device for this component
> complex?

This is exactly the problem we discussed at Kernel Summit during the DR=
M
et.al. session.  It's the multiple component problem.  We have this sol=
ved
in a subsystem and firmware independent manner.

The way this works in imx-drm is that the graph of connections is scann=
ed
to discover which component devices are required, and once all the
components are present, we initialise the logical device.  Further than
that, the driver structure is an implemention specific detail.

The starting point is the CPU facing part, because that's what provides
the logical interfaces, especially as there may be more than one logica=
l
interface (which each of which may be entirely separate kernel
subsystems - display vs capture.)

> >  ,--------.    ,---------.
> >  | dc [port]--[port@0]   |
> >  `--------=B4    | encoder |    ,-----------.
> >                |   [port@1]--[port] panel |
> >                `---------=B4    `-----------=B4=20
>=20
> In all of the above examples I see a unidirectional data flow. There =
are
> producer ports and consumer ports. Is there any (reasonable) possibil=
ity
> of peer ports that are bidirectional?

Generally, they will be unidirectional, but when you realise that you w=
ant
to be able to walk the graph from the CPU point of view, the data flow
direction is meaningless.  What you need to know is how the components
are connected together.

If you model the links as per the data flow direction, then while you m=
ay
be able to walk the display side - eg, dc -> encoder -> panel due to yo=
ur
DT links, you wouldn't be able to walk from the CPU interface down to y=
our
camera sensor - you would need to do a full scan of the DT for every
interation to reverse the direction of the linkages.

> > According to video-interfaces.txt, it is expected that endpoints co=
ntain
> > phandles pointing to the remote endpoint on both sides. I'd like to
> > leave this up to the more specialized bindings, but I can see that =
this
> > makes enumerating the connections starting from each device tree no=
de
> > easier, for example at probe time.
>=20
> This has come up in the past. That approach comes down to premature
> optimization at the expense of making the data structure more prone t=
o
> inconsistency. I consider it to be a bad pattern.
>=20
> Backlinks are good for things like dynamically linked lists that need=
 to
> be fast and the software fully manages the links. For a data structur=
e like
> the FDT it is better to have the data in one place, and one place onl=
y.
> Besides, computers are *good* at parsing data structures. :-)
>=20
> I appreciate that existing drivers may be using the backlinks, but I
> strongly recommend not doing it for new users.

"Backlinks" doesn't convey to me exactly what you mean here.  Are you
talking about the ones in the opposite direction to data flow, or the
ones pointing upstream towards the CPU?  (I'm going to use upstream to
refer to the ones pointing towards the CPU.)

That matters: as I've said above, when creating logical devices, you
tend to start at the CPU interfaces and work your way down the graph.
Working the opposite way is much harder, especially if you hit some
kind of muxing arranagement which results in two sensors which combine
into one logical grabbing device.

> > If the back links are not provided in the device tree, a device at =
the
> > receiving end of a remote-endpoint phandle can only know about conn=
ected
> > remote ports after the kernel parsed the whole graph and created th=
e
> > back links itself.
>=20
> A whole tree parse isn't expensive. We do it all the time.

A while tree parse may not be expensive, but to do it multiple times
increases the cost manyfold.  Taking the first example above, it may
be needed to do that five times, one time per link, and that may be
just one subsystem.  It could very easily become 10 times, at which
point the expense is an order of magnitude more than it was.

We do have real hardware which is arranged as per that first diagram.
It's the iMX6Q - two IPUs each with two display controllers, giving a
total of four output video streams.  Those are then fed into a set of
muxes which then feed into a set of encoders.  Effectively, all those
muxes make a switching matrix, allowing you to connect any encoder to
any of the four output video streams - even connecting two or more
encoders to the same video stream.

There's HDMI, TV, LDB, and parallel.  So that's 20 links in total (in
reality, it's 16 because we don't represent the mux-to-encoder link
because it's not relevant.)  So, is 16x "a whole tree parse which isn't
expensive" still not expensive?

I'm not saying that we /need/ this, I'm merely pointing out that your
comment may be correct for one-offs, but that may not be what happens
in reality.

I think for the case I mention above, it's entirely possible to do
without the upstream links - whether that suits everyone, I'm not sure.

> > >  Graphs should be one direction only.
> >=20
> > But this is not what the current binding in video-interfaces.txt
> > describes. I don't think it is a good idea to explicitly forbid
> > backlinks in this binding.
>=20
> Nah, I disagree. The binding document /should/ forbid it to make it
> really clear what the common pattern is. The code doesn't have to
> enforce it (you don't want to break existing platforms), but the
> document should be blunt.
>=20
> Another thought. In terms of the pattern, I would add a recommendatio=
n
> that there should be a way to identify ports of a particular type. ie=
=2E
> If I were using the pattern to implement an patch bay of DSP filters,
> where each input and output, then each target node should have a uniq=
ue
> identifier property analogous to "interrupt-controller" or
> "gpio-controller". In this fictitious example I would probably choose
> "audiostream-input-port" and "audiostream-output-port" as empty
> properties in the port nodes. (I'm not suggesting a change to the
> existing binding, but making a recommendation to new users).

Given the amount of discussion of these bindings which are already in
the kernel, I have to ask a really obvious question: were they reviewed
before they were merged into the kernel?  It sounds like the above
discussion should already have happened...

--=20
=46TTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... sl=
owly
improving, and getting towards what was expected from it.
