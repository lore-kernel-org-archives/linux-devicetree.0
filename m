From: Andres Salomon <dilinger@queued.net>
Subject: [PATCH] of/pdt: allow DT device matching by fixing 'name'
 brokenness
Date: Fri, 18 Feb 2011 19:06:59 -0800
Message-ID: <20110218190659.7f955e4c@queued.net>
References: <20110216222820.487AE9D401C@zog.reactivated.net>
	<1297896277.3011.5.camel@macbook.infradead.org>
	<AANLkTikAF2X1A5jfoNfCPRhZkZ7qPdZ57c8B5b9z4+qr@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <AANLkTikAF2X1A5jfoNfCPRhZkZ7qPdZ57c8B5b9z4+qr@mail.gmail.com>
Sender: sparclinux-owner@vger.kernel.org
To: Daniel Drake <dsd@laptop.org>
Cc: David Woodhouse <dwmw2@infradead.org>, cbou@mail.ru, linux-kernel@vger.kernel.org, x86@kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, dmitry.torokhov@gmail.com, Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 18 Feb 2011 23:42:57 +0000
Daniel Drake <dsd@laptop.org> wrote:

> On 16 February 2011 22:44, David Woodhouse <dwmw2@infradead.org>
> wrote:
> > On Wed, 2011-02-16 at 22:28 +0000, Daniel Drake wrote:
> >>
> >> +static int __init add_common_platform_devices(void)
> >> +{
> >> + =C2=A0 =C2=A0 =C2=A0 struct platform_device *pdev;
> >> +
> >> + =C2=A0 =C2=A0 =C2=A0 pdev =3D platform_device_register_simple("o=
lpc-battery", -1,
> >> NULL, 0);
> >> + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(pdev))
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PTR_ERR(=
pdev);
> >> +
> >> + =C2=A0 =C2=A0 =C2=A0 return 0;
> >> +}
> >> +
> >
> > Still kind of sucks that you have to do this, and can't bind to
> > something in the device-tree.
>=20
> OK, feel free to put this patch on hold for now. I started looking at
> the device tree approach today. It looks doable but first we have to
> fix a DT bug/inconsistency that is preventing us from correctly
> binding to the tree's devices.
>=20
> Daniel


Mea culpa.  The patch below fixes a bug I introduced earlier.
Cc'ing the sparc folks, as this probably affects them
(although I would think that it fixes broken behavior for them..?)





=46rom: Andres Salomon <dilinger@queued.net>

Commit e2f2a93b changed dp->name from using the 'name' property to
using package-to-path.  This fixed /proc/device-tree creation by
eliminating conflicts between names (the 'name' property provides
names like 'battery', whereas package-to-path provides names like
'/foo/bar/battery@0', which we stripped to 'battery@0').  However,
it also breaks of_device_id table matching.

The fix that we _really_ wanted was to keep dp->name based upon
the name property ('battery'), but based dp->full_name upon
package-to-path ('battery@0').  This patch does just that.

Signed-off-by: Andres Salomon <dilinger@queued.net>
Reported-by: Daniel Drake <dsd@laptop.org>
---
 drivers/of/pdt.c |   42 +++++++++++++++++++-----------------------
 1 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/of/pdt.c b/drivers/of/pdt.c
index 28295d0..b39d584 100644
--- a/drivers/of/pdt.c
+++ b/drivers/of/pdt.c
@@ -48,7 +48,7 @@ static inline void irq_trans_init(struct device_node =
*dp) { }
=20
 static inline const char *of_pdt_node_name(struct device_node *dp)
 {
-	return dp->name;
+	return NULL;
 }
=20
 #endif /* !CONFIG_SPARC */
@@ -156,23 +156,6 @@ static char * __init of_pdt_try_pkg2path(phandle n=
ode)
 	return res+1;
 }
=20
-/*
- * When fetching the node's name, first try using package-to-path; if
- * that fails (either because the arch hasn't supplied a PROM callback=
,
- * or some other random failure), fall back to just looking at the nod=
e's
- * 'name' property.
- */
-static char * __init of_pdt_build_name(phandle node)
-{
-	char *buf;
-
-	buf =3D of_pdt_try_pkg2path(node);
-	if (!buf)
-		buf =3D of_pdt_get_one_property(node, "name");
-
-	return buf;
-}
-
 static struct device_node * __init of_pdt_create_node(phandle node,
 						    struct device_node *parent)
 {
@@ -187,7 +170,7 @@ static struct device_node * __init of_pdt_create_no=
de(phandle node,
=20
 	kref_init(&dp->kref);
=20
-	dp->name =3D of_pdt_build_name(node);
+	dp->name =3D of_pdt_get_one_property(node, "name");
 	dp->type =3D of_pdt_get_one_property(node, "device_type");
 	dp->phandle =3D node;
=20
@@ -198,13 +181,26 @@ static struct device_node * __init of_pdt_create_=
node(phandle node,
 	return dp;
 }
=20
-static char * __init of_pdt_build_full_name(struct device_node *dp)
+static char * __init of_pdt_build_full_name(struct device_node *dp,
+		phandle node)
 {
 	int len, ourlen, plen;
+	const char *name;
 	char *n;
=20
+	/*
+	 * When fetching the full name, rather than what we see with the
+	 * name property (ie, 'battery'), we want the name we see with
+	 * package-to-path (ie, 'battery@0').
+	 */
+	name =3D of_pdt_node_name(dp);
+	if (!name)
+		name =3D of_pdt_try_pkg2path(node);
+	if (!name)
+		name =3D dp->name;
+
 	plen =3D strlen(dp->parent->full_name);
-	ourlen =3D strlen(of_pdt_node_name(dp));
+	ourlen =3D strlen(name);
 	len =3D ourlen + plen + 2;
=20
 	n =3D prom_early_alloc(len);
@@ -213,7 +209,7 @@ static char * __init of_pdt_build_full_name(struct =
device_node *dp)
 		strcpy(n + plen, "/");
 		plen++;
 	}
-	strcpy(n + plen, of_pdt_node_name(dp));
+	strcpy(n + plen, name);
=20
 	return n;
 }
@@ -243,7 +239,7 @@ static struct device_node * __init of_pdt_build_tre=
e(struct device_node *parent,
 #if defined(CONFIG_SPARC)
 		dp->path_component_name =3D build_path_component(dp);
 #endif
-		dp->full_name =3D of_pdt_build_full_name(dp);
+		dp->full_name =3D of_pdt_build_full_name(dp, node);
=20
 		dp->child =3D of_pdt_build_tree(dp,
 				of_pdt_prom_ops->getchild(node), nextp);
--=20
1.7.2.3

--
To unsubscribe from this list: send the line "unsubscribe sparclinux" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
