From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: media: Add Cadence MIPI-CSI2 TX Device
 Tree bindings
Date: Tue, 3 Oct 2017 17:01:53 -0500
Message-ID: <20171003220153.mxjwzmcejwojevlg@rob-hp-laptop>
References: <20170922114703.30511-1-maxime.ripard@free-electrons.com>
 <20170922114703.30511-2-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170922114703.30511-2-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyprian Wronka <cwronka-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Steve Creaney <screaney-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, nm-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 22, 2017 at 01:47:02PM +0200, Maxime Ripard wrote:
> The Cadence MIPI-CSI2 RX controller is a CSI2 bridge that supports up to 4
> video streams and can output on up to 4 CSI-2 lanes, depending on the
> hardware implementation.
> 
> It can operate with an external D-PHY, an internal one or no D-PHY at all
> in some configurations.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  .../devicetree/bindings/media/cdns,csi2tx.txt      | 97 ++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/cdns,csi2tx.txt

Other than the one issue pointed out,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
