From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v8 28/28] rcar-vin: enable support for r8a77970
Date: Mon, 4 Dec 2017 10:48:56 +0100
Message-ID: <25017e02-ee2b-c5fc-7980-55d5d9d6211f@xs4all.nl>
References: <20171129194342.26239-1-niklas.soderlund+renesas@ragnatech.se>
 <20171129194342.26239-29-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171129194342.26239-29-niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tomoharu.fukawa.eb-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/29/2017 08:43 PM, Niklas Söderlund wrote:
> Add the SoC specific information for Renesas r8a77970.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>

Reviewed-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

Regards,

	Hans

> ---
>  .../devicetree/bindings/media/rcar_vin.txt         |  1 +
>  drivers/media/platform/rcar-vin/rcar-core.c        | 40 ++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/rcar_vin.txt
> index 314743532bbb4523..6b98f8a3398fa493 100644
> --- a/Documentation/devicetree/bindings/media/rcar_vin.txt
> +++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
> @@ -21,6 +21,7 @@ on Gen3 to a CSI-2 receiver.
>     - "renesas,vin-r8a7794" for the R8A7794 device
>     - "renesas,vin-r8a7795" for the R8A7795 device
>     - "renesas,vin-r8a7796" for the R8A7796 device
> +   - "renesas,vin-r8a77970" for the R8A77970 device
>     - "renesas,rcar-gen2-vin" for a generic R-Car Gen2 or RZ/G1 compatible
>       device.
>     - "renesas,rcar-gen3-vin" for a generic R-Car Gen3 compatible device.
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 62eb89b36fbb2ee1..bbdf36b5c3c8178d 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -1145,6 +1145,42 @@ static const struct rvin_info rcar_info_r8a7796 = {
>  	},
>  };
>  
> +static const struct rvin_info rcar_info_r8a77970 = {
> +	.chip = RCAR_GEN3,
> +	.use_mc = true,
> +	.max_width = 4096,
> +	.max_height = 4096,
> +
> +	.num_chsels = 5,
> +	.chsels = {
> +		{
> +			{ .csi = RVIN_CSI40, .chan = 0 },
> +			{ .csi = RVIN_NC, .chan = 0 },
> +			{ .csi = RVIN_NC, .chan = 0 },
> +			{ .csi = RVIN_CSI40, .chan = 0 },
> +			{ .csi = RVIN_NC, .chan = 0 },
> +		}, {
> +			{ .csi = RVIN_NC, .chan = 0 },
> +			{ .csi = RVIN_NC, .chan = 0 },
> +			{ .csi = RVIN_CSI40, .chan = 0 },
> +			{ .csi = RVIN_CSI40, .chan = 1 },
> +			{ .csi = RVIN_NC, .chan = 0 },
> +		}, {
> +			{ .csi = RVIN_NC, .chan = 0 },
> +			{ .csi = RVIN_CSI40, .chan = 0 },
> +			{ .csi = RVIN_NC, .chan = 0 },
> +			{ .csi = RVIN_CSI40, .chan = 2 },
> +			{ .csi = RVIN_NC, .chan = 0 },
> +		}, {
> +			{ .csi = RVIN_CSI40, .chan = 1 },
> +			{ .csi = RVIN_NC, .chan = 0 },
> +			{ .csi = RVIN_NC, .chan = 0 },
> +			{ .csi = RVIN_CSI40, .chan = 3 },
> +			{ .csi = RVIN_NC, .chan = 0 },
> +		},
> +	},
> +};
> +
>  static const struct of_device_id rvin_of_id_table[] = {
>  	{
>  		.compatible = "renesas,vin-r8a7778",
> @@ -1182,6 +1218,10 @@ static const struct of_device_id rvin_of_id_table[] = {
>  		.compatible = "renesas,vin-r8a7796",
>  		.data = &rcar_info_r8a7796,
>  	},
> +	{
> +		.compatible = "renesas,vin-r8a77970",
> +		.data = &rcar_info_r8a77970,
> +	},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, rvin_of_id_table);
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
