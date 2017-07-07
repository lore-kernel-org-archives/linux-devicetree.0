MIME-Version: 1.0
In-Reply-To: <20170705193254.ulpoduoqlqf4ttkj@flea>
References: <20170628145343.25443-1-khilman@baylibre.com>
	<20170705142015.tmlmes5lobadndsy@rob-hp-laptop>
	<20170705193254.ulpoduoqlqf4ttkj@flea>
Date: Fri, 7 Jul 2017 08:24:03 -0500
Message-ID: <CAL_JsqJ7P2ehaL4wZjBsk-DRjpSiCVRNmmxT7w9xuC2PYiUKFQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: amlogic: add unstable statement
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Kevin Hilman <khilman@baylibre.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>



On Wed, Jul 5, 2017 at 2:32 PM, Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
> On Wed, Jul 05, 2017 at 09:20:15AM -0500, Rob Herring wrote:
>> On Wed, Jun 28, 2017 at 07:53:43AM -0700, Kevin Hilman wrote:
>> > Due to the lack of documentation on this SoC family, discovery of new
>> > features, and correcting of previous misunderstandings is expected, so
>> > it's unrealistic to expect any form of stable bindings for this SoC
>> > family.  Make that clear inthe binding documentation.
>>
>> s/inthe/in the/
>>
>> >
>> > Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>> > ---
>> >  Documentation/devicetree/bindings/arm/amlogic.txt | 12 ++++++++++++
>> >  1 file changed, 12 insertions(+)
>>
>> I've yet to see anyone remove an unstable tag and I'd rather see these
>> for individual bindings than for the platform as a whole. In the end,
>> it's a platform maintainers decision whether to accept compatibility
>> breakage regardless of some text that probably no one reads.
>
> So what is the policy exactly to decide whether this statement can be
> merged or not?

I acked it, didn't I?

> We have all the issues mentionned above, no backing from the vendor,
> and yet, we were forced last year to bow down to one single "user"
> without a clear usage into supporting a stable ABI that we never
> really anticipated. How does that work exactly?
