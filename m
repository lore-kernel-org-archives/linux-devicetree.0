From: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: mvebu: linksys: enable buffer manager support
Date: Thu, 16 Mar 2017 06:48:40 +0100
Message-ID: <20170316064840.3398bd26@gmail.com>
References: <20170308053312.29243-1-ralph.sennhauser@gmail.com>
        <8760jafiy8.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8760jafiy8.fsf-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 15 Mar 2017 20:17:35 +0100
Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Hi Ralph,
>  
>  On mer., mars 08 2017, Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> wrote:
> 
> </snip>
>
> > @@ -88,6 +89,9 @@
> >  			ethernet@70000 {
> >  				status = "okay";
> >  				phy-mode = "rgmii-id";
> > +				buffer-manager = <&bm>;
> > +				bm,pool-long = <1>;
> > +				bm,pool-short = <3>;
> >  				fixed-link {
> >  					speed = <1000>;
> >  					full-duplex;
> > @@ -97,6 +101,9 @@
> >  			ethernet@34000 {
> >  				status = "okay";
> >  				phy-mode = "sgmii";
> > +				buffer-manager = <&bm>;
> > +				bm,pool-long = <0>;
> > +				bm,pool-short = <3>;  
> Any reason to reuse the same pool than the other port?
> 
> As only two ports are used here, then each of them can have use 2 of
> the 4 availables pools. 
> 
> </snip>

Hi Gregory,

It has been quite a while since I have written that patch. Something
written somewhere in the Documentation / commit message which I can't
find anymore gave me the impression that using the same for short
doesn't make a difference. So I went with the pool IDs used for other
similar boards for "consistency".

Will send a v2 shortly using all independent pools using the IDs witch
come most natural in context.

Thanks
Ralph
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
