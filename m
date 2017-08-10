From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/7] mtd: spi-nor: cadence-quadspi: add a delay in write
 sequence
Date: Wed, 9 Aug 2017 19:08:31 -0500
Message-ID: <20170810000831.mtj5w4sgwa56ja24@rob-hp-laptop>
References: <20170801045434.8733-1-vigneshr@ti.com>
 <20170801045434.8733-2-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170801045434.8733-2-vigneshr-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Cc: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 01, 2017 at 10:24:28AM +0530, Vignesh R wrote:
> As per 66AK2G02 TRM[1] SPRUHY8F section 11.15.5.3 Indirect Access
> Controller programming sequence, a delay equal to couple QSPI master
> clock(~5ns) is required after setting CQSPI_REG_INDIRECTWR_START bit and
> writing data to the flash. Add a new compatible to handle the couple of
> cycles of delay required in the indirect write sequence, since this
> delay is specific to TI 66AK2G SoC.
> 
> [1]http://www.ti.com/lit/ug/spruhy8f/spruhy8f.pdf
> 
> Signed-off-by: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt |  1 +
>  drivers/mtd/spi-nor/cadence-quadspi.c                     | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> index f248056da24c..fdd511a83511 100644
> --- a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> @@ -2,6 +2,7 @@
>  
>  Required properties:
>  - compatible : Should be "cdns,qspi-nor".
> +	       Should be "ti,k2g-qspi" for TI 66AK2G platform.

Also, this doesn't indicate that "cdns,qspi-nor" is a fallback as you 
have in the dts files. Reformat to 1 valid combination per line.

>  - reg : Contains two entries, each of which is a tuple consisting of a
>  	physical address and length. The first entry is the address and
>  	length of the controller register set. The second entry is the
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
