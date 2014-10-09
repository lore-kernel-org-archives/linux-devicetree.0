From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH V4 6/7] MAINTAINERS: Entry for Cygnus/iproc arm
 architecture and clock drivers
Date: Thu, 09 Oct 2014 16:00:51 -0700
Message-ID: <1412895651.8770.7.camel@joe-AO725>
References: <Scott Branden <sbranden@broadcom.com>
	 <1412894671-5921-1-git-send-email-sbranden@broadcom.com>
	 <1412894671-5921-7-git-send-email-sbranden@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412894671-5921-7-git-send-email-sbranden@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Scott Branden <sbranden@broadcom.com>
Cc: Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Russell King <linux@arm.linux.org.uk>, bcm-kernel-feedback-list@broadcom.com, Mike Turquette <mturquette@linaro.org>, Alex Elder <elder@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Antti Palosaari <crope@iki.fi>, JD Zheng <jdzheng@broadcom.com>, Ray Jui <rjui@broadcom.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2014-10-09 at 15:44 -0700, Scott Branden wrote:
> Acked-by: Jonathan Richardson <jonathar@broadcom.com>
> Signed-off-by: Scott Branden <sbranden@broadcom.com>
> ---
>  MAINTAINERS |   17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a12edf2..0900082 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2071,9 +2071,24 @@ L:	linux-scsi@vger.kernel.org
>  S:	Supported
>  F:	drivers/scsi/bnx2i/
>  
> -BROADCOM KONA GPIO DRIVER
> +BROADCOM CYGNUS/IPROC ARM ARCHITECTURE
>  M:	Ray Jui <rjui@broadcom.com>
> +M:	Scott Branden <sbranden@broadcom.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	bcm-kernel-feedback-list@broadcom.com
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/arm/bcm/cygnus.txt
> +F:	arch/arm/boot/dts/bcm-cygnus.dtsi
> +F:	arch/arm/boot/dts/bcm911360_entphn.dts
> +F:	arch/arm/configs/bcm_cygnus_defconfig
> +F:	arch/arm/mach-bcm/bcm_cygnus.c
> +F:	Documentation/devicetree/bindings/clock/clk-cygnus.txt
> +F:	Documentation/devicetree/bindings/clock/clk-iproc.txt
> +F:	drivers/clk/bcm/clk-cygnus.c
> +F:	drivers/clk/bcm/clk-iproc.c
> +
> +BROADCOM KONA GPIO DRIVER
> +M:	Ray Jui <rjui@broadcom.com>
>  S:	Supported
>  F:	drivers/gpio/gpio-bcm-kona.c
>  F:	Documentation/devicetree/bindings/gpio/gpio-bcm-kona.txt

This drops this L line from BROADCOM KONA GPIO DRIVER
L:	bcm-kernel-feedback-list@broadcom.com

Is that what you want?
