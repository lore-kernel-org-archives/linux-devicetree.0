From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] <linux/of_platform.h>: fix compilation warnings with DT
 disabled
Date: Fri, 1 Mar 2013 16:09:25 +0900
Message-ID: <20130301070925.GA24369@verge.net.au>
References: <201302190258.25726.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201302190258.25726.sergei.shtylyov@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, devicetree-discuss@lists.ozlabs.org, vladimir.barinov@cogentembedded.com, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 19, 2013 at 02:58:25AM +0300, Sergei Shtylyov wrote:
> Fix the following compilation warnings (in Simon Horman's renesas.git=
 repo):
>=20
> In file included from arch/arm/mach-shmobile/setup-r8a7779.c:24:0:
> include/linux/of_platform.h:107:13: warning: =E2=80=98struct of_devic=
e_id=E2=80=99 declared
> inside parameter list [enabled by default]
> include/linux/of_platform.h:107:13: warning: its scope is only this d=
efinition
> or declaration, which is probably not what you want [enabled by defau=
lt]
> include/linux/of_platform.h:107:13: warning: =E2=80=98struct device_n=
ode=E2=80=99 declared
> inside parameter list [enabled by default]
>=20
> <linux/of_platform.h> only #include's headers with definitions of the=
 above
> mentioned structures if CONFIG_OF_DEVICE=3Dy but uses them even if no=
t. One
> solution is to move some #include's out of #ifdef CONFIG_OF_DEVICE an=
d use
> incomplete declarations for the rest of the structures where the #ifd=
ef move
> doesn't help...
>=20
> Reported-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Grant, could you consider taking this patch?

> ---
> Actually, it compiles eve without 'struct device_node' declared, I ha=
ven't
> found the reason of this, so left it there...
>=20
>  include/linux/of_platform.h |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> Index: linux/include/linux/of_platform.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux.orig/include/linux/of_platform.h
> +++ linux/include/linux/of_platform.h
> @@ -11,9 +11,10 @@
>   *
>   */
> =20
> -#ifdef CONFIG_OF_DEVICE
>  #include <linux/device.h>
>  #include <linux/mod_devicetable.h>
> +
> +#ifdef CONFIG_OF_DEVICE
>  #include <linux/pm.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> @@ -100,7 +101,7 @@ extern int of_platform_populate(struct d
> =20
>  #if !defined(CONFIG_OF_ADDRESS)
>  struct of_dev_auxdata;
> -struct device;
> +struct device_node;
>  static inline int of_platform_populate(struct device_node *root,
>  					const struct of_device_id *matches,
>  					const struct of_dev_auxdata *lookup,
> --
> To unsubscribe from this list: send the line "unsubscribe linux-sh" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
