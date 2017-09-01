From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC/PATCH] drivers/of/platform: Add powerpc 4xx embedded busses
 to default list
Date: Fri, 1 Sep 2017 07:10:27 +0200
Message-ID: <20170901051027.GD2584@kroah.com>
References: <1504237861.4974.59.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1504237861.4974.59.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 01, 2017 at 01:51:01PM +1000, Benjamin Herrenschmidt wrote:
> This allow to (slowly) migrate those embedded platforms
> to of_platform_default_populate()
> 
> Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> ---
> 
> I'm here to collect acks (or comments :-) I'd like this to go via
> the powerpc tree along with the patches converting some of the
> platforms. I'll be adding more bus types if/when I start tackling
> other powerpc embedded families but for now I'm dealing with 4xx.
> 
>  drivers/of/platform.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
