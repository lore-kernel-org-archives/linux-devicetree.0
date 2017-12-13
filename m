From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: Re: [PATCH 1/2] media: dt-bindings: coda: Add compatible for CodaHx4
 on i.MX51
Date: Wed, 13 Dec 2017 16:21:52 +0200
Message-ID: <20171213142152.7vcludcs7ohjeaqb@sapphire.tkos.co.il>
References: <20171213140918.22500-1-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171213140918.22500-1-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Chris Healy <Chris.Healy-c8ZVq/bFV1I@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On Wed, Dec 13, 2017 at 03:09:17PM +0100, Philipp Zabel wrote:
> Add a compatible for the CodaHx4 VPU used on i.MX51.
> 
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/media/coda.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/coda.txt b/Documentation/devicetree/bindings/media/coda.txt
> index 2865d04e40305..660f5ecf2a23b 100644
> --- a/Documentation/devicetree/bindings/media/coda.txt
> +++ b/Documentation/devicetree/bindings/media/coda.txt
> @@ -7,6 +7,7 @@ called VPU (Video Processing Unit).
>  Required properties:
>  - compatible : should be "fsl,<chip>-src" for i.MX SoCs:
>    (a) "fsl,imx27-vpu" for CodaDx6 present in i.MX27
> +  (a) "fsl,imx51-vpu" for CodaHx4 present in i.MX51

Renumbering the strings might be useful.

>    (b) "fsl,imx53-vpu" for CODA7541 present in i.MX53
>    (c) "fsl,imx6q-vpu" for CODA960 present in i.MX6q
>  - reg: should be register base and length as documented in the

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org - tel: +972.2.679.5364, http://www.tkos.co.il -
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
