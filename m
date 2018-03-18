MIME-Version: 1.0
In-Reply-To: <fbe35381-45a6-7084-c1f9-5ede1eb88bab@gmail.com>
References: <20180312155829.12365-1-oleg@kaa.org.ua>
	<20180313124548.12074-1-oleg@kaa.org.ua>
	<20180318124925.i4yuxigkfu6spv26@rob-hp-laptop>
	<fbe35381-45a6-7084-c1f9-5ede1eb88bab@gmail.com>
Date: Sun, 18 Mar 2018 18:38:02 -0500
Message-ID: <CAL_JsqKdCa_FV13fEw8V-avojUCN_PB+2djsnCsGDH-5qAOEcA@mail.gmail.com>
Subject: Re: [PATCH v3] leds: add LED driver for CR0014114 board
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Sun, Mar 18, 2018 at 3:03 PM, Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
> On 03/18/2018 01:49 PM, Rob Herring wrote:
>> On Tue, Mar 13, 2018 at 02:45:48PM +0200, Oleh Kravchenko wrote:
>>> This patch adds a LED class driver for the RGB LEDs found on
>>> the Crane Merchandising System CR0014114 LEDs board.
>>>
>>> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
>>> ---
>>>  .../devicetree/bindings/leds/leds-cr0014114.txt    |  46 ++++
>>>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>>
>> Please split to separate patch.
>>
>>>  drivers/leds/Kconfig                               |  13 +
>>>  drivers/leds/Makefile                              |   1 +
>>>  drivers/leds/leds-cr0014114.c                      | 292 +++++++++++++++++++++
>>>  5 files changed, 353 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-cr0014114.txt
>>>  create mode 100644 drivers/leds/leds-cr0014114.c
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-cr0014114.txt b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
>>> new file mode 100644
>>> index 000000000000..977a9929b04f
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
>>> @@ -0,0 +1,46 @@
>>> +Crane Merchandising System - cr0014114 LED driver
>>> +-------------------------------------------------
>>> +
>>> +This LED Board is widely used in vending machines produced
>>> +by Crane Merchandising Systems.
>>> +
>>> +Required properties:
>>> +- compatible: "cms,cr0014114"
>>> +- reg: chip select address for the device
>>> +- spi-cpha: shifted clock phase mode is required
>>> +
>>> +LED sub-node properties:
>>> +- label : (optional)
>>> +    see Documentation/devicetree/bindings/leds/common.txt
>>> +- linux,default-trigger : (optional)
>>> +    see Documentation/devicetree/bindings/leds/common.txt
>>> +
>>> +Example
>>> +-------
>>> +
>>> +cr0014114@0 {
>>
>> leds@...
>
> In [0] you required it to be led-controller and the rest like below:

Ah yes, you're right. That's what I get for trying to go off my memory.

>
>
> led-controller@12 {
>   reg = <12>;
>
>   led@0 {
>     reg = <0>;
>   };
>   led@1 {
>     reg = <1>;
>   };
> };
>
>
> Since that time I started to require adhering to this naming pattern
> for LED controller node and led@address for child nodes, where
> applicable.
>
> I plan on submitting a patch for common LED bindings, that will
> switch device names to led-controller in DT examples.
>
> With this scheme another problem arises, because now we have:
>
> - label: The label for this LED. If omitted, the label is taken from
>          the node name (excluding the unit address).
>
> With that DT child node name is useless, because it is "led" for
> each sub-led. Therefore I propose to make label property required,
> and avoid using child DT node name as a fallback.

There was never any guarantee that the same child node name was not
used elsewhere.

I think the OS needs to be able to cope with no label or even that
label is not unique. Suppose you have an overlay for a addon board and
you can have multiple boards connected. They'd all have the same
label. So moving to label only reduces the problem. You could use the
reg property and/or compatible of the parent to construct the names.
Or just append an IDR value to the name like we do on platform
devices. If the user didn't specify a label, then they shouldn't
really care what the name is, so just use "led.X". Though likely folks
will care if the name changes on them.

Rob
