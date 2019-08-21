From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH v5 2/7] dt-bindings: display: msm: gmu: add optional
 ocmem property
Date: Wed, 21 Aug 2019 15:38:06 -0400
Message-ID: <20190821193806.GA17476@onstation.org>
References: <20190806002229.8304-1-masneyb@onstation.org>
 <20190806002229.8304-3-masneyb@onstation.org>
 <20190821192602.GA16243@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190821192602.GA16243@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: agross@kernel.org, robdclark@gmail.com, sean@poorly.run, bjorn.andersson@linaro.org, airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com, jonathan@marek.ca, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, jcrouse@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 21, 2019 at 02:26:02PM -0500, Rob Herring wrote:
> On Mon, Aug 05, 2019 at 08:22:24PM -0400, Brian Masney wrote:
> > Some A3xx and A4xx Adreno GPUs do not have GMEM inside the GPU core and
> > must use the On Chip MEMory (OCMEM) in order to be functional. Add the
> > optional ocmem property to the Adreno Graphics Management Unit bindings.
> > 
> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > ---
> > Changes since v4:
> > - None
> > 
> > Changes since v3:
> > - correct link to qcom,ocmem.yaml
> > 
> > Changes since v2:
> > - Add a3xx example with OCMEM
> > 
> > Changes since v1:
> > - None
> > 
> >  .../devicetree/bindings/display/msm/gmu.txt   | 50 +++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
> > index 90af5b0a56a9..672d557caba4 100644
> > --- a/Documentation/devicetree/bindings/display/msm/gmu.txt
> > +++ b/Documentation/devicetree/bindings/display/msm/gmu.txt
> > @@ -31,6 +31,10 @@ Required properties:
> >  - iommus: phandle to the adreno iommu
> >  - operating-points-v2: phandle to the OPP operating points
> >  
> > +Optional properties:
> > +- ocmem: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
> > +         SoCs. See Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
> 
> Sigh, to repeat my comment on v1 and v3:
> 
> We already have a couple of similar properties. Lets standardize on
> 'sram' as that is what TI already uses.

I also had the path wrong then in those older versions. It was
previously in the soc namespace instead of the sram namespace. I didn't
realize that you also wanted to change the name of the property as well.
Sorry about the confusion on my part.

Brian
