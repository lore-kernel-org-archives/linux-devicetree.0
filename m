From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/9] drm/msm: fix OF child-node lookup
Date: Wed, 22 Aug 2018 09:41:04 -0500
Message-ID: <CAL_Jsq+6rftT-FfXGs_WSFDMLqNWbgBqHwtEXmxkgCjf9yf07g@mail.gmail.com>
References: <20180822105547.9634-1-johan@kernel.org> <20180822105547.9634-4-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180822105547.9634-4-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, Jordan Crouse <jcrouse@codeaurora.org>, Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 22, 2018 at 5:57 AM Johan Hovold <johan@kernel.org> wrote:
>
> Use the new of_get_compatible_child() helper to lookup the legacy
> pwrlevels child node instead of using of_find_compatible_node(), which
> searches the entire tree and thus can return an unrelated (i.e.
> non-child) node.
>
> This also addresses a potential use-after-free (e.g. after probe
> deferral) as the tree-wide helper drops a reference to its first
> argument (i.e. the probed device's node).
>
> While at it, also fix the related child-node reference leak.
>
> Fixes: e2af8b6b0ca1 ("drm/msm: gpu: Use OPP tables if we can")
> Cc: stable <stable@vger.kernel.org>     # 4.12
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: David Airlie <airlied@linux.ie>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index da1363a0c54d..93d70f4a2154 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -633,8 +633,7 @@ static int adreno_get_legacy_pwrlevels(struct device *dev)
>         struct device_node *child, *node;
>         int ret;
>
> -       node = of_find_compatible_node(dev->of_node, NULL,
> -               "qcom,gpu-pwrlevels");
> +       node = of_get_compatible_child(dev->of_node, "qcom,gpu-pwrlevels");

Not really your problem, but this is undocumented and a downstream
binding. There's been OPP support in addition for more than a year
now, we should just remove this code IMO. For some reason though, no
one updated the 8064 dts though.

Rob
