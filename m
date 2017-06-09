From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/6] dt-bindings: display: Add Synopsys DW MIPI DSI
 DRM bridge driver
Date: Fri, 9 Jun 2017 08:01:17 -0500
Message-ID: <20170609130117.m5eyqrmv3gsokmuj@rob-hp-laptop>
References: <1496414235-20098-1-git-send-email-philippe.cornu@st.com>
 <1496414235-20098-3-git-send-email-philippe.cornu@st.com>
 <20170608154028.6ck3dos6de2dogrk@rob-hp-laptop>
 <7502cbc2-9feb-4dd3-3d95-b5f33b8a8872@codeaurora.org>
 <7dd31d6d-1d5d-2432-07aa-96349f50c924@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7dd31d6d-1d5d-2432-07aa-96349f50c924-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Maxime Coquelin <mco>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 09, 2017 at 10:43:07AM +0100, Jose Abreu wrote:
> Hello,
> 
> 
> On 09-06-2017 05:11, Archit Taneja wrote:
> > Hi Philippe, Rob,
> >
> > On 06/08/2017 09:10 PM, Rob Herring wrote:
> >> Seems strange there's not also a pixel or bit clock? Or this
> >> gets driven
> >> from the phy?
> >
> > Since you mention phy here, I wanted to share a concern with
> > the bindings.
> > These bindings don't have a separate PHY DT node. The PHY is
> > assumed as a
> > part of the IP when integrated by a SoC. There are already
> > rockchip and
> > hisil DSI bindings that use this IP but don't define a PHY node.
> >
> > It's a similar situation with the DW-HDMI bindings.
> >
> > For example, when the DW HDMI is integrated in rockchip or
> > renesas SoC, the
> > bindings "rockchip,rk3288-dw-hdmi" or "renesas,r8a7795-dw-hdmi"
> > are used,
> > and they don't have a separate PHY DT node.
> >
> > I wasn't sure whether this is the right way to proceed or not
> > for such IPs.
> > Some advice would help us here.
> >
> > Thanks,
> > Archit
> >
> 
> I just want to add that read/writes from/to phy are done using
> the controller (in HDMI and in MIPI DSI Host), so the only way to
> have a phy driver is that if some custom callbacks are provided
> or if the memory region is shared.
> 
> Anyway, I agree with Archit in the sense that phy + controller
> are highly tied. Also, these two "pieces" are SoC specific and
> sometimes very different between SoC's because they can be
> customized so I think a different compatible string suits well here.

When the phy is integrated like this, I agree that it doesn't make sense 
to have a separate phy node.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
