From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: remove 'interrupt-parent' from bindings
Date: Mon, 23 Jul 2018 20:22:50 -0600
Message-ID: <CAL_JsqL67uQradiJ-OQTNs++zkUC3DWp8ore3XiB9f8fF0MhSw@mail.gmail.com>
References: <20180723221317.16394-1-robh@kernel.org> <811b4c0c-7d9c-2bbc-5029-58a458a13f7e@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <811b4c0c-7d9c-2bbc-5029-58a458a13f7e@mleia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 23, 2018 at 5:20 PM Vladimir Zapolskiy <vz@mleia.com> wrote:
>
> Hi Rob,
>
> On 07/24/2018 01:13 AM, Rob Herring wrote:
> > 'interrupt-parent' is often documented as part of define bindings, but
> > it is really outside the scope of a device binding. It's never required
> > in a given node as it is often inherited from a parent node. Or it can
> > be implicit if a parent node is an 'interrupt-controller' node. So
> > remove it from all the binding files.
> >
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
>
> [snip]
>
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.txt b/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.txt
> > index 38211f344dc8..0bfb3ba55f4c 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.txt
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.txt
> > @@ -14,8 +14,6 @@ Required properties:
> >    Reset value is IRQ_TYPE_LEVEL_LOW.
> >
> >  Optional properties:
> > -- interrupt-parent: empty for MIC interrupt controller, link to parent
> > -  MIC interrupt controller for SIC1 and SIC2
> >  - interrupts: empty for MIC interrupt controller, cascaded MIC
> >    hardware interrupts for SIC1 and SIC2
> >
>
> I would rather ask you to keep the property here, it is optional in sense that
> its presence distinguishes MIC and SIC types of interrupt controllers.

Sure, no problem.

Hopefully I remember on the next round of wack-a-mole.

Rob
