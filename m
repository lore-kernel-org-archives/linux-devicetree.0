From: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: mvebu: add support for Linksys WRT3200ACM
 (Rango)
Date: Wed, 24 May 2017 08:12:15 +0200
Message-ID: <20170524081215.6fa37f4f@gmail.com>
References: <20170523212921.16684-1-ralph.sennhauser@gmail.com>
        <20170524013753.GA3770@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170524013753.GA3770-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 24 May 2017 03:37:53 +0200
Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:

> Hi Ralph
> 
> > Changes since v1:
> > 
> >   - Use non-removable with the sdhci node  
> 
> ..
> 
> > +
> > +&sdhci {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&sdhci_pins>;
> > +	no-1-8-v;
> > +	broken-cd;
> > +	wp-inverted;
> > +	bus-width = <8>;
> > +	status = "okay";
> > +};  
> 
> ???
> 
> 	Andrew

Arg, forgot to squash the --fixup for this one

Ralph
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
