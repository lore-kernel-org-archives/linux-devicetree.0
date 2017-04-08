From: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: dts: add drive-strength levels of pin for
 Hi3660 SoC
Date: Sat, 8 Apr 2017 14:42:32 +0800
Message-ID: <58E88658.20805@hisilicon.com>
References: <20170330064803.18648-1-hw.wangxiaoyin@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170330064803.18648-1-hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wang Xiaoyin <hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: chenya99-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Xiaoyin,

On 2017/3/30 14:48, Wang Xiaoyin wrote:
> Add drive-strength levels of pin for Hi3660 Soc.
>
> Signed-off-by: Wang Xiaoyin <hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>

Thanks!
Applied both to the hisilicon arm64 dt tree.

Best Regards,
Wei
> ---
>   include/dt-bindings/pinctrl/hisi.h | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/include/dt-bindings/pinctrl/hisi.h b/include/dt-bindings/pinctrl/hisi.h
> index 38f1ea879ea1..0359bfdc9119 100644
> --- a/include/dt-bindings/pinctrl/hisi.h
> +++ b/include/dt-bindings/pinctrl/hisi.h
> @@ -56,4 +56,19 @@
>   #define DRIVE4_08MA	(4 << 4)
>   #define DRIVE4_10MA	(6 << 4)
>   
> +/* drive strength definition for hi3660 */
> +#define DRIVE6_MASK	(15 << 4)
> +#define DRIVE6_04MA	(0 << 4)
> +#define DRIVE6_12MA	(4 << 4)
> +#define DRIVE6_19MA	(8 << 4)
> +#define DRIVE6_27MA	(10 << 4)
> +#define DRIVE6_32MA	(15 << 4)
> +#define DRIVE7_02MA	(0 << 4)
> +#define DRIVE7_04MA	(1 << 4)
> +#define DRIVE7_06MA	(2 << 4)
> +#define DRIVE7_08MA	(3 << 4)
> +#define DRIVE7_10MA	(4 << 4)
> +#define DRIVE7_12MA	(5 << 4)
> +#define DRIVE7_14MA	(6 << 4)
> +#define DRIVE7_16MA	(7 << 4)
>   #endif


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
