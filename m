From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: mailbox: add binding doc for the ARM
 SMC/HVC mailbox
Date: Mon, 2 Sep 2019 15:20:00 +0100
Message-ID: <CAL_JsqLauLbgVg=Aguebqk3q6e+BOxiMNJ+xqTgkmpAjOh8BpA@mail.gmail.com>
References: <1567004515-3567-1-git-send-email-peng.fan@nxp.com>
 <1567004515-3567-2-git-send-email-peng.fan@nxp.com> <5d6d1b86.1c69fb81.f86b5.3988@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5d6d1b86.1c69fb81.f86b5.3988@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Fan <peng.fan@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 2, 2019 at 2:39 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Aug 28, 2019 at 03:02:58AM +0000, Peng Fan wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > The ARM SMC/HVC mailbox binding describes a firmware interface to trigger
> > actions in software layers running in the EL2 or EL3 exception levels.
> > The term "ARM" here relates to the SMC instruction as part of the ARM
> > instruction set, not as a standard endorsed by ARM Ltd.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  .../devicetree/bindings/mailbox/arm-smc.yaml       | 125 +++++++++++++++++++++
> >  1 file changed, 125 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mailbox/arm-smc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mailbox/arm-smc.yaml b/Documentation/devicetree/bindings/mailbox/arm-smc.yaml
> > new file mode 100644
> > index 000000000000..f8eb28d5e307
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mailbox/arm-smc.yaml
> > @@ -0,0 +1,125 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mailbox/arm-smc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ARM SMC Mailbox Interface
> > +
> > +maintainers:
> > +  - Peng Fan <peng.fan@nxp.com>
> > +
> > +description: |
> > +  This mailbox uses the ARM smc (secure monitor call) and hvc (hypervisor
> > +  call) instruction to trigger a mailbox-connected activity in firmware,
> > +  executing on the very same core as the caller. By nature this operation
> > +  is synchronous and this mailbox provides no way for asynchronous messages
> > +  to be delivered the other way round, from firmware to the OS, but
> > +  asynchronous notification could also be supported. However the value of
> > +  r0/w0/x0 the firmware returns after the smc call is delivered as a received
> > +  message to the mailbox framework, so a synchronous communication can be
> > +  established, for a asynchronous notification, no value will be returned.
> > +  The exact meaning of both the action the mailbox triggers as well as the
> > +  return value is defined by their users and is not subject to this binding.
> > +
> > +  One use case of this mailbox is the SCMI interface, which uses shared memory
> > +  to transfer commands and parameters, and a mailbox to trigger a function
> > +  call. This allows SoCs without a separate management processor (or when
> > +  such a processor is not available or used) to use this standardized
> > +  interface anyway.
> > +
> > +  This binding describes no hardware, but establishes a firmware interface.
> > +  Upon receiving an SMC using one of the described SMC function identifiers,
> > +  the firmware is expected to trigger some mailbox connected functionality.
> > +  The communication follows the ARM SMC calling convention.
> > +  Firmware expects an SMC function identifier in r0 or w0. The supported
> > +  identifiers are passed from consumers, or listed in the the arm,func-ids
> > +  properties as described below. The firmware can return one value in
> > +  the first SMC result register, it is expected to be an error value,
> > +  which shall be propagated to the mailbox client.
> > +
> > +  Any core which supports the SMC or HVC instruction can be used, as long as
> > +  a firmware component running in EL3 or EL2 is handling these calls.
> > +
> > +properties:
> > +  compatible:
> > +    const: arm,smc-mbox
> > +
> > +  "#mbox-cells":
> > +    const: 1
> > +
> > +  arm,num-chans:
> > +    description: The number of channels supported.
> > +    items:
> > +      minimum: 1
> > +      maximum: 4096 # Should be enough?
> > +
> > +  method:
> > +    - enum:
>
> Did you build this with 'make dt_binding_check' as this should be a
> warning. This should not be a list entry (i.e. drop the '-').
>
> > +        - smc
> > +        - hvc
> > +
> > +  transports:
>
> arm,transports
>
> > +    - enum:
> > +        - mem
> > +        - reg
> > +
> > +  arm,func-ids:
> > +    description: |
> > +      An array of 32-bit values specifying the function IDs used by each
> > +      mailbox channel. Those function IDs follow the ARM SMC calling
> > +      convention standard [1].
> > +
> > +      There is one identifier per channel and the number of supported
> > +      channels is determined by the length of this array.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array

Also, this doesn't work. You need:

allOf:
  - $ref: /schemas/types.yaml#/definitions/uint32-array

> > +    minItems: 0
> > +    maxItems: 4096   # Should be enough?
