From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 08/13] ARM: dts: armada-385-linksys: use binary unit
 prefixes
Date: Tue, 23 May 2017 14:02:37 +0200
Message-ID: <20170523120237.GO13759@lunn.ch>
References: <20170521124903.11050-1-ralph.sennhauser@gmail.com>
 <20170521124903.11050-9-ralph.sennhauser@gmail.com>
 <20170522150001.GM29447@lunn.ch>
 <20170522202416.1c48d91a@gmail.com>
 <20170523103302.4f78eb93@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170523103302.4f78eb93-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 23, 2017 at 10:33:02AM +0200, Ralph Sennhauser wrote:
> On Mon, 22 May 2017 20:24:16 +0200
> Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
> > On Mon, 22 May 2017 17:00:01 +0200
> > Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:
> > 
> > > On Sun, May 21, 2017 at 02:48:57PM +0200, Ralph Sennhauser wrote:  
> > > > Use IEEE 1541-2002 unit prefixes for sizes.    
> > > 
> > > Does ePAPR recommend this?  
> > 
> > Not directly, but the paper (v1.1) itself is using MiB as well which
> > could be seen as a recommendation.
> 
> Found the pdf again on the web, so here a link:
> http://elinux.org/images/c/cf/Power_ePAPR_APPROVED_v1.1.pdf
> 
> Funny thing it's using KB(instead of KiB) and MiB. So it's
> inconsistent, also the unit with SI prefix would be kB and not KB. So
> I'd say ePAPR doesn't care / the authors didn't pay any attention to
> this.

Hi Ralph

Thanks for checking into this.

My preference, and it is only a preference, is to not do this. Keep
with MB, KB.

   Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
