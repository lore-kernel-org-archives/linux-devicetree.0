From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [RESEND PATCH v1 4/4] clk: rockchip: rk3036: fix and add node id for emac clock
Date: Fri, 01 Jan 2016 23:10:54 +0100
Message-ID: <1562268.fb58QJ4jV7@diego>
References: <1451293433-32392-1-git-send-email-zhengxing@rock-chips.com> <5681E8E4.2010303@rock-chips.com> <5681F121.3070307@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart1948952.CzreNMXDyD"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <5681F121.3070307@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: Yakir Yang <ykk@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Michael Turquette <mturquette@baylibre.com>, Kumar Gala <galak@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, keescook@google.com, linux-clk@vger.kernel.org, leozwang@google.com
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.

--nextPart1948952.CzreNMXDyD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Xing,

Am Dienstag, 29. Dezember 2015, 10:34:09 schrieb Xing Zheng:
> On 2015=E5=B9=B412=E6=9C=8829=E6=97=A5 09:59, Yakir Yang wrote:
> > On 12/28/2015 08:41 PM, Heiko St=C3=BCbner wrote:
> >> Am Montag, 28. Dezember 2015, 17:03:53 schrieb Xing Zheng:
> >>> Due to referred old version TRM, there is incorrect emac clock no=
de,
> >>> we should fix it. The SEL_21_9 is the parent of SEL_21_4.
> >>>=20
> >>> In the emac driver, we need to refer HCLK_MAC, and because There =
are
> >>> only 3PLLs (APLL/GPLL/DPLL) on the rk3036, most clock are under t=
he
> >>> GPLL, and it is unable to provide the accurate rate for mac_ref w=
hich
> >>> need to 50MHz probability, we should let it under the APLL and ar=
e
> >>> able to set the freq which integer multiples of 50MHz, so we add =
these
> >>> emac node for reference.
> >>=20
> >> I don't really follow here. While I do understand that the emac ne=
eds
> >> 50MHz, I
> >> don't think using the APLL as source is helpful.
> >>=20
> >> The APLL is the main clocksource for the cpu-cores, including freq=
uency
> >> scaling, and while it currently only lists 816MHz as sole frequenc=
y,
> >> you're
> >> pretty much guaranteed to not get your correct multiple of 50MHz f=
rom
> >> there
> >> either. And limiting the cpu to just do 600MHz to get the mac work=
ing
> >> sounds
> >> pretty bad ;-) .
> >>=20
> >>=20
> >> In the rk3036 cru-node the gpll gets set to 594MHz. Is there a
> >> special reason
> >> why it needs to be 594MHz and cannot be a round 600MHz? Because th=
at
> >> would
> >> also provide your 50MHz-multiple nicely.
> >=20
> > Yes, this magic 594MHz would help to support the standard HDMI
> > resolutions, here are the math:
> >=20
> > 1920x1080-60Hz DCLK =3D 148.5MHz =3D 594MHz / 4
> > 1280x720-60Hz DCLK =3D 74.25MHz =3D 594MHz / 8
> > 720x480-60Hz DCLK =3D 27MHz =3D 594MHz / 22
> >=20
> > Thanks,
> > - Yakir
>=20
> Thanks Yakir.
>=20
> Hi Heiko,
>  From the above, do you have better idea for the RK3036's emac withou=
t
> ext-oscillator?

During the last days I did play a bit with the clock framework. As I do=
n't=20
have a Kylin (or any rk3036) board, I did build a test-case with pclk_c=
pu on=20
the rk3188 (which can be affected by the armclk if not reparented to th=
e=20
gpll), which got sucessfully adapted to get back to (or near) the origi=
nally=20
requested frequency.

So ideally you could roll back your mux/div split here and try the atta=
ched=20
diff. In theory it should help :-) .
As can be seen by the FIXMEs, not fully finished, but I'd like to deter=
mine if=20
it fixes the issue at least.


Heiko

--nextPart1948952.CzreNMXDyD
Content-Disposition: attachment; filename="clk-keep-req-rate.diff"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="clk-keep-req-rate.diff"

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7bbb0fd..83a7234 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1423,6 +1423,9 @@ static struct clk_core *clk_propagate_rate_change(struct clk_core *core,
 	return fail_clk;
 }
 
+static int clk_core_set_rate_nolock(struct clk_core *core,
+				    unsigned long req_rate);
+
 /*
  * walk down a subtree and set the new rates notifying the rate
  * change on the way
@@ -1438,6 +1441,7 @@ static void clk_change_rate(struct clk_core *core)
 
 	old_rate = core->rate;
 
+printk("%s: %s requested %lu, new %lu\n", __func__, core->name, core->req_rate, core->new_rate);
 	if (core->new_parent)
 		best_parent_rate = core->new_parent->rate;
 	else if (core->parent)
@@ -1507,6 +1511,12 @@ static void clk_change_rate(struct clk_core *core)
 	/* handle the new child who might not be in core->children yet */
 	if (core->new_child)
 		clk_change_rate(core->new_child);
+
+	/* FIXME: add flag to limit to specific clocks? */
+	if (core->req_rate && core->new_rate != old_rate) {
+		printk("\t\ttrying to adapt %s\n", core->name);
+		clk_core_set_rate_nolock(core, core->req_rate);
+	}
 }
 
 static int clk_core_set_rate_nolock(struct clk_core *core,
@@ -1520,8 +1530,10 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 		return 0;
 
 	/* bail early if nothing to do */
-	if (rate == clk_core_get_rate_nolock(core))
+	if (rate == clk_core_get_rate_nolock(core)) {
+		core->req_rate = req_rate;
 		return 0;
+	}
 
 	if ((core->flags & CLK_SET_RATE_GATE) && core->prepare_count)
 		return -EBUSY;
@@ -1612,9 +1624,14 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 	clk_prepare_lock();
 
 	if (min != clk->min_rate || max != clk->max_rate) {
+		unsigned long rate = clk->core->req_rate;
+
+		if (!rate)
+			rate = clk->core->rate;
+
 		clk->min_rate = min;
 		clk->max_rate = max;
-		ret = clk_core_set_rate_nolock(clk->core, clk->core->req_rate);
+		ret = clk_core_set_rate_nolock(clk->core, rate);
 	}
 
 	clk_prepare_unlock();
@@ -2451,7 +2468,7 @@ static int __clk_init(struct device *dev, struct clk *clk_user)
 		rate = core->parent->rate;
 	else
 		rate = 0;
-	core->rate = core->req_rate = rate;
+	core->rate = rate;
 
 	/*
 	 * walk the list of orphan clocks and reparent any that are children of
@@ -2798,6 +2815,7 @@ int __clk_get(struct clk *clk)
 
 void __clk_put(struct clk *clk)
 {
+	unsigned long rate;
 	struct module *owner;
 
 	if (!clk || WARN_ON_ONCE(IS_ERR(clk)))
@@ -2806,9 +2824,13 @@ void __clk_put(struct clk *clk)
 	clk_prepare_lock();
 
 	hlist_del(&clk->clks_node);
-	if (clk->min_rate > clk->core->req_rate ||
-	    clk->max_rate < clk->core->req_rate)
-		clk_core_set_rate_nolock(clk->core, clk->core->req_rate);
+
+	rate = clk->core->req_rate;
+	if (!rate)
+		rate = clk->core->rate;
+
+	if (clk->min_rate > rate || clk->max_rate < rate)
+		clk_core_set_rate_nolock(clk->core, rate);
 
 	owner = clk->core->owner;
 	kref_put(&clk->core->ref, __clk_release);

--nextPart1948952.CzreNMXDyD--

