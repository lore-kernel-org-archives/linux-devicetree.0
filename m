From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/6 v2] ARM: integrator: check PL010 device name rather
 than base address
Date: Sat, 1 Sep 2012 18:32:47 +0000
Message-ID: <201209011832.47805.arnd@arndb.de>
References: <1346471760-23993-1-git-send-email-linus.walleij@linaro.org>
 <1346471760-23993-2-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1346471760-23993-2-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Saturday 01 September 2012, Linus Walleij wrote:
> In the PL010 UART callback a comparison against the base address is
> done to figure out which UART is doing the callback. This does not
> play well with device tree, so let's check the dev_name() of the
> device instead.
> 
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Hmm, I think the dev_name would also not be that nice, because it changes
after the conversion to DT is complete.

>  arch/arm/mach-integrator/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-integrator/core.c b/arch/arm/mach-integrator/core.c
> index 5ba4bc8..67ea181 100644
> --- a/arch/arm/mach-integrator/core.c
> +++ b/arch/arm/mach-integrator/core.c
> @@ -100,7 +100,7 @@ static void integrator_uart_set_mctrl(struct amba_device *dev, void __iomem *bas
>  {
>         unsigned int ctrls = 0, ctrlc = 0, rts_mask, dtr_mask;
>  
> -       if (dev == &uart0_device) {
> +       if (!strcmp(dev_name(&dev->dev), "uart0")) {
>                 rts_mask = 1 << 4;
>                 dtr_mask = 1 << 5;
>         } else {

Maybe it's possible to compare the base pointer against INTEGRATOR_UART0_BASE instead?

	Arnd
