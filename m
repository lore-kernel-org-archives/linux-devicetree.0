From: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: display: msm: gmu: add optional ocmem property
Date: Wed, 19 Jun 2019 13:21:20 -0700
Message-ID: <CAF6AEGs6By9-LGRBAPw2OwR9tRKJtEiZVgS2WVWRXmOK1VxNLA@mail.gmail.com>
References: <20190616132930.6942-1-masneyb@onstation.org> <20190616132930.6942-3-masneyb@onstation.org>
 <CAL_Jsq+Ne=NEcLbO6C19iOny4bwm_m5QEtcsM78ZDeBmDUVO_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+Ne=NEcLbO6C19iOny4bwm_m5QEtcsM78ZDeBmDUVO_Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Brian Masney <masneyb@onstation.org>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Sean Paul <sean@poorly.run>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Jonathan Marek <jonathan@marek.ca>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, freedreno <freedreno@lists.freedesktop.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 19, 2019 at 1:17 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Sun, Jun 16, 2019 at 7:29 AM Brian Masney <masneyb@onstation.org> wrote:
> >
> > Some A3xx and A4xx Adreno GPUs do not have GMEM inside the GPU core and
> > must use the On Chip MEMory (OCMEM) in order to be functional. Add the
> > optional ocmem property to the Adreno Graphics Management Unit bindings.
> >
> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > ---
> >  Documentation/devicetree/bindings/display/msm/gmu.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
> > index 90af5b0a56a9..c746b95e95d4 100644
> > --- a/Documentation/devicetree/bindings/display/msm/gmu.txt
> > +++ b/Documentation/devicetree/bindings/display/msm/gmu.txt
> > @@ -31,6 +31,10 @@ Required properties:
> >  - iommus: phandle to the adreno iommu
> >  - operating-points-v2: phandle to the OPP operating points
> >
> > +Optional properties:
> > +- ocmem: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
> > +         SoCs. See Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml.
>
> We already have a couple of similar properties. Lets standardize on
> 'sram' as that is what TI already uses.
>
> Also, is the whole OCMEM allocated to the GMU? If not you should have
> child nodes to subdivide the memory.
>

iirc, downstream a large chunk of OCMEM is statically allocated for
GPU.. the remainder is dynamically allocated for different use-cases.
The upstream driver Brian is proposing only handles the static
allocation case (and I don't think we have upstream support for the
various audio and video use-cases that used dynamic OCMEM allocation
downstream)

Although maybe we should still have a child node to separate the
statically and dynamically allocated parts?  I'm not sure what would
make the most sense..

BR,
-R
