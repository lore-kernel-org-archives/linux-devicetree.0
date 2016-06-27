From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v3 2/2] phy: add a driver for the Rockchip SoC internal
 PCIe PHY
Date: Mon, 27 Jun 2016 16:24:32 -0700
Message-ID: <20160627232431.GB101555@google.com>
References: <1466040179-30973-1-git-send-email-shawn.lin@rock-chips.com>
 <5763F665.6070403@ti.com>
 <c88eb16f-e976-ad52-02fb-5ec7b6e261b9@rock-chips.com>
 <57678ED2.9000707@ti.com>
 <428a1393-c6b4-163c-ceec-9b79fdd8ad4a@rock-chips.com>
 <20160623233737.GB21157@google.com>
 <5770B883.9030907@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5770B883.9030907@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Wenrui Li <wenrui.li@rock-chips.com>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Kishon,

On Mon, Jun 27, 2016 at 10:54:19AM +0530, Kishon Vijay Abraham I wrote:
> On Friday 24 June 2016 05:07 AM, Brian Norris wrote:
> > On Thu, Jun 23, 2016 at 10:30:17AM +0800, Shawn Lin wrote:
> >> =E5=9C=A8 2016/6/20 14:36, Kishon Vijay Abraham I =E5=86=99=E9=81=93=
:
> >>> On Monday 20 June 2016 06:28 AM, Shawn Lin wrote:
> >>>> On 2016/6/17 21:08, Kishon Vijay Abraham I wrote:
> >>>>> Er.. don't use export symbols from phy driver. I think it would=
 be nice if you
> >>>>> can model the driver in such a way that the PCIe driver can con=
trol individual
> >>>>> phy's.
> >>>>>
> >>>>
> >>>> Yes, I was trying to look for a way not to export symbols from
> >>>> phy... But I failed to find it as there at least need three
> >>>> interaction between controller and phy which made me believe we
> >>>> at least need to export one symbol without adding new API for ph=
y.
> >=20
> > My interpretation of the above is that Shawn means we might turn of=
f up
> > to 3 different lanes (i.e., 3 of 4 supported lanes might be unused)=
=2E
> >=20
> >>> That can be managed by implementing a small state machine within =
the PHY driver.
> >>
> >> I don't understand your point of implementing a small state machin=
e
> >> within the PHY driver.
> >=20
> > I'm not 100% sure I understand, but I think I have a reasonable
> > interpretation below.
> >=20
> >> Do you mean I need to call vaarious of power_on/off and count the
> >> on/off times to decide the state machine?
> >>
> >> I would appreciate it If you could elaborate this a bit more or
> >> show me a example. :)
> >=20
> > My interpretation: rather than associating a single PCIe controller
> > device with a single struct phy that controls up to 4 lanes, Kishon=
 is
> > suggesting you should have this driver implement 4 phy objects, one=
 for
> > each lane. You'd need to add #phy-cells =3D <1> to the DT binding, =
and
> > implement an ->of_xlate() hook so we can associate/address them
> > properly. Then the PCIe controller would call phy_power_off() on ea=
ch
> > lane that's not used.
> >=20
> > The state machine would come into play because you have additional =
power
> > savings to utilize, but only when all PHYs are off. So the state ma=
chine
> > would just track how many of the lane PHYs are still on, and when t=
he
> > count reaches 0, you call reset_control_assert(rk_phy->phy_rst).

[...]

> That's pretty much what I had in mind. Thanks for putting this down i=
n an
> elaborate manner.

No problem. Glad we understand your suggestion now.

It remains to be seen whether we can reasonably utilize this suggestion
though. According to Shawn, the PCIe controller doesn't have anough
information to be able to utilize this model effectively. But I have my
doubts, which I've posted in reply to Shawn.

Regards,
Brian
