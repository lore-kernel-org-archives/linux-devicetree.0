From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: rockchip: rk3399: Add xin32k clk
Date: Fri, 16 Nov 2018 10:23:59 -0800
Message-ID: <CAD=FV=XVDAjLt+VtxedHEma1FRrG0LuFZ2c7L5-MsdCZkgEcsw@mail.gmail.com>
References: <20181116051719.23376-1-dbasehore@chromium.org>
 <CAD=FV=W7sYY5n609erPpTxux+0Efad_0YpPkoVZB14Kqm=baXA@mail.gmail.com>
 <CAGAzgsq7uF=E3dzhyCjK4gq09_UV_aZhQbyaTnz7yDY_ErQYKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAGAzgsq7uF=E3dzhyCjK4gq09_UV_aZhQbyaTnz7yDY_ErQYKQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "nickey.yang" <nickey.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tony Xie <tony.xie-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Klaus Goger <klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>, Chris <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?6YOR6Iic5Lm+?= <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Nov 16, 2018 at 9:39 AM dbasehore . <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
> On Fri, Nov 16, 2018 at 8:01 AM Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> >
> > Hi,
> >
> > On Thu, Nov 15, 2018 at 9:17 PM Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > >
> > > This adds the xin32k clock to the RK3399 CPU. Even though it's not
> > > directly used, muxes will end up traversing the entire clk tree on
> > > calls to determine_rate if it doesn't exist.
> > >
> > > Signed-off-by: Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > ---
> > >  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> >
> > nit: I would have expected ${SUBJECT} to have v2 in it somewhere.
> >
> >
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > > index 99e7f65c1779..3d09472978f8 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> >
> > Aww crud.  I was at the airport yesterday and so I didn't notice that
> > you were touching rk3399, not rk3399-gru.  This belongs in the gru
> > device tree file, not in the top level rk3399.  As you have written
> > this it will break rk3399 boards that have an rk808 on them, AKA:
>
> Should this be moved to the rk3399.dtsi file? The RK3399 assumes that
> this clk exists (same as the 24MHz clk which is in rk3399.dtsi). While
> it can function without it defined, it really shouldn't. We can just
> assign the existing labels in the dts files you pointed out.

No, it should be in the board files.  Each board may produce the 32k
clock through a different component.  On gru-based devices we produce
the 32k clock through a silego part.  On some other ones we produce it
from rk808.

Technically you could say that we don't _truly_ need to model this
clock and we could have just inserted a dummy/fixed 32k clock in the
clk-rk3399.c file.  ...but we did model it so that means we should
probably model it semi-properly.

If a given board forgets to provide a 32k clock then that's a bug for
them like it was for us.

-Doug
