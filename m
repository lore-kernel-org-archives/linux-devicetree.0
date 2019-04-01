From: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [PATCH v1 3/4] dt-bindings: drm/msm/gpu: Document a5xx / a6xx
 zap shader region
Date: Mon, 1 Apr 2019 10:13:24 -0600
Message-ID: <20190401161324.GC10168@jcrouse1-lnx.qualcomm.com>
References: <1552414422-9568-1-git-send-email-jcrouse@codeaurora.org>
 <1552414422-9568-4-git-send-email-jcrouse@codeaurora.org>
 <20190328133215.GA14020@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190328133215.GA14020@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Daniel Vetter <daniel@ffwll.ch>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 28, 2019 at 08:32:15AM -0500, Rob Herring wrote:
> On Tue, Mar 12, 2019 at 12:13:41PM -0600, Jordan Crouse wrote:
> > Describe the zap-shader node that defines a reserved memory region
> > to store the zap shader.
> > 
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> > 
> >  Documentation/devicetree/bindings/display/msm/gpu.txt | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
> > index aad1aef..1e6d870 100644
> > --- a/Documentation/devicetree/bindings/display/msm/gpu.txt
> > +++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
> > @@ -25,6 +25,9 @@ Required properties:
> >  - qcom,gmu: For GMU attached devices a phandle to the GMU device that will
> >    control the power for the GPU. Applicable targets:
> >      - qcom,adreno-630.2
> > +- zap-shader: For a5xx and a6xx devices this node contains a memory-region that
> > +  points to reserved memory to store the zap shader that can be used to help
> > +  bring the GPU out of secure mode.
> 
> This is the properties section and zap-shader is not a property.

Thanks, I can fix that.

> But why do you need a child node in the first place? Just add 
> 'memory-region' to the parent.

Two reasons.  First, this memory is locked in the secure world once the MDT
loader is run and it isn't really intended for CPU access. If the parent device
tries to set up DMA operations thinking it has access to the memory it might not
work out very well.  Putting it in a child makes it clear that this is a special
chunk of memory for a special case.

The second reason is that not all target platforms require the zap shader, so it
would be nice to have it as a child node so that it could be removed on target
platforms that don't need it.

Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
