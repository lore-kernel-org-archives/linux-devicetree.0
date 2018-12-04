From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 14/34] dt-bindings: arm: Convert Amlogic board/soc
 bindings to json-schema
Date: Tue, 4 Dec 2018 08:44:52 -0600
Message-ID: <CAL_Jsq+e2m5VaibpvuTYURZ+E=MCSUGH8cokdWYWEjn_jy9iwA@mail.gmail.com>
References: <20181203213223.16986-1-robh@kernel.org> <20181203213223.16986-15-robh@kernel.org>
 <dfb921ca-63c5-a4c2-f3e2-c2eebdf688f6@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dfb921ca-63c5-a4c2-f3e2-c2eebdf688f6@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <kumar.gala@linaro.org>, ARM-SoC Maintainers <arm@kernel.org>, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@arm.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 4, 2018 at 2:39 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi Rob,
>
> You forgot linux-amlogic in CC...
>
> On 03/12/2018 22:32, Rob Herring wrote:
> > Convert Amlogic SoC bindings to DT schema format using json-schema.
> >
> > Cc: Carlo Caione <carlo@caione.org>
> > Cc: Kevin Hilman <khilman@baylibre.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---

[...]

> > +      - items:
> > +          - enum:
> > +              - amlogic,s400
> > +          - const: amlogic,a113d
> > +          - const: amlogic,meson-axg
> > +      - items:
> > +          - enum:
> > +              - amlogic,u200
> > +          - const: amlogic,g12a
>
> but all this feels wrong for me.
>
> First of all, this yaml description is not human friendly and not intuitive at all,
> and secondly with this conversion we loose all the comments about the SoC family relationship
> with the compatible strings !
>
> I really understand the point to have automated verification, but really it's a pain to read
> (I can't imagine newcomers... the actual DT bindings are already hard to read...) and
> I feel it will be a real pain to write !

What do you suggest that would be easier? Is it the YAML itself or the
json-schema vocabulary? For the former, we could use {} and [] to make
things more json style. But I imagine it is the latter.

There is some learning curve for json-schema and is certainly a
concern I have, but there would be a learning curve for anything. Our
choices are use some existing schema language or invent one. All the
previous efforts (there's been about 5 since 2013) have been inventing
one, and they've not gone far. There will be far few resources
available to train people with if we do something custom.

> Can't we mix an "humam text" with a "yaml" part on a same document ? we are in 2018 (nearly 2019),
> and it should be easy to extract a yaml description from a text document without pain and
> keep all the human description, no ?

Yes. Please go look at the annotated example in patch 2.

> What will be the case for all the bindings with ASCII art to describe the architecture of the
> HW ? will you simply drop it to replace it with cold yaml description ?

No, you can have literal blocks and/or comments with however much
description you like. In fact, there's some notion to write the
descriptions in sphinx and extract them to generate documentation, but
that's a ways off. That's just the extent of what is possible.

Rob
