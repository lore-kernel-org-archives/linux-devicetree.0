From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 1/3] gpio: davinci: add OF support
Date: Mon, 14 Oct 2013 15:25:22 +0300
Message-ID: <525BE2B2.8020105@ti.com>
References: <1380902596-4693-1-git-send-email-sujithkv@ti.com>	<1380902596-4693-2-git-send-email-sujithkv@ti.com>	<CACRpkdYxegBSYXR1-98smUNnDXpyRHo_vuYdnr3r7zhawENiUA@mail.gmail.com>	<CA+V-a8vyPyL0j0nPOZyjxrecusFzXovFPsNBLKYXns5ASWR-wg@mail.gmail.com>	<CACRpkdYNexWWXuQ052xuQ4NOdXm2gt-+ByREKeGo-VAnbH4D2w@mail.gmail.com>
	<CA+V-a8vH7VXqz=2cz-uD=YfRBRYrJ10K1Aptw28vV8gP+PiT2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <CA+V-a8vH7VXqz=2cz-uD=YfRBRYrJ10K1Aptw28vV8gP+PiT2g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Prabhakar Lad <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DLOS <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, LDOC <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Prabhakar Lad,

On 10/11/2013 07:18 PM, Prabhakar Lad wrote:
> Hi Linus,
> 
> On 10/11/13, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On Fri, Oct 11, 2013 at 4:59 PM, Prabhakar Lad
>> <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On 10/11/13, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>>> On Fri, Oct 4, 2013 at 6:03 PM, Prabhakar Lad
>>>> <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>>>>> +- ti,davinci-gpio-irq-base: Base from where GPIO interrupt numbering
>>>>> starts.
>>>>
>>>> What is this?
>>>>
>>>> If I have ever ACKed this I have been drunk. I take it back.
>>>>
>>> here is the ACK https://patchwork.kernel.org/patch/2721181/
>>
>> And as suspected that version of the patch did not contain
>> this strange node property.
>>
> The property did exist in the patch 'intc_irq_num', I just renamed
> it and gave a proper description to it.
> 
>> Don't keep my ACK on patches if you change basic stuff like
>> that, they need to be re-acked, this runs the risk of abusing
>> my trust amongst other subsystem maintainers who might
>> go and merge this because "aha the GPIO maintainer
>> thinks that this is OK".
>>
> Agreed, I carry forwarded the ACK since it had minor changes.
> 
>>>> This "base" is a Linux-specific thing and has no place in the
>>>> device tree, and shall not be there. You have to find some way to
>>>> avoid this, what do you think some other OS should do with
>>>> this value...
>>>>
>>>> All IRQs in Linux are assumed to be dynamically assigned numbers
>>>> nowadays, with a property like this you can never switch on
>>>> SPARSE_IRQ for the DaVinci.
>>>>
>>> Can you point to any alternative solution if you have any ?
>>
>> First convert this GPIO driver to use an irqdomain to map
>> HW IRQs to Linux IRQs, and grab a few IRQ descriptors
>> dynamically off the irq descriptor heap.
>> Example: commit
>> a6c45b99a658521291cfb66ecf035cc58b38f206
>> "pinctrl/coh901: use irqdomain, allocate irqdescs"
>>
>> Then on a longer term convert DaVinci to use dynamically
>> allocated IRQs for all interrupt controllers, and move it over
>> to SPARSE_IRQ so you know this works.
>>
> Thanks for the pointers.
> 

Could it be possible to use "interrupts" and "interrupt-names" to identify
assigned banked & unbanked IRQs?

For example DM646x (http://www.ti.com/lit/ug/sprueq8a/sprueq8a.pdf):

interrupts = <48 IRQ_TYPE_EDGE_BOTH>,
             <49 IRQ_TYPE_EDGE_BOTH>,
             <50 IRQ_TYPE_EDGE_BOTH>,
             <51 IRQ_TYPE_EDGE_BOTH>,
             <52 IRQ_TYPE_EDGE_BOTH>,
             <53 IRQ_TYPE_EDGE_BOTH>,
             <54 IRQ_TYPE_EDGE_BOTH>,
             <55 IRQ_TYPE_EDGE_BOTH>,
             <56 IRQ_TYPE_EDGE_BOTH>,
             <57 IRQ_TYPE_EDGE_BOTH>,
             <58 IRQ_TYPE_EDGE_BOTH>;
interrupt-names = "gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6", "gpio7", "bank0", "bank1", "bank2";

For example OMAP-L138 (http://www.ti.com/lit/ug/spruh77a/spruh77a.pdf):

interrupts = <42 IRQ_TYPE_EDGE_BOTH>,
             <43 IRQ_TYPE_EDGE_BOTH>,
             <44 IRQ_TYPE_EDGE_BOTH>,
             <45 IRQ_TYPE_EDGE_BOTH>,
             <46 IRQ_TYPE_EDGE_BOTH>,
             <47 IRQ_TYPE_EDGE_BOTH>,
             <48 IRQ_TYPE_EDGE_BOTH>,
             <49 IRQ_TYPE_EDGE_BOTH>,
             <50 IRQ_TYPE_EDGE_BOTH>;

interrupt-names = "bank0", "bank1", "bank2", "bank3", "bank4", "bank5", "bank6", "bank7", "bank8";

For example Keystone 66AK2E05/02
 (http://www.ti.com/lit/ds/sprs865a/sprs865a.pdf and http://www.ti.com/lit/ug/sprugv1/sprugv1.pdf):

interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
             <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
[..]
             <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
             <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;


interrupt-names = "gpio0", "gpio1", [...], "gpio30", "gpio31";

So then, following properties would not be needed at all, because all inf. can be
taken from interrupt's properties: 
+- ti,davinci-gpio-irq-base: Base from where GPIO interrupt numbering starts.
+- ti,davinci-gpio-unbanked: The number of GPIOs that have an individual interrupt line to processor.

It should work good if Davinci-gpio driver will be converted to use
linear IRQ domains for banked irqs.


Regards,
-grygorii
