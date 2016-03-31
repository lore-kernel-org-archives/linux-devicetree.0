From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v42 3/6] clk: Provide OF helper to mark clocks as CRITICAL
Date: Thu, 31 Mar 2016 10:14:32 +0100
Message-ID: <20160331091432.GP3323@x1>
References: <1455225554-13267-1-git-send-email-mturquette@baylibre.com>
 <1455225554-13267-4-git-send-email-mturquette@baylibre.com>
 <20160212080254.GK20693@x1>
 <20160330171542.23150.23031@quark.deferred.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160330171542.23150.23031@quark.deferred.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, sboyd@codeaurora.org, maxime.ripard@free-electrons.com, maxime.coquelin@st.com, geert@linux-m68k.org, heiko@sntech.de, andre.przywara@arm.com, rklein@nvidia.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 30 Mar 2016, Michael Turquette wrote:

> Quoting Lee Jones (2016-02-12 00:02:54)
> > On Thu, 11 Feb 2016, Michael Turquette wrote:
> >=20
> > > From: Lee Jones <lee.jones@linaro.org>
> > >=20
> > > This call matches clocks which have been marked as critical in DT
> > > and sets the appropriate flag.  These flags can then be used to
> > > mark the clock core flags appropriately prior to registration.
> > >=20
> > > Legacy bindings requiring this feature must add the clock-critica=
l
> > > property to their binding descriptions, as it is not a part of
> > > common-clock binding.
> > >=20
> > > Cc: devicetree@vger.kernel.org
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > Signed-off-by: Michael Turquette <mturquette@baylibre.com>
> > > ---
> > > Changed in vWhatever:
> > >   * Added kerneldoc
> > >   * Moved to clk.c, removed static inline
> > >   * s/of_clk_mark_if_critical/of_clk_detect_critical/
> >=20
> > Looks like you didn't fold this change in.
> >=20
> > Only the kerneldoc is correct.
>=20
> Thanks for the catch. I've fixed it and applied patches 1-3 to clk-ne=
xt.
> Patches 4-6 are turning up some bugs in other code that need to be fi=
xed
> before they are applied.

Thanks Mike. \o/

> > >   * s/critical-clock/clock-critical/
> > >=20
> > >  drivers/clk/clk.c            | 35 ++++++++++++++++++++++++++++++=
+++++
> > >  include/linux/clk-provider.h |  8 +++++++-
> > >  2 files changed, 42 insertions(+), 1 deletion(-)
> >=20
> > Appart from the small aforementioned issue, the changes look good t=
o
> > me.
> >=20
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 39f9527..5181a15 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -3202,6 +3202,41 @@ static int parent_ready(struct device_node=
 *np)
> > >  }
> > > =20
> > >  /**
> > > + * of_clk_detect_critical() - set CLK_IS_CRITICAL flag from Devi=
ce Tree
> > > + * @np: Device node pointer associated with clock provider
> > > + * @index: clock index
> > > + * @flags: pointer to clk_core->flags
> > > + *
> > > + * Detects if the clock-critical property exists and, if so, set=
s the
> > > + * corresponding CLK_IS_CRITICAL flag.
> > > + *
> > > + * Do not use this function. It exists only for legacy Device Tr=
ee
> > > + * bindings, such as the one-clock-per-node style that are outda=
ted.
> > > + * Those bindings typically put all clock data into .dts and the=
 Linux
> > > + * driver has no clock data, thus making it impossible to set th=
is flag
> > > + * correctly from the driver. Only those drivers may call
> > > + * of_clk_detect_critical from their setup functions.
> > > + *
> > > + * Return: error code or zero on success
> > > + */
> > > +int of_clk_mark_if_critical(struct device_node *np,
> > > +                                       int index, unsigned long =
*flags)
> > > +{
> > > +     struct property *prop;
> > > +     const __be32 *cur;
> > > +     uint32_t idx;
> > > +
> > > +     if (!np || !flags)
> > > +             return -EINVAL;
> > > +
> > > +     of_property_for_each_u32(np, "clock-critical", prop, cur, i=
dx)
> > > +             if (index =3D=3D idx)
> > > +                     *flags |=3D CLK_IS_CRITICAL;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +/**
> > >   * of_clk_init() - Scan and init clock providers from the DT
> > >   * @matches: array of compatible values and init functions for p=
roviders.
> > >   *
> > > diff --git a/include/linux/clk-provider.h b/include/linux/clk-pro=
vider.h
> > > index 1d986ea..d15d3cc 100644
> > > --- a/include/linux/clk-provider.h
> > > +++ b/include/linux/clk-provider.h
> > > @@ -705,7 +705,8 @@ int of_clk_get_parent_count(struct device_nod=
e *np);
> > >  int of_clk_parent_fill(struct device_node *np, const char **pare=
nts,
> > >                      unsigned int size);
> > >  const char *of_clk_get_parent_name(struct device_node *np, int i=
ndex);
> > > -
> > > +int of_clk_mark_if_critical(struct device_node *np, int index,
> > > +                         unsigned long *flags);
> > >  void of_clk_init(const struct of_device_id *matches);
> > > =20
> > >  #else /* !CONFIG_OF */
> > > @@ -742,6 +743,11 @@ static inline const char *of_clk_get_parent_=
name(struct device_node *np,
> > >  {
> > >       return NULL;
> > >  }
> > > +static inline int of_clk_mark_if_critical(struct device_node *np=
, int index,
> > > +                                       unsigned long *flags)
> > > +{
> > > +     return 0;
> > > +}
> > >  static inline void of_clk_init(const struct of_device_id *matche=
s) {}
> > >  #endif /* CONFIG_OF */
> > > =20
> >=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
