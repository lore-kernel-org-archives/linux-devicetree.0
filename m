From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: make __of_attach_node() static
Date: Thu, 22 Jun 2017 11:16:56 -0500
Message-ID: <20170622161656.jmzcvaqyh3p4bd6x@rob-hp-laptop>
References: <1498072598-4366-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1498072598-4366-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 21, 2017 at 12:16:38PM -0700, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
> 
> __of_attach_node() is not used outside of drivers/of/dynamic.c.  Make
> it static and remove it from drivers/of/of_private.h.
> 
> Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
> ---
>  drivers/of/dynamic.c    | 2 +-
>  drivers/of/of_private.h | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)

Applied.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
