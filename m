From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: r8a7795: Add DRIF support
Date: Mon, 3 Jul 2017 11:03:23 +0200
Message-ID: <20170703090323.GA15426@verge.net.au>
References: <20170623091320.12664-1-ramesh.shanmugasundaram@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170623091320.12664-1-ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 23, 2017 at 10:13:20AM +0100, Ramesh Shanmugasundaram wrote:
> Adds the DRIF controller nodes for r8a7795.
> 
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> ---
> Hi Simon,
> 
>    This patch is based on renesas-devel-20170622-v4.12-rc6 tag.
>    It is verified on both H3 ES1.1 and ES2.0 SoC revisions.
> 
>    The bindings[1] and the driver[2] were pushed into the media_tree.
> 
>    [1] https://git.linuxtv.org/media_tree.git/commit/?id=54a707ea011601f06cc5ef7fe6d0daac71ab0622
>    [2] https://git.linuxtv.org/media_tree.git/commit/?id=7625ee981af166ddb569e2e6c0006e2af471326f
> 
> Thanks,
> Ramesh.

Thanks for the reminder and sorry for letting this slip through.
I have queued this up for v4.14.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
