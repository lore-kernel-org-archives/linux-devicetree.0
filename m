From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4 1/2] arm64: dts: rockchip: add "rockchip,
 grf" property for RK3399 PMUCRU/CRU
Date: Tue, 10 Jan 2017 20:58:10 +0100
Message-ID: <1523574.hS8CXi1tTP@diego>
References: <1484028930-20305-1-git-send-email-zhengxing@rock-chips.com>
 <CAD=FV=Wwu3q_LqwYUWcJQRvp5neVOS9szgsYFONWTRJ0X8hRTA@mail.gmail.com>
 <8683375.pL9J7LxuT0@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <8683375.pL9J7LxuT0@diego>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Doug,

Am Dienstag, 10. Januar 2017, 20:46:12 schrieb Heiko St=FCbner:
> Am Dienstag, 10. Januar 2017, 10:45:48 schrieb Doug Anderson:
> > Hi,
> > =

> > On Mon, Jan 9, 2017 at 10:15 PM, Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> =

> wrote:
> > > The structure rockchip_clk_provider needs to refer the GRF regmap
> > > in somewhere, if the CRU node has not "rockchip,grf" property,
> > > calling syscon_regmap_lookup_by_phandle will return an invalid GRF
> > > regmap, and the MUXGRF type clock will be not supported.
> > > =

> > > Therefore, we need to add them.
> > > =

> > > Signed-off-by: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > > ---
> > > =

> > > Changes in v4:
> > > - separte the binding patch
> > > =

> > > Changes in v3:
> > > - add optional roperty rockchip,grf in rockchip,rk3399-cru.txt
> > > =

> > > Changes in v2:
> > > - referring pmugrf for PMUGRU
> > > - fix the typo "invaild" in COMMIT message
> > > =

> > >  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 2 ++
> > >  1 file changed, 2 insertions(+)
> > =

> > This seems fine to me, so:
> > =

> > Reviewed-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > =

> > ...but I will say that before you actually add any real "MUXGRF"
> > clocks on rk3399 you _might_ need to rework the code to make things
> > truly "optional".  If it turns out that any existing clocks that
> > already exist today already go through one of these muxes in the GRF
> > and we've always been assuming one setting of the mux, we'll need to
> > make sure we keep assuming that setting of the mux even if the "grf"
> > isn't specified.
> =

> I guess I see that a bit more relaxed :-) .
> =

> I.e. the GRF being optional is a remnant of syscons not being available w=
hen
> the clocks get set up- so were coming in later or not at all. For the
> rk3288 I converted, there we never really had the case of the GRF missing.
> =

> And the GRF mux for the vcodec now present is not being used by anything =
yet
> (neither driver nor binding), so no old devicetree can break.
> =

> > As I understand it, your motivation for this patch is to eventually be
> > able to model the EDP reference clock which can either be xin24 or
> > "edp osc".  Presumably the eDP "reference clock" isn't related to any
> > of the pre-existing eDP clocks so that one should be safe.
> =

> Same here, so far we don't even have edp or even any other graphical outp=
ut
> on the rk3399, so again there is no old devicetree that could break when
> the grf is not specified.

reading all of the above again, it feels like you essentially also said =

similar things already in your original reply and I misread some of it.

But again, I don't see the need for any more code right now, as hopefully t=
he =

simple stuff we currently only support does not have any grf-based muxes in =

it. Xing + Rockchip people, please correct me if I'm wrong here :-)


Heiko
