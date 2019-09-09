From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 2/4] clk: qcom: clk-rpmh: Convert to parent data scheme
Date: Mon, 09 Sep 2019 04:26:43 -0700
Message-ID: <20190909112644.4F45221920@mail.kernel.org>
References: <20190822170140.7615-1-vkoul@kernel.org> <20190822170140.7615-3-vkoul@kernel.org> <20190824063115.GW26807@tuxbook-pro> <20190826062127.GH2672@vkoul-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190826062127.GH2672@vkoul-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2019-08-25 23:21:27)
> On 23-08-19, 23:31, Bjorn Andersson wrote:
> > On Thu 22 Aug 10:01 PDT 2019, Vinod Koul wrote:
> >=20
> > > Convert the rpmh clock driver to use the new parent data scheme by
> > > specifying the parent data for board clock.
> > >=20
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > >  drivers/clk/qcom/clk-rpmh.c | 10 ++++++++--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> > > index c3fd632af119..0bced7326a20 100644
> > > --- a/drivers/clk/qcom/clk-rpmh.c
> > > +++ b/drivers/clk/qcom/clk-rpmh.c
> > > @@ -95,7 +95,10 @@ static DEFINE_MUTEX(rpmh_clk_lock);
> > >             .hw.init =3D &(struct clk_init_data){                    =
 \
> > >                     .ops =3D &clk_rpmh_ops,                          =
 \
> > >                     .name =3D #_name,                                =
 \
> > > -                   .parent_names =3D (const char *[]){ "xo_board" },=
 \
> > > +                   .parent_data =3D  &(const struct clk_parent_data)=
{ \
> > > +                                   .fw_name =3D "xo_board",         =
 \
> > > +                                   .name =3D "xo_board",            =
 \
> >=20
> > Iiuc .name here refers to the global clock namespace and .fw_name refers
> > to the device_node local name space. As such I really prefer this to be:
> >=20
> >   .fw_name =3D "xo",
> >   .name =3D "xo_board",
> >=20
> > This ensures the backwards compatibility (when using global lookup),
> > without complicating the node-local naming.
>=20
> Sure, while thinking more on this, should we finalize the name as xo or
> cxo, I see latter being also used at few places. It would be great to
> get a name and stick to it for longer time :)
> --=20

I would name it 'cxo' because that's the pin name on this platform.
