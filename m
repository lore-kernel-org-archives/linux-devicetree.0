From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] fsl-quadspi: introduce per-bus spi-bus-width property
Date: Mon, 3 Oct 2016 13:51:43 -0500
Message-ID: <20161003185143.GA27634@rob-hp-laptop>
References: <20160927055957.427-1-albert.aribaud@3adev.fr>
 <20160927055957.427-2-albert.aribaud@3adev.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160927055957.427-2-albert.aribaud-iEu9NFBzPZE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Albert ARIBAUD (3ADEV)" <albert.aribaud-iEu9NFBzPZE@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 27, 2016 at 07:59:57AM +0200, Albert ARIBAUD (3ADEV) wrote:
> Introduce spi-bus-width property for bus subnodes, to
> specify per-bus capability to use NORMAL, FAST, DUAL,
> and/or QUAD reads.
> 
> Signed-off-by: Albert ARIBAUD (3ADEV) <albert.aribaud-iEu9NFBzPZE@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Make this a common property.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
