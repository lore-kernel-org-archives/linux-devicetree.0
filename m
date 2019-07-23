MIME-Version: 1.0
Date: Tue, 23 Jul 2019 08:29:55 -0600
References: <20190628042745.28455-1-j-keerthy@ti.com>
	<20190628042745.28455-2-j-keerthy@ti.com>
	<20190722182945.GA24685@bogus>
	<b8712fe4-4590-fdda-8a24-bf0f135ad567@ti.com>
In-Reply-To: <b8712fe4-4590-fdda-8a24-bf0f135ad567@ti.com>
Message-ID: <CAL_JsqKXcRFrOf6qdhu74xeRq4PZLJmTgFbbV0PRre8E8uM0BA@mail.gmail.com>
Subject: Re: [RESEND PATCH 01/10] dt-bindings: crypto: k3: Add sa2ul bindings documentation
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Keerthy <j-keerthy@ti.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, Herbert Xu <herbert@gondor.apana.org.au>, David Miller <davem@davemloft.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, Nishanth Menon <nm@ti.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jul 22, 2019 at 10:10 PM Keerthy <j-keerthy@ti.com> wrote:
>
>
>
> On 22/07/19 11:59 PM, Rob Herring wrote:
> > On Fri, Jun 28, 2019 at 09:57:36AM +0530, Keerthy wrote:
> >> The series adds Crypto hardware accelerator support for SA2UL.
> >> SA2UL stands for security accelerator ultra lite.
> >>
> >> The Security Accelerator (SA2_UL) subsystem provides hardware
> >> cryptographic acceleration for the following use cases:
> >> =E2=80=A2 Encryption and authentication for secure boot
> >> =E2=80=A2 Encryption and authentication of content in applications
> >>    requiring DRM (digital rights management) and
> >>    content/asset protection
> >> The device includes one instantiation of SA2_UL named SA2_UL0
> >>
> >> SA2UL needs on tx channel and a pair of rx dma channels.
> >>
> >> Signed-off-by: Keerthy <j-keerthy@ti.com>
> >> ---
> >>   .../devicetree/bindings/crypto/sa2ul.txt      | 47 +++++++++++++++++=
++
> >>   1 file changed, 47 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/crypto/sa2ul.tx=
t
> >>
> >> diff --git a/Documentation/devicetree/bindings/crypto/sa2ul.txt b/Docu=
mentation/devicetree/bindings/crypto/sa2ul.txt
> >> new file mode 100644
> >> index 000000000000..81cc039673b4
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/crypto/sa2ul.txt
> >> @@ -0,0 +1,47 @@
> >> +K3 SoC SA2UL crypto module
> >> +
> >> +Required properties:
> >> +
> >> +- compatible : Should be:
> >> +  - "ti,sa2ul-crypto"
> >
> > Needs to be SoC specific.
>
> okay
>
> >
> >> +- reg : Offset and length of the register set for the module
> >> +
> >> +- dmas: DMA specifiers for tx and rx dma. sa2ul needs one tx channel
> >> +    and 2 rx channels. First rx channel for < 256 bytes and
> >> +    the other one for >=3D256 bytes. See the DMA client binding,
> >> +        Documentation/devicetree/bindings/dma/dma.txt
> >> +- dma-names: DMA request names has to have one tx and 2 rx names
> >> +    corresponding to dmas abive.
> >> +- ti,psil-config* - UDMA PSIL native Peripheral using packet mode.
> >> +    SA2UL must have EPIB(Extended protocal information block)
> >> +    and PSDATA(protocol specific data) properties.
> >
> > If ti,needs-epib is required, then why do you need to specify it in DT?
> > In any case, this all seems like channel config info that should be par=
t
> > of the #dma-cells.
>
> ti,needs-epib is the udma client(Here sa2ul) conveying the udma layer.
> Not every udma client needs epib.

Right, but if sa2ul always needs it, then it can be implied and set by the =
driver.
