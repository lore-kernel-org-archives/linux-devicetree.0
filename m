From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: imx: Add Y Soft IOTA Draco, Hydra and Ursa boards
Date: Tue, 8 Jan 2019 12:11:50 -0600
Message-ID: <CAL_JsqLRX2g1t-8YCqpZ5fd=-MyLPkgy88Gb=6ohEZbxWfS+LA@mail.gmail.com>
References: <1545144107-88378-1-git-send-email-michal.vokac@ysoft.com>
 <20181228232556.GA14277@bogus> <49371bd4-6ab9-31c3-dd48-800becac17e3@ysoft.com>
 <CAL_JsqJyZt=VCv2bX1YYFQt91BcFqDWfeAqkJVcF7eFD0_JM1g@mail.gmail.com>
 <6fd5ac6a-edb5-a600-3c10-b46a1c1d9906@ysoft.com> <f96952b2-7b19-5397-00a1-0fe9b5800dab@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f96952b2-7b19-5397-00a1-0fe9b5800dab@ysoft.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?Vm9rw6HEjSBNaWNoYWw=?= <Michal.Vokac@ysoft.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 8, 2019 at 10:09 AM Vok=C3=A1=C4=8D Michal <Michal.Vokac@ysoft.=
com> wrote:
>
> On 8.1.2019 16:00, Vok=C3=A1=C4=8D Michal wrote:
> > On 8.1.2019 15:56, Rob Herring wrote:
> >> On Tue, Jan 8, 2019 at 5:43 AM Vok=C3=A1=C4=8D Michal <Michal.Vokac@ys=
oft.com> wrote:
> >>>
> >>> On 29.12.2018 00:25, Rob Herring wrote:
> >>>> On Tue, Dec 18, 2018 at 02:42:11PM +0000, Vok=C3=A1=C4=8D Michal wro=
te:
> >>>>> These are i.MX6S/DL based SBCs embedded in various Y Soft products.
> >>>>> All share the same board design but have slightly different HW
> >>>>> configuration.
> >>
> >> [...]
> >>
> >>>>> +/ {
> >>>>> +    model =3D "Y Soft IOTA Draco i.MX6Solo board";
> >>>>> +    compatible =3D "ysoft,imx6dl-yapp4-draco", "fsl,imx6dl";
> >>>>
> >>>> All compatible strings should be documented, not just SoC vendor boa=
rds.
> >>>
> >>> OK, I will add a Documentation/devicetree/bindings/arm/ysoft.yaml fil=
e for that.
> >>
> >> Actually, it should go in fsl.yaml. The file for every board vendor is
> >> gone. i.MX was pretty much the only platform doing that.
> >
> > OK, I will do so. Thank you.
>
> I am sorry for the noise Rob, but your "dt-bindings: arm: Convert FSL
> board/soc bindings to json-schema" patch is not in mainline yet. So
> there is no arm/fsl.yaml file to add my compatible strings into.
>
> Now I do not know how to respin. Should I send this updated dts/dtsi
> patch as usual and create another patch with the ysoft compatible
> strings against your yaml-bindings-v2 branch, where the fsl.yaml file
> exist? Or something else?

Humm, I thought Shawn had applied to his tree as there were some conflicts.

Shawn, do you need me to resend?

Rob
