From: =?windows-1252?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: create an include directory for DT bindings
Date: Tue, 11 Nov 2014 15:51:14 +0100
Message-ID: <54622262.2010200@suse.de>
References: <1415712108-11352-1-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415712108-11352-1-git-send-email-bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Am 11.11.2014 um 14:21 schrieb Bintian Wang:
> Some header files may be used by both DT files and kernel, and we
> usually put them under <include/dt-bindings/>, and also include them
> in DT files just like:
>     #include <dt-bindings/xxx/xxx.h>
> for exaple, some clock header files.
>=20
> On arm64 platform, the compiler will report an error and terminate
> when compiling DT files:
>     dt-bindings/xxx/xxx.h: No such file or directory
>=20
> In order to fix the compile error, create an include directory and sy=
mlink
> dt-bindings from there to the actual location of include/dt-bindings/=
:
>=20
> arch/arm64/boot/dts/include/dt-bindings -> ../../../../../include/dt-=
bindings
>=20
> Signed-off-by: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/include/dt-bindings | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 120000 arch/arm64/boot/dts/include/dt-bindings
>=20
> diff --git a/arch/arm64/boot/dts/include/dt-bindings b/arch/arm64/boo=
t/dts/include/dt-bindings
> new file mode 120000
> index 0000000..08c00e4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/include/dt-bindings
> @@ -0,0 +1 @@
> +../../../../../include/dt-bindings
> \ No newline at end of file

Such a patch was already on the list for the Juno board.

Regards,
Andreas

--=20
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 21284 AG N=FCrn=
berg
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
