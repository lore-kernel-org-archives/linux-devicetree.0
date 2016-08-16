From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v10 5/5] usb: dwc3: add rockchip specific glue layer
Date: Tue, 16 Aug 2016 10:19:20 +0300
Message-ID: <87y43x89l3.fsf@linux.intel.com>
References: <1471251031-17084-1-git-send-email-william.wu@rock-chips.com> <1471251284-1804-1-git-send-email-william.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471251284-1804-1-git-send-email-william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org> writes:
> Add rockchip specific glue layer to support USB3 Peripheral mode
> and Host mode on rockchip platforms (e.g. rk3399).
>
> The DesignWare USB3 integrated in rockchip SoCs is a configurable
> IP Core which can be instantiated as Dual-Role Device (DRD), Host
> Only (XHCI) and Peripheral Only configurations.
>
> We use extcon notifier to manage usb cable detection and mode switch.
> Enable DWC3 PM runtime auto suspend to allow core enter runtime_suspend
> if USB cable is dettached. For host mode, it requires to keep whole
> DWC3 controller in reset state to hold pipe power state in P2 before
> initializing PHY. And it need to reconfigure USB PHY interface of DWC3
> core after deassert DWC3 controller reset.
>
> The current driver supports Host only and Peripheral Only well, for
> now, we will add support for OTG after we have it all stabilized.
>
> Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> Changes in v10:
> - fix building error
>
> Changes in v9:
> - Add a new dwc3-rockchip.c driver for rk3399, rather than use dwc3-of-si=
mple.c
>
>  drivers/usb/dwc3/Kconfig         |   9 +
>  drivers/usb/dwc3/Makefile        |   1 +
>  drivers/usb/dwc3/core.c          |   2 +-
>  drivers/usb/dwc3/core.h          |   1 +
>  drivers/usb/dwc3/dwc3-rockchip.c | 441 +++++++++++++++++++++++++++++++++=
++++++

William, if you need to touch core dwc3 to introduce a glue layer,
you're doing it wrong.

> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index e887b38..3da6215 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -405,7 +405,7 @@ static void dwc3_cache_hwparams(struct dwc3 *dwc)
>   * initialized. The PHY interfaces and the PHYs get initialized together=
 with
>   * the core in dwc3_core_init.
>   */
> -static int dwc3_phy_setup(struct dwc3 *dwc)
> +int dwc3_phy_setup(struct dwc3 *dwc)

there's no way I'll let this slip through the cracks :-)

> diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-roc=
kchip.c
> new file mode 100644
> index 0000000..eeae1a9
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-rockchip.c
> @@ -0,0 +1,441 @@

[...]

> +static int dwc3_rockchip_probe(struct platform_device *pdev)
> +{
> +	struct dwc3_rockchip	*rockchip;
> +	struct device		*dev =3D &pdev->dev;
> +	struct device_node	*np =3D dev->of_node, *child;
> +	struct platform_device	*child_pdev;
> +
> +	unsigned int		count;
> +	int			ret;
> +	int			i;
> +
> +	rockchip =3D devm_kzalloc(dev, sizeof(*rockchip), GFP_KERNEL);
> +
> +	if (!rockchip)
> +		return -ENOMEM;
> +
> +	count =3D of_clk_get_parent_count(np);
> +	if (!count)
> +		return -ENOENT;
> +
> +	rockchip->num_clocks =3D count;
> +
> +	rockchip->clks =3D devm_kcalloc(dev, rockchip->num_clocks,
> +				      sizeof(struct clk *), GFP_KERNEL);
> +	if (!rockchip->clks)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, rockchip);
> +
> +	rockchip->dev =3D dev;
> +	rockchip->edev =3D NULL;
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	ret =3D pm_runtime_get_sync(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "get_sync failed with err %d\n", ret);
> +		goto err1;
> +	}
> +
> +	for (i =3D 0; i < rockchip->num_clocks; i++) {
> +		struct clk	*clk;
> +
> +		clk =3D of_clk_get(np, i);
> +		if (IS_ERR(clk)) {
> +			while (--i >=3D 0)
> +				clk_put(rockchip->clks[i]);
> +			ret =3D PTR_ERR(clk);
> +
> +			goto err1;
> +		}
> +
> +		ret =3D clk_prepare_enable(clk);
> +		if (ret < 0) {
> +			while (--i >=3D 0) {
> +				clk_disable_unprepare(rockchip->clks[i]);
> +				clk_put(rockchip->clks[i]);
> +			}
> +			clk_put(clk);
> +
> +			goto err1;
> +		}
> +
> +		rockchip->clks[i] =3D clk;
> +	}
> +
> +	rockchip->otg_rst =3D devm_reset_control_get(dev, "usb3-otg");
> +	if (IS_ERR(rockchip->otg_rst)) {
> +		dev_err(dev, "could not get reset controller\n");
> +		ret =3D PTR_ERR(rockchip->otg_rst);
> +		goto err2;
> +	}
> +
> +	ret =3D dwc3_rockchip_extcon_register(rockchip);
> +	if (ret < 0)
> +		goto err2;
> +
> +	child =3D of_get_child_by_name(np, "dwc3");
> +	if (!child) {
> +		dev_err(dev, "failed to find dwc3 core node\n");
> +		ret =3D -ENODEV;
> +		goto err3;
> +	}
> +
> +	/* Allocate and initialize the core */
> +	ret =3D of_platform_populate(np, NULL, NULL, dev);
> +	if (ret) {
> +		dev_err(dev, "failed to create dwc3 core\n");
> +		goto err3;
> +	}
> +
> +	child_pdev =3D of_find_device_by_node(child);
> +	if (!child_pdev) {
> +		dev_err(dev, "failed to find dwc3 core device\n");
> +		ret =3D -ENODEV;
> +		goto err4;
> +	}
> +
> +	rockchip->dwc =3D platform_get_drvdata(child_pdev);

