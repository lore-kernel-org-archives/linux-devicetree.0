From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH V6 1/2] dt-bindings: mailbox: add binding doc for the ARM
 SMC/HVC mailbox
Date: Wed, 18 Sep 2019 09:02:15 +0000
Message-ID: <AM0PR04MB4481E07A2DD996703EE9FADD888E0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1568626884-5189-1-git-send-email-peng.fan@nxp.com>
        <1568626884-5189-2-git-send-email-peng.fan@nxp.com>
 <20190917183115.3e40180f@donnerap.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917183115.3e40180f@donnerap.cambridge.arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Andre,

> Subject: Re: [PATCH V6 1/2] dt-bindings: mailbox: add binding doc for the
> ARM SMC/HVC mailbox
>=20
> On Mon, 16 Sep 2019 09:44:37 +0000
> Peng Fan <peng.fan@nxp.com> wrote:
>=20
> Hi,
>=20
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
> >  .../devicetree/bindings/mailbox/arm-smc.yaml       | 96
> ++++++++++++++++++++++
> >  1 file changed, 96 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/mailbox/arm-smc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mailbox/arm-smc.yaml
> > b/Documentation/devicetree/bindings/mailbox/arm-smc.yaml
> > new file mode 100644
> > index 000000000000..bf01bec035fc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mailbox/arm-smc.yaml
> > @@ -0,0 +1,96 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> >
> +cetree.org%2Fschemas%2Fmailbox%2Farm-smc.yaml%23&amp;data=3D02%7
> C01%7Cp
> >
> +eng.fan%40nxp.com%7Cff378bc3d622436c39ba08d73b94dfcc%7C686ea1d
> 3bc2b4c
> >
> +6fa92cd99c5c301635%7C0%7C1%7C637043382928045369&amp;sdata=3Drnx
> KdDGjPPd
> > +8VBI5WmgnZ3jxIjL2hcRYzbljfFxDkA0%3D&amp;reserved=3D0
> > +$schema:
> > +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> >
> +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=3D02%7C01%7Cpe
> ng.fan%
> >
> +40nxp.com%7Cff378bc3d622436c39ba08d73b94dfcc%7C686ea1d3bc2b4c6
> fa92cd9
> >
> +9c5c301635%7C0%7C1%7C637043382928045369&amp;sdata=3DR02nWzpp9
> %2BrDYG9tA
> > +ot4pdWb8tGGHet1MOjrD0dEjwA%3D&amp;reserved=3D0
> > +
> > +title: ARM SMC Mailbox Interface
> > +
> > +maintainers:
> > +  - Peng Fan <peng.fan@nxp.com>
> > +
> > +description: |
> > +  This mailbox uses the ARM smc (secure monitor call) and hvc
> > +(hypervisor
>=20
> I think "or" instead of "and" is less confusing.

ok

>=20
> > +  call) instruction to trigger a mailbox-connected activity in
> > + firmware,  executing on the very same core as the caller. The value
> > + of r0/w0/x0  the firmware returns after the smc call is delivered as
> > + a received  message to the mailbox framework, so synchronous
> > + communication can be  established. The exact meaning of the action
> > + the mailbox triggers as  well as the return value is defined by
> > + their users and is not subject  to this binding.
> > +
> > +  One use case of this mailbox is the SCMI interface, which uses
> > + shared
>=20
>      One example use case of this mailbox ...
> (to make it more obvious that it's not restricted to this)

ok

>=20
> > +  memory to transfer commands and parameters, and a mailbox to
> > + trigger a  function call. This allows SoCs without a separate
> > + management processor  (or when such a processor is not available or
> > + used) to use this  standardized interface anyway.
> > +
> > +  This binding describes no hardware, but establishes a firmware
> interface.
> > +  Upon receiving an SMC using one of the described SMC function
> > + identifiers,
>=20
>                              ... the described SMC function identifier,

ok

>=20
> > +  the firmware is expected to trigger some mailbox connected
> functionality.
> > +  The communication follows the ARM SMC calling convention.
> > +  Firmware expects an SMC function identifier in r0 or w0. The
> > + supported  identifiers are passed from consumers,
>=20
>      identifier

ok

>=20
> "passed from consumers": How? Where?
> But I want to repeat: We should not allow this. This is a binding for a m=
ailbox
> controller driver, not a generic firmware backdoor.

As Jassi suggested the function identifier as an optional for mailbox drive=
r.
The driver should support function id passed from consumers.
Currently there is no users for such case that passed from consumers,
so I have no idea how.

> We should be as strict as possible to avoid any security issues.
> The firmware certainly knows the function ID it implements. The firmware
> controls the DT. So it is straight-forward to put the ID into the DT. The
> firmware could even do this at boot time, dynamically, before passing on =
the
> DT to the non-secure world (bootloader or kernel).
>=20
> What would be the use case of this functionality?
>=20
> > or listed in the the arm,func-ids
>=20
>                        arm,func-id

ok
>=20
> > +  properties as described below. The firmware can return one value in
>=20
>      property
ok
>=20
> > +  the first SMC result register, it is expected to be an error value,
> > + which shall be propagated to the mailbox client.
> > +
> > +  Any core which supports the SMC or HVC instruction can be used, as
> > + long  as a firmware component running in EL3 or EL2 is handling these
> calls.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - description:
> > +          For implementations using ARM SMC instruction.
> > +        const: arm,smc-mbox
> > +
> > +      - description:
> > +          For implementations using ARM HVC instruction.
> > +        const: arm,hvc-mbox
>=20
> I am not particularly happy with this, but well ...
>=20
> > +
> > +  "#mbox-cells":
> > +    const: 1
>=20
> Why is this "1"? What is this number used for? It used to be the channel =
ID,
> but since you are describing a single channel controller only, this shoul=
d be 0
> now.

Mailbox bindings requires it at least 1, as replied to Jassi in the other m=
ail.

>=20
> > +
> > +  arm,func-id:
> > +    description: |
> > +      An 32-bit value specifying the function ID used by the mailbox.
>=20
>          A single 32-bit value ...
>=20
> > +      The function ID follow the ARM SMC calling convention standard
> [1].
>=20
>                          follows
>=20
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +required:
> > +  - compatible
> > +  - "#mbox-cells"
> > +
> > +examples:
> > +  - |
> > +    sram@93f000 {
> > +      compatible =3D "mmio-sram";
> > +      reg =3D <0x0 0x93f000 0x0 0x1000>;
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <1>;
> > +      ranges =3D <0x0 0x93f000 0x1000>;
> > +
> > +      cpu_scp_lpri: scp-shmem@0 {
> > +        compatible =3D "arm,scmi-shmem";
> > +        reg =3D <0x0 0x200>;
> > +      };
> > +    };
> > +
> > +    smc_tx_mbox: tx_mbox {
> > +      #mbox-cells =3D <1>;
>=20
> As mentioned above, should be 0.
>=20
> > +      compatible =3D "arm,smc-mbox";
> > +      /* optional */
>=20
> First: having "optional" in a specific example is not helpful, just confu=
sing.
> Second: It is actually *not* optional in this case, as there is no other =
way of
> propagating the function ID. The SCMI driver as the mailbox client has
> certainly no clue about this.

I'll drop "/*optinal*/" since it is required in the example.

> I think I said this previously: Relying on the mailbox client to pass the=
 function
> ID sounds broken, as this is a property of the mailbox controller driver.=
 The
> mailbox client does not care about this mailbox communication detail, it =
just
> wants to trigger the mailbox.
>=20
> > +      arm,func-id =3D <0xc20000fe>;
> > +    };
> > +
> > +    firmware {
> > +      scmi {
> > +        compatible =3D "arm,scmi";
> > +        mboxes =3D <&smc_tx_mbox 0>;
>=20
> ... and here just <&smc_tx_mbox>; would suffice.

Mailbox requires mbox-cells at least 1, it must have one arg.
Otherwise of_mbox_index_xlate not work.

Thanks,
Peng.

>=20
> > +        mbox-names =3D "tx";
> > +        shmem =3D <&cpu_scp_lpri>;
> > +      };
> > +    };
> > +
> > +...
>=20
> Cheers,
> Andre.
