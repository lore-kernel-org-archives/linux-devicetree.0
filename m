From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] DT: Use helper function to read u32 values
Date: Fri, 1 Jul 2011 08:37:59 -0600
Message-ID: <BANLkTikSnqPYxhrZv0YrhdZmTC=zrNNDRg@mail.gmail.com>
References: <BANLkTin+WCRrxhOBNoL_AJJAkS-w9ybXqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <BANLkTin+WCRrxhOBNoL_AJJAkS-w9ybXqg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Manjunatha GK <manjugk-l0cyMroinI0@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org\"" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 1, 2011 at 7:55 AM, Manjunatha GK <manjugk-l0cyMroinI0@public.gmane.org> wrote:
> Use helper function of_property_read_u32() in place of of_get_property
> and be32_to_cpup() api's for code optimization.
>
> Compile tested the changes.
>
> Signed-off-by: G, Manjunath Kondaiah <manjugk-l0cyMroinI0@public.gmane.org>
> ---
> =A0drivers/of/irq.c=A0=A0=A0=A0 |=A0=A0 37 ++++++++++++++++++++++--------=
-------
> =A0drivers/of/of_i2c.c=A0 |=A0=A0=A0 8 +++-----
> =A0drivers/of/of_mdio.c |=A0=A0 16 ++++++----------
> =A03 files changed, 31 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 9f689f1..13c02e2 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -59,20 +59,20 @@ EXPORT_SYMBOL_GPL(irq_of_parse_and_map);
> =A0struct device_node *of_irq_find_parent(struct device_node *child)
> =A0{
> =A0=A0=A0=A0 struct device_node *p;
> -=A0=A0=A0 const __be32 *parp;
> +=A0=A0=A0 u32 *parp =3D NULL;
>
> =A0=A0=A0=A0 if (!of_node_get(child))
> =A0=A0=A0=A0 =A0=A0=A0 return NULL;
>
> =A0=A0=A0=A0 do {
> -=A0=A0=A0 =A0=A0=A0 parp =3D of_get_property(child, "interrupt-parent", =
NULL);
> +=A0=A0=A0 =A0=A0=A0 of_property_read_u32(child, "interrupt-parent", parp=
);
> =A0=A0=A0=A0 =A0=A0=A0 if (parp =3D=3D NULL)
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 p =3D of_get_parent(child);

Hi Manjunatha.

This won't work.  You must pass a valid pointer.  It needs to be done this =
way;
        u32 parp;
        if (of_property_read_u32(child, "interrupt-parent", &parp) =3D=3D 0=
) {
                ...
        } else {
                ...
        }

> =A0=A0=A0=A0 =A0=A0=A0 else {
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 if (of_irq_workarounds & OF_IMAP_NO_PHAN=
DLE)
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 p =3D of_node_get(of_irq_dflt_=
pic);
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 else
> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 p =3D of_find_node_by_phandle(be=
32_to_cpup(parp));
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 p =3D of_find_node_by_phandle(*p=
arp);
> =A0=A0=A0=A0 =A0=A0=A0 }
> =A0=A0=A0=A0 =A0=A0=A0 of_node_put(child);
> =A0=A0=A0=A0 =A0=A0=A0 child =3D p;
> @@ -100,7 +100,8 @@ int of_irq_map_raw(struct device_node *parent, const
> __be32 *intspec,
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0 u32 ointsize, const __be32 *addr, struct of=
_irq *out_irq)
> =A0{
> =A0=A0=A0=A0 struct device_node *ipar, *tnode, *old =3D NULL, *newpar =3D=
 NULL;
> -=A0=A0=A0 const __be32 *tmp, *imap, *imask;
> +=A0=A0=A0 const __be32 *imap, *imask;
> +=A0=A0=A0 u32 *tmp;
> =A0=A0=A0=A0 u32 intsize =3D 1, addrsize, newintsize =3D 0, newaddrsize =
=3D 0;
> =A0=A0=A0=A0 int imaplen, match, i;
>
> @@ -115,9 +116,10 @@ int of_irq_map_raw(struct device_node *parent, const
> __be32 *intspec,
> =A0=A0=A0=A0 =A0* is none, we are nice and just walk up the tree
> =A0=A0=A0=A0 =A0*/
> =A0=A0=A0=A0 do {
> -=A0=A0=A0 =A0=A0=A0 tmp =3D of_get_property(ipar, "#interrupt-cells", NU=
LL);
> +=A0=A0=A0 =A0=A0=A0 tmp =3D NULL;
> +=A0=A0=A0 =A0=A0=A0 of_property_read_u32(ipar, "#interrupt-cells", tmp);
> =A0=A0=A0=A0 =A0=A0=A0 if (tmp !=3D NULL) {
> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 intsize =3D be32_to_cpu(*tmp);
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 intsize =3D *tmp;
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 break;
> =A0=A0=A0=A0 =A0=A0=A0 }
> =A0=A0=A0=A0 =A0=A0=A0 tnode =3D ipar;
> @@ -139,14 +141,15 @@ int of_irq_map_raw(struct device_node *parent, const
> __be32 *intspec,
> =A0=A0=A0=A0 =A0*/
> =A0=A0=A0=A0 old =3D of_node_get(ipar);
> =A0=A0=A0=A0 do {
> -=A0=A0=A0 =A0=A0=A0 tmp =3D of_get_property(old, "#address-cells", NULL);
> +=A0=A0=A0 =A0=A0=A0 tmp =3D NULL;
> +=A0=A0=A0 =A0=A0=A0 of_property_read_u32(old, "#address-cells", tmp);
> =A0=A0=A0=A0 =A0=A0=A0 tnode =3D of_get_parent(old);
> =A0=A0=A0=A0 =A0=A0=A0 of_node_put(old);
> =A0=A0=A0=A0 =A0=A0=A0 old =3D tnode;
> =A0=A0=A0=A0 } while (old && tmp =3D=3D NULL);
> =A0=A0=A0=A0 of_node_put(old);
> =A0=A0=A0=A0 old =3D NULL;
> -=A0=A0=A0 addrsize =3D (tmp =3D=3D NULL) ? 2 : be32_to_cpu(*tmp);
> +=A0=A0=A0 addrsize =3D (tmp =3D=3D NULL) ? 2 : (*tmp);
>
> =A0=A0=A0=A0 pr_debug(" -> addrsize=3D%d\n", addrsize);
>
> @@ -225,14 +228,16 @@ int of_irq_map_raw(struct device_node *parent, const
> __be32 *intspec,
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 /* Get #interrupt-cells and #address-cel=
ls of new
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0* parent
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0*/
> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 tmp =3D of_get_property(newpar, "#interrup=
t-cells", NULL);
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 tmp =3D NULL;
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 of_property_read_u32(newpar, "#interrupt-c=
ells", tmp);
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 if (tmp =3D=3D NULL) {
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 pr_debug(" -> parent lacks #in=
terrupt-cells!\n");
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 goto fail;
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 }
> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 newintsize =3D be32_to_cpu(*tmp);
> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 tmp =3D of_get_property(newpar, "#address-=
cells", NULL);
> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 newaddrsize =3D (tmp =3D=3D NULL) ? 0 : be=
32_to_cpu(*tmp);
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 newintsize =3D *tmp;
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 tmp =3D NULL;
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 of_property_read_u32(newpar, "#address-cel=
ls", tmp);
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 newaddrsize =3D (tmp =3D=3D NULL) ? 0 : (*=
tmp);
>
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 pr_debug(" -> newintsize=3D%d, newaddrsi=
ze=3D%d\n",
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 newintsize, newaddrsize);
> @@ -284,7 +289,8 @@ EXPORT_SYMBOL_GPL(of_irq_map_raw);
> =A0int of_irq_map_one(struct device_node *device, int index, struct of_irq
> *out_irq)
> =A0{
> =A0=A0=A0=A0 struct device_node *p;
> -=A0=A0=A0 const __be32 *intspec, *tmp, *addr;
> +=A0=A0=A0 const __be32 *intspec, *addr;
> +=A0=A0=A0 u32 *tmp;
> =A0=A0=A0=A0 u32 intsize, intlen;
> =A0=A0=A0=A0 int res =3D -EINVAL;
>
> @@ -311,10 +317,11 @@ int of_irq_map_one(struct device_node *device, int
> index, struct of_irq *out_irq
> =A0=A0=A0=A0 =A0=A0=A0 return -EINVAL;
>
> =A0=A0=A0=A0 /* Get size of interrupt specifier */
> -=A0=A0=A0 tmp =3D of_get_property(p, "#interrupt-cells", NULL);
> +=A0=A0=A0 tmp =3D NULL;
> +=A0=A0=A0 of_get_property(p, "#interrupt-cells", tmp);
> =A0=A0=A0=A0 if (tmp =3D=3D NULL)
> =A0=A0=A0=A0 =A0=A0=A0 goto out;
> -=A0=A0=A0 intsize =3D be32_to_cpu(*tmp);
> +=A0=A0=A0 intsize =3D *tmp;
>
> =A0=A0=A0=A0 pr_debug(" intsize=3D%d intlen=3D%d\n", intsize, intlen);
>
> diff --git a/drivers/of/of_i2c.c b/drivers/of/of_i2c.c
> index f37fbeb..7113512 100644
> --- a/drivers/of/of_i2c.c
> +++ b/drivers/of/of_i2c.c
> @@ -32,8 +32,7 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
> =A0=A0=A0=A0 for_each_child_of_node(adap->dev.of_node, node) {
> =A0=A0=A0=A0 =A0=A0=A0 struct i2c_board_info info =3D {};
> =A0=A0=A0=A0 =A0=A0=A0 struct dev_archdata dev_ad =3D {};
> -=A0=A0=A0 =A0=A0=A0 const __be32 *addr;
> -=A0=A0=A0 =A0=A0=A0 int len;
> +=A0=A0=A0 =A0=A0=A0 u32 *addr =3D NULL;
>
> =A0=A0=A0=A0 =A0=A0=A0 dev_dbg(&adap->dev, "of_i2c: register %s\n", node-=
>full_name);
>
> @@ -43,14 +42,13 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 continue;
> =A0=A0=A0=A0 =A0=A0=A0 }
>
> -=A0=A0=A0 =A0=A0=A0 addr =3D of_get_property(node, "reg", &len);
> -=A0=A0=A0 =A0=A0=A0 if (!addr || (len < sizeof(int))) {
> +=A0=A0=A0 =A0=A0=A0 if (of_get_property(node, "reg", addr)) {
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 dev_err(&adap->dev, "of_i2c: invalid reg=
 on %s\n",
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 node->full_name);
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 continue;
> =A0=A0=A0=A0 =A0=A0=A0 }
>
> -=A0=A0=A0 =A0=A0=A0 info.addr =3D be32_to_cpup(addr);
> +=A0=A0=A0 =A0=A0=A0 info.addr =3D *addr;
> =A0=A0=A0=A0 =A0=A0=A0 if (info.addr > (1 << 10) - 1) {
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 dev_err(&adap->dev, "of_i2c: invalid add=
r=3D%x on %s\n",
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 info.addr, node->full_name);
> diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
> index d35e300..d4b6503 100644
> --- a/drivers/of/of_mdio.c
> +++ b/drivers/of/of_mdio.c
> @@ -52,19 +52,17 @@ int of_mdiobus_register(struct mii_bus *mdio, struct
> device_node *np)
>
> =A0=A0=A0=A0 /* Loop over the child nodes and register a phy_device for e=
ach one */
> =A0=A0=A0=A0 for_each_child_of_node(np, child) {
> -=A0=A0=A0 =A0=A0=A0 const __be32 *paddr;
> =A0=A0=A0=A0 =A0=A0=A0 u32 addr;
> -=A0=A0=A0 =A0=A0=A0 int len;
> +=A0=A0=A0 =A0=A0=A0 u32 *paddr =3D NULL;
>
> =A0=A0=A0=A0 =A0=A0=A0 /* A PHY must have a reg property in the range [0-=
31] */
> -=A0=A0=A0 =A0=A0=A0 paddr =3D of_get_property(child, "reg", &len);
> -=A0=A0=A0 =A0=A0=A0 if (!paddr || len < sizeof(*paddr)) {
> +=A0=A0=A0 =A0=A0=A0 if (of_property_read_u32(child, "reg", paddr)) {
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 dev_err(&mdio->dev, "%s has invalid PHY =
address\n",
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 child->full_name);
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 continue;
> =A0=A0=A0=A0 =A0=A0=A0 }
>
> -=A0=A0=A0 =A0=A0=A0 addr =3D be32_to_cpup(paddr);
> +=A0=A0=A0 =A0=A0=A0 addr =3D *paddr;
> =A0=A0=A0=A0 =A0=A0=A0 if (addr >=3D 32) {
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 dev_err(&mdio->dev, "%s PHY address %i i=
s too large\n",
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 child->full_name, addr);
> @@ -169,8 +167,7 @@ struct phy_device *of_phy_connect_fixed_link(struct
> net_device *dev,
> =A0=A0=A0=A0 struct device_node *net_np;
> =A0=A0=A0=A0 char bus_id[MII_BUS_ID_SIZE + 3];
> =A0=A0=A0=A0 struct phy_device *phy;
> -=A0=A0=A0 const __be32 *phy_id;
> -=A0=A0=A0 int sz;
> +=A0=A0=A0 u32 *phy_id =3D NULL;
>
> =A0=A0=A0=A0 if (!dev->dev.parent)
> =A0=A0=A0=A0 =A0=A0=A0 return NULL;
> @@ -179,11 +176,10 @@ struct phy_device *of_phy_connect_fixed_link(struct
> net_device *dev,
> =A0=A0=A0=A0 if (!net_np)
> =A0=A0=A0=A0 =A0=A0=A0 return NULL;
>
> -=A0=A0=A0 phy_id =3D of_get_property(net_np, "fixed-link", &sz);
> -=A0=A0=A0 if (!phy_id || sz < sizeof(*phy_id))
> +=A0=A0=A0 if (of_property_read_u32(net_np, "fixed-link", phy_id))
> =A0=A0=A0=A0 =A0=A0=A0 return NULL;
>
> -=A0=A0=A0 sprintf(bus_id, PHY_ID_FMT, "0", be32_to_cpu(phy_id[0]));
> +=A0=A0=A0 sprintf(bus_id, PHY_ID_FMT, "0", phy_id[0]);
>
> =A0=A0=A0=A0 phy =3D phy_connect(dev, bus_id, hndlr, 0, iface);
> =A0=A0=A0=A0 return IS_ERR(phy) ? NULL : phy;
> --
> 1.7.4.1
>
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
