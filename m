From: Amelie DELAUNAY <amelie.delaunay@st.com>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: Add ST Multi-Function eXpander
 driver
Date: Thu, 22 Feb 2018 15:19:46 +0000
Message-ID: <c44b4b09-8c28-5168-136f-c72c291d7b7b@st.com>
References: <1518100057-23234-1-git-send-email-amelie.delaunay@st.com>
 <1518100057-23234-2-git-send-email-amelie.delaunay@st.com>
 <CACRpkdZxJhntgHwgsg=P98i0aGnXSQ2rXO16H0U=cJ+sBbF27g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZxJhntgHwgsg=P98i0aGnXSQ2rXO16H0U=cJ+sBbF27g@mail.gmail.com>
Content-Language: en-US
Content-ID: <7CC796D646A239409EA3DC0E782F1B18@st.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 02/22/2018 02:11 PM, Linus Walleij wrote:
> On Thu, Feb 8, 2018 at 3:27 PM, Amelie Delaunay <amelie.delaunay@st.com> wrote:
> 
>> +Required properties:
>> +- compatible: must be "st,mfx"
> 
> I bet this should be more specific. Tomorrow there will be a new
> version of this expander and then we will wish that we used
> a more specific compatible for the first one.
> 
> Does this chip have any kind of product number on it?
> 
> Else I would be tempted to use the compatible "st,mfx-0000"
> or something, indicating it is the first of its kind.
> 

This chip has a FW version. So, I agree, I should use a compatible that 
reflects this FW version.

>> +- reg: I2C address of the device
>> +- interrupts: interrupt triggered by MFX_IRQ_OUT signal
>> +- interrupt-parent: interrupt controller MFX is connected to
>> +- interrupt-controller: marks the device as an interrupt controller
>> +- #interrupt-cells: should be <1>, index of the interrupt within the
>> +  controller, in accordance with the "one cell" variant of
>> +  <devicetree/bindings/interrupt-controller/interrupt.txt>
> 
> Seems fine.
> 
>> +Optional nodes:
>> +
>> +* GPIO eXpander
>> +MFX provides 16 programmable GPIOs, and it is also possible to recover 8
>> +alternate GPIOs if the main functions are not used (touchscreen controller and
>> +IDD measurement not enabled).
> 
> Apparenly Rob thinks this should go elsewhere.
> 

It would go with gpio/pinctrl driver, so in dt-bindings/(gpio|pinctrl).

Regards,
Amelie

>> +- gpio-controller: marks the device node as a GPIO controller
>> +- #gpio-cells: should be <2>, the first cell is the GPIO offset on this GPIO
>> +  controller, the second cell is the gpio flags in accordance with
>> +  <dt-bindings/gpio/st-mfx-gpio.h>.
> 
> Let's discuss these extra GPIO flag bindings separately.
> 
> Yours,
> Linus Walleij
> 
