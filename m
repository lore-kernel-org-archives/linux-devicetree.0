From: Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx27: fix typo in makefile
Date: Thu, 19 Mar 2015 18:43:28 +0000
Message-ID: <CALeDE9OV_gLz9BBPL4Lv5+H0900XyFB_+CwRTAZ5HmYo4952YQ@mail.gmail.com>
References: <1426789318-30637-1-git-send-email-vincent.stehle@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426789318-30637-1-git-send-email-vincent.stehle-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 19, 2015 at 6:21 PM, Vincent Stehl=C3=A9
<vincent.stehle-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> Commit cb612390e546 ("ARM: dts: Only build dtb if associated Arch and=
/or SoC is
> enabled") conditioned the generation of i.MX27 systems dts with
> CONFIG_SOC_IMX31; fix this typo.
>
> Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Signed-off-by: Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> Cc: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index a1c776b..992ea0b 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -215,7 +215,7 @@ dtb-$(CONFIG_SOC_IMX25) +=3D \
>         imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb \
>         imx25-karo-tx25.dtb \
>         imx25-pdk.dtb
> -dtb-$(CONFIG_SOC_IMX31) +=3D \
> +dtb-$(CONFIG_SOC_IMX27) +=3D \
>         imx27-apf27.dtb \
>         imx27-apf27dev.dtb \
>         imx27-eukrea-mbimxsd27-baseboard.dtb \
> --
> 2.1.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
