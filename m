From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: dmaengine: dma-common: Change
 dma-channel-mask to uint32-array
Date: Wed, 18 Sep 2019 09:21:26 -0500
Message-ID: <CAL_JsqLJn4dmnjU=7kVgiosAU=o+fSJNH6578D92fGbdOR8Zfw@mail.gmail.com>
References: <20190910114559.22810-1-peter.ujfalusi@ti.com> <20190910114559.22810-2-peter.ujfalusi@ti.com>
 <20190918132835.GA4527@bogus> <d76ffc38-8e68-656a-325b-37de9b01e015@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d76ffc38-8e68-656a-325b-37de9b01e015@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Vinod <vkoul@kernel.org>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 18, 2019 at 9:04 AM Peter Ujfalusi <peter.ujfalusi@ti.com> wrot=
e:
>
>
>
> On 18/09/2019 16.28, Rob Herring wrote:
> > On Tue, Sep 10, 2019 at 02:45:57PM +0300, Peter Ujfalusi wrote:
> >> Make the dma-channel-mask to be usable for controllers with more than =
32
> >> channels.
> >>
> >> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> >> ---
> >>  Documentation/devicetree/bindings/dma/dma-common.yaml | 10 +++++++++-
> >>  1 file changed, 9 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/dma/dma-common.yaml b/D=
ocumentation/devicetree/bindings/dma/dma-common.yaml
> >> index ed0a49a6f020..41460946be64 100644
> >> --- a/Documentation/devicetree/bindings/dma/dma-common.yaml
> >> +++ b/Documentation/devicetree/bindings/dma/dma-common.yaml
> >> @@ -25,11 +25,19 @@ properties:
> >>        Used to provide DMA controller specific information.
> >>
> >>    dma-channel-mask:
> >> -    $ref: /schemas/types.yaml#definitions/uint32
> >>      description:
> >>        Bitmask of available DMA channels in ascending order that are
> >>        not reserved by firmware and are available to the
> >>        kernel. i.e. first channel corresponds to LSB.
> >> +    allOf:
> >> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> >> +        items:
> >> +          minItems =3D 1
> >
> > '=3D'? Just making up the syntax?
>
> Opps, sorry.
>
> >
> >> +          maxItems =3D 255 # Should be enough
> >> +          - description: Mask of channels 0-31
> >> +          - description: Mask of channels 32-63
> >
> > You are mixing a schema and list here...
>
> Should I extend the description with something like this:
> "The first item in the array is for channels 0-31, the second is for
> channels 32-63, etc."
>
> To make sure that it is used in a correct and consistent manner.

Sure.

>
> >> +          ...
> >
> > That's end of doc marker in YAML...
>
> I believe I need some reading to do for YAML..
>
> >
> >> +          - description: Mask of chnanels X-(X+31)
> >
> > Obviously, this was not validated with 'make dt_binding_check'.
> make dt_bindings_check
> make: *** No rule to make target 'dt_bindings_check'.  Stop.

Read Documentation/devicetree/writing-schema.md (or .rst in next).

Either your config doesn't have DTC enabled or you don't have
dt-schema installed.

>
> > What you  want is:
> >
> >     allOf:
> >       - $ref: /schemas/types.yaml#/definitions/uint32-array
> >       - minItems: 1
> >         maxItems: 255 # Should be enough
>
> OK and thanks for the comments.
>
> - P=C3=A9ter
>
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
