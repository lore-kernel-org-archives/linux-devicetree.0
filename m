From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: net: sun8i-a83t-emac: Add phy-io-supply property
Date: Tue, 20 Aug 2019 11:57:06 -0500
Message-ID: <CAL_JsqJHNL91KMAP5ya97eiyTypGniCJ+tbP=NchPJK502i5FQ@mail.gmail.com>
References: <20190820145343.29108-1-megous@megous.com> <20190820145343.29108-3-megous@megous.com>
 <CAL_JsqLHeA6A_+ZgmCzC42Y6yJrEq6+D3vKn8ETh2D7LJ+1_-g@mail.gmail.com> <20190820163433.sr4lvjxmmhjtbtcb@core.my.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190820163433.sr4lvjxmmhjtbtcb@core.my.home>
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2019 at 11:34 AM Ond=C5=99ej Jirman <megous@megous.com> wro=
te:
>
> On Tue, Aug 20, 2019 at 11:20:22AM -0500, Rob Herring wrote:
> > On Tue, Aug 20, 2019 at 9:53 AM <megous@megous.com> wrote:
> > >
> > > From: Ondrej Jirman <megous@megous.com>
> > >
> > > Some PHYs require separate power supply for I/O pins in some modes
> > > of operation. Add phy-io-supply property, to allow enabling this
> > > power supply.
> >
> > Perhaps since this is new, such phys should have *-supply in their node=
s.
>
> Yes, I just don't understand, since external ethernet phys are so common,
> and they require power, how there's no fairly generic mechanism for this
> already in the PHY subsystem, or somewhere?

Because generic mechanisms for this don't work. For example, what
happens when the 2 supplies need to be turned on in a certain order
and with certain timings? And then add in reset or control lines into
the mix... You can see in the bindings we already have some of that.

> It looks like other ethernet mac drivers also implement supplies on phys
> on the EMAC nodes. Just grep phy-supply through dt-bindings/net.
>
> Historical reasons, or am I missing something? It almost seems like I mus=
t
> be missing something, since putting these properties to phy nodes
> seems so obvious.

Things get added one by one and one new property isn't that
controversial. We've generally learned the lesson and avoid this
pattern now, but ethernet phys are one of the older bindings.

Rob
