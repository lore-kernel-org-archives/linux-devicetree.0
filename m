From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/7] [media] dt-bindings: Add a binding for Video Data
 Order Adapter
Date: Tue, 3 Jan 2017 17:18:30 -0600
Message-ID: <20170103231829.am6mup7q5drwjy26@rob-hp-laptop>
References: <20170102132352.23669-1-m.tretter@pengutronix.de>
 <20170102132352.23669-2-m.tretter@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170102132352.23669-2-m.tretter-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Tretter <m.tretter-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 02, 2017 at 02:23:46PM +0100, Michael Tretter wrote:
> From: Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Add a DT binding documentation for the Video Data Order Adapter (VDOA)
> of the Freescale i.MX6 SoC.
> 
> Also, add the compatible property and correct clock to the device tree
> to match the documentation.
> 
> Signed-off-by: Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Michael Tretter <m.tretter-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  .../devicetree/bindings/media/fsl-vdoa.txt          | 21 +++++++++++++++++++++
>  arch/arm/boot/dts/imx6qdl.dtsi                      |  2 ++
>  2 files changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/fsl-vdoa.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
