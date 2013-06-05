From: Gerlando Falauto <gerlando.falauto@keymile.com>
Subject: Re: DT version of kirkwood_ge0x_init()
Date: Wed, 05 Jun 2013 11:55:10 +0200
Message-ID: <51AF0AFE.1000503@keymile.com>
References: <51ADBEE0.5040500@keymile.com> <51ADC2C2.6010106@gmail.com>
 <51AE53D4.5070208@keymile.com> <51AEFF26.8080004@gmail.com>
 <51AF06E0.6040103@keymile.com> <51AF0990.7090406@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <51AF0990.7090406@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, "Longchamp, Valentin" <Valentin.Longchamp@keymile.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "Brunck,
 Holger" <Holger.Brunck@keymile.com>, Thomas Gleixner <tglx@linutronix.de>, Simon Guinot <simon@sequanux.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 06/05/2013 11:49 AM, Sebastian Hesselbarth wrote:
> On 06/05/13 11:37, Gerlando Falauto wrote:
>> On 06/05/2013 11:04 AM, Sebastian Hesselbarth wrote:
>> [...]
>>>
>>> I have irqchip and clocksource drivers ready for Orion SoCs (Kirkwood,
>>> Dove, Orion5x, MV78x00). Just need some time to rebase and send patches.
>>
>> [sorry we've moved to a different topic]
>> [adding Thomas Gleixner]
>> You mean the driver in arch/arm/plat-orion/gpio.c or the generic
>> one in drivers/gpio/gpio-mvebu.c?
>
> For Kirkwood and Dove, DT kernels use gpio-mvebu. And that is there
> from a time when there was no irqdomain support in generic chip. That
> should be updated.

I know, that's why I was wondering how it is possible to update this 
driver and yet support per-cpu registers.
But I am admittedly not 100% sure I know what I'm talking about.

Anyway, could you please Cc: me when you post those patches?

Thank you,
Gerlando
