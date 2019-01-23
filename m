MIME-Version: 1.0
Date: Wed, 23 Jan 2019 09:15:06 -0600
References: <20190123134833.119031-1-chris.brandt@renesas.com>
	<CAL_JsqKuDzL2N_fihJzUEZ9uRK5HWd1ARD7DzZZM7Dy4C8M_BA@mail.gmail.com>
	<TYXPR01MB1568588CC80BDB074A4FADA08A990@TYXPR01MB1568.jpnprd01.prod.outlook.com>
In-Reply-To: <TYXPR01MB1568588CC80BDB074A4FADA08A990@TYXPR01MB1568.jpnprd01.prod.outlook.com>
Message-ID: <CAL_JsqLz-w+jZD3ybcjRhLBKsnrsEqxkPyaSy015LiL_1_hmpw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: renesas: Document RZ/A2M EVB
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jan 23, 2019 at 8:09 AM Chris Brandt <Chris.Brandt@renesas.com> wrote:
>
> On Wednesday, January 23, 2019, Rob Herring wrote:
> > Please check your changes with 'dt_binding_check' target. This will
> > fail. 'description' already has a value, so you can't add a list to
> > it. And description has to be a string.
> >
> > >          items:
> >
> > Move the 2 lines here.
> >
> > >            - const: renesas,r7s9210
>
> I can't find 'dt_binding_check' (I guess it's only in the DT tree).

It's a make target added in 5.0-rc1. You need 'yaml-bindings'
installed. See Documentation/devicetree/writing-schemas.md for
details.

Rob
