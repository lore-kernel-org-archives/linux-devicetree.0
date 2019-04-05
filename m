From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 2/2] arm64: dts: h6: Add watchdog node
Date: Fri, 5 Apr 2019 22:59:35 +0800
Message-ID: <CAGb2v66cv7dVwj7oyRaHT5Q2XCbNqzuS-Uk9hdNJbVv57QOmUg@mail.gmail.com>
References: <20190404135736.8491-1-peron.clem@gmail.com> <20190404135736.8491-2-peron.clem@gmail.com>
 <20190405090236.e7vnyjzxmzfke3d6@flea> <CAGb2v65wcEAUTwRhC42iRkPaWXLGX1CJeq+TSzHVTOrT+L=8vA@mail.gmail.com>
 <20190405145005.jmmwsvbateqssbyq@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190405145005.jmmwsvbateqssbyq@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Samuel Holland <samuel@sholland.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 5, 2019 at 10:50 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Fri, Apr 05, 2019 at 10:35:08PM +0800, Chen-Yu Tsai wrote:
> > On Fri, Apr 5, 2019 at 5:02 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > >
> > > On Thu, Apr 04, 2019 at 03:57:36PM +0200, Clément Péron wrote:
> > > > Allwinner H6 has a watchog compatible with A31.
> > > >
> > > > Declare it in the device tree.
> > > >
> > > > Signed-off-by: Clément Péron <peron.clem@gmail.com>
> > >
> > > Applied both, thanks!
> > > Maxime
> >
> > IIRC there are 3 watchdogs on the H6. One is the trusted watchdog,
> > which should be reserved for underlying firmware.
> >
> > The other two are the normal and R-block watchdog. Although they
> > look the same, the "normal" one can't reset the system. :(
> > That one is actually the one ATF currently uses. So reboot doesn't
> > work on the H6.
>
> So that patch will not do anything then?

I'm still on vacation, so I haven't checked the address of the new device.
If it's the normal one, then yeah, it won't do anything. I've tried that.
IIRC Samuel (or someone else) on IRC also mentioned this.

ChenYu
