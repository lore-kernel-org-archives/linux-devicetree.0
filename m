From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mtd: spear-smi: Update compatible property
Date: Fri, 23 Mar 2012 09:10:25 -0500
Message-ID: <4F6C8451.1020005@gmail.com>
References: <97859bb4d86d008968a784339be8567094c487a1.1332492461.git.viresh.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <97859bb4d86d008968a784339be8567094c487a1.1332492461.git.viresh.kumar-qxv4g6HH51o@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sr-ynQEQJNshbs@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/23/2012 03:48 AM, Viresh Kumar wrote:
> SPEAr SMI controller version is same for all SPEAr machines. Thus we don't need
> per machine compatible property in driver.

Until the next chip...

> Thus this patch updates compatible entry to: "st,spear-smi", so that it
> works for all SPEAr machines.
> 

There is no reason all machines can't use "st,spear600-smi" in their
dts. It doesn't have to be a spear600, just compatible with it. Really
you want the string to be the oldest SOC the block is in and then newer
SOCs can claim compatibility with the old version.

This is also bad that you would break any existing dtb's out there. This
is probably not a concern yet since it's all new and in transition, but
down the road this is something that can't be done.

Rob

> Signed-off-by: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
> ---
>  .../devicetree/bindings/mtd/spear_smi.txt          |    4 ++--
>  drivers/mtd/devices/spear_smi.c                    |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/spear_smi.txt b/Documentation/devicetree/bindings/mtd/spear_smi.txt
> index 7248aad..80dfd96 100644
> --- a/Documentation/devicetree/bindings/mtd/spear_smi.txt
> +++ b/Documentation/devicetree/bindings/mtd/spear_smi.txt
> @@ -1,7 +1,7 @@
>  * SPEAr SMI
>  
>  Required properties:
> -- compatible : "st,spear600-smi"
> +- compatible : "st,spear-smi"
>  - reg : Address range of the mtd chip
>  - #address-cells, #size-cells : Must be present if the device has sub-nodes
>    representing partitions.
> @@ -16,7 +16,7 @@ Optional properties:
>  Example:
>  
>  	smi: flash@fc000000 {
> -		compatible = "st,spear600-smi";
> +		compatible = "st,spear-smi";
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		reg = <0xfc000000 0x1000>;
> diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
> index bebce11..f392594 100644
> --- a/drivers/mtd/devices/spear_smi.c
> +++ b/drivers/mtd/devices/spear_smi.c
> @@ -1113,7 +1113,7 @@ int spear_smi_resume(struct platform_device *pdev)
>  
>  #ifdef CONFIG_OF
>  static const struct of_device_id spear_smi_id_table[] = {
> -	{ .compatible = "st,spear600-smi" },
> +	{ .compatible = "st,spear-smi" },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, spear_smi_id_table);
