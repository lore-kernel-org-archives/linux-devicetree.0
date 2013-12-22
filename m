From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 2/2] gpio: davinci: reuse for Keystone SoC
Date: Sun, 22 Dec 2013 21:05:11 +0530
Message-ID: <52B706AF.8040408@ti.com>
References: <1387361272-20861-1-git-send-email-grygorii.strashko@ti.com>
	<1387361272-20861-3-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1387361272-20861-3-git-send-email-grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rob,

On Wednesday 18 December 2013 03:37 PM, Grygorii Strashko wrote:
> The similar GPIO HW block is used by keystone SoCs as
> in Davinci SoCs.
> Hence, reuse Davinci GPIO driver for Keystone taking into
> account that Keystone contains ARM GIC IRQ controller which
> is implemented using IRQ Chip.
> 
> Documentation:
> 	http://www.ti.com/lit/ug/sprugv1/sprugv1.pdf
> 
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> 
> Acked-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
> ---
>  .../devicetree/bindings/gpio/gpio-davinci.txt      |    4 +-
>  drivers/gpio/gpio-davinci.c                        |   46 ++++++++++++++++----
>  2 files changed, 40 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> index a2e839d..4ce9862 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> @@ -1,7 +1,7 @@
> -Davinci GPIO controller bindings
> +Davinci/Keystone GPIO controller bindings
>  
>  Required Properties:
> -- compatible: should be "ti,dm6441-gpio"
> +- compatible: should be "ti,dm6441-gpio", "ti,keystone-gpio"

Can I get your ack for this change? Its pretty trivial, but still..

Thanks,
Sekhar
