From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH 2/3] usb: dwc3 : Add support for USB snooping
Date: Fri, 11 Aug 2017 14:08:44 +0300
Message-ID: <87tw1e8ipv.fsf@linux.intel.com>
References: <1502445596-33716-1-git-send-email-yinbo.zhu@nxp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502445596-33716-1-git-send-email-yinbo.zhu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yinbo.zhu@nxp.com, linux-devel@gforge.freescale.netyinbo.zhu@nxp.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: open list <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, moderated list <linux-arm-kernel@lists.infradead.org>, open list <devicetree@vger.kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Stefano Stabellini <sstabellini@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Bart Van Assche <bart.vanassche@sandisk.com>, Doug Ledford <dledford@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rajesh Bhagat <rajesh.bhagat@freescale.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

yinbo.zhu@nxp.com writes:
> From: Rajesh Bhagat <rajesh.bhagat@freescale.com>
>
> Add support for USB3 snooping by asserting bits
> in register DWC3_GSBUSCFG0 for data and descriptor

you're doing WAAAAAAY more than that. Also, you don't tell me WHY you
want/need snooping to be enabled, or any of the other changes you made belo=
w.

> Signed-off-by: Nikhil Badola <nikhil.badola@freescale.com>
> Signed-off-by: Rajesh Bhagat <rajesh.bhagat@freescale.com>
> Signed-off-by: yinbo.zhu <yinbo.zhu@nxp.com>
> ---
>  drivers/usb/dwc3/core.c | 71 ++++++++++++++++++++++++++++++++++++-------=
------
>  drivers/usb/dwc3/core.h |  3 +++
>  drivers/usb/dwc3/host.c |  8 +++++-
>  3 files changed, 63 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 02a534a..b51b0d8 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -90,6 +90,7 @@ static int dwc3_get_dr_mode(struct dwc3 *dwc)
>=20=20
>  		if (IS_ENABLED(CONFIG_USB_DWC3_HOST))
>  			mode =3D USB_DR_MODE_HOST;
> +

unnecessary change

