From: Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v4 4/6] gpio: davinci: add OF support
Date: Wed, 6 Nov 2013 15:38:24 +0530
Message-ID: <CA+V-a8tJ7yDJOPamoCiaX6Twnnqxp_o_L0rzo2dEeSDS2VoYLw@mail.gmail.com>
References: <1383406775-14902-1-git-send-email-prabhakar.csenng@gmail.com>
 <1383406775-14902-5-git-send-email-prabhakar.csenng@gmail.com>
 <5277E752.8090005@ti.com> <CA+V-a8uV0g36LoQtxFjR56SaMxj7KOE2ztC+pfT_Pn1wGcqEmw@mail.gmail.com>
 <527923EF.4070602@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <527923EF.4070602@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Sekhar Nori <nsekhar@ti.com>, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, Alex Elder <alex.elder@linaro.org>, LDOC <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, LAK <linux-arm-kernel@lists.infradead.org>, dlos <davinci-linux-open-source@linux.davincidsp.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Grygorii,

On Tue, Nov 5, 2013 at 10:29 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> On 11/05/2013 10:53 AM, Prabhakar Lad wrote:> Hi Grygorii,
>
>>
>> Thanks for the review.
>>
>> On Mon, Nov 4, 2013 at 11:58 PM, Grygorii Strashko
>> <grygorii.strashko@ti.com> wrote:
>>> Hi Prabhakar Lad,
>>>
>>>
>>> On 11/02/2013 05:39 PM, Lad, Prabhakar wrote:
>>>>
>>>> From: KV Sujith <sujithkv@ti.com>
>>>>
>>>> This patch adds OF parser support for davinci gpio
>>>> driver and also appropriate documentation in gpio-davinci.txt
>>>> located at Documentation/devicetree/bindings/gpio/.
>>>
>>>
>>> I worry, do we need to have gpio_chip.of_xlate() callback implement=
ed?
>>
>> I looked for the other OF GPIO implementations with same "ngpio"
>> property (marvel, msm) but I don=92t see of_xlate() callback impleme=
nted.
>
> The question: will below definitions in DT work or not after this ser=
ies?
>  Will of_get_gpio()/of_get_named_gpio() work?
>
> Example1 - leds:
>         leds {
>                 compatible =3D "gpio-leds";
>                 debug0 {
>                         label =3D "green:debug0";
>                         gpios =3D <&gpio 29 GPIO_ACTIVE_HIGH>;
>                 };
>         };
>
> Example2 - any dev:
> devA {
>         compatible =3D "devA";
>         gpios =3D <&gpio 120 GPIO_ACTIVE_LOW>;
>
> }
>
>
Agreed of_get_gpio()/of_get_named_gpio() wont work without
xlate callback implemented, but I think this can be added as a
incremental patch later.

>>
>>> - From one side, Davinci GPIO controller in DT described by one ent=
ry
>>> which defines number of supported GPIOs as "ti,ngpio =3D <144>;"
>>>
>>> - From other side, on Linux level more than one gpio_chip objects a=
re
>>> instantiated (one per each 32 GPIO).
>>>
>>> How the standard GPIO biding will work in this case? .. And will th=
ey?
>>>
>>> Linus, I'd very appreciate if you will be able to clarify this poin=
t.
>>>
>>>
>>>>
>>>> Signed-off-by: KV Sujith <sujithkv@ti.com>
>>>> Signed-off-by: Philip Avinash <avinashphilip@ti.com>
>>>> [prabhakar.csengg@gmail.com: simplified the OF code, removed
>>>>                  unnecessary DT property and also simplified
>>>>                  the commit message]
>>>> Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
>>>> ---
>>>>    .../devicetree/bindings/gpio/gpio-davinci.txt      |   32
>>>> ++++++++++++
>>>>    drivers/gpio/gpio-davinci.c                        |   54
>>>> ++++++++++++++++++--
>>>>    2 files changed, 83 insertions(+), 3 deletions(-)
>>>>    create mode 100644
>>>> Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.t=
xt
>>>> b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>>>> new file mode 100644
>>>> index 0000000..55aae1c
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>>>> @@ -0,0 +1,32 @@
>>>> +Davinci GPIO controller bindings29
>
>>>> +
>>>> +Required Properties:
>>>> +- compatible: should be "ti,dm6441-gpio"
>>>> +
>>>> +- reg: Physical base address of the controller and the size of me=
mory
>>>> mapped
>>>> +       registers.
>>>> +
>>>> +- gpio-controller : Marks the device node as a gpio controller.
>>>> +
>>>> +- interrupts: Array of GPIO interrupt number.
>>>
>>>
>>> May be meaning of <interrupts> property need to be extended, becaus=
e,
>>> as of now, only banked or unbanked IRQs are supported - and not bot=
h.
>>>
>>>
>> OK
>>
>>>> +
>>>> +- ti,ngpio: The number of GPIO pins supported.
>>>> +
>>>> +- ti,davinci-gpio-unbanked: The number of GPIOs that have an indi=
vidual
>>>> interrupt
>>>> +                            line to processor.
>>>
>>>
>>> Should interrupt-controller; specifier be added here?
>>>
>> No
>
> So, it would be impossible to map GPIO IRQ to device through DT. Righ=
t?
> Like:
>         devX@0 {
>                 compatible =3D "devX";
>                 interrupt-parent =3D <&gpio>;
>                 interrupts =3D <50 IRQ_TYPE_EDGE_FALLING>; /* gpio li=
ne 50 */
>
>
>         };
>
>
may be I took you wrong here, the interrupt-controller is inherited
property taken from its parent, so didn=92t mention that in the documen=
tation

Regards,
--Prabhakar Lad
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
