From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: Re: [PATCH] ARM: dts: r8a7791: Don't disable referenced optional
 clocks
Date: Fri, 08 Apr 2016 12:50:54 +0200
Message-ID: <1460112654.31245.20.camel@collabora.co.uk>
References: <1459947173-6664-1-git-send-email-sjoerd.simons@collabora.co.uk>
	 <CAMuHMdUtPhBT0_+hSk_t5osHC8TssyGMFo+YOWetTGBkbpB4PQ@mail.gmail.com>
	 <1459949826.23936.19.camel@collabora.co.uk>
	 <20160407232155.GH18567@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160407232155.GH18567@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2016-04-07 at 16:21 -0700, Stephen Boyd wrote:
> On 04/06, Sjoerd Simons wrote:
> >=20
> > On Wed, 2016-04-06 at 15:11 +0200, Geert Uytterhoeven wrote:
> > >=20
> > > CC Mike, Stephen, linux-clk (this time with the new Mike)
> > >=20
> > > On Wed, Apr 6, 2016 at 2:52 PM, Sjoerd Simons
> > > <sjoerd.simons@collabora.co.uk> wrote:
> > > >=20
> > > >=20
> > > > clk_get on a disabled clock node will return EPROBE_DEFER,
> > > > which
> > > > can
> > > > cause drivers to be deferred forever if such clocks are
> > > > referenced
> > > > in
> > > > their clocks property.
> > > Is this a side effect of commit 3e5dd6f6e690048d ("clk: Ignore
> > > disabled DT
> > > clock providers")?
> > Yes it seems so. Reverting that patch means that i can drop this
> > one
> > and get the expected behaviour again.
> The DT is broken then? Is it possible to mark these status =3D
> "okay" so that things work again?

> >=20
> >=20
> > Though even so I'm not sure what the convention is for clocks like
> > these, the r8a7791.dtsi is inconsistent, as some are disabled while
> > others (e.g. the audio clocks) are 0hz. Would be good to get some
> > input
> > on that regardless.
> >=20
> What's the question here?

So the question is how to model unconnected external clocks in device-
tree.

The dtsi we're loooking at has (in pseudo dt):

device {
=C2=A0 clock-names =3D "internal", "external";
=C2=A0 clocks =3D <&internal, &external>
};

external {
=C2=A0 compatible =3D "fixed-clock";
=C2=A0 clock-frequency =3D <12345>;
=C2=A0 status =3D "disabled";
};

Before=C2=A03e5dd6f6e690048d ("clk: Ignore=C2=A0disabled DT=C2=A0clock =
providers")
this apparently worked. Afterwards drivers getting all the clocks would
fail to probe with -EPROBE_DEFER.

Judging by your comment I assume this way of modelling it is broken
(and the behaviour caused by the patch is correct)?=C2=A0

And as a follow-up, is modelling unconnected clocks as enabled with a
frequency of 0hz as my proposed patch does seen as the right way of
doing things?


--=20
Sjoerd Simons
Collabora Ltd.
