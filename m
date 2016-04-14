From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] ARM: dts: r8a7791: Don't disable referenced optional
 clocks
Date: Wed, 13 Apr 2016 17:19:13 -0700
Message-ID: <20160414001913.GG14441@codeaurora.org>
References: <1459947173-6664-1-git-send-email-sjoerd.simons@collabora.co.uk>
 <CAMuHMdUtPhBT0_+hSk_t5osHC8TssyGMFo+YOWetTGBkbpB4PQ@mail.gmail.com>
 <1459949826.23936.19.camel@collabora.co.uk>
 <20160407232155.GH18567@codeaurora.org>
 <1460112654.31245.20.camel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460112654.31245.20.camel@collabora.co.uk>
Sender: linux-clk-owner@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 04/08, Sjoerd Simons wrote:
> On Thu, 2016-04-07 at 16:21 -0700, Stephen Boyd wrote:
> > On 04/06, Sjoerd Simons wrote:
> > >=20
> > > Though even so I'm not sure what the convention is for clocks lik=
e
> > > these, the r8a7791.dtsi is inconsistent, as some are disabled whi=
le
> > > others (e.g. the audio clocks) are 0hz. Would be good to get some
> > > input
> > > on that regardless.
> > >=20
> > What's the question here?
>=20
> So the question is how to model unconnected external clocks in device=
-
> tree.
>=20
> The dtsi we're loooking at has (in pseudo dt):
>=20
> device {
> =A0 clock-names =3D "internal", "external";
> =A0 clocks =3D <&internal, &external>
> };
>=20
> external {
> =A0 compatible =3D "fixed-clock";
> =A0 clock-frequency =3D <12345>;
> =A0 status =3D "disabled";
> };
>=20
> Before=A03e5dd6f6e690048d ("clk: Ignore=A0disabled DT=A0clock provide=
rs")
> this apparently worked. Afterwards drivers getting all the clocks wou=
ld
> fail to probe with -EPROBE_DEFER.
>=20
> Judging by your comment I assume this way of modelling it is broken
> (and the behaviour caused by the patch is correct)?=A0
>=20
> And as a follow-up, is modelling unconnected clocks as enabled with a
> frequency of 0hz as my proposed patch does seen as the right way of
> doing things?
>=20

Right. In the case where the external clk is populated, I imagine
there would be a DT node describing it with the clock-frequency
property if it's a fixed rate clk. If the clk is not populated on
the board, then we would have a "ground" clk node that has a
frequency of 0. This way, if we have some mux clk that is default
connected to the external clk but can switch to some internal clk
it isn't orphaned forever. This is actually a problem for orphan
clk deferral right now.

My head starts to spin when we consider something like expansion
boards that have clk pins on them though. Hopefully for things
like that, we can populate clks with DT overlays and then change
the root hierarchy of the clk tree by swapping out the "ground"
clk for some real clk on the expansion board. The usage of
strings to describe the clk tree is probably going to get us here
though. Fun!

If we can't do this DT design because of backwards compatibility
concerns, then perhaps we need to expand the core to return a
fixed rate of 0 clk whenever clk_get() is called on a provider
that's status =3D "disabled"? Here's an untested patch to show that
idea.

---8<----
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fb74dc1f7520..19c3777b1cea 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3085,6 +3085,17 @@ int of_clk_parent_fill(struct device_node *np, c=
onst char **parents,
 }
 EXPORT_SYMBOL_GPL(of_clk_parent_fill);
=20
+static void init_disabled_clk_provider(struct device_node *np)
+{
+	struct clk *clk;
+
+	clk =3D clk_register_fixed_rate(NULL, of_node_full_name(np), NULL, 0,=
 0);
+	if (IS_ERR(clk))
+		return;
+
+	of_clk_add_provider(np, of_clk_src_simple_get, clk);
+}
+
 struct clock_provider {
 	of_clk_init_cb_t clk_init_cb;
 	struct device_node *np;
@@ -3150,9 +3161,6 @@ void __init of_clk_init(const struct of_device_id=
 *matches)
 	for_each_matching_node_and_match(np, matches, &match) {
 		struct clock_provider *parent;
=20
-		if (!of_device_is_available(np))
-			continue;
-
 		parent =3D kzalloc(sizeof(*parent), GFP_KERNEL);
 		if (!parent) {
 			list_for_each_entry_safe(clk_provider, next,
@@ -3165,7 +3173,18 @@ void __init of_clk_init(const struct of_device_i=
d *matches)
 			return;
 		}
=20
-		parent->clk_init_cb =3D match->data;
+		/*
+		 * Sometimes DT nodes are status =3D "disabled" but they're used
+		 * by other clk providers. In that case we make the disabled
+		 * provider return fixed rate clks with a frequency of 0 so
+		 * that nothing is orphaned and drivers can still get all
+		 * their clks.
+		 */
+		if (!of_device_is_available(np)) {
+			parent->clk_init_cb =3D init_disabled_clk_provider;
+		} else {
+			parent->clk_init_cb =3D match->data;
+		}
 		parent->np =3D of_node_get(np);
 		list_add_tail(&parent->node, &clk_provider_list);
 	}
--=20
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
