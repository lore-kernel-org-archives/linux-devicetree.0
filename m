From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCHv2] dt: bindings: Add support for CSI1 bus
Date: Fri, 3 Feb 2017 16:16:49 +0200
Message-ID: <20170203141649.GC12291@valkosipuli.retiisi.org.uk>
References: <20161228183036.GA13139@amd>
 <20170111225335.GA21553@amd>
 <20170119214905.GD3205@valkosipuli.retiisi.org.uk>
 <20170203115045.GA1350@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170203115045.GA1350@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Pavel,

On Fri, Feb 03, 2017 at 12:50:45PM +0100, Pavel Machek wrote:
> Hi!
> 
> > > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > @@ -76,6 +76,11 @@ Optional endpoint properties
> > >    mode horizontal and vertical synchronization signals are provided to the
> > >    slave device (data source) by the master device (data sink). In the master
> > >    mode the data source device is also the source of the synchronization signals.
> > > +- bus-type: data bus type. Possible values are:
> > > +  0 - MIPI CSI2
> > > +  1 - parallel / Bt656
> > > +  2 - MIPI CSI1
> > > +  3 - CCP2
> > 
> > Actually, thinking about this again --- we only need to explictly specify
> > busses if we're dealing with either CCP2 or CSI-1. The vast majority of the
> > actual busses are and continue to be CSI-2 or either parallel or Bt.656. As
> > they can be implicitly detected, we would have an option to just drop values
> > 0 and 1 from above, i.e. only leave CSI-1 and CCP2. For now, specifying
> > CSI-2 or parallel / Bt.656 adds no value as the old DT binaries without
> > bus-type will need to be supported anyway.
> 
> Hmm. "Just deleting the others" may be a bit confusing... but what
> about this? It explains what we can autodetect.
> 
> Best regards,
> 								Pavel
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index 08c4498..d54093b 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -77,10 +77,10 @@ Optional endpoint properties
>    slave device (data source) by the master device (data sink). In the master
>    mode the data source device is also the source of the synchronization signals.
>  - bus-type: data bus type. Possible values are:
> -  0 - MIPI CSI2
> -  1 - parallel / Bt656
> -  2 - MIPI CSI1
> -  3 - CCP2
> +  0 - autodetect based on other properties (MIPI CSI2, parallel, Bt656)

In the meantime, I also realised that we need to separate MIPI C-PHY and
D-PHY from each other. So I think we'll need that property for CSI-2
nevertheless. How about:

0 - autodetect based on other properties (MIPI CSI-2 D-PHY, parallel or Bt656)
1 - MIPI CSI-2 C-PHY
2 - MIPI CSI1
3 - CCP2 

I wouldn't add a separate entry for the parallel case as there are plenty of
existing DT binaries with parallel interface configuration without phy-type
property. They will need to be continue to be supported anyway, so there's
not too much value in adding a type for that purpose.

I do find this a bit annoying; we should have had something like phy-type
from day one rather than try to guess which phy is being used...

> +  1 - MIPI CSI1
> +  2 - CCP2
> +  Autodetection is default, and bus-type property may be omitted in that case.
>  - bus-width: number of data lines actively used, valid for the parallel busses.
>  - data-shift: on the parallel data busses, if bus-width is used to specify the
>    number of data lines, data-shift can be used to specify which data lines are
> 
> 


-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
