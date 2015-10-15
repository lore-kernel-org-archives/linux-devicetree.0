From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/3] extcon: arizona: Add extcon specific device tree
 binding document
Date: Thu, 15 Oct 2015 17:39:12 +0900
Message-ID: <561F6630.3050802@samsung.com>
References: <1444831944-4655-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1444831944-4655-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1444831944-4655-2-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Charles,

On 2015=EB=85=84 10=EC=9B=94 14=EC=9D=BC 23:12, Charles Keepax wrote:
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
>  .../devicetree/bindings/extcon/extcon-arizona.txt  |   15 ++++++++++=
+++++
>  MAINTAINERS                                        |    1 +
>  2 files changed, 16 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/extcon/extcon-a=
rizona.txt
>=20
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-arizona.=
txt b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> new file mode 100644
> index 0000000..e1705fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> @@ -0,0 +1,15 @@
> +Cirrus Logic Arizona class audio SoCs
> +
> +These devices are audio SoCs with extensive digital capabilities and=
 a range
> +of analogue I/O.
> +
> +This document lists Extcon specific bindings, see the primary bindin=
g document:
> +  ../mfd/arizona.txt
> +
> +Optional properties:
> +
> +  - wlf,hpdet-channel : Headphone detection channel.
> +    ARIZONA_ACCDET_MODE_HPL or 1 - Headphone detect mode is set to H=
PDETL
> +    ARIZONA_ACCDET_MODE_HPR or 2 - Headphone detect mode is set to H=
PDETR
> +    If this node is not mentioned or if the value is unknown, then
> +    headphone detection mode is set to HPDETL.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9f6685f..08c804a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11393,6 +11393,7 @@ T:	git https://github.com/CirrusLogic/linux-d=
rivers.git
>  W:	https://github.com/CirrusLogic/linux-drivers/wiki
>  S:	Supported
>  F:	Documentation/hwmon/wm83??
> +F:	Documentation/devicetree/bindings/extcon/extcon-arizona.txt
>  F:	arch/arm/mach-s3c64xx/mach-crag6410*
>  F:	drivers/clk/clk-wm83*.c
>  F:	drivers/extcon/extcon-arizona.c
>=20

You should add the description of patch.

If you add the description, looks good to me and you can add my acked t=
ag.
Acked-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Thanks,
Chanwoo Choi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
