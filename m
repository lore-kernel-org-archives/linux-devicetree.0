From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v7 2/7] dt-bindings: display: msm: gmu: add optional ocmem property
Date: Tue, 27 Aug 2019 07:21:41 -0500
Message-ID: <CAL_JsqLmaE+6Lj6KDgscK3OO=fsCGM=90eRCYK_gBA7bdkEbEg@mail.gmail.com>
References: <20190823121637.5861-1-masneyb@onstation.org> <20190823121637.5861-3-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190823121637.5861-3-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Andy Gross <agross@kernel.org>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Jonathan Marek <jonathan@marek.ca>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, freedreno <freedreno@lists.freedesktop.org>, devicetree@vger.kernel.org, Jordan Crouse <jcrouse@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 23, 2019 at 7:16 AM Brian Masney <masneyb@onstation.org> wrote:
>
> Some A3xx and A4xx Adreno GPUs do not have GMEM inside the GPU core and
> must use the On Chip MEMory (OCMEM) in order to be functional. Add the
> optional ocmem property to the Adreno Graphics Management Unit bindings.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Changes since v6:
> - link to gmu-sram in example
> - add ranges property to ocmem example to match bindings
>
> Changes since v5:
> - rename ocmem property to sram to match what TI currently has.
>
> Changes since v4:
> - None
>
> Changes since v3:
> - correct link to qcom,ocmem.yaml
>
> Changes since v2:
> - Add a3xx example with OCMEM
>
> Changes since v1:
> - None
>
>  .../devicetree/bindings/display/msm/gmu.txt   | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
