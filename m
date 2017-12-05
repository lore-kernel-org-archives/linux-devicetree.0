From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [RFC 0/2] dt-bindings: mipi-dsi: dual-channel DSI bindings
Date: Tue,  5 Dec 2017 16:03:54 +0530
Message-ID: <20171205103356.9917-1-architt@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: tomi.valkeinen-l0cyMroinI0@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, philippe.cornu-qxv4g6HH51o@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nickey.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

DSI host controllers these days can be ganged together to drive larger
displays. Every SoC vendor supporting this is trying to add their own
DT property so that the corresponding drivers can identify that they
need to operate in the dual DSI mode. If we use the graph bindings, we
don't really need an additional DT property in the DSI host controller
to tell it that it's operating in dual-channel mode. It's something that
can be inferred 

I don't know much about how dual-channel is implemented on anything apart
from MSM chipsets, but one thing that seems universal is that the clock
driving both the DSI controllers (and corresponding PHYs) should have the
same clock source. The DSI instance that drives this clock is generally
called the "master", and the other instance the "slave". A "clock-master"
DT property has been proposed for the same.

There are some open item(s) that aren't described in the mipi DSI/DCS
spec, but we might need to have either as bindings or some sort of DSI
flags:

- When sending commands over DSI to peripherals with 2 DSI channels,
  some peripherals seem to have a requirement that both the DSIs trigger
  the same command at the same time. Otherwise, the controller on the
  peripheral goes a bit nuts. Is this common to all peripherals? Or are
  there devices where we just need to send the DCS/generic commands to
  the "master" DSI channel?

- When trying to read something back from the panel (a DCS read command
  followed by a BTA etc.), should both the DSI controllers be listening
  for data, or only the master?

- Anything else?

The first patch adds some explanation on how to deal with peripherals
that do DSI, but have a different control bus. This is something we've
already started using, but didn't have properly documented anywhere.

The second patch proposes bindings for DSI hosts/peripherals that
implement dual-channel DSI. 

Archit Taneja (2):
  dt-bindings: mipi-dsi: Add info about peripherals with non-DSI control
    bus
  dt-bindings: mipi-dsi: Add dual-channel DSI related info

 .../devicetree/bindings/display/mipi-dsi-bus.txt   | 152 ++++++++++++++++++++-
 1 file changed, 145 insertions(+), 7 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
