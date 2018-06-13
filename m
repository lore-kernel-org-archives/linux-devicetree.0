From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: document gpio-mt7621 bindings
Date: Wed, 13 Jun 2018 13:28:35 -0600
Message-ID: <CAL_Jsq+0bnEmE2n-O3a7ecSXOsjTfZD3AqJDQunO6xzUF_W-=A@mail.gmail.com>
References: <1527924610-13135-1-git-send-email-sergio.paracuellos@gmail.com>
 <1527924610-13135-3-git-send-email-sergio.paracuellos@gmail.com>
 <20180612205638.GA2404@rob-hp-laptop>
 <CAMhs-H8GYut-7hopEb0Oe0DYz0sjSwcw_rQ4hzipu9LMz-zWFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CAMhs-H8GYut-7hopEb0Oe0DYz0sjSwcw_rQ4hzipu9LMz-zWFg@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, driverdev-devel@linuxdriverproject.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, NeilBrown <neil@brown.name>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 13, 2018 at 10:23 AM, Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
> Hi Rob,
>
> Thanks for your time in reviewing this.
>
> On Tue, Jun 12, 2018 at 10:56 PM, Rob Herring <robh@kernel.org> wrote:
>> On Sat, Jun 02, 2018 at 09:30:10AM +0200, Sergio Paracuellos wrote:
>>> Add a devicetree binding documentation for the mt7621 driver.
>>

>>> +   second cell specifies GPIO flags, as defined in <dt-bindings/gpio/gpio.h>.
>>> +   Only the GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
>>> +- gpio-controller : Marks the device node as a GPIO controller.
>>> +- reg : The id of the bank that the node describes.
>>
>> I'd prefer to not have banks defined in DT. Do you have a variable
>> number or resources that are per bank? If not, then you don't need them.
>
> Mmmm, That's what I understood from documentation:
>
> "Some system-on-chips (SoCs) use the concept of GPIO banks. ...
> Usually each such bank is
> exposed in the device tree as an individual gpio-controller node. ..."

This should be conditioned on being able to divide up the registers by
bank which seems like you can't. Or there's the case like the DW GPIO
block and the number of banks is configurable.

> If this is not a good approach, could you please me point me out to a
> device tree example where
> the correct approach is being used?

I'm not sure offhand. There are lots of examples of single nodes I'm
sure. Which ones have banks I haven't a clue. IIRC, there were some
cases where the bank # was part of the GPIO cells, but I seem to
recall Linus prefers not having 3 cells.

Rob
