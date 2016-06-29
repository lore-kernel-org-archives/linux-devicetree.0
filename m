From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v5 2/2] phy: rockchip-inno-usb2: add a new driver for
 Rockchip usb2phy
Date: Wed, 29 Jun 2016 16:27:19 +0200
Message-ID: <2624359.mbyKrcyvqy@phil>
References: <1465783810-18756-1-git-send-email-frank.wang@rock-chips.com>
 <1653733.7f4MgdqfFf@diego> <5773D7DC.9050902@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <5773D7DC.9050902-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kishon,

Am Mittwoch, 29. Juni 2016, 19:44:52 schrieb Kishon Vijay Abraham I:
> On Friday 17 June 2016 10:16 PM, Heiko St=FCbner wrote:
> > Am Freitag, 17. Juni 2016, 17:24:46 schrieb Kishon Vijay Abraham I:
> > [...]
> > =

> >>> +	/* find out a proper config which can be matched with dt. */
> >>> +	index =3D 0;
> >>> +	while (phy_cfgs[index].reg) {
> >>> +		if (phy_cfgs[index].reg =3D=3D reg) {
> >> =

> >> Why not pass these config values from dt? Moreover finding the config
> >> using register offset is bound to break.
> > =

> > As you have probably seen, this phy block is no stand-alone
> > (mmio-)device, but gets controlled through special register/bits in the
> > so called "General Register Files" syscon.
> > =

> > The values stored and accessed here, are the location and layout of
> > those
> > control registers. Bits in those phy control registers at times move
> > between phy-versions in different socs (rk3036, rk3228, rk3366, rk3368,
> > rk3399) and some are even missing. So I don't really see a nice way to
> > describe that in dt without describing the register and offset of each
> > of those 22 used bits individually.
> > =

> > =

> > I'm also not sure where you expect it to break? The reg-offset is the
> > offset of the phy inside the GRF and the Designware-phy also already
> > does something similar to select some appropriate values.
> =

> I'm concerned the phy can be placed in the different reg-offset within GRF
> (like in the next silicon revision) and this driver can't be used.

That is something that has not happened with all Rockchip SoCs I have had i=
n =

my hands so far.

While the GRF is some sort-of wild-west area with settings for vastly =

different blocks in there and always changes between different socs (rk3288 =

[4-core A17] <-> rk3366 <-> rk3368 [8-core A53] <-> rk3399 etc) there =

haven't been such changes (different register offsets) between soc-revision=
s =

of the same soc that I know off.

The GRF also includes such important things like the whole pinctrl handling=
, =

so if there were such offset changes in the GRF a lot of drivers (and =

maintainers) would get very unhappy - me included :-) .


Heiko
