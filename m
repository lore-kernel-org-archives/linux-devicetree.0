From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v5 2/2] phy: rockchip-inno-usb2: add a new driver for Rockchip usb2phy
Date: Wed, 15 Jun 2016 20:49:30 +0200
Message-ID: <2590052.6LplKWTe68@diego>
References: <1465783810-18756-1-git-send-email-frank.wang@rock-chips.com> <20086422.3ieDmpZrvB@diego> <da45cb15-4823-0992-0b83-475f1ad4c8aa@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <da45cb15-4823-0992-0b83-475f1ad4c8aa@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wang <frank.wang@rock-chips.com>
Cc: dianders@chromium.org, linux@roeck-us.net, groeck@chromium.org, jwerner@chromium.org, kishon@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, xzy.xu@rock-chips.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, william.wu@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Frank,

Am Mittwoch, 15. Juni 2016, 18:58:43 schrieb Frank Wang:
> On 2016/6/15 17:04, Heiko St=FCbner wrote:
> > Am Mittwoch, 15. Juni 2016, 11:23:26 schrieb Frank Wang:
> >> On 2016/6/14 21:27, Heiko St=FCbner wrote:
> >>> Am Montag, 13. Juni 2016, 10:10:10 schrieb Frank Wang:
> >>>> The newer SoCs (rk3366, rk3399) take a different usb-phy IP bloc=
k
> >>>> than rk3288 and before, and most of phy-related registers are al=
so
> >>>> different from the past, so a new phy driver is required necessa=
rily.
> >>>>=20
> >>>> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
> >>>> ---
> >>>>=20
> >>>> Changes in v5:
> >>>>    - Added 'reg' in the data block to match the different phy-bl=
ocks in
> >>>>    dt.
> >>>>=20
> >>>> Changes in v4:
> >>>>    - Removed some processes related to 'vbus_host-supply'.
> >>>>=20
> >>>> Changes in v3:
> >>>>    - Resolved the mapping defect between fixed value in driver a=
nd the
> >>>>=20
> >>>> property in devicetree.
> >>>>=20
> >>>>    - Optimized 480m output clock register function.
> >>>>    - Code cleanup.
> >>>>=20
> >>>> Changes in v2:
> >>>>    - Changed vbus_host operation from gpio to regulator in *_pro=
be.
> >>>>    - Improved the fault treatment relate to 480m clock register.
> >>>>    - Cleaned up some meaningless codes in *_clk480m_disable.
> >>>>    - made more clear the comment of *_sm_work.
> >>>>   =20
> >>>>    drivers/phy/Kconfig                  |    7 +
> >>>>    drivers/phy/Makefile                 |    1 +
> >>>>    drivers/phy/phy-rockchip-inno-usb2.c |  645
> >>>>=20
> >>>> ++++++++++++++++++++++++++++++++++ 3 files changed, 653 insertio=
ns(+)
> >>>>=20
> >>>> [...]
> >>>>=20
> >>>> +
> >>>> +static int rockchip_usb2phy_exit(struct phy *phy)
> >>>> +{
> >>>> +	struct rockchip_usb2phy_port *rport =3D phy_get_drvdata(phy);
> >>>> +
> >>>>=20
> >>> 	if (!rport->port_cfg)
> >>> =09
> >>> 		return 0;
> >>>>=20
> >>>> +	if (rport->port_id =3D=3D USB2PHY_PORT_HOST)
> >>>> +		cancel_delayed_work_sync(&rport->sm_work);
> >>>> +
> >>>=20
> >>> you will also need to resume the port here, if it is suspended at=
 this
> >>> point, as phy_power_off gets called after phy_exit and would prob=
ably
> >>> produce clk enable/disable mismatches otherwise.
> >>=20
> >> Hmm, from my personal point of view, when canceling sm_work here, =
it may
> >> not cause the port goes to suspend, isn't it? besides, clk only pr=
epared
> >> in *_usb2phy_resume(), and unprepared in *_usb2phy_suspend(), so i=
f we
> >> resume port here,  the prepare_count of clk will be increased agai=
n, I
> >> am afraid this is not correct, and am I wrong? would you like to t=
ell me
> >> more details?
> >=20
> > usb2phy_resume gets called both initially through phy_power_on as w=
ell.
> > So it's on but through the first scheduled work call, might get sus=
pended
> > when nothing is connected. (clk_enable and clk_disable will run).
> > If nothing is connected on unload phy_power_off will get called whi=
le the
> > clock actually is still disabled.
> >=20
> > So I think it's either resuming on exit, or at least making sure to=
 do
> > nothing in that case in the phy_power_off callback of the driver.
>=20
> Well, I got what you mean. I saw phy_power_on() gets called  twice at
> ehci/ohci driver probe time, one is at pdata->power_on(); another is =
at
> usb_add_hcd(), so after that, the power_count of phy increases to two=
=2E
> however, when ehci/ohci driver goes to suspend, there is only once to
> call phy_power_off(), and the power_count of phy decreases to 1, so o=
ur
> usb2phy_resume() could not be invoked :-) .
>
> If so, is it still need to care it?

You should never have to rely on oddities in other drivers :-)

> How about use suspended member of
> rockchip_usb2phy_port as a conditional to check in *_usb2phy_suspend(=
),
> if necessary.

That looks also sane and should work.


Heiko
