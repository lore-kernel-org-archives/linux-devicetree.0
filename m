From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 27/28] rcar-vin: enable support for r8a7796
Date: Thu, 30 Nov 2017 20:17:46 -0600
Message-ID: <20171201021746.ujhlvirxexnqk5po@rob-hp-laptop>
References: <20171129194342.26239-1-niklas.soderlund+renesas@ragnatech.se>
 <20171129194342.26239-28-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171129194342.26239-28-niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tomoharu.fukawa.eb-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 29, 2017 at 08:43:41PM +0100, Niklas Söderlund wrote:
> Add the SoC specific information for Renesas r8a7796.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
> Reviewed-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/media/rcar_vin.txt         |  1 +

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/media/platform/rcar-vin/rcar-core.c        | 64 ++++++++++++++++++++++
>  2 files changed, 65 insertions(+)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
