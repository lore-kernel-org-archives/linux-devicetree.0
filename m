From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/5] pcmcia: at91_cf: clean up and add DT support
Date: Fri, 8 Mar 2013 10:21:19 +0100
Message-ID: <5139AD8F.2060607@atmel.com>
References: <1360863766-22511-1-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1360863766-22511-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-X3ehHDuj6sIIGcDfoQAp7OTW4wlIGRCZ@public.gmane.org, linux-pcmcia-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/14/2013 06:42 PM, Joachim Eastwood :
> Hi
> 
> This series clean up at91_cf a bit and add DT bindings.
> 
> Patch series tested on custom RM9200 board in both with DT and
> with old platform data.
> 
> 
> Joachim Eastwood (5):
>   pcmcia: at91_cf: fix gpio_get_value in at91_cf_get_status
>   pcmcia: at91_cf: convert to dev_ print functions
>   pcmcia: at91_cf: use devm_ functions for allocations
>   pcmcia: at91_cf: clean up header includes
>   pcmcia: at91_cf: add support for DT
> 
>  .../devicetree/bindings/ata/atmel-at91_cf.txt      |  19 +++
>  drivers/pcmcia/Kconfig                             |   2 +-
>  drivers/pcmcia/at91_cf.c                           | 148 +++++++++++----------
>  3 files changed, 99 insertions(+), 70 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/ata/atmel-at91_cf.txt

Joachim,

Thanks a lot for these patches. You can add on the whole series:

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

I hope that it can be taken by linux-pcmcia.

Best regards,

PS: make sure to add linux-arm-kernel mailing-list as well: it always
interests people there to have updates on AT91 peripherals...
-- 
Nicolas Ferre
