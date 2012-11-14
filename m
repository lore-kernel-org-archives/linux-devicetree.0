From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: Re: [RFC] MIPS: BCM63XX: register GPIO controller through Device Tree
Date: Wed, 14 Nov 2012 13:13:44 +0100
Message-ID: <CAOiHx=n7kqnnu51ObiPMeBtVYNX0n+xiBkk8FOJ0EQ5nQRbD9A@mail.gmail.com>
References: <1352638249-29298-1-git-send-email-jonas.gorski@gmail.com>
 <1352638249-29298-12-git-send-email-jonas.gorski@gmail.com> <50A1D54E.2090406@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50A1D54E.2090406@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, John Crispin <blogic@openwrt.org>, Maxime Bizon <mbizon@freebox.fr>, Florian Fainelli <florian@openwrt.org>, Kevin Cernekee <cernekee@gmail.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 13 November 2012 06:06, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 11/11/2012 05:50 AM, Jonas Gorski wrote:
>> Register the GPIO controller through Device Tree and add the
>> appropriate values in the include files.
>>
>> Since we can't register a platform driver at this early stage move the
>> direct call to bcm63xx_gpio_init from prom_init to an arch initcall.
>
>> diff --git a/Documentation/devicetree/bindings/gpio/bcm63xx-gpio.txt b/Documentation/devicetree/bindings/gpio/bcm63xx-gpio.txt
>
>> +- #gpio-cells: Must be <2>. The first cell is the GPIO pin, and
>> +  the second one the standard linux flags.
>
> Also here, I think you want to explicitly document the flag values here
> so the bindings don't rely on the Linux kernel code. I don't think
> there's a standard central file which documents them though, although I
> vaguely recall some discussion to create add them to gpio.txt?

I'll add some more description. And yes there isn't, and I can't
comment about that since I just joined devicetree-discuss a few days
ago. It would be nice to have them there. Maybe I'll add a reference
to gpio.txt and see if I can come up with an acceptable description
for the flags.


Jonas
