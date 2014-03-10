From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v6 2/8] Documentation: of: Document graph bindings
Date: Mon, 10 Mar 2014 14:57:24 +0100
Message-ID: <1394459844.7380.33.camel@paszta.hi.pengutronix.de>
References: <1394011242-16783-1-git-send-email-p.zabel@pengutronix.de>
	 <20140307182717.67596C40B43@trevor.secretlab.ca>
	 <1394443690.7380.10.camel@paszta.hi.pengutronix.de>
	 <2406124.RniJY1n1Xd@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2406124.RniJY1n1Xd@avalon>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Grant Likely <grant.likely@linaro.org>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Montag, den 10.03.2014, 12:37 +0100 schrieb Laurent Pinchart:
> Hi Philipp,
>=20
> On Monday 10 March 2014 10:28:10 Philipp Zabel wrote:
> > Hi Grant,
> >=20
> > Am Freitag, den 07.03.2014, 18:27 +0000 schrieb Grant Likely:
> > > On Wed,  5 Mar 2014 10:20:36 +0100, Philipp Zabel wrote:
> > > > The device tree graph bindings as used by V4L2 and documented i=
n
> > > > Documentation/device-tree/bindings/media/video-interfaces.txt c=
ontain
> > > > generic parts that are not media specific but could be useful f=
or any
> > > > subsystem with data flow between multiple devices. This documen=
t
> > > > describes the generic bindings.
> > > >=20
> > > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > >=20
> > > See my comments on the previous version. My concerns are the hand=
ling of
> > > the optional 'ports' node and the usage of reverse links.
> >=20
> > would this change address your concern about the reverse links? As =
the
> > preexisting video-interfaces.txt bindings mandate the reverse links=
, I
> > worry about introducing a second, subtly different binding. It shou=
ld be
> > noted somewhere in video-interfaces.txt that the reverse links are
> > deprecated for the but still supported by the code for backwards
> > compatibility.
>=20
> I'm very much against removing the reverse links. Without them the gr=
aph will=20
> become much more complex to parse. You can try to convince me, but fo=
r now I'm=20
> afraid it's a NACK.

=46or the record, I'd prefer to keep them, too. Besides the parsing
complexity, it just feels more natural to take both ends and connect
them together. If phandles are only permitted to point in one direction=
,
there's always the additional question which direction is the right one=
=2E

Assume, for example, the following setup of two SoC digital audio
interfaces connected to an audio codec and a bluetooth chip,
respectively. The audio codec has a second audio interface that is
connected directly to the bluetooth chip for headset operation:

,-------.     ,--------.
| dai1 [0]---[0] codec |
`-------'  ,-[1]       |
           |  `--------'
           |  ,-----.
,-------.  `-[1] bt |
| dai2 [0]---[0]    |
`-------'     `-----=C2=B4

How to decide which direction the codec:1 <-->  bt:1 link should point
in?

regards
Philipp