No! You will *NOT* the core struct device. Don't even try to come up
with tricks like this.

Let's do this: introduce a glue layer that gets peripheral-only
working. Remove PM for now, too. Start with something simple, get the
bare minimum working upstream and add more stuff as you go.

Trying to do everything in one patch just makes it much more likely for
your patch to be NAKed. What you're doing here is bypassing all the
layering we've built. That won't work very well. The only thing you'll
get is for your patches to continue to be NAKed.

Avoid the tricks and abuses. Just because you _can_ do it somehow, it
doesn't mean you _should_ do it :-)

Your best option right now, is to remove PM and dual-role support and a
minimal glue layer supported.

In fact, all you *really* need is to add a compatible to
dwc3-of-simple.c. That should be enough to get your dwc3 working. Don't
do anything more than that. For dual-role and PM, we can add it
generically to dwc3-of-simple.c when all pieces fall into place.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXsr54AAoJEIaOsuA1yqREN0QQAKlPytsAUbZyb/y1MxLgHkpG
/4a2RRBRzMZGl+sIX68xC172MBeICaG2oC0WtWevidcEn+iJMWb9JfQcYN+GBrqu
kls/cgdY04FLn0hjoIuP5NYviX515SjoxzZNtB+vef3SGWu+5WVTKYr/DlqRM7wb
jFxF2jESQ7dED0zP2R77kdaXj3ykZ21zV72uYuI1zanx2KB12wzPW+HLKsPKHbYO
lAp81Xw5E4pwGPc1TghwrJ0hPlvok4WZ+ApiKD3VNLcbwPGxa0FQFXcL08Gi+Bqt
jzEk0O64J+4mHAU/srtcBddLzMaqYHgNlrm/RSvsW4CQ7CDjq8vVh3lcp9VR/6c8
e3NZJF5MQtCm6bnvJ2sOYSaKtkLKneR6On34z69yo3tJuxG4WsBCRZJVuBBJ5PhS
UqW1DQenDWe4jys5LUPoKHiWAErP2CKDDxqAsIZe1xxl55LsilCSpAIqFgdU7u1O
tXx2NJHrZKHTSfUW/7fq8pGwOF4C1uRiE9L6cD1s8U5S/To9j9C/c3LZWCgFrq56
2CGwj+O7gl+KD1ZC75hbT2Ah3I5LifLBuEs7s6jyrRZUl46IKFEn7c7s94g2PxcT
wNMQjMvSzIpe0yho8VbLJ/DF9hd7ESzx9uQoVYgSFsD1elw/9syZlY/dCAZOWg2D
ykD7CVp4NPfTCKUPBJer
=W/u7
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
