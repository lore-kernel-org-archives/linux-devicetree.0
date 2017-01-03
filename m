From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt: bindings: Add support for CSI1 bus
Date: Tue, 3 Jan 2017 14:38:54 -0600
Message-ID: <20170103203854.gyyfzxbnnxl3flov@rob-hp-laptop>
References: <20161228183036.GA13139@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161228183036.GA13139@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 28, 2016 at 07:30:36PM +0100, Pavel Machek wrote:
> From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
> 
> In the vast majority of cases the bus type is known to the driver(s)
> since a receiver or transmitter can only support a single one. There
> are cases however where different options are possible.

What cases specifically?

> Document the CSI1/CCP2 properties strobe_clk_inv and strobe_clock
> properties. The former tells whether the strobe/clock signal is
> inverted, while the latter signifies the clock or strobe mode.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index 9cd2a36..f0523f7 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -76,6 +76,10 @@ Optional endpoint properties
>    mode horizontal and vertical synchronization signals are provided to the
>    slave device (data source) by the master device (data sink). In the master
>    mode the data source device is also the source of the synchronization signals.
> +- bus-type: data bus type. Possible values are:
> +  0 - CSI2

As in MIPI CSI2?

> +  1 - parallel / Bt656
> +  2 - CCP2
>  - bus-width: number of data lines actively used, valid for the parallel busses.
>  - data-shift: on the parallel data busses, if bus-width is used to specify the
>    number of data lines, data-shift can be used to specify which data lines are
> @@ -110,9 +114,10 @@ Optional endpoint properties
>    lane and followed by the data lanes in the same order as in data-lanes.
>    Valid values are 0 (normal) and 1 (inverted). The length of the array
>    should be the combined length of data-lanes and clock-lanes properties.
> -  If the lane-polarities property is omitted, the value must be interpreted
> -  as 0 (normal). This property is valid for serial busses only.

Why is this removed?

> -
> +- clock-inv: Clock or strobe signal inversion.
> +  Possible values: 0 -- not inverted; 1 -- inverted

"invert" assumes I know what is normal and I do not. Define what is 
"normal" and name the property the opposite of that. If normal is data 
shifted on clock rising edge, then call the the property 
"clock-shift-falling-edge" for example..

> +- strobe: Whether the clock signal is used as clock or strobe. Used
> +  with CCP2, for instance.
>  
>  Example
>  -------
> 
> 
> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
