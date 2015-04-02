From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/4] clk: Provide always-on clock support
Date: Thu, 2 Apr 2015 08:10:27 +0100
Message-ID: <20150402071027.GW9447@x1>
References: <1425071674-16995-1-git-send-email-lee.jones@linaro.org>
 <1425071674-16995-4-git-send-email-lee.jones@linaro.org>
 <CAJe_Zhf=GBb8AfnTLaGxGcZkVSm9TtdnTsmpH_MBmbMT8ViMDg@mail.gmail.com>
 <20150302083652.GE31325@x1>
 <CABb+yY07woiiG8e2kff_AsiFCHNP+TKYyNm_o6=f5WmFsLi8gQ@mail.gmail.com>
 <20150302101859.GB32347@x1>
 <CAJe_Zhc-94afeWegEeOoL3X13y35MDJvqME1x7XMy3vVVXYedg@mail.gmail.com>
 <20150401014218.25195.61119@quantum>
 <CABb+yY2SMq3=wKEdTO_XgK3BOMSWy7=EWufqS9QYhGzLM1HQkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY2SMq3=wKEdTO_XgK3BOMSWy7=EWufqS9QYhGzLM1HQkw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Michael Turquette <mturquette@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Devicetree List <devicetree@vger.kernel.org>, kernel@stlinux.com, Stephen Boyd <sboyd@codeaurora.org>, lkml <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 02 Apr 2015, Jassi Brar wrote:

> On Wed, Apr 1, 2015 at 7:12 AM, Michael Turquette <mturquette@linaro.=
org> wrote:
> > Quoting Jassi Brar (2015-03-02 02:28:44)
> >> On 2 March 2015 at 15:48, Lee Jones <lee.jones@linaro.org> wrote:
> >> > On Mon, 02 Mar 2015, Jassi Brar wrote:
> >> >
> >> >> On Mon, Mar 2, 2015 at 2:06 PM, Lee Jones <lee.jones@linaro.org=
> wrote:
> >> >> > On Sat, 28 Feb 2015, Jassi Brar wrote:
> >> >> >
> >> >> >> On 28 February 2015 at 02:44, Lee Jones <lee.jones@linaro.or=
g> wrote:
> >> >> >> > Lots of platforms contain clocks which if turned off would=
 prove fatal.
> >> >> >> > The only way to recover from these catastrophic failures i=
s to restart
> >> >> >> > the board(s).  Now, when a clock is registered with the fr=
amework it is
> >> >> >> > compared against a list of provided always-on clock names =
which must be
> >> >> >> > kept ungated.  If it matches, we enable the existing CLK_I=
GNORE_UNUSED
> >> >> >> > flag, which will prevent the common clk framework from att=
empting to
> >> >> >> > gate it during the clk_disable_unused() procedure.
> >> >> >> >
> >> >> >> If a clock is critical on a certain board, it could be got+e=
nabled
> >> >> >> during early boot so there is always a user.
> >> >> >
> >> >> > I tried this.  There was push-back from the DT maintainers.
> >> >> >
> >> >> >   http://lists.infradead.org/pipermail/linux-arm-kernel/2015-=
=46ebruary/324417.html
> >> >> >
> >> >> Thanks, I wasn't aware of the history.
> >> >>
> >> >> >> To be able to do that from DT, maybe add a new, say, CLK_ALW=
AYS_ON
> >> >> >> flag could be made to initialize the clock with one phantom =
user
> >> >> >> already. Or just reuse the CLK_IGNORE_UNUSED?
> >> >> >
> >> >> > How is that different to what this set is doing?
> >> >> >
> >> >> The phantom user - that's there but none can see it.
> >> >>
> >> >> How about?
> >> >>
> >> >> +       of_property_for_each_string(np, "clock-always-on", prop=
, clkname) {
> >> >> +               clk =3D __clk_lookup(clkname);
> >> >> +               if (!clk)
> >> >> +                       continue;
> >> >> +
> >> >> +               clk->core->enable_count =3D 1;
> >> >> +               clk->core->prepare_count =3D 1;
> >> >> +       }
> >> >
> >> > This is only fractionally different from the current implementat=
ion.
> >> >
> >> > I believe the current way it slightly nicer, as we don't have to=
 fake
> >> > the user count.
> >> >
> >> Well... the user is indeed there, isn't it? It's just not known to
> >> Linux. So 'fake' isn't most applicable here.
> >> Otherwise you might have to stub out some existing and future
> >> functions for CLK_IGNORE_UNUSED. And how do we explain to userspac=
e
> >> which would see power drawn but no user of the clock?
> >
> > Jassi,
> >
> > This is broken. What if the parent of this clock has
> > {enable,prepare}_count of zero? The way we propagate these refcount=
s up
> > the tree would fall over.
> >
> Yeah it needs to be done at higher level,
> - clk->core->enable_count =3D 1;
> - clk->core->prepare_count =3D 1;
> + clk_prepare_enable(clk);

=46YI: https://lkml.org/lkml/2015/4/1/267

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
