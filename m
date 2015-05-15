From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [STLinux Kernel] [PATCH] ARM: STi: DT: STih407: Re-order #include
 <*.dtsi> files
Date: Fri, 15 May 2015 11:49:47 +0200
Message-ID: <5555C13B.1090705@st.com>
References: <1431353569-13291-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431353569-13291-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

HI Lee,

On 05/11/2015 04:12 PM, Lee Jones wrote:
> This patch fixes a regression where serial is enabled by the first
> (board) DTSI, then disabled by the second (SoC) file.  To enable
> serial and keep it enabled, we need to include the file which enables
> it last.
>
> Reported-by: LAVA [via Peter Griffin <peter.griffin@linaro.org>]
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>   arch/arm/boot/dts/stih407-b2120.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/stih407-b2120.dts b/arch/arm/boot/dts/stih407-b2120.dts
> index af48714..6d93475 100644
> --- a/arch/arm/boot/dts/stih407-b2120.dts
> +++ b/arch/arm/boot/dts/stih407-b2120.dts
> @@ -7,8 +7,8 @@
>    * published by the Free Software Foundation.
>    */
>   /dts-v1/;
> -#include "stihxxx-b2120.dtsi"
>   #include "stih407.dtsi"
> +#include "stihxxx-b2120.dtsi"
>   / {
>   	model = "STiH407 B2120";
>   	compatible = "st,stih407-b2120", "st,stih407";

Applied to STi DT branch for v4.2.

Thanks!
Maxime
