From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 01/10] dt-bindings: display: renesas: Add R-Car LVDS encoder DT bindings
Date: Fri, 12 Jan 2018 15:29:48 +0200
Message-ID: <1560461.HFdK8RZ078@avalon>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com> <20180112005858.26472-2-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdWFHRti_Su+01QYnWXHGB2Z=d4Sq93Y9JJgb2ifKSs2vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWFHRti_Su+01QYnWXHGB2Z=d4Sq93Y9JJgb2ifKSs2vg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, DRI Development <dri-devel@lists.freedesktop.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Geert,

On Friday, 12 January 2018 12:13:18 EET Geert Uytterhoeven wrote:
> On Fri, Jan 12, 2018 at 1:58 AM, Laurent Pinchart wrote:
> > The Renesas R-Car Gen2 and Gen3 SoCs have internal LVDS encoders. Add
> > corresponding device tree bindings.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > @@ -0,0 +1,54 @@
> > +Renesas R-Car LVDS Encoder
> > +==========================
> > +
> > +These DT bindings describe the LVDS encoder embedded in the Renesas R-Car
> > Gen2 +and Gen3 SoCs.
> > +
> > +Required properties:
> > +
> > +- compatible : Shall contain one of
> > +  - "renesas,lvds-r8a7743" for R8A7790 (R-Car RZ/G1M) compatible LVDS
> > encoders
> > +  - "renesas,lvds-r8a7790" for R8A7790 (R-Car H2) compatible LVDS
> > encoders
> > +  - "renesas,lvds-r8a7791" for R8A7791 (R-Car M2-W) compatible LVDS
> > encoders
> > +  - "renesas,lvds-r8a7793" for R8A7791 (R-Car M2-N) compatible LVDS
> > encoders
> > +  - "renesas,lvds-r8a7795" for R8A7795 (R-Car H3) compatible LVDS
> > encoders
> > +  - "renesas,lvds-r8a7796" for R8A7796 (R-Car M3-W) compatible LVDS
> > encoders
> 
> As this is a new binding, please use "renesas,<soc>-lvds".

I've recently been thinking that we made the wrong choice, <ip>-<soc> would be 
better in my opinion as it aligns with <ip>-<version>, but it's too late to 
change that, so I'll change the order here.

> BTW, would it make sense to use "renesas,<soc>-du" for the new DU binding,
> too? Or have you reserved that for the future version that will have a
> one-to-one mapping between device nodes and DU channels? ;-)

It's a good idea, let's reserve it for that evolution. If it ever happens ;-)

-- 
Regards,

Laurent Pinchart
