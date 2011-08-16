From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dmaengine: at_hdmac: add device tree probe
Date: Tue, 16 Aug 2011 18:33:28 +0200
Message-ID: <4E4A9BD8.1040302@atmel.com>
References: <1312549120-22266-1-git-send-email-nicolas.ferre@atmel.com>
	<20110807040932.GF7667@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110807040932.GF7667-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 07/08/2011 06:09, Grant Likely :
> On Fri, Aug 05, 2011 at 01:58:40PM +0100, Nicolas Ferre wrote:
>> Add device tree probe support for atmel at_hdmac DMA driver.
>> Bindings are added to specify the number of channels that the implementation of
>> the controller actually has. They also allow to tell if the peripherals/DMA
>> transfer is supported by the IP.
>>
>> Signed-off-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>> ---
>>  .../devicetree/bindings/dma/atmel-hdmac.txt        |   23 +++++++++
>>  drivers/dma/at_hdmac.c                             |   51 ++++++++++++++++----
>>  2 files changed, 65 insertions(+), 9 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/dma/atmel-hdmac.txt
>>
>> diff --git a/Documentation/devicetree/bindings/dma/atmel-hdmac.txt b/Documentation/devicetree/bindings/dma/atmel-hdmac.txt
>> new file mode 100644
>> index 0000000..0e48553
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/atmel-hdmac.txt
>> @@ -0,0 +1,23 @@
>> +* Atmel Direct Memory Access Controller
>> +
>> +Required properties:
>> +- compatible: Should be "atmel,<chip>-hdmac"
>> +- reg: Should contain DMA registers location and length
>> +- interrupts: Should contain DMA interrupt
>> +- atmel,hdmac-nr-channels: Should contain number of channels
>> +  available in the controller
>> +
>> +Optional properties:
>> +- atmel,hdmac-cap-memcpy: Chip can do memory to memory transfers
>> +- atmel,hdmac-cap-slave: Chip can do peripherals/memory transfers
> 
> Heh, ignore my comments on the other patch about missing documentation
> for the dma engine.  :-)
> 
> Otherwise the patch looks pretty good.

[..]

Grant, Vinod,

Don't you think it would make sense to generalize nr-channels and maybe
also the capabilities properties for other dmaengine drivers?
I have seen other dmaengine drivers taking the number of channels from
platform data so that would make sense.
It would be new dmaengine device tree properties, but on the other hand,
I do not know if code can also be centralized for handling of those
properties... maybe it is better to let drivers deal with them if
required...

Your thoughts?

Best regards,
-- 
Nicolas Ferre
