From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: EDAC: Add Amazon's Annapurna Labs L1 EDAC
Date: Fri, 30 Aug 2019 16:50:24 -0500
Message-ID: <CAL_Jsq+95qZyHWT_A-=L+SSbR0vmMqQDq8N2XcxwFJVG2HCthA@mail.gmail.com>
References: <20190805143911.12185-1-hhhawa@amazon.com> <20190805143911.12185-2-hhhawa@amazon.com>
 <20190821191704.GA32425@bogus> <1d23d7c5-cd7b-1512-5300-d43e82ba6dc1@amazon.com>
 <CAL_Jsq+8jGbR4u7FA8r0gP5i2H+nSgOkGU_5mfiL=i=c0sOW8A@mail.gmail.com> <d46ac081-1867-2997-e2a3-bcfea42b74f3@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d46ac081-1867-2997-e2a3-bcfea42b74f3@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Morse <james.morse@arm.com>
Cc: "Hawa, Hanna" <hhhawa@amazon.com>, Mark Rutland <mark.rutland@arm.com>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, David Miller <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>, "Woodhouse, David" <dwmw@amazon.co.uk>, benh@amazon.com, "Krupnik, Ronen" <ronenk@amazon.com>, Talel Shenhar <talel@amazon.com>, Jonathan Chocron <jonnyc@amazon.com>, "Hanoch, Uri" <hanochu@amazon.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-edac <linux-edac@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 30, 2019 at 7:45 AM James Morse <james.morse@arm.com> wrote:
>
> Hi guys,
>
> On 27/08/2019 14:49, Rob Herring wrote:
> > On Mon, Aug 26, 2019 at 9:49 AM Hawa, Hanna <hhhawa@amazon.com> wrote:
> >> On 8/21/2019 10:17 PM, Rob Herring wrote:
> >>> Why is this even in DT? AFAICT, this is all just CortexA57 core features
> >>> (i.e. nothing Amazon specific). The core type and the ECC capabilities
> >>> are discoverable.
> >>
> >> Added to the DT in order to easily enable/disable the driver.
> >
> > That alone is not reason enough to put it in DT. From a DT
> > perspective, I have no idea what the whims of a OS maintainer are
> > regarding whether they want all this to be 1 driver or 2 drivers.
> > (IMO, it should be 1 as this is ECC for an A57. For a core and memory
> > controller, then 2 seems appropriate.)
> >
> >> You are
> >> correct that they are CortexA57 core features and nothing Amazon
> >> specific, but it's IMPLEMENTATION DEFINED, meaning that in different
> >> cortex revisions (e.g. A57) the register bitmap may change. Because of
> >> that we added an Amazon compatible which corresponds to the specific
> >> core we are using.
>
> I think its that the instruction encoding is in the imp-def space that is important.
>
> CPU-implementers can add whatever registers they find useful here. A57 and A72 both
> implemented some ECC registers here. (They are not guaranteed to be the same, but I can't
> find any differences).

Two cores potentially being the same only furthers my argument that
this shouldn't be an Amazon driver.

> We need some information from DT because the TRM doesn't say what happens when you read
> from these registers on an A57 that doesn't have the 'optional ECC protection'. It could
> take an exception due to an unimplemented system register.

My read of the TRM is that L2 ECC is always there and L1 ECC/parity is
optional. Furthermore, bit 22 of L2CTRL_EL1 indicates if L1 ECC/parity
is supported or not and there's other non-ECC stuff like cache RAM
timing values in that register.

> The imp-def instruction space may also be trapped by a higher exception level. KVM does
> this, and emulates these registers as if they were all undefined.

So KVM provides a semi-CortexA57? Code that runs on real h/w won't as a guest.

However, if we do need DT to indicate ECC support in a core or not,
then we already have an A57 node and should put that info there.

Rob
