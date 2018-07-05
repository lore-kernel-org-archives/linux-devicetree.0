MIME-Version: 1.0
Date: Thu, 5 Jul 2018 11:18:34 -0600
References: <1530054453-10393-1-git-send-email-festevam@gmail.com>
	<20180703222142.GA15061@rob-hp-laptop>
	<f4505aac-7e1f-9f1b-6f3a-6c3478ea9e12@mentor.com>
In-Reply-To: <f4505aac-7e1f-9f1b-6f3a-6c3478ea9e12@mentor.com>
Message-ID: <CAL_JsqKmo9p6dzweU+m_wj56C1uzFg60a9=E+b84A2AhSrmO8g@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: sram: Add 'clocks' as an optional property
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jul 4, 2018 at 12:40 AM Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:
>
> Hi Rob, Fabio,
>
> On 07/04/2018 01:21 AM, Rob Herring wrote:
> > On Tue, Jun 26, 2018 at 08:07:33PM -0300, Fabio Estevam wrote:
> >> From: Fabio Estevam <fabio.estevam@nxp.com>
> >>
> >> Some SoCs (like i.MX53) need to specify the SRAM clock in the
> >> device tree via the clocks property.
> >>
> >> Add an entry to the optional property section.
> >>
> >> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
> >> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> >> ---
> >> Changes since v1:
> >> - Add space before : and use the more common "list of phandle
> >> and clock specifier pairs" term - Vladimir
> >>
> >>  Documentation/devicetree/bindings/sram/sram.txt | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/sram/sram.txt b/Documentation/devicetree/bindings/sram/sram.txt
> >> index 267da44..ae6ca34 100644
> >> --- a/Documentation/devicetree/bindings/sram/sram.txt
> >> +++ b/Documentation/devicetree/bindings/sram/sram.txt
> >> @@ -50,6 +50,8 @@ Optional properties in the area nodes:
> >>               manipulation of the page attributes.
> >>  - label : the name for the reserved partition, if omitted, the label
> >>            is taken from the node name excluding the unit address.
> >> +- clocks : a list of phandle and clock specifier pairs that controls the
> >> +       SRAM clock.
> >
> > A list controlling THE (single) SRAM clock?
> >
> > Once we start needing clocks, power, or other setup, we really should
> > have specific compatible strings (and binding docs) for the SRAM. I'll
> > take a single clock though.
> >
>
> There are SRAM devices, which take multiple power or clock supplies [1],
> where one clock or power domain control enables a segment on SRAM, however
> a number of (enabled) segments form a single continuous IO memory space,
> hence it could make sense to pluralize clocks in the generic document,
> particular device specifics can be described separately.

The device specific part still has to say how many clocks and what
they are, so having multiple clocks in the generic binding doesn't buy
you anything. And I don't care to give the impression that we support
multiple clocks with the generic binding.

Rob
