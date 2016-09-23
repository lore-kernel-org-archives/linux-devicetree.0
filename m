From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: display-timing: Add
 property to configure sync drive edge
Date: Fri, 23 Sep 2016 15:01:54 -0500
Message-ID: <20160923200154.GA15443@rob-hp-laptop>
References: <20160922103526.24925-1-peter.ujfalusi@ti.com>
 <20160922103526.24925-2-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160922103526.24925-2-peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Cc: plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 22, 2016 at 01:35:24PM +0300, Peter Ujfalusi wrote:
> There are display panels which demands that the sync signal is driven on
> different edge than the pixel data.
> With the syncclk-active property we can specify the clk edge to be used to
> drive the sync signal. When the property is missing it indicates that the
> sync is driven on the same edge as the pixel data.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
> CC: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> CC: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  .../devicetree/bindings/display/panel/display-timing.txt          | 8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
