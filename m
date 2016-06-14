From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/6] mtd: nand: gpmi: document the clocks and
 clock-names in DT property
Date: Tue, 14 Jun 2016 07:46:14 -0500
Message-ID: <20160614124614.GA3616@rob-hp-laptop>
References: <1465578094-8816-1-git-send-email-han.xu@nxp.com>
 <1465578094-8816-3-git-send-email-han.xu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465578094-8816-3-git-send-email-han.xu-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
Cc: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 10, 2016 at 12:01:30PM -0500, Han Xu wrote:
> add the clocks and clock-names in DT property, gpmi-io clock is
> mandatory for all platforms, but some platforms, such as i.MX6Q may
> need more extra clocks for submodules. More details please refer to the
> SoC reference manual.
> 
> Signed-off-by: Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mtd/gpmi-nand.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> index d02acaf..c8d0e2f 100644
> --- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> @@ -13,6 +13,13 @@ Required properties:
>      and GPMI DMA channel ID.
>      Refer to dma.txt and fsl-mxs-dma.txt for details.
>    - dma-names: Must be "rx-tx".
> +  - clocks : The clocks needed by the gpmi controller. This field varies
> +    depends on the SoC design, "gpmi-io" is mandatory but some platforms may
> +    need several extra clocks, such as i.MX6Q, it requires "gpmi_apb,
> +    gpmi_bch, gpmi_bch_apb and per1_bch" for all submodules. Please refer to
> +    the HW design manual.

You need to spell out exactly which clocks each chip/compatible string 
has.

I'm generally suspicious of varying number of clocks. My guess is all 
the versions have the additional clocks, but they are all just tied to 
the same parent. 

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
