From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH v3 1/2] dt-bindings: mailbox: add binding doc for the ARM
 SMC/HVC mailbox
Date: Thu, 18 Jul 2019 01:47:56 +0000
Message-ID: <AM0PR04MB448136F19FBE4674E56A7A4288C80@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1563184103-8493-1-git-send-email-peng.fan@nxp.com>
 <1563184103-8493-2-git-send-email-peng.fan@nxp.com>
 <20190717172801.GG18370@e107155-lin>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190717172801.GG18370@e107155-lin>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Sudeep,

> Subject: Re: [PATCH v3 1/2] dt-bindings: mailbox: add binding doc for the=
 ARM
> SMC/HVC mailbox
>=20
> This looks much better now.
>=20
> On Mon, Jul 15, 2019 at 10:10:10AM +0000, Peng Fan wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > The ARM SMC/HVC mailbox binding describes a firmware interface to
> > trigger actions in software layers running in the EL2 or EL3 exception =
levels.
> > The term "ARM" here relates to the SMC instruction as part of the ARM
> > instruction set, not as a standard endorsed by ARM Ltd.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >
> > V3:
> >  Convert to yaml
> >  Drop interrupt
> >  Introudce transports to indicate mem/reg  The func id is still kept
> > as optional, because like SCMI it only  cares about message.
> >
> > V2:
> >  Introduce interrupts as a property.
> >
> >  .../devicetree/bindings/mailbox/arm-smc.yaml       | 124
> +++++++++++++++++++++
> >  1 file changed, 124 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/mailbox/arm-smc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mailbox/arm-smc.yaml
> > b/Documentation/devicetree/bindings/mailbox/arm-smc.yaml
> > new file mode 100644
> > index 000000000000..da9b1a03bc4e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mailbox/arm-smc.yaml
> > @@ -0,0 +1,124 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> >
> +cetree.org%2Fschemas%2Fmailbox%2Farm-smc.yaml%23&amp;data=3D02%7
> C01%7Cp
> >
> +eng.fan%40nxp.com%7Cb5039d50ce8c40928edb08d70adc20f9%7C686ea1
> d3bc2b4c
> >
> +6fa92cd99c5c301635%7C0%7C1%7C636989812923178414&amp;sdata=3DUT
> 7r2vOLX4a
> > +tv7Yfh750wdSXSh2ZPxeJOXLWl5yACK0%3D&amp;reserved=3D0
> > +$schema:
> > +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> >
> +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=3D02%7C01%7Cpe
> ng.fan%
> >
> +40nxp.com%7Cb5039d50ce8c40928edb08d70adc20f9%7C686ea1d3bc2b4c
> 6fa92cd9
> >
> +9c5c301635%7C0%7C1%7C636989812923178414&amp;sdata=3D3Gjn1NQtO
> PbvfTvyN3X
> > +b89%2BvvGO2ff6DpGQUQejGAzU%3D&amp;reserved=3D0
> > +
> > +title: ARM SMC Mailbox Interface
> > +
> > +maintainers:
> > +  - Peng Fan <peng.fan@nxp.com>
> > +
> > +description: |
> > +  This mailbox uses the ARM smc (secure monitor call) and hvc
> > +(hypervisor
> > +  call) instruction to trigger a mailbox-connected activity in
> > +firmware,
> > +  executing on the very same core as the caller. By nature this
> > +operation
> > +  is synchronous and this mailbox provides no way for asynchronous
> > +messages
> > +  to be delivered the other way round, from firmware to the OS, but
> > +  asynchronous notification could also be supported. However the
> > +value of
> > +  r0/w0/x0 the firmware returns after the smc call is delivered as a
> > +received
> > +  message to the mailbox framework, so a synchronous communication
> > +can be
> > +  established, for a asynchronous notification, no value will be retur=
ned.
> > +  The exact meaning of both the action the mailbox triggers as well
> > +as the
> > +  return value is defined by their users and is not subject to this bi=
nding.
> > +
> > +  One use case of this mailbox is the SCMI interface, which uses
> > + shared memory  to transfer commands and parameters, and a mailbox
> to
> > + trigger a function  call. This allows SoCs without a separate
> > + management processor (or when  such a processor is not available or
> > + used) to use this standardized  interface anyway.
> > +
> > +  This binding describes no hardware, but establishes a firmware
> interface.
> > +  Upon receiving an SMC using one of the described SMC function
> > + identifiers,  the firmware is expected to trigger some mailbox connec=
ted
> functionality.
> > +  The communication follows the ARM SMC calling convention.
> > +  Firmware expects an SMC function identifier in r0 or w0. The
> > + supported  identifiers are passed from consumers, or listed in the
> > + the arm,func-ids  properties as described below. The firmware can
> > + return one value in  the first SMC result register, it is expected
> > + to be an error value,  which shall be propagated to the mailbox clien=
t.
> > +
> > +  Any core which supports the SMC or HVC instruction can be used, as
> > + long as  a firmware component running in EL3 or EL2 is handling these
> calls.
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
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  method:
> > +    items:
> > +      - enum:
> > +          - smc
> > +          - hvc
> > +
> > +  transports:
> > +    items:
> > +      - enum:
> > +          - mem
> > +          - reg
> > +
> > +  arm,func-ids:
> > +    description: |
> > +      An array of 32-bit values specifying the function IDs used by ea=
ch
> > +      mailbox channel. Those function IDs follow the ARM SMC calling
> > +      convention standard [1].
> > +
> > +      There is one identifier per channel and the number of supported
> > +      channels is determined by the length of this array.
> > +    minItems: 0
> > +    maxItems: 4096   # Should be enough?
>=20
> I am new to yaml, is there a way to say the number of entries here must
> match arm,num-chans ? And not sure if min/maxItems matter then ?

I am also new to yaml, Rob might have ideas.

>=20
> > +
> > +required:
> > +  - compatible
> > +  - "#mbox-cells"
> > +  - arm,num-chans
> > +  - transports
> > +  - method
> > +
>=20
> Why is arm,func-ids optional ? Is there any standard arm,func-ids we can
> resort to. Sorry I know you expect ARM Ltd to answer that, but I just wan=
t to
> raise the point that we don't have one today and hence it can't be option=
al. Or
> I am missing something ?

In the v3 patchset, Jassi expected the id be passed from client firmware dr=
iver,
but you said scmi is expected a only message protocol. So here I still keep=
 this
as optional, if specified in dts, the mailbox driver will use it. If not sp=
ecificed
in dts, the mailbox driver expect the client firmware driver pass the func =
id to
mailbox driver.

Thanks,
Peng.

>=20
> --
> Regards,
> Sudeep
