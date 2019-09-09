MIME-Version: 1.0
Date: Mon, 9 Sep 2019 16:55:51 +0100
References: <20190805143911.12185-1-hhhawa@amazon.com>
	<20190805143911.12185-2-hhhawa@amazon.com>
	<20190821191704.GA32425@bogus>
	<1d23d7c5-cd7b-1512-5300-d43e82ba6dc1@amazon.com>
	<CAL_Jsq+8jGbR4u7FA8r0gP5i2H+nSgOkGU_5mfiL=i=c0sOW8A@mail.gmail.com>
	<d46ac081-1867-2997-e2a3-bcfea42b74f3@arm.com>
	<CAL_Jsq+95qZyHWT_A-=L+SSbR0vmMqQDq8N2XcxwFJVG2HCthA@mail.gmail.com>
	<21050550-7629-e8f7-2d30-16c1858cf3cc@arm.com>
In-Reply-To: <21050550-7629-e8f7-2d30-16c1858cf3cc@arm.com>
Message-ID: <CAL_JsqJcqdKGhbuiHpHLQw-844HfkndE-Ws-uRFkQGRQE_JiwA@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: EDAC: Add Amazon's Annapurna Labs L1 EDAC
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: James Morse <james.morse@arm.com>
Cc: "Hawa, Hanna" <hhhawa@amazon.com>, Mark Rutland <mark.rutland@arm.com>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, David Miller <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>, "Woodhouse, David" <dwmw@amazon.co.uk>, benh@amazon.com, "Krupnik, Ronen" <ronenk@amazon.com>, Talel Shenhar <talel@amazon.com>, Jonathan Chocron <jonnyc@amazon.com>, "Hanoch, Uri" <hanochu@amazon.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-edac <linux-edac@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Sep 6, 2019 at 5:29 PM James Morse <james.morse@arm.com> wrote:
>
> Hi Rob,
>
> On 30/08/2019 22:50, Rob Herring wrote:
> > So KVM provides a semi-CortexA57? Code that runs on real h/w won't as a guest.
>
> KVM provides the architectural bits of Cortex-A57's EL1, when running on A57.
>
> Code that depends on EL2, won't run as a guest. Code that depends on some
> non-architectural behaviour of A57 won't work in a guest, (e.g. the PMU)
> Features the hypervisor doesn't completely support may get hidden. The aim is to provide
> an virtual CPU, it might not be exactly the same as the one you're running on.
>
> Hypervisors have to disable access to the imp-def registers as they may allow the guest to
> break its confinement. (e.g. messing with the L2 timing)
>
> Code using imp-def instructions at EL1 needs to know they aren't trapped/disabled by a
> higher exception level. If someone wants to emulate these, something would need a model of
> what those imp-def instructions do.
>


>
> Thanks,
>
> James
