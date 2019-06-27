From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: arm: fsl: Add DSP IPC binding support
Date: Thu, 27 Jun 2019 09:59:21 -0600
Message-ID: <CAL_Jsq+rWn+vVfBGdAB23Xu0RaFV1HwSdBbfj9F4M3W1EUo9_A@mail.gmail.com>
References: <20190614081650.11880-1-daniel.baluta@nxp.com> <20190614081650.11880-3-daniel.baluta@nxp.com>
 <CAL_JsqJKgMB1PNA33gmFju4AQTc2WaSBoOGQExVaGd9LZRmk_g@mail.gmail.com>
 <CAEnQRZBNA4ndSL1vMStHemYkzt9TxqjgdWWjqFwnBFQ+ha+egA@mail.gmail.com>
 <CAL_JsqJQRbuWKgON+ukZ3GRwyq8SvTZ=PRGwMhQjAxKPSP-Fkw@mail.gmail.com> <CAEnQRZCjp9dUt0JTjhN0CnV0+Xzc+q1EHCnJn_TNOQoUWZBTsg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAEnQRZCjp9dUt0JTjhN0CnV0+Xzc+q1EHCnJn_TNOQoUWZBTsg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "S.j. Wang" <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 27, 2019 at 1:40 AM Daniel Baluta <daniel.baluta@gmail.com> wro=
te:
>
> <snip>
>
> > > > > +  mboxes:
> > > > > +    description:
> > > > > +      List of phandle of 2 MU channels for TXDB, 2 MU channels f=
or RXDB
> > > > > +      (see mailbox/fsl,mu.txt)
> > > > > +    maxItems: 1
> > > >
> > > > Should be 4?
> > >
> > > Actually is just a list with 1 item. I think is the terminology:
> > >
> > > You can have an example here of the mboxes defined for SCU.
> > > https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/fre=
escale/imx8qxp.dtsi#L123
> >
> > mboxes =3D <&lsio_mu1 0 0
> > &lsio_mu1 0 1
> > &lsio_mu1 0 2
> > &lsio_mu1 0 3
> > &lsio_mu1 1 0
> > &lsio_mu1 1 1
> > &lsio_mu1 1 2
> > &lsio_mu1 1 3
> > &lsio_mu1 3 3>;
> >
> > Logically, this is 9 entries and each entry is 3 cells ( or phandle
> > plus 2 cells). More below...
>
> Ok..
>
> >
> > > > > +
> > > > > +  mbox-names
> >
> > Also, missing a ':' here. This won't build. Make sure you build this
> > (make dt_binding_check). See
> > Documentation/devicetree/writing-schemas.md.
> >
> Fixed in v2. Awesome!
>
> I thought that Documentation/devicetree/bindings/dsp/fsl,dsp_ipc.yaml
> is purely decorative and used as an example. But it's actually the schema=
 for
> the newly yaml dts, right?

Yes, that's the point. Enforcing that dts files contain what the
binding docs say.

>
> Used make dt_binding_check everything looks OK now.
>
> > > > > +    description:
> > > > > +      Mailboxes names
> > > > > +    allOf:
> > > > > +      - $ref: "/schemas/types.yaml#/definitions/string"
> > > >
> > > > No need for this, '*-names' already has a defined type.
> > > So, should I remove the above two lines ?
> >
> > Actually, all 4. There's no need to describe what 'mbox-names' is.
> >
> > > > > +      - enum: [ "txdb0", "txdb1", "rxdb0", "rxdb1" ]
> > > >
> > > > Should be an 'items' list with 4 entries?
> > >
> > > Let me better read the yaml spec. But "items" list indeed sounds bett=
er.
> >
> > What you should end up with is:
> >
> > items:
> >   - const: txdb0
> >   - const: txdb1
> >   - const: rxdb0
> >   - const: rxdb1
> >
> > This is saying you have 4 strings in the listed order. The enum you
> > had would be a single string of one of the 4 values.
> >
> I see! Thanks.
>
> > > > > +required:
> > > > > +  - compatible
> > > > > +  - mboxes
> > > > > +  - mbox-names
> > > >
> > > > This seems incomplete. How does one boot the DSP? Load firmware? No
> > > > resources that Linux has to manage. Shared memory?
> > >
> > > This is only the IPC mailboxes used by DSP to communicate with Linux.=
 The
