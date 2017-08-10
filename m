From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/7] mtd: spi-nor: cadence-quadspi: Add support to enable
 loopback clock circuit
Date: Wed, 9 Aug 2017 19:10:21 -0500
Message-ID: <20170810001021.ayygkgy6xwnrxghl@rob-hp-laptop>
References: <20170801045434.8733-1-vigneshr@ti.com>
 <20170801045434.8733-3-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170801045434.8733-3-vigneshr-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Cc: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 01, 2017 at 10:24:29AM +0530, Vignesh R wrote:
> Cadence QSPI IP has a adapted loopback circuit which can be enabled by
> setting BYPASS field to 0 in READCAPTURE register. It enables use of
> QSPI return clock to latch the data rather than the internal QSPI
> reference clock. For high speed operations, adapted loopback circuit
> using QSPI return clock helps to increase data valid window.
> 
> Add DT parameter cdns,rclk-en to help enable adapted loopback circuit
> for boards which do have QSPI return clock provided.
> This patch also modifies cqspi_readdata_capture() function's bypass
> parameter to bool to match how its used in the function.
> 
> Signed-off-by: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 3 +++
>  drivers/mtd/spi-nor/cadence-quadspi.c                     | 8 ++++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)

Please separate bindings to a separate patch or patches.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
