From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH RFC] of: add a basic memory driver
Date: Wed, 11 Sep 2013 09:54:00 +0200
Message-ID: <20130911075400.GG2746@lukather>
References: <1378863781-4235-1-git-send-email-emilio@elopez.com.ar>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5377544219795710775=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1378863781-4235-1-git-send-email-emilio@elopez.com.ar>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>
Cc: devicetree@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, rob.herring@calxeda.com, david.lanzendoerfer@o2s.ch, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============5377544219795710775==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2E/hm+v6kSLEYT3h"
Content-Disposition: inline


--2E/hm+v6kSLEYT3h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Emilio,

On Tue, Sep 10, 2013 at 10:43:01PM -0300, Emilio L=F3pez wrote:
> This driver's only job is to claim and ensure that the necessary clock
> for memory operation on a DT-enabled machine remains enabled.
>=20
> Signed-off-by: Emilio L=F3pez <emilio@elopez.com.ar>
> ---
>=20
> Hi,
>=20
> I am currently facing an issue with the clock setup: a critical but
> unclaimed clock gets disabled as a side effect of disabling one of its
> children. The clock setup looks something like this:
>=20
>       PLL
>        |
>  ------------
>  |          |
> DDR       Others
>             |
>           periph
>=20
> The PLL clock is marked with the CLK_IGNORE_UNUSED flag, so on a normal
> boot it remains on, even after the unused clocks cleanup code runs. The
> problem occurs when someone enables "periph" and then, later on, disables
> it: the framework starts disabling clocks upwards on the tree,=20
> eventually switching the PLL off (and that kills the machine, as the memo=
ry
> clock is shut down).

That looks like a bug in the clock framework. I'd expect it to at least
behave in the same way when disabling the unused clocks at late startup
and when going up disabling some clocks' parent later on.

> There's two possible solutions I can think of:
>  1) add some extra checks on the framework to not turn off clocks marked
>     with such a flag on the non-explicit case (ie, when I'm disabling
>     some other clock)
>=20
>  2) create an actual user of the DDR clock, that way it won't get
>     disabled simply because it's being used.
>=20
> I considered 1) and implemented it, but the result was not pretty.

What was not pretty about it?

> This patch is my take on 2). Please let me know what you think; all
> feedback is welcome :)
>=20
> Cheers,
>=20
> Emilio
>=20
>  drivers/of/Kconfig     |  6 ++++++
>  drivers/of/Makefile    |  1 +
>  drivers/of/of_memory.c | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 37 insertions(+)
>  create mode 100644 drivers/of/of_memory.c
>=20
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index 9d2009a..f6c5e20 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -80,4 +80,10 @@ config OF_RESERVED_MEM
>  	help
>  	  Initialization code for DMA reserved memory
> =20
> +config OF_MEMORY
> +	depends on COMMON_CLK
> +	def_bool y
> +	help
> +	  Simple memory initialization
> +
>  endmenu # OF
> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
> index ed9660a..15f0167 100644
> --- a/drivers/of/Makefile
> +++ b/drivers/of/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_OF_PCI)	+=3D of_pci.o
>  obj-$(CONFIG_OF_PCI_IRQ)  +=3D of_pci_irq.o
>  obj-$(CONFIG_OF_MTD)	+=3D of_mtd.o
>  obj-$(CONFIG_OF_RESERVED_MEM) +=3D of_reserved_mem.o
> +obj-$(CONFIG_OF_MEMORY) +=3D of_memory.o
> diff --git a/drivers/of/of_memory.c b/drivers/of/of_memory.c
> new file mode 100644
> index 0000000..a833f7a
> --- /dev/null
> +++ b/drivers/of/of_memory.c
> @@ -0,0 +1,30 @@
> +/*
> + * Simple memory driver
> + */
> +
> +#include <linux/of.h>
> +#include <linux/clk.h>
> +
> +static int __init of_memory_enable(void)
> +{
> +	struct device_node *np;
> +	struct clk *clk;
> +
> +	np =3D of_find_node_by_path("/memory");
> +	if (!np) {
> +		pr_err("no /memory on DT!\n");
> +		return 0;
> +	}
> +
> +	clk =3D of_clk_get(np, 0);
> +	if (!IS_ERR(clk)) {
> +		clk_prepare_enable(clk);
> +		clk_put(clk);
> +	}
> +
> +	of_node_put(np);
> +
> +	return 0;
> +}
> +
> +device_initcall(of_memory_enable);

I like this idea as well. But imho, both 1 and 2 should be done. 2) is
only about memory devices, while 1) is much more generic.

And fwiw, the Marvell Armada 370 is also in this case of having a
gatable clock for the DDR that could potentially be disabled (but is
not, since it has no other users than the DDR itself, and as such, no
one ever calls clk_disable on it).=20

Thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--2E/hm+v6kSLEYT3h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJSMCGYAAoJEBx+YmzsjxAgaN4QAJtb9WjFzKUj0uXP3L8Ea0mG
hCcKGvglf/rVHVD4X43H3wP2dDefDDJ7EAT1Un7KLaKh9SS9V3AFGZ6tqwM02TRW
jsiaMRbQSWdWXF8S2v/hI/5kdnPGBQTnh7h8fJFq/66mEe+1RLnihDA8pDrbTLAR
0Mn8smireik9VUkBEaH55WAGCmFqeE4mn8Zmn/Vf2MFgEJOIxvBGD8bFbs1I7YdF
uGjdM+dtZ4z7kBRGZnX7NCddMOyRvJnYnhK4NvI7uQQRRGzYggh5nBurDM7qEL/c
EsgdHrq5RvRKPTzORfxivddnS5/3hFauQi4Rp7xV2D0XJj3gPRL3x4bxeXedOAo+
TD3gbYOoZDcYuzNj99T6lryrMy9qnjQWNUVIk6W4EhldsFE83xkJJ1ClpoO+v8zS
BH1rhsF7RyEspcYGirgCRIfNCxcVy0FPFjbZQDQH4iTScfZ7969yjT6cD7iZciKW
1SnlF+xNnUOUXl6XgXokzm8/fqzgdGf+NOIA8Lg054XDc4mb9JBdB4P+ZyYw4YaO
AmQjdkuaa0e+/s9qrvq8YprG8rVaAlbF7t74L3OULkf6TsWGRv+7ZNcTTVl2FK6U
G3AYH2O/M3aL9rs2L1R+Xf7sqYKgIIVNHibCMiop/TkSLBza5FJ6L84HnkEx/GEo
9917rQVPPKZgL3fnIZW7
=PT6g
-----END PGP SIGNATURE-----

--2E/hm+v6kSLEYT3h--


--===============5377544219795710775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5377544219795710775==--
