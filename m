From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 04/17] fdt: Add basic support for decoding GPIO
 definitions
Date: Mon, 05 Dec 2011 15:22:04 -0700
Message-ID: <4EDD440C.80002@nvidia.com>
References: <1322878300-5551-1-git-send-email-sjg@chromium.org>	<1322878300-5551-5-git-send-email-sjg@chromium.org>	<4EDD3BA8.8040808@nvidia.com>
 <CAPnjgZ3ARCTXVN2MKhfrdCCmmb21zbYdSq8AuQFPdoA=xFr7Mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ3ARCTXVN2MKhfrdCCmmb21zbYdSq8AuQFPdoA=xFr7Mg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/05/2011 02:56 PM, Simon Glass wrote:
> Hi Stephen,
> 
> On Mon, Dec 5, 2011 at 1:46 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On 12/02/2011 07:11 PM, Simon Glass wrote:
>>> This adds some support into fdtdec for reading GPIO definitions from
>>> the fdt. We permit up to FDT_GPIO_MAX GPIOs in the system. Each GPIO
>>> is of the form:
>>>
>>> gpio-function-name = <phandle gpio_num flags>;
>>>
>>> where:
>>>
>>> phandle is a pointer to the GPIO node
>>> gpio_num is the number of the GPIO (0 to 223)
>>> flags is some flags, proposed as follows:
>>>
>>>    bit    meaning
>>>    0      0=input, 1=output
>>>    1      for output only: inital value of output
>>>    2      0=polarity normal, 1=active low (inverted)
>>
>> The meaning of the flags (and even whether there are any flags any if so
>> how many cells there are to contain them) is defined by the GPIO
>> controller's binding. It's not something that can be interpreted in
>> isolation by a generic DT parsing function. See for example #gpio-cells
>> in tegra20.dtsi's gpio node and kernel file
>> Documentation/devicetree/bindings/gpio/gpio_nvidia.txt.
> 
> I see this in my version:
> 
> Required properties:
> - compatible : "nvidia,tegra20-gpio"
> - #gpio-cells : Should be two. The first cell is the pin number and the
>   second cell is used to specify optional parameters:
>   - bit 0 specifies polarity (0 for normal, 1 for inverted)
> - gpio-controller : Marks the device node as a GPIO controller.
> 
> so how do I go about adding the other two bits?

I don't think you would. Input vs. output and output value are set up by
APIs such as gpio_direction_input/output based on what the driver wants
to do with the GPIOs.

>>> +/* For now we allow 224 GPIOs. We can extend this later if required */
>>> +enum {
>>> +     FDT_GPIO_NONE = 255,    /* an invalid GPIO used to end our list */
>>
>> Can't you use 0 for that? (the kernel currently uses -1, but it seems
>> there's agreement that was a mistake). If you use 255, the number will
>> have to keep getting bumped as more complex systems become supported. If
>> not 0, perhaps U32_MAX or whatever the relevant ${type}_MAX is?
> 
> But 0 is a valid GPIO isn't it?

Well, it depends how you define your numbering scheme. It may well be!

There are many ways of representing a GPIO:

* GPIO n on a specific controller (of which there may be many). This is
what DT GPIO bindings use.

* A system-wide GPIO ID, in which case the numbering is "virtual" (e.g.
a concatenation of the GPIOs on all the present controllers), and you
can choose to start the first controller's GPIOs at 0, 1, 1000 etc.,
thus leaving -1, 0, -n..999 etc. as invalid GPIOs. This is what the
Linux kernel's gpiolib uses (and some say this global numbering scheme
was a mistake).

> I currently use the max value available to the u8. We can change it at
> will when we update the u8 type to u16 which is why I made it a
> constant.

include/asm-generic/gpio.h seems to use an int to represent a GPIO. I'd
suggest these APIs do the same, rather than use a u8.

-- 
nvpublic
