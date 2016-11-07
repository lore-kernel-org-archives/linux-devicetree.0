From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: DTS: r8a7794: alt: Fix PFC names for DU
Date: Mon, 7 Nov 2016 13:40:45 +0100
Message-ID: <20161107124044.GE12319@verge.net.au>
References: <1478180574-15464-1-git-send-email-jacopo@jmondi.org>
 <1478201686-25488-1-git-send-email-jacopo@jmondi.org>
 <c0a3c44b-545c-7af3-feed-857cb20ef698@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c0a3c44b-545c-7af3-feed-857cb20ef698-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Jacopo Mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 04, 2016 at 02:43:18PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 11/3/2016 10:34 PM, Jacopo Mondi wrote:
> 
> >Update the PFC pin groups and function names of DU interface for
> >r8a7794 ALT board.
> >
> >The currently specified pin groups and function names prevented PFC and
> >DU interfaces from being correctly configured:
> >
> >sh-pfc e6060000.pin-controller: function 'du' not supported
> >sh-pfc e6060000.pin-controller: invalid function du in map table
> >sh-pfc e6060000.pin-controller: function 'du' not supported
> >sh-pfc e6060000.pin-controller: invalid function du in map table
> >sh-pfc e6060000.pin-controller: function 'du' not supported
> >sh-pfc e6060000.pin-controller: invalid function du in map table
> >sh-pfc e6060000.pin-controller: function 'du' not supported
> >sh-pfc e6060000.pin-controller: invalid function du in map table
> >rcar-du: probe of feb00000.display failed with error -22
> >
> >Signed-off-by: Jacopo Mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
> 
> Acked-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

Thanks, I have queued this up.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
