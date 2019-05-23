From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v7 2/4] soc: qcom: Add AOSS QMP driver
Date: Thu, 23 May 2019 11:05:00 -0700
Message-ID: <5ce6e0cd.1c69fb81.9a03e.0260@mx.google.com>
References: <20190501043734.26706-1-bjorn.andersson@linaro.org> <20190501043734.26706-3-bjorn.andersson@linaro.org> <CAD=FV=VVxKSp6e=j8YM8JBrhsF+T=0=8xDjd_817hphOMWHVFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=VVxKSp6e=j8YM8JBrhsF+T=0=8xDjd_817hphOMWHVFA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Doug Anderson <dianders@chromium.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Doug Anderson (2019-05-23 09:38:13)
> Hi,
>=20
> On Tue, Apr 30, 2019 at 9:38 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
>=20
> > +static int qmp_qdss_clk_add(struct qmp *qmp)
> > +{
> > +       struct clk_init_data qdss_init =3D {
> > +               .ops =3D &qmp_qdss_clk_ops,
> > +               .name =3D "qdss",
> > +       };
>=20
> Can't qdss_init be "static const"?  That had the advantage of not
> needing to construct it on the stack and also of it having a longer
> lifetime.  It looks like clk_register() stores the "hw" pointer in its
> structure and the "hw" structure will have a pointer here.  While I
> can believe that it never looks at it again, it's nice if that pointer
> doesn't point somewhere on an old stack.
>=20
> I suppose we could go the other way and try to mark more stuff in this
> module as __init and __initdata, but even then at least the pointer
> won't be onto a stack.  ;-)
>=20

Const would be nice, but otherwise making it static isn't a good idea.
The clk_init_data structure is all copied over, although we do leave a
dangling pointer to it stored inside the clk_hw structure we don't use
it after clk registration. Maybe we should overwrite the pointer with
NULL once we're done in clk_register() so that clk providers can't use
it. It might break somebody but would at least clarify this point.

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index aa51756fd4d6..56997a974408 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3438,9 +3438,9 @@ static int clk_cpy_name(const char **dst_p, const cha=
r *src, bool must_exist)
 	return 0;
 }
=20
-static int clk_core_populate_parent_map(struct clk_core *core)
+static int clk_core_populate_parent_map(struct clk_core *core,
+					const struct clk_init_data *init)
 {
-	const struct clk_init_data *init =3D core->hw->init;
 	u8 num_parents =3D init->num_parents;
 	const char * const *parent_names =3D init->parent_names;
 	const struct clk_hw **parent_hws =3D init->parent_hws;
@@ -3520,6 +3520,14 @@ __clk_register(struct device *dev, struct device_nod=
e *np, struct clk_hw *hw)
 {
 	int ret;
 	struct clk_core *core;
+	const struct clk_init_data *init =3D hw->init;
+
+	/*
+	 * The init data is not supposed to be used outside of registration path.
+	 * Set it to NULL so that provider drivers can't use it either and so that
+	 * we catch use of hw->init early on in the core.
+	 */
+	hw->init =3D NULL;
=20
 	core =3D kzalloc(sizeof(*core), GFP_KERNEL);
 	if (!core) {
@@ -3527,17 +3535,17 @@ __clk_register(struct device *dev, struct device_no=
de *np, struct clk_hw *hw)
 		goto fail_out;
 	}
=20
-	core->name =3D kstrdup_const(hw->init->name, GFP_KERNEL);
+	core->name =3D kstrdup_const(init->name, GFP_KERNEL);
 	if (!core->name) {
 		ret =3D -ENOMEM;
 		goto fail_name;
 	}
=20
-	if (WARN_ON(!hw->init->ops)) {
+	if (WARN_ON(!init->ops)) {
 		ret =3D -EINVAL;
 		goto fail_ops;
 	}
-	core->ops =3D hw->init->ops;
+	core->ops =3D init->ops;
=20
 	if (dev && pm_runtime_enabled(dev))
 		core->rpm_enabled =3D true;
@@ -3546,13 +3554,13 @@ __clk_register(struct device *dev, struct device_no=
de *np, struct clk_hw *hw)
 	if (dev && dev->driver)
 		core->owner =3D dev->driver->owner;
 	core->hw =3D hw;
-	core->flags =3D hw->init->flags;
-	core->num_parents =3D hw->init->num_parents;
+	core->flags =3D init->flags;
+	core->num_parents =3D init->num_parents;
 	core->min_rate =3D 0;
 	core->max_rate =3D ULONG_MAX;
 	hw->core =3D core;
=20
-	ret =3D clk_core_populate_parent_map(core);
+	ret =3D clk_core_populate_parent_map(core, init);
 	if (ret)
 		goto fail_parents;
=20

>=20
>=20
> > +static void qmp_pd_remove(struct qmp *qmp)
> > +{
> > +       struct genpd_onecell_data *data =3D &qmp->pd_data;
> > +       struct device *dev =3D qmp->dev;
> > +       int i;
> > +
> > +       of_genpd_del_provider(dev->of_node);
> > +
> > +       for (i =3D 0; i < data->num_domains; i++)
> > +               pm_genpd_remove(data->domains[i]);
>=20
> Still feels like the above loop would be better as:
>   for (i =3D data->num_domains - 1; i >=3D 0; i--)
>=20

Reason being to remove in reverse order? Otherwise this looks like an
opinion.
