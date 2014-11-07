MIME-Version: 1.0
In-Reply-To: <20141107164940.663f5423@bbrezillon>
References: <1415203287-21517-1-git-send-email-boris.brezillon@free-electrons.com>
	<1415203287-21517-7-git-send-email-boris.brezillon@free-electrons.com>
	<CAL_JsqJvT-gnr6AYHq42qfgS+ckZ1y6DFiPK5+-MBhHefB8_Sg@mail.gmail.com>
	<20141107164940.663f5423@bbrezillon>
Date: Fri, 7 Nov 2014 13:39:43 -0600
Message-ID: <CAL_Jsq+F2APb7mDX8S9AcuOuUxQ=UBd_kVHkWFcU0AaTEjb0Fg@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] memory: atmel-ebi: add DT bindings documentation
From: Rob Herring <robherring2@gmail.com>
Content-Type: text/plain; charset=UTF-8
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Arnd Bergmann <arnd@arndb.de>
List-ID: <devicetree@vger.kernel.org>

On Fri, Nov 7, 2014 at 9:49 AM, Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> On Fri, 7 Nov 2014 09:21:39 -0600
> Rob Herring <robherring2@gmail.com> wrote:
>
>> On Wed, Nov 5, 2014 at 10:01 AM, Boris Brezillon
>> <boris.brezillon@free-electrons.com> wrote:
>> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>>
>> Perhaps some commit msg?
>
> Yes, I was just lazy and though this series would make another round
> anyway :-).
>
> I'll add a commit log to all my commits...
>
>>
>> While this binding seems mostly okay to me, this is the 2nd memory
>> controller binding I've looked at in the last day [1]. There are
>> probably some others already as well. This makes me think we need a
>> generic binding here. At least the node structure and how we define
>> chip selects should be common.
>
> Sure.
> Any suggestion ?

Start with yours.

> BTW, I don't use any specific property to define the chip select
> associated to a device, because it's already encoded in the reg
> property.
> TI AEMIF binding define an ti,cs-chipselect property, is there any
> reason for doing that ?
>
> Moreover, IMHO it would even make sense to have some sort of
> framework/helper functions for those kind of interfaces to external
> memories, but this is another story :-).


>
>>
>> While I like timing information in time units over magic register
>> values in the Tegra binding, the reality is converting timing info to
>> register values is generally very hard to get both correct and
>> optimal. In the end, you probably need to hand tweak the register
>> settings anyway. So I'm hesitant to say it must be done 1 way here.
>
> Well, I'm not a big fan of timings expressed in clock cycles, cause
> this implies changing your DT when you tweak your master/bus clk.
> Expressing those timings in nano or pico seconds let the driver figure
> out what's the best value according to the current source clk rate.

Agreed. 
>
> Regards,
>
> Boris
>
>
> --
> Boris Brezillon, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
