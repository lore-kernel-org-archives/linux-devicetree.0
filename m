From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] of: irq: use of_property_read_bool() for
 "interrupt-controller" prop
Date: Fri, 21 Jul 2017 10:46:04 -0500
Message-ID: <20170721154604.kbjb74ebzicodckl@rob-hp-laptop>
References: <20170708203318.045262932@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170708203318.045262932-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Jul 08, 2017 at 11:29:51PM +0300, Sergei Shtylyov wrote:
> The "interrupt-controller" property is boolean, i.e. has no value.  The DT
> interrupt parsing code predates of_property_read_bool(), so it uses either
> of_get_property() or of_find_property() -- the former isn't quite correct
> for the boolean props (but works somehow). Use the modern boolean prop API
> instead.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> 
> ---
>  drivers/of/irq.c |    5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Both applied, thanks.

Any plans to convert other users?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