> @@ -305,14 +306,27 @@ static void dwc3_free_event_buffers(struct dwc3 *dw=
c)
>   */
>  static int dwc3_alloc_event_buffers(struct dwc3 *dwc, unsigned length)
>  {
> -	struct dwc3_event_buffer *evt;
> +	int                     num;
> +	int                     i;
> +
> +	num =3D DWC3_NUM_INT(dwc->hwparams.hwparams1);
> +	dwc->num_event_buffers =3D num;
> +
> +	dwc->ev_buffs =3D devm_kzalloc(dwc->dev, sizeof(*dwc->ev_buffs) * num,
> +			GFP_KERNEL);
> +	if (!dwc->ev_buffs)
> +		return -ENOMEM;

why do you need more than one event buffer?

> -	evt =3D dwc3_alloc_one_event_buffer(dwc, length);
> -	if (IS_ERR(evt)) {
> -		dev_err(dwc->dev, "can't allocate event buffer\n");
> -		return PTR_ERR(evt);
> +	for (i =3D 0; i < num; i++) {
> +		struct dwc3_event_buffer        *evt;
> +
> +		evt =3D dwc3_alloc_one_event_buffer(dwc, length);
> +		if (IS_ERR(evt)) {
> +			dev_err(dwc->dev, "can't allocate event buffer\n");
> +			return PTR_ERR(evt);
> +		}
> +		dwc->ev_buffs[i] =3D evt;

you're reverting the code to a previous stage which I changed because we
had no use for more than one event buffer. You do this without any
explanation of why while also putting all the changes in a completely
unrelated patch.

If you're new to this, you should've checked with more senior engineers
about how the process works on public mailing lists. Also, we have very
detailed documentation about the process, perhaps read it a little?

> @@ -325,17 +339,25 @@ static int dwc3_alloc_event_buffers(struct dwc3 *dw=
c, unsigned length)
>   */
>  static int dwc3_event_buffers_setup(struct dwc3 *dwc)
>  {
> -	struct dwc3_event_buffer	*evt;
> -
> -	evt =3D dwc->ev_buf;
> -	evt->lpos =3D 0;
> -	dwc3_writel(dwc->regs, DWC3_GEVNTADRLO(0),
> -			lower_32_bits(evt->dma));
> -	dwc3_writel(dwc->regs, DWC3_GEVNTADRHI(0),
> -			upper_32_bits(evt->dma));
> -	dwc3_writel(dwc->regs, DWC3_GEVNTSIZ(0),
> -			DWC3_GEVNTSIZ_SIZE(evt->length));
> -	dwc3_writel(dwc->regs, DWC3_GEVNTCOUNT(0), 0);
> +	struct dwc3_event_buffer        *evt;
> +	int                             n;
> +
> +	for (n =3D 0; n < dwc->num_event_buffers; n++) {
> +		evt =3D dwc->ev_buffs[n];
> +		dev_dbg(dwc->dev, "Event buf %p dma %08llx length %d\n",
> +				evt->buf, (unsigned long long) evt->dma,
> +				evt->length);

why these changes? Why the dev_dbg()? It took me a lot of work to get
rid of dev_dbg() from this driver, I'm not accepting them back.

> @@ -1181,6 +1203,7 @@ static void dwc3_check_params(struct dwc3 *dwc)
>  static int dwc3_probe(struct platform_device *pdev)
>  {
>  	struct device		*dev =3D &pdev->dev;
> +	struct device_node      *node =3D dev->of_node;
>  	struct resource		*res;
>  	struct dwc3		*dwc;
>=20=20
> @@ -1188,7 +1211,6 @@ static int dwc3_probe(struct platform_device *pdev)
>=20=20
>  	void __iomem		*regs;
>=20=20
> -	struct device_node      *node =3D dev->of_node;

why are these two changes important? They don't seem to be.

> @@ -1260,6 +1282,19 @@ static int dwc3_probe(struct platform_device *pdev)
>  		goto err2;
>  	}
>=20=20
> +	/* Change burst beat and outstanding pipelined transfers requests */
> +	dwc3_writel(dwc->regs, DWC3_GSBUSCFG0,
> +		(dwc3_readl(dwc->regs, DWC3_GSBUSCFG0) & ~0xff) | 0xf);

Are you SURE this will work for EVERY user of this driver? Do you know
how many different companies (let alone SoCs) are using this generic
driver? Why are you forcing YOUR setup upon everybody? Why should
everybody use YOUR burst increment length? Also, why are you using magic
constants?

> +	dwc3_writel(dwc->regs, DWC3_GSBUSCFG1,
> +		dwc3_readl(dwc->regs, DWC3_GSBUSCFG1) | 0xf00);

ditto, why should EVERYBODY use 16 requests? Why magic constant?

> +	/* Enable Snooping */
> +	if (node && of_dma_is_coherent(node)) {
> +		dwc3_writel(dwc->regs, DWC3_GSBUSCFG0,
> +		dwc3_readl(dwc->regs, DWC3_GSBUSCFG0) | 0x22220000);

why magic constant? How are you certain this will work for everybody?

> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index b83388f..e075665 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -29,6 +29,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
> +#include <linux/of_address.h>
>=20=20
>  #include <linux/usb/ch9.h>
>  #include <linux/usb/gadget.h>
> @@ -913,6 +914,7 @@ struct dwc3 {
>  	struct platform_device	*xhci;
>  	struct resource		xhci_resources[DWC3_XHCI_RESOURCES_NUM];
>=20=20
> +	struct dwc3_event_buffer **ev_buffs;
>  	struct dwc3_event_buffer *ev_buf;
>  	struct dwc3_ep		*eps[DWC3_ENDPOINTS_NUM];
>=20=20
> @@ -946,6 +948,7 @@ struct dwc3 {
>  	u32			incrx_type[2];
>  	u32			irq_gadget;
>  	u32			nr_scratch;
> +	u32			num_event_buffers;
>  	u32			u1u2;
>  	u32			maximum_speed;

NAK

> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index 3e85616..0f2b86c 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -93,8 +93,14 @@ int dwc3_host_init(struct dwc3 *dwc)
>  		dma_set_coherent_mask(&xhci->dev, dwc->dev->coherent_dma_mask);
>=20=20
>  	xhci->dev.parent =3D dwc->dev;
> -
>  	xhci->dev.dma_mask =3D dwc->dev->dma_mask;
> +	xhci->dev.dma_parms     =3D dwc->dev->dma_parms;
> +
> +	/* set DMA operations */
> +	if (dwc->dev->of_node && of_dma_is_coherent(dwc->dev->of_node)) {
> +		xhci->dev.archdata.dma_ops =3D dwc->dev->archdata.dma_ops;
> +		dev_dbg(dwc->dev, "set dma_ops for usb\n");
> +	}

NAK, we have sysdev for that. Seems like you need to use it.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlmNkDwACgkQzL64meEa
mQZ6Rg//Q9j/W9ZwFnXWP2M8I9nkAX3dI0lQxUueF1Ysg5oqNpfNyZX3gj336Dka
CL4y5SAPE7ewwCkUNTJ+xb58lRvG9MpSac3TuVGCsWbONxNWwEn50EvzbQ+oTw2U
+NSkAdELDTO44bfk8bhIxvw8mefPtEsyZVA5L7gFab2Jb0LQDOBtPQ2rfeYW4WCd
P+mFI0Db7ii6LQ/4feytkccsT+mE+iGSFvpW6+gcCv7kyCqL8K+RqfY0WvmXBDGs
FAMdzZqKLll95+OF7CmXMiDa91h8DykbErNJ/7lEu3tqFRKhQxlYr53qqbT+t8Jg
FyMps5Ja3A2WIDFJWW1aRcxoi2/JMPqYQfZcpwqA3NOOE9aB4r9VQg3uWof+pVoA
LQI6E/9vJFhjMULAOzKf+ZWwqwFIz7cnBuRZxLofi3Y4ymRExRB/ru6TYpJ6uuDL
yGhXev/3P8GSWFotonwUxovFyV7wZCS1AlTIpTLxImdVJDVsgHYMKeclJnIV44y/
Ne60YvRHZiSZ+AEe3e96X8hzD6xfkLb3DZnuRVoj7acthtzvE0dZafb1PkUqLUAe
K+mj2tGzKcAeX5xGoPyzQpAFlMJGcfBtZsken2RvxFS8REspy5Lfi94MUvKnwfRM
nryR0PQZBt1crCioDf7Fp6DSMP8xPJ5DPqYmPJiHYkA/dBVM+uU=
=8I9f
-----END PGP SIGNATURE-----
--=-=-=--
