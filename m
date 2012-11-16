From: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 1/9] usb: chipidea: pci: mark platformdata as static and
 __devinitdata
Date: Fri, 16 Nov 2012 12:06:57 +0200
Message-ID: <87haop7tfi.fsf@ashishki-desk.ger.corp.intel.com>
References: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de>
 <1352909950-32555-2-git-send-email-m.grzeschik@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1352909950-32555-2-git-send-email-m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:

> From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>
> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

static yes, __devinitdata -- probably not. These structs are used
everywhere throughout the driver currently, not only at initialization
time.

> ---
>  drivers/usb/chipidea/ci13xxx_pci.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/chipidea/ci13xxx_pci.c b/drivers/usb/chipidea/ci13xxx_pci.c
> index 918e149..97d25c8 100644
> --- a/drivers/usb/chipidea/ci13xxx_pci.c
> +++ b/drivers/usb/chipidea/ci13xxx_pci.c
> @@ -23,17 +23,17 @@
>  /******************************************************************************
>   * PCI block
>   *****************************************************************************/
> -struct ci13xxx_platform_data pci_platdata = {
> +static struct ci13xxx_platform_data pci_platdata __devinitdata = {
>  	.name		= UDC_DRIVER_NAME,
>  	.capoffset	= DEF_CAPOFFSET,
>  };
>  
> -struct ci13xxx_platform_data langwell_pci_platdata = {
> +static struct ci13xxx_platform_data langwell_pci_platdata __devinitdata = {
>  	.name		= UDC_DRIVER_NAME,
>  	.capoffset	= 0,
>  };
>  
> -struct ci13xxx_platform_data penwell_pci_platdata = {
> +static struct ci13xxx_platform_data penwell_pci_platdata __devinitdata = {
>  	.name		= UDC_DRIVER_NAME,
>  	.capoffset	= 0,
>  	.power_budget	= 200,
> -- 
> 1.7.10.4
