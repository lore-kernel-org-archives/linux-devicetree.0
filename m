From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: Re: [PATCHv2] dt: bindings: Add support for CSI1 bus
Date: Thu, 12 Jan 2017 14:06:03 +0200
Message-ID: <20170112120603.6gwtpwhyuaynvlj3@tarshish>
References: <20161228183036.GA13139@amd>
 <20170111225335.GA21553@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170111225335.GA21553@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Pavel,

On Wed, Jan 11, 2017 at 11:53:35PM +0100, Pavel Machek wrote:
> From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
> 
> In the vast majority of cases the bus type is known to the driver(s)
> since a receiver or transmitter can only support a single one. There
> are cases however where different options are possible.
> 
> The existing V4L2 OF support tries to figure out the bus type and
> parse the bus parameters based on that. This does not scale too well
> as there are multiple serial busses that share common properties.
> 
> Some hardware also supports multiple types of busses on the same
> interfaces.
> 
> Document the CSI1/CCP2 property strobe. It signifies the clock or
> strobe mode.
>  
> Signed-off-by: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index 9cd2a36..08c4498 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -76,6 +76,11 @@ Optional endpoint properties
>    mode horizontal and vertical synchronization signals are provided to the
>    slave device (data source) by the master device (data sink). In the master
>    mode the data source device is also the source of the synchronization signals.
> +- bus-type: data bus type. Possible values are:
> +  0 - MIPI CSI2
> +  1 - parallel / Bt656

Why not have separate values for parallel and BT.656?

baruch

> +  2 - MIPI CSI1
> +  3 - CCP2
>  - bus-width: number of data lines actively used, valid for the parallel busses.
>  - data-shift: on the parallel data busses, if bus-width is used to specify the
>    number of data lines, data-shift can be used to specify which data lines are
> @@ -112,7 +117,8 @@ Optional endpoint properties
>    should be the combined length of data-lanes and clock-lanes properties.
>    If the lane-polarities property is omitted, the value must be interpreted
>    as 0 (normal). This property is valid for serial busses only.
> -
> +- strobe: Whether the clock signal is used as clock or strobe. Used
> +  with CCP2, for instance.
>  
>  Example
>  -------

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org - tel: +972.52.368.4656, http://www.tkos.co.il -
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
