From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH] dt: bindings: Add support for CSI1 bus
Date: Mon, 2 Jan 2017 09:00:10 +0200
Message-ID: <20170102070010.GD3958@valkosipuli.retiisi.org.uk>
References: <20161228183036.GA13139@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161228183036.GA13139@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Pavel,

On Wed, Dec 28, 2016 at 07:30:36PM +0100, Pavel Machek wrote:
> From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
> 
> In the vast majority of cases the bus type is known to the driver(s)
> since a receiver or transmitter can only support a single one. There
> are cases however where different options are possible.
> 
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
> +  1 - parallel / Bt656
> +  2 - CCP2

I wonder if we should make a difference between CCP2 and CSI-1 here, as it
may make a difference in hardware configuration. The next patch does
recognise that difference, so it should be present here as well.

Perhaps 2 - CSI1; 3 - CCP2. What do you think?

>  - bus-width: number of data lines actively used, valid for the parallel busses.
>  - data-shift: on the parallel data busses, if bus-width is used to specify the
>    number of data lines, data-shift can be used to specify which data lines are
> @@ -110,9 +114,10 @@ Optional endpoint properties
>    lane and followed by the data lanes in the same order as in data-lanes.
>    Valid values are 0 (normal) and 1 (inverted). The length of the array
>    should be the combined length of data-lanes and clock-lanes properties.
> -  If the lane-polarities property is omitted, the value must be interpreted
> -  as 0 (normal). This property is valid for serial busses only.
> -
> +- clock-inv: Clock or strobe signal inversion.
> +  Possible values: 0 -- not inverted; 1 -- inverted
> +- strobe: Whether the clock signal is used as clock or strobe. Used
> +  with CCP2, for instance.
>  
>  Example
>  -------
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
