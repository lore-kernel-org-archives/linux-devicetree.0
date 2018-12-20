From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: drm/msm/a6xx: Document interconnect
 properties for GPU
Date: Thu, 20 Dec 2018 11:30:25 -0800
Message-ID: <CAD=FV=X4ZxZJt1+RbP1v_XXcVx3xNux1+K7MUWWwtc_TwuX0RQ@mail.gmail.com>
References: <20181220173026.3857-1-jcrouse@codeaurora.org> <20181220173026.3857-3-jcrouse@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181220173026.3857-3-jcrouse@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jordan Crouse <jcrouse@codeaurora.org>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Clark <robdclark@gmail.com>
Cc: freedreno <freedreno@lists.freedesktop.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Dec 20, 2018 at 9:30 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Add documentation for the interconnect and interconnect-names bindings
> for the GPU node as detailed by bindings/interconnect/interconnect.txt.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  Documentation/devicetree/bindings/display/msm/gpu.txt | 4 ++++
>  1 file changed, 4 insertions(+)

I would have been fine if you had kept my tag (even though 50% of the
patch changed!).  ...but here it is again:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I assume this will be going through Georgi's tree w/ the previous patch.

-Doug
