MIME-Version: 1.0
Date: Tue, 18 Dec 2018 09:44:23 -0600
References: <20181217144324.99422-1-chris.brandt@renesas.com>
	<20181217144324.99422-2-chris.brandt@renesas.com>
	<20181218150551.GA15519@bogus>
	<TYXPR01MB1568D8FDF5E286B2832703048ABD0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
In-Reply-To: <TYXPR01MB1568D8FDF5E286B2832703048ABD0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
Message-ID: <CAL_JsqLcnWLK0Uyg1YQ7TRzN+vMqtKNO6Jj+VLb_dTzstTDj-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ARM: dts: r7s9210: Initial SoC device tree
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Dec 18, 2018 at 9:40 AM Chris Brandt <Chris.Brandt@renesas.com> wrote:
>
> On Tuesday, December 18, 2018 1, Rob Herring wrote:
> > > +/ {
> > > +   compatible = "renesas,r7s9210";
> > > +   interrupt-parent = <&gic>;
> > > +   #address-cells = <1>;
> > > +   #size-cells = <1>;
> > > +
> > > +   bsid: chipid@fcfe8004 {
> >
> > Put all the mmio peripherals under a simple-bus node or nodes.
>
> Just to be clear on what you mean, basically put all the peripherals
> under a 'soc' node like the other Renesas parts?

Yes.

>
>         soc {
>                 compatible = "simple-bus";
>                 interrupt-parent = <&gic>;
>
>                 #address-cells = <2>;
>                 #size-cells = <2>;
>                 ranges;
>
>
> Thanks,
> Chris
>
