From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 02/10] dt-bindings: display: renesas: Deprecate LVDS support in the DU bindings
Date: Fri, 12 Jan 2018 18:46:01 +0200
Message-ID: <4541848.oEjN67B46T@avalon>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com> <20180112005858.26472-3-laurent.pinchart+renesas@ideasonboard.com> <7e7432fb-770e-d426-dfc1-1518975acd4e@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <7e7432fb-770e-d426-dfc1-1518975acd4e@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Friday, 12 January 2018 17:14:33 EET Sergei Shtylyov wrote:
> On 01/12/2018 03:58 AM, Laurent Pinchart wrote:
> > The internal LVDS encoders now have their own DT bindings, representing
> > them as part of the DU is deprecated.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  .../devicetree/bindings/display/renesas,du.txt     | 26 ++++++++---------
> >  1 file changed, 11 insertions(+), 15 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt
> > b/Documentation/devicetree/bindings/display/renesas,du.txt index
> > cd48aba3bc8c..8f6e0e118e3e 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> > 
> > @@ -17,9 +17,7 @@ Required Properties:
> >     - reg: A list of base address and length of each memory resource, one
> >     for
> >       each entry in the reg-names property.
> >     - reg-names: Name of the memory resources. The DU requires one memory
> > 
> > -    resource for the DU core (named "du") and one memory resource for
> > each
> > -    LVDS encoder (named "lvds.x" with "x" being the LVDS controller
> > numerical
> > -    index).
> > +    resource for the DU core (named "du").
> 
>     Could we get rid of this prop altogether?

Actually yes, as unlike what I thought the driver doesn't use it. I'll drop it 
in v2.

-- 
Regards,

Laurent Pinchart
