From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 04/17] fdt: Add basic support for decoding GPIO
 definitions
Date: Mon, 05 Dec 2011 16:03:03 -0700
Message-ID: <4EDD4DA7.6070902@nvidia.com>
References: <1322878300-5551-1-git-send-email-sjg@chromium.org>	<1322878300-5551-5-git-send-email-sjg@chromium.org>	<4EDD3BA8.8040808@nvidia.com>	<CAPnjgZ3ARCTXVN2MKhfrdCCmmb21zbYdSq8AuQFPdoA=xFr7Mg@mail.gmail.com>	<4EDD440C.80002@nvidia.com>
 <CAPnjgZ03+tfMhkqo4=uarcAf1E8hTfvSF_Y0=V70tuqP866QQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ03+tfMhkqo4=uarcAf1E8hTfvSF_Y0=V70tuqP866QQQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On 12/05/2011 03:52 PM, Simon Glass wrote:
> Hi Stephen,
> 
> On Mon, Dec 5, 2011 at 2:22 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On 12/05/2011 02:56 PM, Simon Glass wrote:
>>> Hi Stephen,
>>>
>>> On Mon, Dec 5, 2011 at 1:46 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>> On 12/02/2011 07:11 PM, Simon Glass wrote:
>>>>> This adds some support into fdtdec for reading GPIO definitions from
>>>>> the fdt. We permit up to FDT_GPIO_MAX GPIOs in the system. Each GPIO
>>>>> is of the form:
>>>>>
>>>>> gpio-function-name = <phandle gpio_num flags>;
>>>>>
>>>>> where:
>>>>>
>>>>> phandle is a pointer to the GPIO node
>>>>> gpio_num is the number of the GPIO (0 to 223)
>>>>> flags is some flags, proposed as follows:
>>>>>
>>>>>    bit    meaning
>>>>>    0      0=input, 1=output
>>>>>    1      for output only: inital value of output
>>>>>    2      0=polarity normal, 1=active low (inverted)
>>>>
>>>> The meaning of the flags (and even whether there are any flags any if so
>>>> how many cells there are to contain them) is defined by the GPIO
>>>> controller's binding. It's not something that can be interpreted in
>>>> isolation by a generic DT parsing function. See for example #gpio-cells
>>>> in tegra20.dtsi's gpio node and kernel file
>>>> Documentation/devicetree/bindings/gpio/gpio_nvidia.txt.
>>>
>>> I see this in my version:
>>>
>>> Required properties:
>>> - compatible : "nvidia,tegra20-gpio"
>>> - #gpio-cells : Should be two. The first cell is the pin number and the
>>>   second cell is used to specify optional parameters:
>>>   - bit 0 specifies polarity (0 for normal, 1 for inverted)
>>> - gpio-controller : Marks the device node as a GPIO controller.
>>>
>>> so how do I go about adding the other two bits?
>>
>> I don't think you would. Input vs. output and output value are set up by
>> APIs such as gpio_direction_input/output based on what the driver wants
>> to do with the GPIOs.
> 
> Fair enough. I am wanting to create a way for more information to be
> provided about a GPIO so that it can be set up automatically ready for
> use (reduces code size).

At least in this case, I don't think it makes sense to do that. The FDT
is about representing that a particular GPIO is a VBUS GPIO. That
doesn't mean the GPIO /has/ to be an output driven high; that's only
true if the driver is enabled and chooses to configure that port as a
host port, not a device port.

If you wanted to represent GPIOs that were always configured to a
specific output value in DT, I think that'd be an unrelated binding
somewhere other than the USB bus's vbus-gpios property, since it'd have
a completely different semantic meaning.

>> include/asm-generic/gpio.h seems to use an int to represent a GPIO. I'd
>> suggest these APIs do the same, rather than use a u8.
> 
> Do you mean the fdt_gpio_state structure?

Yes.

> I have not used u8 for any
> function calls and would not.
> 
> This adds 3 bytes for every entry. What is the benefit? People get
> upset when we waste memory!

Well, U-boot has already chosen to use an int to represent a GPIO ID.
Given that, I assert that all places that store a GPIO ID should use the
same type. And realistically, we're only talking about a handful of
instances here, and any bloat is completely limited to those platforms
that use this feature, and linear with the number of GPIOs.

-- 
nvpublic
