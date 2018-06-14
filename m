From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: document gpio-mt7621 bindings
Date: Thu, 14 Jun 2018 18:20:25 +0200
Message-ID: <CAMhs-H_rsxDP-2BjrM6vYOie+NwDmj8ygry2hQdwM0kWZz7+oQ@mail.gmail.com>
References: <1527924610-13135-1-git-send-email-sergio.paracuellos@gmail.com>
 <1527924610-13135-3-git-send-email-sergio.paracuellos@gmail.com>
 <20180612205638.GA2404@rob-hp-laptop>
 <CAMhs-H8GYut-7hopEb0Oe0DYz0sjSwcw_rQ4hzipu9LMz-zWFg@mail.gmail.com>
 <CAL_Jsq+0bnEmE2n-O3a7ecSXOsjTfZD3AqJDQunO6xzUF_W-=A@mail.gmail.com>
 <20180614044539.GA8681@foobar>
 <CACRpkda+tOYEnAgskbNkMXNoFkGo+unV4RcheZn2mJnEHQsYyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CACRpkda+tOYEnAgskbNkMXNoFkGo+unV4RcheZn2mJnEHQsYyQ@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, driverdev-devel@linuxdriverproject.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, NeilBrown <neil@brown.name>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 14, 2018 at 4:17 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Jun 14, 2018 at 6:45 AM, Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
>
>> Ok, so... does the following single node sounds acceptable?
>>
>> gpio: gpio@600 {
>>   #gpio-cells = <2>;
>>   #interrupt-cells = <2>;
>>   compatible = "mediatek,mt7621-gpio";
>>   gpio-controller;
>>   interrupt-controller;
>>   reg = <0x600 0x60>;
>>   interrupt-parent = <&gic>;
>>   interrupts = <GIC_SHARED 12 IRQ_TYPE_LEVEL_HIGH>;
>>   mediatek,gpio-bank-widths = <32 32 32>;
>
> Why would you need this? It is pretty obvious from the
> compatible string isn't it? Just use that to tell that
> "aha, it is mediatek,mt7321-gpio, so it has 3x32 GPIOs
> indexed from 0..95".
>
> No need of overspecifying stuff.

Ok, So just one node with no extra stuff.

gpio: gpio@600 {
   #gpio-cells = <2>;
   #interrupt-cells = <2>;
   compatible = "mediatek,mt7621-gpio";
   gpio-controller;
   interrupt-controller;
   reg = <0x600 0x60>;
   interrupt-parent = <&gic>;
   interrupts = <GIC_SHARED 12 IRQ_TYPE_LEVEL_HIGH>;

Thanks for your answers!

>
> Yours,
> Linus Walleij

Best regards,
    Sergio Paracuellos
