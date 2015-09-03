From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [STLinux Kernel] [PATCH v3 1/6] ARM: STi: Add DT defines for
 co-processor reset lines
Date: Thu, 3 Sep 2015 17:31:29 +0100
Message-ID: <20150903163129.GE7093@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1441208289-17330-1-git-send-email-lee.jones@linaro.org>
 <1441208289-17330-2-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1441208289-17330-2-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, ohad@wizery.com, devicetree@vger.kernel.org, f.fainelli@gmail.com, kernel@stlinux.com, Nathan_Lynch@mentor.com
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Wed, 02 Sep 2015, Lee Jones wrote:

> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  include/dt-bindings/reset-controller/stih407-resets.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/dt-bindings/reset-controller/stih407-resets.h b/include/dt-bindings/reset-controller/stih407-resets.h
> index 02d4328..4ab3a1c 100644
> --- a/include/dt-bindings/reset-controller/stih407-resets.h
> +++ b/include/dt-bindings/reset-controller/stih407-resets.h
> @@ -52,6 +52,10 @@
>  #define STIH407_KEYSCAN_SOFTRESET	26
>  #define STIH407_USB2_PORT0_SOFTRESET	27
>  #define STIH407_USB2_PORT1_SOFTRESET	28
> +#define STIH407_ST231_AUD_SOFTRESET	29
> +#define STIH407_ST231_DMU_SOFTRESET	30
> +#define STIH407_ST231_GP0_SOFTRESET	31
> +#define STIH407_ST231_GP1_SOFTRESET	32

You've added the #defines, so the DT should compile with v3.

However you don't appear to have added the code which
uses these #defines to drivers/reset/reset-stih407.c. So v3
still won't take the co-processors out of reset.

regards,

Peter.
