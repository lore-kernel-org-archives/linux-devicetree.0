From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv4 2/4] ARM: msm: Add support for APQ8074 Dragonboard
Date: Fri, 04 Oct 2013 11:28:31 +0300
Message-ID: <1380875311.24031.17.camel@iivanov-dev.int.mm-sol.com>
References: <1380841557-2673-1-git-send-email-rvaswani@codeaurora.org>
	 <1380841557-2673-3-git-send-email-rvaswani@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380841557-2673-3-git-send-email-rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rohit Vaswani <rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Daniel Walker <dwalker-zu3NM2574RrQT0dZR+AlfA@public.gmane.org>, Bryan Huntsman <bryanh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Hi Rohit, 

On Thu, 2013-10-03 at 16:05 -0700, Rohit Vaswani wrote: 
> This patch adds basic board support for APQ8074 Dragonboard
> which belongs to the Snapdragon 800 family.
> For now, just support a basic machine with device tree.
> 
> Signed-off-by: Rohit Vaswani <rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                     |  3 ++-
>  arch/arm/boot/dts/qcom-apq8074-dragonboard.dts |  6 +++++
>  arch/arm/boot/dts/qcom-msm8974.dtsi            | 35 ++++++++++++++++++++++++++
>  arch/arm/mach-msm/Kconfig                      | 13 ++++++++++
>  arch/arm/mach-msm/board-dt.c                   |  9 +++++++
>  5 files changed, 65 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>  create mode 100644 arch/arm/boot/dts/qcom-msm8974.dtsi
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 000cf76..e71a3ec 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -102,7 +102,8 @@ dtb-$(CONFIG_ARCH_KIRKWOOD) += kirkwood-cloudbox.dtb \
>  	kirkwood-openblocks_a6.dtb
>  dtb-$(CONFIG_ARCH_MARCO) += marco-evb.dtb
>  dtb-$(CONFIG_ARCH_MSM) += msm8660-surf.dtb \
> -	msm8960-cdp.dtb
> +	msm8960-cdp.dtb \
> +	qcom-apq8074-dragonboard.dtb
>  dtb-$(CONFIG_ARCH_MVEBU) += armada-370-db.dtb \
>  	armada-370-mirabox.dtb \
>  	armada-370-netgear-rn102.dtb \
> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> new file mode 100644
> index 0000000..bb6f3c4
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> @@ -0,0 +1,6 @@
> +/include/ "qcom-msm8974.dtsi"

Please, could you replace /include/ by #include. This will allow
us to use of #define features from C header files. Since[1] we have 
clocks indexes definitions shared between C code and DT files.


Thanks, 
Ivan

[1] http://www.spinics.net/lists/arm-kernel/msg276937.html



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
