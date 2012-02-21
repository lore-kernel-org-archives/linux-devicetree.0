From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/6 V3] atmel/nand: add DT support
Date: Tue, 21 Feb 2012 10:59:17 +0100
Message-ID: <4F436AF5.5030104@atmel.com>
References: <1328524512-18159-2-git-send-email-plagnioj@jcrosoft.com>
 <1329817573-6473-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1329817573-6473-1-git-send-email-plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/21/2012 10:46 AM, Jean-Christophe PLAGNIOL-VILLARD :
> Use a local copy of board informatin and fill with DT data.
> 
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> ---
> v3:
> 
> 	protect against !CONFIG_OF
> 
> Best Regards,
> J.
>  .../devicetree/bindings/mtd/atmel-nand.txt         |   41 +++++++
>  arch/arm/boot/dts/at91sam9g20.dtsi                 |   17 +++
>  arch/arm/boot/dts/at91sam9g45.dtsi                 |   17 +++
>  arch/arm/boot/dts/at91sam9m10g45ek.dts             |   26 +++++-
>  arch/arm/boot/dts/usb_a9g20.dts                    |   46 ++++++++-
>  arch/arm/mach-at91/at91sam9x5.c                    |    5 -

As we will put this series on top of 9x5, we may also add the entries in
at91sam9x5.dtsi / at91sam9x5cm.dtsi ...

>  arch/arm/mach-at91/board-dt.c                      |   52 ---------
>  drivers/mtd/nand/atmel_nand.c                      |  113 ++++++++++++++++----
>  8 files changed, 238 insertions(+), 79 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/atmel-nand.txt

Otherwise,

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Bye,
-- 
Nicolas Ferre
