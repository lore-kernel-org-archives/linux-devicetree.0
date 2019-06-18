From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 7/8] net: ethernet: ixp4xx: Add DT bindings
Date: Tue, 18 Jun 2019 14:22:36 -0600
Message-ID: <CAL_Jsq+qwmA1hHRj73B1uf0WY76waK7M96Ndj1RSKHuAi1v=Cw@mail.gmail.com>
References: <20190524162229.9185-1-linus.walleij@linaro.org>
 <CAL_Jsq+bZsJ+SBiJa2hzXU9RkTNBhDk_Uv_Fk6V6DqRGh-xPRg@mail.gmail.com> <CACRpkdbkwTtS2ofpxkZLERW-b+4=d7m9qiPXGT+iMemn9zZE1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbkwTtS2ofpxkZLERW-b+4=d7m9qiPXGT+iMemn9zZE1A@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: netdev <netdev@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Halasa <khalasa@piap.pl>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 18, 2019 at 1:44 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, May 24, 2019 at 9:41 PM Rob Herring <robh@kernel.org> wrote:
>
> > > +  reg:
> > > +    maxItems: 1
> > > +    description: Ethernet MMIO address range
> > > +
> > > +  queue-rx:
> > > +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> > > +    maxItems: 1
> >
> > This doesn't actually do what you think it is doing. A $ref plus
> > additional constraints need to be under an 'allOf' list.
> >
> > > +    description: phandle to the RX queue on the NPE
> >
> > But this is a phandle plus 1 cell, right?
> >
> > - allOf:
> >     - $ref: '/schemas/types.yaml#/definitions/phandle-array'
> >     - items:
> >         - items:
> >             - description: phandle to the RX queue on the NPE
> >             - description: whatever the cell contains
> >               enum: [ 1, 2, 3, 4 ] # any constraints you can put on the cell
> >
> > This implicitly says you have 1 of a phandle + 1 cell.
> >
> > I need to add this to example-schema.yaml...
>
> I just can't get this right :(
>
> I have this:
>
>   queue-rx:
>     - allOf:

Properties take a schema/object/dict or boolean. You are making
queue-rx a list. Drop the '-'.

>       - $ref: '/schemas/types.yaml#/definitions/phandle-array'
>       - items:
>         - items:
>           - description: phandle to the RX queue on the NPE
>           - description: index of the NPE engine RX queue to use
>             enum: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
>
> I get this from dt_binding_check:
>
>   CHKDT   Documentation/devicetree/bindings/net/intel,ixp4xx-ethernet.yaml
> Documentation/devicetree/bindings/net/intel,ixp4xx-ethernet.yaml:
> properties:queue-rx: [{'allOf': [{'$ref':
> '/schemas/types.yaml#/definitions/phandle-array'}, {'items':
> [{'items': [{'description': 'phandle to the RX queue on the NPE'},
> {'description': 'index of the NPE engine RX queue to use', 'enum': [0,
> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}]}]}]}] is not of type 'object',
> 'boolean'
> make[3]: *** [../Documentation/devicetree/bindings/Makefile:12:
> Documentation/devicetree/bindings/net/intel,ixp4xx-ethernet.example.dts]
> Error 1
>
> Hm .... I just can't figure out what this recursive parsing thingie means...
> I tried to update the pip3 repo but no cigar.

What do you mean pip didn't work?

Rob
