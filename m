From: Amelie DELAUNAY <amelie.delaunay@st.com>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: Add ST Multi-Function eXpander
 driver
Date: Thu, 22 Feb 2018 15:15:20 +0000
Message-ID: <7667aba8-2c96-a16b-45f8-5d69a9613c7c@st.com>
References: <1518100057-23234-1-git-send-email-amelie.delaunay@st.com>
 <1518100057-23234-2-git-send-email-amelie.delaunay@st.com>
 <20180218231938.goeht7tomfkab6uu@rob-hp-laptop>
 <b08ab2cd-d6a0-b5da-e33e-ad150370776b@st.com>
 <CACRpkdYfHgjAu=By-4pbtpYrbBjRLGEKJhzXobnM6RFYYgjaRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdYfHgjAu=By-4pbtpYrbBjRLGEKJhzXobnM6RFYYgjaRw@mail.gmail.com>
Content-Language: en-US
Content-ID: <363C5EF53D014A43AF6DAD8F9C4EAECC@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 02/22/2018 02:22 PM, Linus Walleij wrote:
> On Mon, Feb 19, 2018 at 4:59 PM, Amelie DELAUNAY <amelie.delaunay@st.com> wrote:
>> On 02/19/2018 12:19 AM, Rob Herring wrote:
>>> On Thu, Feb 08, 2018 at 03:27:32PM +0100, Amelie Delaunay wrote:
> 
>>>> +- interrupts = must be <0>
>>>> +- gpio-controller: marks the device node as a GPIO controller
>>>> +- #gpio-cells: should be <2>, the first cell is the GPIO offset on this GPIO
>>>> +  controller, the second cell is the gpio flags in accordance with
>>>> +  <dt-bindings/gpio/st-mfx-gpio.h>.
>>>
>>> Custom flags? Use standard flags.
>>>
>>> DT binding headers should be part of this patch.
>>>
>> Custom flags because MFX GPIOs have several types:
>> - Output open drain with internal pull-up resistor
>> - Output open drain without internal pull-up resistor
>> - Output push pull without internal pull resistor
>> - Input with internal pull-up resistor
>> - Input with internal pull-down resistor
>> - Input floating
>> - Input analog.
>> Standard flags don't have pull up or down information. That's why I am
>> using custom flags, they overloads standard flags.
> 
> This is because pull up/down and tristate/high z (floating)
> also known as PIN_CONFIG_BIAS_HIGH_IMPEDANCE,
> is controlled by the pin control subsystem, not GPIO.
> 
> If your hardware does even more pin control (like multiplexing)
> then I suggest that you create a pin control driver back-end for
> this and put the resulting driver in drivers/pinctrl.
> 
> Some recent additions of expanders in drivers/pinctrl makes
> for great inspiration for this work. See for example:
> drivers/pinctrl/pinctrl-sx150x.c
> drivers/pinctrl/pinctrl-mcp23s08.c
> 
> These are both combined pin control and GPIO drivers that
> we moved from drivers/gpio because we concluded that they
> do more than just GPIO. The GPIO lines are matches to
> pins using the GPIO ranges from the call to
> gpiochip_add_pin_range() and using gpiochip_generic_config()
> as the gpiochip .set_config() callback.
> 
> It has been discussed to expose subsets of pin config to
> GPIO. Indeed, we already handle open drain/source and
> debounce by simply calling into the pin control back-end
> or handling it directly in the GPIO driver using the standard
> pin config properties.
> 
> I am reluctant about this, I think the split of responsibilities
> is pretty nice.
> 
> I'd recommend looking at the sx150x pin control driver and
> check if you can maybe take this direction with the patch?
> 

Thanks for highlighting these examples. I will have a look on these!

Regards,
Amelie

> Yours,
> Linus Walleij
> 
