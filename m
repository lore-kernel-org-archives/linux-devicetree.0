From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [RFC PATCH] [media]: of: move graph helpers from drivers/media/v4l2-core to drivers/of
Date: Sat, 08 Mar 2014 01:05:50 +0800
Message-ID: <20140307170550.1DFB2C40A0D@trevor.secretlab.ca>
References: <1392119105-25298-1-git-send-email-p.zabel@pengutronix.de> < CAL_Jsq+U9zU1i+STLHMBjY5BeEP6djYnJVE5X1ix-D2q_zWztQ@mail.gmail.com> < 20140217181451.7EB7FC4044D@trevor.secretlab.ca> <20140218070624.GP17250@ pengutronix.de> <20140218162627.32BA4C40517@trevor.secretlab.ca> < 1393263389.3091.82.camel@pizza.hi.pengutronix.de> <20140226110114. CF2C7C40A89@trevor.secretlab.ca> <1393426129.3248.64.camel@paszta.hi. pengutronix.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1393426129.3248.64.camel@paszta.hi.pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robherring2@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Philipp Zabel <philipp.zabel@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, 26 Feb 2014 15:48:49 +0100, Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
> Hi Grant,
>=20
> thank you for the comments.

Hi Philipp,

I've got lots of comments and quesitons below, but I must say thank you
for doing this. It is a helpful description.

>=20
> Am Mittwoch, den 26.02.2014, 11:01 +0000 schrieb Grant Likely:
> > On Mon, 24 Feb 2014 18:36:29 +0100, Philipp Zabel <p.zabel@pengutro=
nix.de> wrote:
> > > Am Dienstag, den 18.02.2014, 16:26 +0000 schrieb Grant Likely:
> > > > >=20
> > > > > You can find it under Documentation/devicetree/bindings/media=
/video-interfaces.txt
> > > >=20
> > > > Okay, I think I'm okay with moving the helpers, but I will make=
 one
> > > > requirement. I would like to have a short binding document desc=
ribing
> > > > the pattern being used. The document above talks a lot about vi=
deo
> > > > specific issues, but the helpers appear to be specifically abou=
t the
> > > > tree walking properties of the API.
> > >=20
> > > Reusing the non-video-secific parts of video-interfaces.txt, how =
about
> > > the following:
> >=20
> > This is good, but I have some comments. This document describes its=
elf
> > as the common way for doing a device graph within the device tree, =
but
> > there is already a well established pattern for device graphs that =
is
> > used by the interrupts-extended, clocks and other bindings. Those a=
re
> > all domain-specific bindings, but the core concept is one device us=
es
> > a resource provided by another device. The resource references cons=
truct
> > a graph independent from the natural FDT node graph. (ie. the inter=
rupts
> > binding forms the interrupt graph. Same for the clock binding).
> >=20
> > So, while this binding does describe a pattern for separate device
> > graphs, it is by no means the only common way of doing so.
> >=20
> > I would like the document to acknowledge the difference from the
> > phandle+args pattern used elsewhere and a description of when it wo=
uld
> > be appropriate to use this instead of a simpler binding.
>=20
> Alright. The main point of this binding is that the devices may have
> multiple distinct ports that each can be connected to other devices.
> So, contrary to the other graph bindings, devices are not simple node=
s
> in a directed graph. For example a single capture device with two
> separate inputs connected to camera sensors:
>=20
> 	,--------.
> 	| cam [port]-.   ,-----------------.
> 	`--------=C2=B4    `-[port@0] capture   |
> 	,---------.   ,-[port@1] interface |
> 	| cam [port]-=C2=B4   `-----------------=C2=B4
> 	`---------=C2=B4

Bear with me, I'm going to comment on each point. I'm not criticizing,
but I do want to understand the HW design. In particular I want to
understand why the linkage is treated as bidirectional instead of one
device being the master.

In this specific example, what would be managing the transfer? Is there
an overarching driver that assembles the pieces, or would you expect
individual drivers to find each other?

> Or two separate display controllers with two parallel outputs each, a
> 4-port multiplexer, and an encoder (e.g. lvds):
>=20
> 	,------------------.
> 	| display    [port@0]--.   ,-------------.
> 	| controller [port@1]-. `-[port@0]       |
> 	`------------------=C2=B4   `--[port@1]  mux  |
> 	,------------------.   ,--[port@2]       |    ,-------------.
> 	| display    [port@0]-=C2=B4 ,-[port@3] [port@4]--[port] encoder |
> 	| controller [port@1]--=C2=B4   `-------------=C2=B4    `-----------=
--=C2=B4
> 	`------------------=C2=B4

Similar question here, how is the above complex assembled into a logica=
l
device? Is there an overarching controller device for this component
complex?

