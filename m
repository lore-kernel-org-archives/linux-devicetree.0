From: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v3 0/7] support other fsl SoCs with usbmisc + small fixes
Date: Thu, 22 Nov 2012 11:24:44 +0200
Message-ID: <87y5hu3s83.fsf@ashishki-desk.ger.corp.intel.com>
References: <1353506793-8354-1-git-send-email-m.grzeschik@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1353506793-8354-1-git-send-email-m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
Cc: fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:

> Nearly every SoC from Freescale has this non-core usb registers. This series
> adds support for more users of this driver.
>
> This series is based on Peter Chen's work. Its needed to merge his master branch
> before applying this series:
>
> https://github.com/hzpeterchen/linux-usb.git
>
> Marc Kleine-Budde (4):
>   usb: chipidea: usbmisc: unset global varibale usbmisc on driver
>     remove
>   usb: chipidea: usbmisc: fix a potential race condition
>   usb: chipidea: usbmisc: prepare driver to handle more than one soc
>   usb: chipidea: usbmisc: add support for ahb, ipg and per clock
>
> Michael Grzeschik (3):
>   usb: chipidea: usbmisc: rename file, struct and functions to
>     usbmisc_imx
>   usb: chipidea: usbmisc: add mx53 support
>   usb: chipidea: usbmisc: add post handling and errata fix for mx25

Cc'ing Peter Chen, in case he didn't see this. Peter, can you have a
look and give your Tested-by/Reviewed-by where appropriate?

Regards,
--
Alex
