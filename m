From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH V9 1/2] dt-bindings: mailbox: add binding doc for the ARM
 SMC/HVC mailbox
Date: Thu, 26 Sep 2019 09:15:48 +0000
Message-ID: <AM0PR04MB4481EA21FAC45DCCF295A71F88860@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1569377224-5755-1-git-send-email-peng.fan@nxp.com>
        <1569377224-5755-2-git-send-email-peng.fan@nxp.com>
 <20190925180901.11fe5165@donnerap.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190925180901.11fe5165@donnerap.cambridge.arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Andre,

> Subject: Re: [PATCH V9 1/2] dt-bindings: mailbox: add binding doc for the
> ARM SMC/HVC mailbox
>=20
[...]
> > + supported  identifier are passed from consumers, or listed in the
> > + the arm,func-id
>=20
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 		This is now obsolete.
>=20
> The rest looks good to me, thanks for the changes!
>=20
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks, I'll wait to see whether Rob and Jassi has some comments or not.

Then post out v10 to address your comments.

Thanks,
Peng.

>=20
> Cheers,
> Andre.
>=20
> > +  property as described below. The firmware can return one value in
> > + the first SMC result register, it is expected to be an error value,
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
> > +
> > +  "#mbox-cells":
> > +    const: 0
> > +
> > +  arm,func-id:
> > +    description: |
> > +      An single 32-bit value specifying the function ID used by the
> mailbox.
> > +      The function ID follows the ARM SMC calling convention standard.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +required:
> > +  - compatible
> > +  - "#mbox-cells"
> > +  - arm,func-id
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
> > +      #mbox-cells =3D <0>;
> > +      compatible =3D "arm,smc-mbox";
> > +      arm,func-id =3D <0xc20000fe>;
> > +    };
> > +
> > +    firmware {
> > +      scmi {
> > +        compatible =3D "arm,scmi";
> > +        mboxes =3D <&smc_tx_mbox>;
> > +        mbox-names =3D "tx";
> > +        shmem =3D <&cpu_scp_lpri>;
> > +      };
> > +    };
> > +
> > +...
