From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 3/7] usb: mtu3: support ip-sleep wakeup for MT8183
Date: Wed, 11 Sep 2019 11:44:53 -0700
Message-ID: <20190911184453.GA2628@roeck-us.net>
References: <1567150854-30033-1-git-send-email-chunfeng.yun@mediatek.com>
 <1567150854-30033-4-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1567150854-30033-4-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 30, 2019 at 03:40:50PM +0800, Chunfeng Yun wrote:
> Support USB wakeup by ip-sleep mode for MT8183, it's similar to
> MT8173
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3: changes micros define
> 
> v2: no changes
> ---
>  drivers/usb/mtu3/mtu3_host.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_host.c b/drivers/usb/mtu3/mtu3_host.c
> index c871b94f3e6f..4f8208885ebd 100644
> --- a/drivers/usb/mtu3/mtu3_host.c
> +++ b/drivers/usb/mtu3/mtu3_host.c
> @@ -18,6 +18,12 @@
>  #include "mtu3.h"
>  #include "mtu3_dr.h"
>  
> +/* mt8183 etc */
> +#define PERI_WK_CTRL0	0x20
> +#define WC0_IS_C(x)	(((x) & 0xf) << 28)  /* cycle debounce */
> +#define WC0_IS_P	BIT(12)	/* polarity */
> +#define WC0_IS_EN	BIT(6)
> +

For 64-bit builds, this results in:

drivers/usb/mtu3/mtu3_host.c: In function ‘ssusb_wakeup_ip_sleep_set’:
./include/linux/bits.h:6:19: warning:
	conversion from ‘long unsigned int’ to ‘u32’ {aka ‘unsigned int’}
	changes value from ‘18446744073441120320’ to ‘4026536000’ [-Woverflow]

since WC0_IS_C() is sign extended to 64 bit and then truncated.

Observed with gcc 7.4.0 and 8.3.0.

Guenter

>  /* mt8173 etc */
>  #define PERI_WK_CTRL1	0x4
>  #define WC1_IS_C(x)	(((x) & 0xf) << 26)  /* cycle debounce */
> @@ -30,7 +36,8 @@
>  #define SSC_SPM_INT_EN		BIT(1)
>  
>  enum ssusb_uwk_vers {
> -	SSUSB_UWK_V1 = 1,
> +	SSUSB_UWK_V0 = 0,
> +	SSUSB_UWK_V1,
>  	SSUSB_UWK_V2,
>  };
>  
> @@ -43,6 +50,11 @@ static void ssusb_wakeup_ip_sleep_set(struct ssusb_mtk *ssusb, bool enable)
>  	u32 reg, msk, val;
>  
>  	switch (ssusb->uwk_vers) {
> +	case SSUSB_UWK_V0:
> +		reg = ssusb->uwk_reg_base + PERI_WK_CTRL0;
> +		msk = WC0_IS_EN | WC0_IS_C(0xf) | WC0_IS_P;
> +		val = enable ? (WC0_IS_EN | WC0_IS_C(0x8)) : 0;
> +		break;
>  	case SSUSB_UWK_V1:
>  		reg = ssusb->uwk_reg_base + PERI_WK_CTRL1;
>  		msk = WC1_IS_EN | WC1_IS_C(0xf) | WC1_IS_P;
