From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 04/17] fdt: Add basic support for decoding GPIO
 definitions
Date: Mon, 5 Dec 2011 14:52:01 -0800
Message-ID: <CAPnjgZ03+tfMhkqo4=uarcAf1E8hTfvSF_Y0=V70tuqP866QQQ@mail.gmail.com>
References: <1322878300-5551-1-git-send-email-sjg@chromium.org>
 <1322878300-5551-5-git-send-email-sjg@chromium.org>
 <4EDD3BA8.8040808@nvidia.com>
 <CAPnjgZ3ARCTXVN2MKhfrdCCmmb21zbYdSq8AuQFPdoA=xFr7Mg@mail.gmail.com>
 <4EDD440C.80002@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4EDD440C.80002-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Mon, Dec 5, 2011 at 2:22 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On 12/05/2011 02:56 PM, Simon Glass wrote:
>> Hi Stephen,
>>
>> On Mon, Dec 5, 2011 at 1:46 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrot=
e:
>>> On 12/02/2011 07:11 PM, Simon Glass wrote:
>>>> This adds some support into fdtdec for reading GPIO definitions from
>>>> the fdt. We permit up to FDT_GPIO_MAX GPIOs in the system. Each GPIO
>>>> is of the form:
>>>>
>>>> gpio-function-name =3D <phandle gpio_num flags>;
>>>>
>>>> where:
>>>>
>>>> phandle is a pointer to the GPIO node
>>>> gpio_num is the number of the GPIO (0 to 223)
>>>> flags is some flags, proposed as follows:
>>>>
>>>> =A0 =A0bit =A0 =A0meaning
>>>> =A0 =A00 =A0 =A0 =A00=3Dinput, 1=3Doutput
>>>> =A0 =A01 =A0 =A0 =A0for output only: inital value of output
>>>> =A0 =A02 =A0 =A0 =A00=3Dpolarity normal, 1=3Dactive low (inverted)
>>>
>>> The meaning of the flags (and even whether there are any flags any if so
>>> how many cells there are to contain them) is defined by the GPIO
>>> controller's binding. It's not something that can be interpreted in
>>> isolation by a generic DT parsing function. See for example #gpio-cells
>>> in tegra20.dtsi's gpio node and kernel file
>>> Documentation/devicetree/bindings/gpio/gpio_nvidia.txt.
>>
>> I see this in my version:
>>
>> Required properties:
>> - compatible : "nvidia,tegra20-gpio"
>> - #gpio-cells : Should be two. The first cell is the pin number and the
>> =A0 second cell is used to specify optional parameters:
>> =A0 - bit 0 specifies polarity (0 for normal, 1 for inverted)
>> - gpio-controller : Marks the device node as a GPIO controller.
>>
>> so how do I go about adding the other two bits?
>
> I don't think you would. Input vs. output and output value are set up by
> APIs such as gpio_direction_input/output based on what the driver wants
> to do with the GPIOs.

Fair enough. I am wanting to create a way for more information to be
provided about a GPIO so that it can be set up automatically ready for
use (reduces code size).

>
>>>> +/* For now we allow 224 GPIOs. We can extend this later if required */
>>>> +enum {
>>>> + =A0 =A0 FDT_GPIO_NONE =3D 255, =A0 =A0/* an invalid GPIO used to end=
 our list */
>>>
>>> Can't you use 0 for that? (the kernel currently uses -1, but it seems
>>> there's agreement that was a mistake). If you use 255, the number will
>>> have to keep getting bumped as more complex systems become supported. If
>>> not 0, perhaps U32_MAX or whatever the relevant ${type}_MAX is?
>>
>> But 0 is a valid GPIO isn't it?
>
> Well, it depends how you define your numbering scheme. It may well be!
>
> There are many ways of representing a GPIO:
>
> * GPIO n on a specific controller (of which there may be many). This is
> what DT GPIO bindings use.
>
> * A system-wide GPIO ID, in which case the numbering is "virtual" (e.g.
> a concatenation of the GPIOs on all the present controllers), and you
> can choose to start the first controller's GPIOs at 0, 1, 1000 etc.,
> thus leaving -1, 0, -n..999 etc. as invalid GPIOs. This is what the
> Linux kernel's gpiolib uses (and some say this global numbering scheme
> was a mistake).

Well maybe it was a mistake, but it seems painful for the user to
translate GPIO numbers in this way. U-Boot's GPIO command takes a GPIO
number, which starts at zero.

>
>> I currently use the max value available to the u8. We can change it at
>> will when we update the u8 type to u16 which is why I made it a
>> constant.
>
> include/asm-generic/gpio.h seems to use an int to represent a GPIO. I'd
> suggest these APIs do the same, rather than use a u8.

Do you mean the fdt_gpio_state structure? I have not used u8 for any
function calls and would not.

This adds 3 bytes for every entry. What is the benefit? People get
upset when we waste memory!

Regards,
Simon

>
> --
> nvpublic
