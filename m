From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: mfd: mc13xxx: Remove obsolete property
Date: Wed, 27 Sep 2017 16:47:01 -0500
Message-ID: <20170927214701.sizd5wc3azou5x7c@rob-hp-laptop>
References: <1505922711-22070-1-git-send-email-fabio.estevam@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1505922711-22070-1-git-send-email-fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 20, 2017 at 12:51:51PM -0300, Fabio Estevam wrote:
> The 'fsl,spi-num-chipselects' property is obsolete according to 
> Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt, so remove
> it from the example.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/mc13xxx.txt | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
