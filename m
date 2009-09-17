From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: Gpio reset handling
Date: Thu, 17 Sep 2009 15:46:30 +0200
Message-ID: <4AB23DB6.3040800@monstr.eu>
References: <4AAFDDD1.9070702@monstr.eu>
	<fa686aa40909151527r36334528ne1194523f141a8a2@mail.gmail.com>
	<1d3f23370909151540p411f0bc0r1c81b68ceb2fb45e@mail.gmail.com>
	<fa686aa40909151607u29d4025ay101e89d9eae5f30a@mail.gmail.com>
	<4AB1DB2A.6050109@monstr.eu>
	<fa686aa40909170642j63ccef7bnf162cb88b9733023@mail.gmail.com>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa40909170642j63ccef7bnf162cb88b9733023-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> On Thu, Sep 17, 2009 at 12:46 AM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
>> Grant Likely wrote:
>>> From what I've heard so far, I'd do it the same way but use something
>>> like "xlnx,microblaze-gpio-reset" for the compatible value.  As long
>>> as you document the binding and post it to the devicetree-discuss
>>> mailing list for review you should have no problem doing what you want
>>> to do.
>>>
>>> BTW, start with the "xlnx,microblaze-*" value for now.  A architecture
>>> neutral value can always be chosen at a later date if this proves to
>>> be useful.
>> Here I see some problems if we want to use one reset gpio pin with leds.
>> It not happen in these days but I expect to use it with heartbeat led.
>>
>> If I want to use new compatible node, I have to change BSP to support this
>> but I can through out this part of code very soon. And if I want to use
>> that node with leds then this is wrong.
> 
> I think you misunderstand me.  I'm saying create a new node which
> references a gpio from the gpio node.  So it would look something like
> this (adapting your original example):

> 
>                gpio_res: gpio@81400000 {
>                        compatible = "xlnx,xps-gpio-1.00.a";
>                        interrupt-parent = <&xps_intc_0>;
>                        interrupts = < 7 2 >;
>                        reg = < 0x81400000 0x10000 >;
> ...
>                        xlnx,gpio-width = <0x8>;
> ...
>                } ;
> 
> gpio-leds {
>        compatible = "gpio-leds";
>        heartbeat {
>                label = "Heartbeat";
>                gpios = <&gpio_res 4 1>;
>                linux,default-trigger = "heartbeat";
>        };
> 
>        green {
>                label = "Green";
>                gpios = <&gpio_res 5 1>;
>        };
> };
> 
> reset {
>        compatible = "xlnx,microblaze-reset";
>        soft-reset-gpio = <&gpio_res 1 1>;
>        phy-reset-gpio = <&gpio_res 2 1>;
> }

yep, this make sense to me too.

Thanks,
Michal







-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
