From: "Christian Daudt" <csd@broadcom.com>
Subject: Re: [PATCH v9 2/3] ARM: bcm281xx: Enable GPIO driver
Date: Tue, 10 Sep 2013 15:32:02 -0700
Message-ID: <522F9DE2.8080605@broadcom.com>
References: <1378836423-12467-1-git-send-email-markus.mayer@linaro.org>
 <1378836423-12467-3-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1378836423-12467-3-git-send-email-markus.mayer@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Markus Mayer <markus.mayer@linaro.org>
Cc: Device Tree List <devicetree@vger.kernel.org>, Linaro Patches <patches@linaro.org>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Tim Kryger <tim.kryger@linaro.org>, Matt Porter <matt.porter@linaro.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 13-09-10 11:07 AM, Markus Mayer wrote:
> Turn on the bcm281xx GPIO driver in the kernel configuration.
>
> Signed-off-by: Markus Mayer <markus.mayer@linaro.org>
> Reviewed-by: Christian Daudt <csd@broadcom.com>
> ---
>   arch/arm/mach-bcm/Kconfig |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
> index 69d67f7..7f6fca8 100644
> --- a/arch/arm/mach-bcm/Kconfig
> +++ b/arch/arm/mach-bcm/Kconfig
> @@ -9,7 +9,7 @@ config ARCH_BCM
>   	select CLKSRC_OF
>   	select GENERIC_CLOCKEVENTS
>   	select GENERIC_TIME
> -	select GPIO_BCM
> +	select GPIO_BCM_KONA
>   	select SPARSE_IRQ
>   	select TICK_ONESHOT
>   	select CACHE_L2X0
Applied to armsoc/for-3.13/soc

  thanks,
    csd
