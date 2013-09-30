From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/3] of: Add Chunghwa Picture Tubes Ltd. vendor prefix
Date: Mon, 30 Sep 2013 17:03:16 +0100
Message-ID: <20130930160316.GD22259@e106331-lin.cambridge.arm.com>
References: <1380547970-30449-1-git-send-email-treding@nvidia.com>
 <1380547970-30449-2-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1380547970-30449-2-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 30, 2013 at 02:32:49PM +0100, Thierry Reding wrote:
> Chunghwa Picture Tubes Ltd. isn't listed on the stock exchange and just
> Chunghwa is too generic, so use the official abbreviation "CPTT" as the
> vendor prefix.

The changes since v2 mean that the commit messages now describe the
opposite of the patch.

Cheers,
Mark.

> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
> - rename cptt prefix to chunghwa as discussed with Stephen Warren
> 
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 20a92d4..7f13e35 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -20,6 +20,7 @@ cavium	Cavium, Inc.
>  chrp	Common Hardware Reference Platform
>  cirrus	Cirrus Logic, Inc.
>  cortina	Cortina Systems, Inc.
> +chunghwa	Chunghwa Picture Tubes Ltd.
>  dallas	Maxim Integrated Products (formerly Dallas Semiconductor)
>  davicom	DAVICOM Semiconductor, Inc.
>  denx	Denx Software Engineering
> -- 
> 1.8.4
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
