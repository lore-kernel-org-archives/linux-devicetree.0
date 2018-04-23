From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v1 1/2] ARM: configs: stm32: Add MDMA support on
 STM32MP157C
Date: Mon, 23 Apr 2018 11:04:03 +0200
Message-ID: <48c7176a-a4a3-3f13-f76e-cd5833f7f8dc@st.com>
References: <1524215707-14642-1-git-send-email-pierre-yves.mordret@st.com>
 <1524215707-14642-2-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1524215707-14642-2-git-send-email-pierre-yves.mordret@st.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Pierre-Yves,

On 04/20/2018 11:15 AM, Pierre-Yves MORDRET wrote:
> This patch adds MDMA support on STM32MP157C
> 
> Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
> ---
>    Version history:
>       v1:
>          * Initial
> ---
> ---
>   arch/arm/mach-stm32/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
> index 713c068..730feae 100644
> --- a/arch/arm/mach-stm32/Kconfig
> +++ b/arch/arm/mach-stm32/Kconfig
> @@ -46,6 +46,7 @@ if ARCH_MULTI_V7
>   
>   config MACH_STM32MP157
>   	bool "STMicroelectronics STM32MP157"
> +	select STM32_MDMA
>   	default y
>   
>   endif # ARMv7-A
> 

For patches located in mach-stm32, next time I prefer that you format 
commit header as following:

ARM: stm32: Add MDMA support on STM32MP157C

I don't see other issue, so don't resend for that, I will change it.

Regards
Alex
