From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 9/9] usb: musb: musb_am335x: reinstate module
 loading/unloading support
Date: Fri, 18 Jul 2014 09:04:03 -0500
Message-ID: <20140718140403.GI24914@saruman.home>
References: <1405675890-8802-1-git-send-email-LW@KARO-electronics.de>
 <1405675890-8802-2-git-send-email-LW@KARO-electronics.de>
 <1405675890-8802-3-git-send-email-LW@KARO-electronics.de>
 <1405675890-8802-4-git-send-email-LW@KARO-electronics.de>
 <1405675890-8802-5-git-send-email-LW@KARO-electronics.de>
 <1405675890-8802-6-git-send-email-LW@KARO-electronics.de>
 <1405675890-8802-7-git-send-email-LW@KARO-electronics.de>
 <1405675890-8802-8-git-send-email-LW@KARO-electronics.de>
 <1405675890-8802-9-git-send-email-LW@KARO-electronics.de>
 <1405675890-8802-10-git-send-email-LW@KARO-electronics.de>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tSiBuZsJmMXpnp7T"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1405675890-8802-10-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, George Cherian <george.cherian-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--tSiBuZsJmMXpnp7T
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 18, 2014 at 11:31:30AM +0200, Lothar Wa=DFmann wrote:
> There is no need to throw the baby out with the bath due to a bad
> failure analysis. The commit:
> 7adb5c876e9c usb: musb: Fix panic upon musb_am335x module removal
> came to a wrong conclusion about the cause of the crash it was
> "fixing". The real culprit was the phy-am335x module that was removed
> from underneath its users that were still referencing data from it.
> After having fixed this in a previous patch, module unloading can be
> reinstated.
>=20
> Another bug with module loading/unloading was the fact, that after
> removing the devices instantiated from DT their 'OF_POPULATED' flag
> was still set, so that re-loading the module after an unload had no
> effect. This is also fixed in this patch.

now this is a good commit log. I still can't see the need for the other
patch adding try_module_get(), though. Another thing, this needs to be
reviewed by DT folks too.

> Signed-off-by: Lothar Wa=DFmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> ---
>  drivers/usb/musb/musb_am335x.c |   23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/usb/musb/musb_am335x.c b/drivers/usb/musb/musb_am335=
x.c
> index 164c868..152a6f5 100644
> --- a/drivers/usb/musb/musb_am335x.c
> +++ b/drivers/usb/musb/musb_am335x.c
> @@ -19,6 +19,22 @@ err:
>  	return ret;
>  }
> =20
> +static int of_remove_populated_child(struct device *dev, void *d)
> +{
> +	struct platform_device *pdev =3D to_platform_device(dev);
> +
> +	of_device_unregister(pdev);
> +	of_node_clear_flag(pdev->dev.of_node, OF_POPULATED);

I don't think this should be called by drivers; rather by the bus.

> +	return 0;
> +}
> +
> +static int am335x_child_remove(struct platform_device *pdev)
> +{
> +	device_for_each_child(&pdev->dev, NULL, of_remove_populated_child);
> +	pm_runtime_disable(&pdev->dev);
> +	return 0;
> +}
> +
>  static const struct of_device_id am335x_child_of_match[] =3D {
>  	{ .compatible =3D "ti,am33xx-usb" },
>  	{  }
> @@ -27,17 +43,14 @@ MODULE_DEVICE_TABLE(of, am335x_child_of_match);
> =20
>  static struct platform_driver am335x_child_driver =3D {
>  	.probe		=3D am335x_child_probe,
> +	.remove		=3D am335x_child_remove,
>  	.driver		=3D {
>  		.name	=3D "am335x-usb-childs",
>  		.of_match_table	=3D am335x_child_of_match,
>  	},
>  };
> =20
> -static int __init am335x_child_init(void)
> -{
> -	return platform_driver_register(&am335x_child_driver);
> -}
> -module_init(am335x_child_init);
> +module_platform_driver(am335x_child_driver);
> =20
>  MODULE_DESCRIPTION("AM33xx child devices");
>  MODULE_LICENSE("GPL v2");
> --=20
> 1.7.10.4
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

--=20
balbi

--tSiBuZsJmMXpnp7T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTySlTAAoJEIaOsuA1yqRENfUQAIeEqA+cN3yL6drRJJMzavxb
i1PBpj4ow0gHN6Lvwb3PgQ8xbfMrXjGzAE8W4MsSB6h+/QhJUsYu4BqjGLHz0Uej
VI7ASMU3acdFdcYO41hwomn13hbsGh1zXS5ypqej7g9PcX2n4w2Af7/zBQ9jlMW3
/p7VsPp7MHNubDwb28/QSEZqJk1Ow37pisEZL/tSpqEtuHzhOoYgZ554eG3IeqDM
tSU/yWK1bBNcUrkyyFJTviMm8b+VFmQOYYu7WkyfQ3VlQqWDeT6ynva2BQn9hc9P
e8uaPdzGIR90pNPtej34LK1vWSQwc1UbhaZxMDNmndeh025AjYagcrivI+5ADKhP
4pBDSyN5g0j3lZETVOX6pp33vJtJnjkKyKZ0Hl+vwzuDK3F7/rf+sygwU8I7DETd
8sfVvbtnkKpEPm58W1HG0LZIVWmRvUMb3ZopTPhMDz7itaPE7Mu+p+k6b2mhk+cg
qHzskrytitcOTad2z7W+iXfiU82dDjFtCKpVJTuWnU9EwZBQuok/rep+dyQ7IpsF
VkVH3lrVxuaQSUcznPKOWPZdfeIw6gG+wYUMxAI9U+oQafotawBfXfghjZbLcxmU
vfp0TtVyWVpRDq1Ag+oQQZsgcVzCQCNYFpXeeD/HQV2umXGKOTZftCLiGb1+kAEo
Ax9qnJQZJkFDM4Md4MeD
=tuPn
-----END PGP SIGNATURE-----

--tSiBuZsJmMXpnp7T--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
