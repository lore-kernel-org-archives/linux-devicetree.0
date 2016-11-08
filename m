From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/30] usb: dwc2: Deprecate g-use-dma binding
Date: Tue, 08 Nov 2016 11:12:10 +0200
Message-ID: <87wpgeibdh.fsf@linux.intel.com>
References: <cover.1478558343.git.johnyoun@synopsys.com>
 <e99e9d8df77884671f94734109a1a8d76a0222c1.1478558343.git.johnyoun@synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7397900825884293777=="
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <e99e9d8df77884671f94734109a1a8d76a0222c1.1478558343.git.johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============7397900825884293777==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:
> Add a vendor prefix and make the name more consistent by renaming it to
> "snps,gadget-dma-enable".
>
> Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.txt | 5 ++++-
>  arch/arm/boot/dts/rk3036.dtsi                  | 2 +-
>  arch/arm/boot/dts/rk3288.dtsi                  | 2 +-
>  arch/arm/boot/dts/rk3xxx.dtsi                  | 2 +-
>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi      | 2 +-
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi       | 2 +-
>  drivers/usb/dwc2/params.c                      | 9 ++++++++-
>  drivers/usb/dwc2/pci.c                         | 2 +-
>  8 files changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentati=
on/devicetree/bindings/usb/dwc2.txt
> index 9472111..389a461 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
> @@ -26,11 +26,14 @@ Refer to phy/phy-bindings.txt for generic phy consume=
r properties
>  - dr_mode: shall be one of "host", "peripheral" and "otg"
>    Refer to usb/generic.txt
>  - snps,host-dma-disable: disable host DMA mode.
> -- g-use-dma: enable dma usage in gadget driver.
> +- snps,gadget-dma-enable: enable gadget DMA mode.

I don't see why you even have this binding. Looking through the code,
you have:

#define GHWCFG2_SLAVE_ONLY_ARCH			0
#define GHWCFG2_EXT_DMA_ARCH			1
#define GHWCFG2_INT_DMA_ARCH			2

void dwc2_set_param_dma_enable(struct dwc2_hsotg *hsotg, int val)
{
	int valid =3D 1;

	if (val > 0 && hsotg->hw_params.arch =3D=3D GHWCFG2_SLAVE_ONLY_ARCH)
		valid =3D 0;
	if (val < 0)
		valid =3D 0;

	if (!valid) {
		if (val >=3D 0)
			dev_err(hsotg->dev,
				"%d invalid for dma_enable parameter. Check HW configuration.\n",
				val);
		val =3D hsotg->hw_params.arch !=3D GHWCFG2_SLAVE_ONLY_ARCH;
		dev_dbg(hsotg->dev, "Setting dma_enable to %d\n", val);
	}

	hsotg->core_params->dma_enable =3D val;
}

which seems to hint that DMA support is discoverable. If there is DMA,
why would disable it?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYIZbqAAoJEMy+uJnhGpkG6PEP/Rn2lhWl3Od6+PWcdA+h4ktn
0apqjqFhqRp8RICdUzXqY+NAwuLAPZ7B3FzNM8SvRRc5Dyjqdupjzx6rGvXwugoP
l7QL91MoUR2/21VqEWuw8JTt/upunm2MDvX0YzzUI5YWkbi2ZTe5POZfYdJ1tu25
4ep7GjdGDyfhVbQlAtlqVJhD0wBC8Qw0WT0YMlPTdk7pOClWNEn9bAlgJE30M5N3
cpLjEaSdwFqqxzbufNZY7vEunHtsnkZPcTvWzugct72c34eTYHQZy2QtE1aF6Orb
Qnl86GsOtM+4KjhUKi7gge1V+Mp5fjA3LE6GqPgnu+WLym9MboBKvTWoRMU5Sn8e
rDZ17Gmi/Sz6dvIM/0GhHDidBoDGZJPNt5x5+0kf0a/wXcXc/odFuXWb18wJvqjQ
Cnl4n/jvb0RoVVWXGeN4rFWjaoJgFswGE06Vpzx6kEUcJv4aip2ioq2vIa+T8CJi
jByunhM/3DPUJIJQoJVXHTySkpQkSP70qyoJ/h8vNxnV2nnuzC7YbFO7v7sdIWmY
owWPP5Bi5QscT6uX0jd8J9uxSK7atOqEZz8qQJNmbhqdqU96zO17U/yoVtIaaqtI
I6xdh/6jgGxb7sFdPnLN3mM+kKWk0IeHe9XJvpYVHzGUy8xwvvPc7nuIb7/O7b0L
+At60QKZOTSIGM83rFT+
=oO5y
-----END PGP SIGNATURE-----
--=-=-=--


--===============7397900825884293777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-rockchip mailing list
Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip

--===============7397900825884293777==--
