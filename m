From: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: mvebu: add support for the Linksys WRT1900ACS
 (Shelby)
Date: Tue, 14 Feb 2017 20:21:16 +0100
Message-ID: <20170214202116.035ab193@gmail.com>
References: <20170214085919.3997-1-ralph.sennhauser@gmail.com>
        <20170214175533.GF25924@io.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170214175533.GF25924-fahSIxCzskDQ+YiMSub0/l6hYfS7NtTn@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 14 Feb 2017 17:55:33 +0000
Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:

> Hi Ralph, Imre,
> 
> On Tue, Feb 14, 2017 at 09:59:17AM +0100, Ralph Sennhauser wrote:
> > The Linksys WRT1900ACS (Shelby) is another Armada 385 based router
> > in the Linksys WRT AC Series which got released in October 2015.
> > 
> > The file armada-385-linksys-shelby.dts is taken from OpenWrt as-is
> > and originally authored by Imre Kaloz.
> > 
> > URL: http://tinyurl.com/j8lz83a  
> 
> Could you please change this to:
> 
> https://github.com/openwrt/openwrt/blob/8466384db1154a107b86bf3ca10b166a21bd81d0/target/linux/mvebu/files/arch/arm/boot/dts/armada-385-linksys-shelby.dts

Is what I had first and thought were to long to pass, so I went with
this one for V2.

Thanks
Ralph

> 
> Or, say 'imported from
> 
>  https://github.com/openwrt/openwrt
> 
> commit 8466384db115 "mvebu: add support for 4.1 and switch over"'
> 
> or something similar?
> 
> Other than that,
> 
> Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> 
> thx,
> 
> Jason.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
