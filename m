From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v3 7/7] dt-bindings: drm/bridge: Update bindings for ADV7533
Date: Mon, 16 May 2016 15:01:35 +0300
Message-ID: <1987165.vo5BTWVL5e@avalon>
References: <1441625800-1858-1-git-send-email-architt@codeaurora.org> <1992414.kkmfQUJ8oO@avalon> <5719B942.8070907@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5719B942.8070907-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Archit,

On Friday 22 Apr 2016 11:10:18 Archit Taneja wrote:
> On 04/22/2016 04:02 AM, Laurent Pinchart wrote:
> > On Wednesday 09 Mar 2016 16:27:18 Archit Taneja wrote:
> >> Add description of ADV7533. Add the required and optional properties that
> >> are specific to it.
> >> 
> >> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> 
> >> Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> >> ---
> >> 
> >> .../bindings/display/bridge/adi,adv7511.txt        | 25 ++++++++++++-----
> >> 1 file changed, 20 insertions(+), 5 deletions(-)
> >> 
> >> diff --git
> >> a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
> >> b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt index
> >> 96c25ee..420da5a 100644
> >> --- a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
> >> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt

[snip]

> >> +- adi,disable-timing-generator: Only for ADV7533. Disables the internal
> >> timing
> >> +  generator. The chip will rely on the sync signals in the DSI data
> >> lanes,
> >> +  rather than generate its own timings for HDMI output.
> > 
> > Isn't that something that should be selectable at runtime ?
> 
> The timing generator can be enabled/disabled at runtime. Although, we
> don't have a way to tell the driver whether we want to keep it enabled
> or not.
> 
> It's a hardware feature that works well on most platforms, but not on
> all. In particular, it works well on DB410c, but causes issues with
> the Hikey 96 board. The DSI host on Hikey has different clock sources
> that generate the display controller's pixel clock and DSI byte clock,
> whereas the Qualcomm SoC uses the same source. My guess is that the
> ADV7533's timing generator doesn't like it when the pixel data and
> clock are out of phase or something.
> 
> Since it is a hardware feature which needs tweaking, I thought it
> qualified as a DT property.

The fact that a hardware generator is present is certainly describes the 
hardware, but I'm not sure whether to enable it or not also qualifies as a 
hardware feature.

Are there use cases for using the timing generator conditionally on a given 
board ? As you implement support for disabling it, I assume it's not 
mandatory. What feature(s) do we lose if we keep it disabled ?

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
