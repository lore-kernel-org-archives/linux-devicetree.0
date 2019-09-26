From: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/6] iommu/qcom: Use the asid read from device-tree if
	specified
Date: Thu, 26 Sep 2019 13:06:03 -0700
Message-ID: <CAF6AEGs-+SGEJYA4FgGcMXVghLoXmDWbBMjS_BHm=7+9FfYv5g@mail.gmail.com>
References: <20190926120516.4981-1-kholk11@gmail.com>
	<20190926120516.4981-2-kholk11@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20190926120516.4981-2-kholk11-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: AngeloGioacchino Del Regno <kholk11-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, marijns95-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>,
	Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, " <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 26, 2019 at 5:05 AM <kholk11-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> As specified in this driver, the context banks are 0x1000 apart.
> Problem is that sometimes the context number (our asid) does not
> match this logic and we end up using the wrong one: this starts
> being a problem in the case that we need to send TZ commands
> to do anything on a specific context.
>
> For this reason, read the ASID from the DT if the property
> "qcom,ctx-num" is present on the IOMMU context node.
>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/iommu/qcom,iommu.txt    |  1 +
>  drivers/iommu/qcom_iommu.c                      | 17 ++++++++++++++---
>  2 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
> index 059139abce35..98102b323196 100644
> --- a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
> +++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
> @@ -38,6 +38,7 @@ to non-secure vs secure interrupt line.
>          - "qcom,msm-iommu-v1-sec" : secure context bank
>    - reg            : Base address and size of context bank within the iommu
>    - interrupts     : The context fault irq.
> +  - qcom,ctx-num   : The number associated to the context bank


I guess this should be more like:

+  and the following optional properties:
+  - qcom,ctx-num   : The number associated to the context bank

(since this is an optional property)

BR,
-R

>
>  ** Optional properties:
>
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index dadc707573a2..5837556af147 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -557,7 +557,8 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
>          * index into qcom_iommu->ctxs:
>          */
>         if (WARN_ON(asid < 1) ||
> -           WARN_ON(asid > qcom_iommu->num_ctxs))
> +           WARN_ON(asid > qcom_iommu->num_ctxs) ||
> +           WARN_ON(qcom_iommu->ctxs[asid - 1] == NULL))
>                 return -EINVAL;
>
>         if (!fwspec->iommu_priv) {
> @@ -665,7 +666,8 @@ static int qcom_iommu_sec_ptbl_init(struct device *dev)
>
>  static int get_asid(const struct device_node *np)
>  {
> -       u32 reg;
> +       u32 reg, val;
> +       int asid;
>
>         /* read the "reg" property directly to get the relative address
>          * of the context bank, and calculate the asid from that:
> @@ -673,7 +675,16 @@ static int get_asid(const struct device_node *np)
>         if (of_property_read_u32_index(np, "reg", 0, &reg))
>                 return -ENODEV;
>
> -       return reg / 0x1000;      /* context banks are 0x1000 apart */
> +       /* Context banks are 0x1000 apart but, in some cases, the ASID
> +        * number doesn't match to this logic and needs to be passed
> +        * from the DT configuration explicitly.
> +        */
> +       if (of_property_read_u32(np, "qcom,ctx-num", &val))
> +               asid = reg / 0x1000;
> +       else
> +               asid = val;
> +
> +       return asid;
>  }
>
>  static int qcom_iommu_ctx_probe(struct platform_device *pdev)
> --
> 2.21.0
>
