From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: rockchip: convert smp bringup to
 CPU_METHOD_OF_DECLARE
Date: Mon, 26 May 2014 11:13:15 -0700
Message-ID: <20140526181315.GA27093@quad.lixom.net>
References: <1632873.urGeGsUMPH@diego>
 <20140326110024.GR10341@e106331-lin.cambridge.arm.com>
 <2151573.evmqdkWnet@diego>
 <1878147.CvhHSZhTas@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1878147.CvhHSZhTas@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 27, 2014 at 01:06:32AM +0100, Heiko St=FCbner wrote:
> With the newly introduced CPU_METHOD_OF_DECLARE is not necessary anym=
ore
> to reference the relevant smp_ops in the board file, but instead it c=
an
> simply be set by the enable-method property of the cpu nodes.
>=20
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

Applied, however:

> ---
> changes since v1:
>   - add a short description to the enable-method binding
>=20
>  Documentation/devicetree/bindings/arm/cpus.txt | 2 ++
>  arch/arm/boot/dts/rk3066a.dtsi                 | 1 +
>  arch/arm/boot/dts/rk3188.dtsi                  | 1 +
>  arch/arm/mach-rockchip/core.h                  | 2 --
>  arch/arm/mach-rockchip/platsmp.c               | 3 ++-
>  arch/arm/mach-rockchip/rockchip.c              | 1 -
>  6 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documen=
tation/devicetree/bindings/arm/cpus.txt
> index 333f4ae..f52a9ac 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.txt
> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> @@ -185,6 +185,8 @@ nodes to be present and contain the properties de=
scribed below.
>  			    "qcom,gcc-msm8660"
>  			    "qcom,kpss-acc-v1"
>  			    "qcom,kpss-acc-v2"
> +			    "rockchip,rk3066-smp" - cpu-core handling of Socs
> +					from Rockchip starting with rk3066

Nobody else has a comment here, so I removed this one.

I noticed that the list is unsorted, in particular the new marvell entr=
ies were
appended instead of inserted at the right location, which caused a merg=
e
conflict. Sigh. I'll do a separate commit on top to sort the list, sinc=
e
we seem to have the new out-of-order additions in our tree.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
