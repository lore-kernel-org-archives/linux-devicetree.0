From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 4/8] gpio: dt-bindings: Add documentation for Aspeed
 GPIO controllers
Date: Tue, 30 Aug 2016 15:34:25 +0930
Message-ID: <CACPK8XeysBLWM59QCwJ3mGP72=5t-K+M3oYAycut9rx0j9qHQw@mail.gmail.com>
References: <20160819124414.24242-1-andrew@aj.id.au> <20160819124414.24242-5-andrew@aj.id.au>
 <20160819143641.GA19513@rob-hp-laptop> <1471824960.5707.3.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1471824960.5707.3.camel@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 22, 2016 at 9:46 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 2016-08-19 at 09:36 -0500, Rob Herring wrote:
>> On Fri, Aug 19, 2016 at 10:14:10PM +0930, Andrew Jeffery wrote:
>> >
>> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> > ---
>> >
>> > Since v1:
>> >
>> > Rob: I haven't added your Acked-by here as I've made the following changes and
>> > wanted to get your input:
>> >
>> > * Remove interrupt-controller as an optional property
>> > * Defer to interrupt-controller bindings document for sub-node properties
>> >
>> > I had a discussion with Joel about whether the interrupt-controller capability
>> > should be optional and the conclusion was that it should always be configured
>> > by the driver. This makes an optional interrupt-controller property feel
>> > redundant (and possibly inaccurate if left out) so I've removed it.
>> I don't follow. What do you mean byt "configured by the driver". If the
>> block supports interrupts, then it should be marked as an
>> interrupt-controller. It never should have been optional. The OS can
>> ignore the interrupt properties if it chooses.
>
> Right, clearly there was some confusion on my part. I will fix that up.
> Thanks for clarifying.
>

Thanks for clarifying this Rob. With this cleared up,

Acked-by: Joel Stanley <joel@jms.id.au>
