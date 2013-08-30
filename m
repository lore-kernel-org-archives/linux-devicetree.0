From: "Christian Daudt" <csd@broadcom.com>
Subject: Re: [PATCH v7 2/3] ARM: bcm281xx: Enable GPIO driver
Date: Fri, 30 Aug 2013 16:16:55 -0700
Message-ID: <522127E7.6090501@broadcom.com>
References: <1377882914-30152-1-git-send-email-markus.mayer@linaro.org>
 <1377882914-30152-3-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1377882914-30152-3-git-send-email-markus.mayer@linaro.org>
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

On 13-08-30 10:15 AM, Markus Mayer wrote:
> Turn on the bcm281xx GPIO driver in the kernel configuration.
> ---
>   arch/arm/mach-bcm/Kconfig |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
> index f112895..5819126 100644
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
>   	help
Reviewed-by: Christian Daudt <csd@broadcom.com>

  Thanks,
    csd