> > > loading of the firmware, the resources needed to be managed by Linux,=
 etc
> > > are part of the DSP node.
> >
> > You should just add the mailboxes to the DSP node then. I suppose you
> > didn't because you want 2 drivers? If so, that's the OS's problem and
> > not part of DT. A Linux driver can instantiate devices for other
> > drivers.
>
> Yes, I want the DSP IPC driver to be separated. And then the SOF Linux
> driver that needs
> to communicate with DSP just gets a handle to DSP IPC driver and does
> the communication.
>
> dts relevant nodes look like this now:
>
> =C2=BB       dsp_ipc: dsp_ipc {
> =C2=BB       =C2=BB       compatible =3D "fsl,imx8qxp-dsp";
> =C2=BB       =C2=BB       mbox-names =3D "txdb0", "txdb1",
> =C2=BB       =C2=BB       =C2=BB            "rxdb0", "rxdb1";
> =C2=BB       =C2=BB       mboxes =3D <&lsio_mu13 2 0>,
> =C2=BB       =C2=BB       =C2=BB        <&lsio_mu13 2 1>,
> =C2=BB       =C2=BB       =C2=BB        <&lsio_mu13 3 0>,
> =C2=BB       =C2=BB       =C2=BB        <&lsio_mu13 3 1>;
> =C2=BB       };
>
> =C2=BB       adma_dsp: dsp@596e8000 {
> =C2=BB       =C2=BB       compatible =3D "fsl,imx8qxp-sof-dsp";
> =C2=BB       =C2=BB       reg =3D <0x596e8000 0x88000>;
> =C2=BB       =C2=BB       reserved-region =3D <&dsp_reserved>;
> =C2=BB       =C2=BB       ipc =3D <&dsp_ipc>;
> =C2=BB       };
>
> Your suggeston would be to have something like this:
>
> =C2=BB       adma_dsp: dsp@596e8000 {
> =C2=BB       =C2=BB       compatible =3D "fsl,imx8qxp-sof-dsp";
> =C2=BB       =C2=BB       reg =3D <0x596e8000 0x88000>;
> =C2=BB       =C2=BB       reserved-region =3D <&dsp_reserved>;
> =C2=BB                mbox-names =3D "txdb0", "txdb1",
> =C2=BB       =C2=BB       =C2=BB            "rxdb0", "rxdb1";
> =C2=BB       =C2=BB       mboxes =3D <&lsio_mu13 2 0>,
> =C2=BB       =C2=BB       =C2=BB        <&lsio_mu13 2 1>,
> =C2=BB       =C2=BB       =C2=BB        <&lsio_mu13 3 0>,
> =C2=BB       =C2=BB       =C2=BB        <&lsio_mu13 3 1>;
> =C2=BB       };
>
> Not sure exactly how to instantiate IPC DSP driver then.

DT is not the only way to instantiate drivers. A driver can create a
platform device itself which will then instantiate a 2nd driver.

Presumably the DSP needs to be booted, resources enabled, and firmware
loaded before IPC will work. The DSP driver controlling the lifetime
of the IPC driver is the right way to manage the dependencies.

>
> I already have prepared v2 with most of your feedback incorporated,
> but not this latest
> change with moving mboxes inside dsp driver.
>
> More than that I have followed the model of SCFW IPC and having to
> different approach
> for similar IPC mechanism is a little bit confusing.

SC is system controller? Maybe I missed it, but I don't think system
controllers usually have 2 nodes. You only have the communications
interface exposed as the SC provides services to Linux and Linux
doesn't manage the SC resources.

Rob
