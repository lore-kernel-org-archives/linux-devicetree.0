From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: EDAC: Add Amazon's Annapurna Labs L1 EDAC
Date: Tue, 27 Aug 2019 08:49:13 -0500
Message-ID: <CAL_Jsq+8jGbR4u7FA8r0gP5i2H+nSgOkGU_5mfiL=i=c0sOW8A@mail.gmail.com>
References: <20190805143911.12185-1-hhhawa@amazon.com> <20190805143911.12185-2-hhhawa@amazon.com>
 <20190821191704.GA32425@bogus> <1d23d7c5-cd7b-1512-5300-d43e82ba6dc1@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1d23d7c5-cd7b-1512-5300-d43e82ba6dc1@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Hawa, Hanna" <hhhawa@amazon.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, James Morse <james.morse@arm.com>, David Miller <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>, "Woodhouse, David" <dwmw@amazon.co.uk>, benh@amazon.com, "Krupnik, Ronen" <ronenk@amazon.com>, Talel Shenhar <talel@amazon.com>, Jonathan Chocron <jonnyc@amazon.com>, "Hanoch, Uri" <hanochu@amazon.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-edac <linux-edac@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 26, 2019 at 9:49 AM Hawa, Hanna <hhhawa@amazon.com> wrote:
>
>
>
> On 8/21/2019 10:17 PM, Rob Herring wrote:
> > Why is this even in DT? AFAICT, this is all just CortexA57 core features
> > (i.e. nothing Amazon specific). The core type and the ECC capabilities
> > are discoverable.
>
> Added to the DT in order to easily enable/disable the driver.

That alone is not reason enough to put it in DT. From a DT
perspective, I have no idea what the whims of a OS maintainer are
regarding whether they want all this to be 1 driver or 2 drivers.
(IMO, it should be 1 as this is ECC for an A57. For a core and memory
controller, then 2 seems appropriate.)

> You are
> correct that they are CortexA57 core features and nothing Amazon
> specific, but it's IMPLEMENTATION DEFINED, meaning that in different
> cortex revisions (e.g. A57) the register bitmap may change. Because of
> that we added an Amazon compatible which corresponds to the specific
> core we are using.

'IMPLEMENTATION DEFINED' usually means not defined by the
architecture. This doesn't seem like something that's going to change
with A57 revisions. Plus, the A57 is pretty old now, so we know what's
out there already. In any case, the revision is discoverable too, so
we could deal with changes between revisions in any case.

Rob
