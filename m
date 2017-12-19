From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] dt-bindings: imx-gpcv2: Fix the unit address
Date: Tue, 19 Dec 2017 17:37:39 -0600
Message-ID: <20171219233739.2dphbrxfy625zzlm@rob-hp-laptop>
References: <1513447382-4269-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1513447382-4269-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 16, 2017 at 04:03:02PM -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> 
> In the provided example the unit address does not match the 'reg' value,
> as IMX7_POWER_DOMAIN_PCIE_PHY is defined as 1.
> 
> Fix the unit address and avoid using defines in reg as per Rob
> Herring's recommendation.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> ---
> Changes since v1:
> - Avoid using defines as per Rob's recommendation
> 
>  Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
