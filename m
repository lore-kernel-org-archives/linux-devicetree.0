From: Manjunatha GK <manjugk-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] DT: Use helper function to read u32 values
Date: Fri, 1 Jul 2011 19:25:47 +0530
Message-ID: <BANLkTin+WCRrxhOBNoL_AJJAkS-w9ybXqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8821943194972413252=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org\"" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============8821943194972413252==
Content-Type: multipart/alternative; boundary=000e0ce03f4ceb6f5f04a7025fc5

--000e0ce03f4ceb6f5f04a7025fc5
Content-Type: text/plain; charset=ISO-8859-1

Use helper function of_property_read_u32() in place of of_get_property
and be32_to_cpup() api's for code optimization.

Compile tested the changes.

Signed-off-by: G, Manjunath Kondaiah <manjugk-l0cyMroinI0@public.gmane.org>
---
 drivers/of/irq.c     |   37 ++++++++++++++++++++++---------------
 drivers/of/of_i2c.c  |    8 +++-----
 drivers/of/of_mdio.c |   16 ++++++----------
 3 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 9f689f1..13c02e2 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -59,20 +59,20 @@ EXPORT_SYMBOL_GPL(irq_of_parse_and_map);
 struct device_node *of_irq_find_parent(struct device_node *child)
 {
     struct device_node *p;
-    const __be32 *parp;
+    u32 *parp = NULL;

     if (!of_node_get(child))
         return NULL;

     do {
-        parp = of_get_property(child, "interrupt-parent", NULL);
+        of_property_read_u32(child, "interrupt-parent", parp);
         if (parp == NULL)
             p = of_get_parent(child);
         else {
             if (of_irq_workarounds & OF_IMAP_NO_PHANDLE)
                 p = of_node_get(of_irq_dflt_pic);
             else
-                p = of_find_node_by_phandle(be32_to_cpup(parp));
+                p = of_find_node_by_phandle(*parp);
         }
         of_node_put(child);
         child = p;
@@ -100,7 +100,8 @@ int of_irq_map_raw(struct device_node *parent, const
__be32 *intspec,
            u32 ointsize, const __be32 *addr, struct of_irq *out_irq)
 {
     struct device_node *ipar, *tnode, *old = NULL, *newpar = NULL;
-    const __be32 *tmp, *imap, *imask;
+    const __be32 *imap, *imask;
+    u32 *tmp;
     u32 intsize = 1, addrsize, newintsize = 0, newaddrsize = 0;
     int imaplen, match, i;

@@ -115,9 +116,10 @@ int of_irq_map_raw(struct device_node *parent, const
__be32 *intspec,
      * is none, we are nice and just walk up the tree
      */
     do {
-        tmp = of_get_property(ipar, "#interrupt-cells", NULL);
+        tmp = NULL;
+        of_property_read_u32(ipar, "#interrupt-cells", tmp);
         if (tmp != NULL) {
-            intsize = be32_to_cpu(*tmp);
+            intsize = *tmp;
             break;
         }
         tnode = ipar;
@@ -139,14 +141,15 @@ int of_irq_map_raw(struct device_node *parent, const
__be32 *intspec,
      */
     old = of_node_get(ipar);
     do {
-        tmp = of_get_property(old, "#address-cells", NULL);
+        tmp = NULL;
+        of_property_read_u32(old, "#address-cells", tmp);
         tnode = of_get_parent(old);
         of_node_put(old);
         old = tnode;
     } while (old && tmp == NULL);
     of_node_put(old);
     old = NULL;
-    addrsize = (tmp == NULL) ? 2 : be32_to_cpu(*tmp);
+    addrsize = (tmp == NULL) ? 2 : (*tmp);

     pr_debug(" -> addrsize=%d\n", addrsize);

@@ -225,14 +228,16 @@ int of_irq_map_raw(struct device_node *parent, const
__be32 *intspec,
             /* Get #interrupt-cells and #address-cells of new
              * parent
              */
-            tmp = of_get_property(newpar, "#interrupt-cells", NULL);
+            tmp = NULL;
+            of_property_read_u32(newpar, "#interrupt-cells", tmp);
             if (tmp == NULL) {
                 pr_debug(" -> parent lacks #interrupt-cells!\n");
                 goto fail;
             }
-            newintsize = be32_to_cpu(*tmp);
-            tmp = of_get_property(newpar, "#address-cells", NULL);
-            newaddrsize = (tmp == NULL) ? 0 : be32_to_cpu(*tmp);
+            newintsize = *tmp;
+            tmp = NULL;
+            of_property_read_u32(newpar, "#address-cells", tmp);
+            newaddrsize = (tmp == NULL) ? 0 : (*tmp);

             pr_debug(" -> newintsize=%d, newaddrsize=%d\n",
                 newintsize, newaddrsize);
@@ -284,7 +289,8 @@ EXPORT_SYMBOL_GPL(of_irq_map_raw);
 int of_irq_map_one(struct device_node *device, int index, struct of_irq
*out_irq)
 {
     struct device_node *p;
-    const __be32 *intspec, *tmp, *addr;
+    const __be32 *intspec, *addr;
+    u32 *tmp;
     u32 intsize, intlen;
     int res = -EINVAL;

@@ -311,10 +317,11 @@ int of_irq_map_one(struct device_node *device, int
index, struct of_irq *out_irq
         return -EINVAL;

     /* Get size of interrupt specifier */
-    tmp = of_get_property(p, "#interrupt-cells", NULL);
+    tmp = NULL;
+    of_get_property(p, "#interrupt-cells", tmp);
     if (tmp == NULL)
         goto out;
-    intsize = be32_to_cpu(*tmp);
+    intsize = *tmp;

     pr_debug(" intsize=%d intlen=%d\n", intsize, intlen);

diff --git a/drivers/of/of_i2c.c b/drivers/of/of_i2c.c
index f37fbeb..7113512 100644
--- a/drivers/of/of_i2c.c
+++ b/drivers/of/of_i2c.c
@@ -32,8 +32,7 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
     for_each_child_of_node(adap->dev.of_node, node) {
         struct i2c_board_info info = {};
         struct dev_archdata dev_ad = {};
-        const __be32 *addr;
-        int len;
+        u32 *addr = NULL;

         dev_dbg(&adap->dev, "of_i2c: register %s\n", node->full_name);

@@ -43,14 +42,13 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
             continue;
         }

-        addr = of_get_property(node, "reg", &len);
-        if (!addr || (len < sizeof(int))) {
+        if (of_get_property(node, "reg", addr)) {
             dev_err(&adap->dev, "of_i2c: invalid reg on %s\n",
                 node->full_name);
             continue;
         }

-        info.addr = be32_to_cpup(addr);
+        info.addr = *addr;
         if (info.addr > (1 << 10) - 1) {
             dev_err(&adap->dev, "of_i2c: invalid addr=%x on %s\n",
                 info.addr, node->full_name);
diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index d35e300..d4b6503 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -52,19 +52,17 @@ int of_mdiobus_register(struct mii_bus *mdio, struct
device_node *np)

     /* Loop over the child nodes and register a phy_device for each one */
     for_each_child_of_node(np, child) {
-        const __be32 *paddr;
         u32 addr;
-        int len;
+        u32 *paddr = NULL;

         /* A PHY must have a reg property in the range [0-31] */
-        paddr = of_get_property(child, "reg", &len);
-        if (!paddr || len < sizeof(*paddr)) {
+        if (of_property_read_u32(child, "reg", paddr)) {
             dev_err(&mdio->dev, "%s has invalid PHY address\n",
                 child->full_name);
             continue;
         }

-        addr = be32_to_cpup(paddr);
+        addr = *paddr;
         if (addr >= 32) {
             dev_err(&mdio->dev, "%s PHY address %i is too large\n",
                 child->full_name, addr);
@@ -169,8 +167,7 @@ struct phy_device *of_phy_connect_fixed_link(struct
net_device *dev,
     struct device_node *net_np;
     char bus_id[MII_BUS_ID_SIZE + 3];
     struct phy_device *phy;
-    const __be32 *phy_id;
-    int sz;
+    u32 *phy_id = NULL;

     if (!dev->dev.parent)
         return NULL;
@@ -179,11 +176,10 @@ struct phy_device *of_phy_connect_fixed_link(struct
net_device *dev,
     if (!net_np)
         return NULL;

-    phy_id = of_get_property(net_np, "fixed-link", &sz);
-    if (!phy_id || sz < sizeof(*phy_id))
+    if (of_property_read_u32(net_np, "fixed-link", phy_id))
         return NULL;

-    sprintf(bus_id, PHY_ID_FMT, "0", be32_to_cpu(phy_id[0]));
+    sprintf(bus_id, PHY_ID_FMT, "0", phy_id[0]);

     phy = phy_connect(dev, bus_id, hndlr, 0, iface);
     return IS_ERR(phy) ? NULL : phy;
-- 
1.7.4.1

--000e0ce03f4ceb6f5f04a7025fc5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Use helper function of_property_read_u32() in place of of_get_property <br>=
and be32_to_cpup() api&#39;s for code optimization.<br><br>Compile tested t=
he changes.<br><br>Signed-off-by: G, Manjunath Kondaiah &lt;<a href=3D"mail=
to:manjugk-l0cyMroinI0@public.gmane.org">manjugk-l0cyMroinI0@public.gmane.org</a>&gt;<br>
---<br>=A0drivers/of/irq.c=A0=A0=A0=A0 |=A0=A0 37 ++++++++++++++++++++++---=
------------<br>=A0drivers/of/of_i2c.c=A0 |=A0=A0=A0 8 +++-----<br>=A0drive=
rs/of/of_mdio.c |=A0=A0 16 ++++++----------<br>=A03 files changed, 31 inser=
tions(+), 30 deletions(-)<br>
<br>diff --git a/drivers/of/irq.c b/drivers/of/irq.c<br>index 9f689f1..13c0=
2e2 100644<br>--- a/drivers/of/irq.c<br>+++ b/drivers/of/irq.c<br>@@ -59,20=
 +59,20 @@ EXPORT_SYMBOL_GPL(irq_of_parse_and_map);<br>=A0struct device_nod=
e *of_irq_find_parent(struct device_node *child)<br>
=A0{<br>=A0=A0=A0=A0 struct device_node *p;<br>-=A0=A0=A0 const __be32 *par=
p;<br>+=A0=A0=A0 u32 *parp =3D NULL;<br>=A0<br>=A0=A0=A0=A0 if (!of_node_ge=
t(child))<br>=A0=A0=A0=A0 =A0=A0=A0 return NULL;<br>=A0<br>=A0=A0=A0=A0 do =
{<br>-=A0=A0=A0 =A0=A0=A0 parp =3D of_get_property(child, &quot;interrupt-p=
arent&quot;, NULL);<br>
+=A0=A0=A0 =A0=A0=A0 of_property_read_u32(child, &quot;interrupt-parent&quo=
t;, parp);<br>=A0=A0=A0=A0 =A0=A0=A0 if (parp =3D=3D NULL)<br>=A0=A0=A0=A0 =
=A0=A0=A0 =A0=A0=A0 p =3D of_get_parent(child);<br>=A0=A0=A0=A0 =A0=A0=A0 e=
lse {<br>=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 if (of_irq_workarounds &amp; OF_I=
MAP_NO_PHANDLE)<br>
=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 p =3D of_node_get(of_irq_dflt_pi=
c);<br>=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 else<br>-=A0=A0=A0 =A0=A0=A0 =A0=A0=
=A0 =A0=A0=A0 p =3D of_find_node_by_phandle(be32_to_cpup(parp));<br>+=A0=A0=
=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 p =3D of_find_node_by_phandle(*parp);<br>=
=A0=A0=A0=A0 =A0=A0=A0 }<br>=A0=A0=A0=A0 =A0=A0=A0 of_node_put(child);<br>
=A0=A0=A0=A0 =A0=A0=A0 child =3D p;<br>@@ -100,7 +100,8 @@ int of_irq_map_r=
aw(struct device_node *parent, const __be32 *intspec,<br>=A0=A0=A0=A0 =A0=
=A0=A0 =A0=A0 u32 ointsize, const __be32 *addr, struct of_irq *out_irq)<br>=
=A0{<br>=A0=A0=A0=A0 struct device_node *ipar, *tnode, *old =3D NULL, *newp=
ar =3D NULL;<br>
-=A0=A0=A0 const __be32 *tmp, *imap, *imask;<br>+=A0=A0=A0 const __be32 *im=
ap, *imask;<br>+=A0=A0=A0 u32 *tmp;<br>=A0=A0=A0=A0 u32 intsize =3D 1, addr=
size, newintsize =3D 0, newaddrsize =3D 0;<br>=A0=A0=A0=A0 int imaplen, mat=
ch, i;<br>=A0<br>@@ -115,9 +116,10 @@ int of_irq_map_raw(struct device_node=
 *parent, const __be32 *intspec,<br>
=A0=A0=A0=A0 =A0* is none, we are nice and just walk up the tree<br>=A0=A0=
=A0=A0 =A0*/<br>=A0=A0=A0=A0 do {<br>-=A0=A0=A0 =A0=A0=A0 tmp =3D of_get_pr=
operty(ipar, &quot;#interrupt-cells&quot;, NULL);<br>+=A0=A0=A0 =A0=A0=A0 t=
mp =3D NULL;<br>+=A0=A0=A0 =A0=A0=A0 of_property_read_u32(ipar, &quot;#inte=
rrupt-cells&quot;, tmp);<br>
=A0=A0=A0=A0 =A0=A0=A0 if (tmp !=3D NULL) {<br>-=A0=A0=A0 =A0=A0=A0 =A0=A0=
=A0 intsize =3D be32_to_cpu(*tmp);<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 intsiz=
e =3D *tmp;<br>=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 break;<br>=A0=A0=A0=A0 =A0=
=A0=A0 }<br>=A0=A0=A0=A0 =A0=A0=A0 tnode =3D ipar;<br>@@ -139,14 +141,15 @@=
 int of_irq_map_raw(struct device_node *parent, const __be32 *intspec,<br>
=A0=A0=A0=A0 =A0*/<br>=A0=A0=A0=A0 old =3D of_node_get(ipar);<br>=A0=A0=A0=
=A0 do {<br>-=A0=A0=A0 =A0=A0=A0 tmp =3D of_get_property(old, &quot;#addres=
s-cells&quot;, NULL);<br>+=A0=A0=A0 =A0=A0=A0 tmp =3D NULL;<br>+=A0=A0=A0 =
=A0=A0=A0 of_property_read_u32(old, &quot;#address-cells&quot;, tmp);<br>
=A0=A0=A0=A0 =A0=A0=A0 tnode =3D of_get_parent(old);<br>=A0=A0=A0=A0 =A0=A0=
=A0 of_node_put(old);<br>=A0=A0=A0=A0 =A0=A0=A0 old =3D tnode;<br>=A0=A0=A0=
=A0 } while (old &amp;&amp; tmp =3D=3D NULL);<br>=A0=A0=A0=A0 of_node_put(o=
ld);<br>=A0=A0=A0=A0 old =3D NULL;<br>-=A0=A0=A0 addrsize =3D (tmp =3D=3D N=
ULL) ? 2 : be32_to_cpu(*tmp);<br>
+=A0=A0=A0 addrsize =3D (tmp =3D=3D NULL) ? 2 : (*tmp);<br>=A0<br>=A0=A0=A0=
=A0 pr_debug(&quot; -&gt; addrsize=3D%d\n&quot;, addrsize);<br>=A0<br>@@ -2=
25,14 +228,16 @@ int of_irq_map_raw(struct device_node *parent, const __be3=
2 *intspec,<br>=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 /* Get #interrupt-cells and=
 #address-cells of new<br>
=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0* parent<br>=A0=A0=A0=A0 =A0=A0=A0 =A0=
=A0=A0 =A0*/<br>-=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 tmp =3D of_get_property(newp=
ar, &quot;#interrupt-cells&quot;, NULL);<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =
tmp =3D NULL;<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 of_property_read_u32(newpar=
, &quot;#interrupt-cells&quot;, tmp);<br>
=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 if (tmp =3D=3D NULL) {<br>=A0=A0=A0=A0 =A0=
=A0=A0 =A0=A0=A0 =A0=A0=A0 pr_debug(&quot; -&gt; parent lacks #interrupt-ce=
lls!\n&quot;);<br>=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 goto fail;<br>=
=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 }<br>-=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 newint=
size =3D be32_to_cpu(*tmp);<br>-=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 tmp =3D of_ge=
t_property(newpar, &quot;#address-cells&quot;, NULL);<br>
-=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 newaddrsize =3D (tmp =3D=3D NULL) ? 0 : be32=
_to_cpu(*tmp);<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 newintsize =3D *tmp;<br>+=
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 tmp =3D NULL;<br>+=A0=A0=A0 =A0=A0=A0 =A0=A0=
=A0 of_property_read_u32(newpar, &quot;#address-cells&quot;, tmp);<br>+=A0=
=A0=A0 =A0=A0=A0 =A0=A0=A0 newaddrsize =3D (tmp =3D=3D NULL) ? 0 : (*tmp);<=
br>
=A0<br>=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 pr_debug(&quot; -&gt; newintsize=3D=
%d, newaddrsize=3D%d\n&quot;,<br>=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=
 newintsize, newaddrsize);<br>@@ -284,7 +289,8 @@ EXPORT_SYMBOL_GPL(of_irq_=
map_raw);<br>=A0int of_irq_map_one(struct device_node *device, int index, s=
truct of_irq *out_irq)<br>
=A0{<br>=A0=A0=A0=A0 struct device_node *p;<br>-=A0=A0=A0 const __be32 *int=
spec, *tmp, *addr;<br>+=A0=A0=A0 const __be32 *intspec, *addr;<br>+=A0=A0=
=A0 u32 *tmp;<br>=A0=A0=A0=A0 u32 intsize, intlen;<br>=A0=A0=A0=A0 int res =
=3D -EINVAL;<br>=A0<br>@@ -311,10 +317,11 @@ int of_irq_map_one(struct devi=
ce_node *device, int index, struct of_irq *out_irq<br>
=A0=A0=A0=A0 =A0=A0=A0 return -EINVAL;<br>=A0<br>=A0=A0=A0=A0 /* Get size o=
f interrupt specifier */<br>-=A0=A0=A0 tmp =3D of_get_property(p, &quot;#in=
terrupt-cells&quot;, NULL);<br>+=A0=A0=A0 tmp =3D NULL;<br>+=A0=A0=A0 of_ge=
t_property(p, &quot;#interrupt-cells&quot;, tmp);<br>
=A0=A0=A0=A0 if (tmp =3D=3D NULL)<br>=A0=A0=A0=A0 =A0=A0=A0 goto out;<br>-=
=A0=A0=A0 intsize =3D be32_to_cpu(*tmp);<br>+=A0=A0=A0 intsize =3D *tmp;<br=
>=A0<br>=A0=A0=A0=A0 pr_debug(&quot; intsize=3D%d intlen=3D%d\n&quot;, ints=
ize, intlen);<br>=A0<br>diff --git a/drivers/of/of_i2c.c b/drivers/of/of_i2=
c.c<br>
index f37fbeb..7113512 100644<br>--- a/drivers/of/of_i2c.c<br>+++ b/drivers=
/of/of_i2c.c<br>@@ -32,8 +32,7 @@ void of_i2c_register_devices(struct i2c_a=
dapter *adap)<br>=A0=A0=A0=A0 for_each_child_of_node(adap-&gt;dev.of_node, =
node) {<br>
=A0=A0=A0=A0 =A0=A0=A0 struct i2c_board_info info =3D {};<br>=A0=A0=A0=A0 =
=A0=A0=A0 struct dev_archdata dev_ad =3D {};<br>-=A0=A0=A0 =A0=A0=A0 const =
__be32 *addr;<br>-=A0=A0=A0 =A0=A0=A0 int len;<br>+=A0=A0=A0 =A0=A0=A0 u32 =
*addr =3D NULL;<br>=A0<br>=A0=A0=A0=A0 =A0=A0=A0 dev_dbg(&amp;adap-&gt;dev,=
 &quot;of_i2c: register %s\n&quot;, node-&gt;full_name);<br>
=A0<br>@@ -43,14 +42,13 @@ void of_i2c_register_devices(struct i2c_adapter =
*adap)<br>=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 continue;<br>=A0=A0=A0=A0 =A0=A0=
=A0 }<br>=A0<br>-=A0=A0=A0 =A0=A0=A0 addr =3D of_get_property(node, &quot;r=
eg&quot;, &amp;len);<br>-=A0=A0=A0 =A0=A0=A0 if (!addr || (len &lt; sizeof(=
int))) {<br>
+=A0=A0=A0 =A0=A0=A0 if (of_get_property(node, &quot;reg&quot;, addr)) {<br=
>=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 dev_err(&amp;adap-&gt;dev, &quot;of_i2c: =
invalid reg on %s\n&quot;,<br>=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 no=
de-&gt;full_name);<br>=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 continue;<br>=A0=A0=
=A0=A0 =A0=A0=A0 }<br>
=A0<br>-=A0=A0=A0 =A0=A0=A0 info.addr =3D be32_to_cpup(addr);<br>+=A0=A0=A0=
 =A0=A0=A0 info.addr =3D *addr;<br>=A0=A0=A0=A0 =A0=A0=A0 if (info.addr &gt=
; (1 &lt;&lt; 10) - 1) {<br>=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 dev_err(&amp;a=
dap-&gt;dev, &quot;of_i2c: invalid addr=3D%x on %s\n&quot;,<br>
=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 info.addr, node-&gt;full_name);<=
br>diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c<br>index d35e30=
0..d4b6503 100644<br>--- a/drivers/of/of_mdio.c<br>+++ b/drivers/of/of_mdio=
.c<br>@@ -52,19 +52,17 @@ int of_mdiobus_register(struct mii_bus *mdio, str=
uct device_node *np)<br>
=A0<br>=A0=A0=A0=A0 /* Loop over the child nodes and register a phy_device =
for each one */<br>=A0=A0=A0=A0 for_each_child_of_node(np, child) {<br>-=A0=
=A0=A0 =A0=A0=A0 const __be32 *paddr;<br>=A0=A0=A0=A0 =A0=A0=A0 u32 addr;<b=
r>-=A0=A0=A0 =A0=A0=A0 int len;<br>+=A0=A0=A0 =A0=A0=A0 u32 *paddr =3D NULL=
;<br>
=A0<br>=A0=A0=A0=A0 =A0=A0=A0 /* A PHY must have a reg property in the rang=
e [0-31] */<br>-=A0=A0=A0 =A0=A0=A0 paddr =3D of_get_property(child, &quot;=
reg&quot;, &amp;len);<br>-=A0=A0=A0 =A0=A0=A0 if (!paddr || len &lt; sizeof=
(*paddr)) {<br>+=A0=A0=A0 =A0=A0=A0 if (of_property_read_u32(child, &quot;r=
eg&quot;, paddr)) {<br>
=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 dev_err(&amp;mdio-&gt;dev, &quot;%s has in=
valid PHY address\n&quot;,<br>=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 ch=
ild-&gt;full_name);<br>=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 continue;<br>=A0=A0=
=A0=A0 =A0=A0=A0 }<br>=A0<br>-=A0=A0=A0 =A0=A0=A0 addr =3D be32_to_cpup(pad=
dr);<br>+=A0=A0=A0 =A0=A0=A0 addr =3D *paddr;<br>
=A0=A0=A0=A0 =A0=A0=A0 if (addr &gt;=3D 32) {<br>=A0=A0=A0=A0 =A0=A0=A0 =A0=
=A0=A0 dev_err(&amp;mdio-&gt;dev, &quot;%s PHY address %i is too large\n&qu=
ot;,<br>=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 child-&gt;full_name, add=
r);<br>@@ -169,8 +167,7 @@ struct phy_device *of_phy_connect_fixed_link(str=
uct net_device *dev,<br>
=A0=A0=A0=A0 struct device_node *net_np;<br>=A0=A0=A0=A0 char bus_id[MII_BU=
S_ID_SIZE + 3];<br>=A0=A0=A0=A0 struct phy_device *phy;<br>-=A0=A0=A0 const=
 __be32 *phy_id;<br>-=A0=A0=A0 int sz;<br>+=A0=A0=A0 u32 *phy_id =3D NULL;<=
br>=A0<br>=A0=A0=A0=A0 if (!dev-&gt;dev.parent)<br>
=A0=A0=A0=A0 =A0=A0=A0 return NULL;<br>@@ -179,11 +176,10 @@ struct phy_dev=
ice *of_phy_connect_fixed_link(struct net_device *dev,<br>=A0=A0=A0=A0 if (=
!net_np)<br>=A0=A0=A0=A0 =A0=A0=A0 return NULL;<br>=A0<br>-=A0=A0=A0 phy_id=
 =3D of_get_property(net_np, &quot;fixed-link&quot;, &amp;sz);<br>
-=A0=A0=A0 if (!phy_id || sz &lt; sizeof(*phy_id))<br>+=A0=A0=A0 if (of_pro=
perty_read_u32(net_np, &quot;fixed-link&quot;, phy_id))<br>=A0=A0=A0=A0 =A0=
=A0=A0 return NULL;<br>=A0<br>-=A0=A0=A0 sprintf(bus_id, PHY_ID_FMT, &quot;=
0&quot;, be32_to_cpu(phy_id[0]));<br>
+=A0=A0=A0 sprintf(bus_id, PHY_ID_FMT, &quot;0&quot;, phy_id[0]);<br>=A0<br=
>=A0=A0=A0=A0 phy =3D phy_connect(dev, bus_id, hndlr, 0, iface);<br>=A0=A0=
=A0=A0 return IS_ERR(phy) ? NULL : phy;<br>-- <br>1.7.4.1<br><br><br>

--000e0ce03f4ceb6f5f04a7025fc5--

--===============8821943194972413252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8821943194972413252==--
