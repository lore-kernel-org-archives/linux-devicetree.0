From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCHv2] dt: bindings: Add support for CSI1 bus
Date: Fri, 20 Jan 2017 13:46:27 +0200
Message-ID: <20170120114627.GF3205@valkosipuli.retiisi.org.uk>
References: <20161228183036.GA13139@amd>
 <20170111225335.GA21553@amd>
 <20170119214905.GD3205@valkosipuli.retiisi.org.uk>
 <cf372233-f047-6e2c-01eb-02e30e6b2de5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cf372233-f047-6e2c-01eb-02e30e6b2de5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Ivaylo,

On Fri, Jan 20, 2017 at 09:59:13AM +0200, Ivaylo Dimitrov wrote:
> Hi,
> 
> On 19.01.2017 23:49, Sakari Ailus wrote:
> >Hi Pavel,
> >
> >On Wed, Jan 11, 2017 at 11:53:35PM +0100, Pavel Machek wrote:
> >>From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
> >>
> >>In the vast majority of cases the bus type is known to the driver(s)
> >>since a receiver or transmitter can only support a single one. There
> >>are cases however where different options are possible.
> >>
> >>The existing V4L2 OF support tries to figure out the bus type and
> >>parse the bus parameters based on that. This does not scale too well
> >>as there are multiple serial busses that share common properties.
> >>
> >>Some hardware also supports multiple types of busses on the same
> >>interfaces.
> >>
> >>Document the CSI1/CCP2 property strobe. It signifies the clock or
> >>strobe mode.
> >>
> >>Signed-off-by: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
> >>Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>Signed-off-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
> >>
> >>diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> >>index 9cd2a36..08c4498 100644
> >>--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> >>+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> >>@@ -76,6 +76,11 @@ Optional endpoint properties
> >>   mode horizontal and vertical synchronization signals are provided to the
> >>   slave device (data source) by the master device (data sink). In the master
> >>   mode the data source device is also the source of the synchronization signals.
> >>+- bus-type: data bus type. Possible values are:
> >>+  0 - MIPI CSI2
> >>+  1 - parallel / Bt656
> >>+  2 - MIPI CSI1
> >>+  3 - CCP2
> >
> >Actually, thinking about this again --- we only need to explictly specify
> >busses if we're dealing with either CCP2 or CSI-1. The vast majority of the
> >actual busses are and continue to be CSI-2 or either parallel or Bt.656. As
> >they can be implicitly detected, we would have an option to just drop values
> >0 and 1 from above, i.e. only leave CSI-1 and CCP2. For now, specifying
> >CSI-2 or parallel / Bt.656 adds no value as the old DT binaries without
> >bus-type will need to be supported anyway.
> >
> >> - bus-width: number of data lines actively used, valid for the parallel busses.
> >> - data-shift: on the parallel data busses, if bus-width is used to specify the
> >>   number of data lines, data-shift can be used to specify which data lines are
> >>@@ -112,7 +117,8 @@ Optional endpoint properties
> >>   should be the combined length of data-lanes and clock-lanes properties.
> >>   If the lane-polarities property is omitted, the value must be interpreted
> >>   as 0 (normal). This property is valid for serial busses only.
> >>-
> >>+- strobe: Whether the clock signal is used as clock or strobe. Used
> >>+  with CCP2, for instance.
> >
> >How about the "ti,strobe-clock-inv" I proposed? No-one seems to know what
> >this really truly means... or just drop it if it's not really needed.
> >
> 
> Not really :), see https://www.spinics.net/lists/linux-media/msg99802.html
> and https://www.spinics.net/lists/linux-media/msg99800.html
> 
> "clock/strobe", and "strobe-inv" are two distinct properties, see CSI1B_CTRL
> description in OMAP TRM. BTW there is another property that is needed for
> both n900 cameras to operate correctly (VP_CLK_POL, bit 12 from the same
> reg), but that can be added later on when we have the other bits in place.

Oh, indeed, my mistake. Please ignore that comment.

-- 
Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