> Optionally, the same with the multiplexer integrated into the
> encoder device:
>=20
> 	,------------------.
> 	| display    [port@0]--.   ,----------------.
> 	| controller [port@1]-. `-[port@0]          |
> 	`------------------=C2=B4   `--[port@1] encoder  |
> 	,------------------.   ,--[port@2] with mux |
> 	| display    [port@0]-=C2=B4 ,-[port@3]          |
> 	| controller [port@1]--=C2=B4   `----------------=C2=B4
> 	`------------------=C2=B4
>=20
> Or display controller, encoder, and panel:
>=20
>  ,--------.    ,---------.
>  | dc [port]--[port@0]   |
>  `--------=C2=B4    | encoder |    ,-----------.
>                |   [port@1]--[port] panel |
>                `---------=C2=B4    `-----------=C2=B4=20

In all of the above examples I see a unidirectional data flow. There ar=
e
producer ports and consumer ports. Is there any (reasonable) possibilit=
y
of peer ports that are bidirectional?

>=20
> > > "Common bindings for device graphs"
> > >=20
> > > General concept
> > > ---------------
> > >=20
> > > The hierarchical organisation of the device tree is well suited t=
o describe
> > > control flow to devices, but data flow between devices that work =
together to
> > > form a logical compound device can follow arbitrarily complex gra=
phs.
> >=20
> > I would argue that this pattern isn't necessarily restricted to dat=
a
> > flow descriptions. It wants to describe linkage between devices tha=
t are
> > sufficiently complex that the simple binding doesn't do the job.
>=20
> Ok. In principle it would be possible to use the same scheme for othe=
r
> connections than data links.
>=20
> > > The device tree graph bindings allow to describe data bus connect=
ions between
> > > individual devices, that can't be inferred from device tree paren=
t-child
> > > relationships. The common bindings do not contain any information=
 about the
> > > direction or type of data flow, they just map connections. Specif=
ic properties
> > > of the connections can be set depending on the type of connection=
=2E To see
> > > how this binding applies to video pipelines, see for example
> > > Documentation/device-tree/bindings/media/video-interfaces.txt.
> >=20
> > Even if you don't want to declare the direction of data flow, there=
 does
> > need to be some guidance as to how the binding is constructed. Does
> > device A point to device B? Or the other way around? Why would some=
one
> > choose one over the other? I don't want to see a situation where A =
& B
> > point to each other. Things get complex if the graph is allowed to =
be
> > cyclical.
>=20
> According to video-interfaces.txt, it is expected that endpoints cont=
ain
> phandles pointing to the remote endpoint on both sides. I'd like to
> leave this up to the more specialized bindings, but I can see that th=
is
> makes enumerating the connections starting from each device tree node
> easier, for example at probe time.

This has come up in the past. That approach comes down to premature
optimization at the expense of making the data structure more prone to
inconsistency. I consider it to be a bad pattern.

Backlinks are good for things like dynamically linked lists that need t=
o
be fast and the software fully manages the links. For a data structure =
like
the FDT it is better to have the data in one place, and one place only.
Besides, computers are *good* at parsing data structures. :-)

I appreciate that existing drivers may be using the backlinks, but I
strongly recommend not doing it for new users.

> If the back links are not provided in the device tree, a device at th=
e
> receiving end of a remote-endpoint phandle can only know about connec=
ted
> remote ports after the kernel parsed the whole graph and created the
> back links itself.

A whole tree parse isn't expensive. We do it all the time.

Besides, nothing useful can be done until a driver has taken
responsibility for each side of the connection. I would expect to need =
a
registry anyway for pairing things up. If one side gets connected
without having the backlink, then it should get registered and wait
until another port gets registered that does have the linkage. In which
case a whole tree parse isn't ever necessary.

I think the common code would be even more useful if it implemented a
port registry helper in addition to the parsing. That would make the
decoding transparent.

> > > Each endpoint can contain a 'remote-endpoint' phandle property th=
at points to
> > > the corresponding endpoint in the port of the remote device. Two =
'endpoint'
> > > nodes are linked with each other through their 'remote-endpoint' =
phandles.
> >=20
> > I really don't like this aspect. It is far too easy to get wrong.
>=20
> On the other hand it is really easy to test for and warn about missin=
g
> or misdirected backlinks.

I don't think that makes it a better data structure.

> >  Graphs should be one direction only.
>=20
> But this is not what the current binding in video-interfaces.txt
> describes. I don't think it is a good idea to explicitly forbid
> backlinks in this binding.

Nah, I disagree. The binding document /should/ forbid it to make it
really clear what the common pattern is. The code doesn't have to
enforce it (you don't want to break existing platforms), but the
document should be blunt.

Another thought. In terms of the pattern, I would add a recommendation
that there should be a way to identify ports of a particular type. ie.
If I were using the pattern to implement an patch bay of DSP filters,
where each input and output, then each target node should have a unique
identifier property analogous to "interrupt-controller" or
"gpio-controller". In this fictitious example I would probably choose
"audiostream-input-port" and "audiostream-output-port" as empty
properties in the port nodes. (I'm not suggesting a change to the
existing binding, but making a recommendation to new users).

g.
