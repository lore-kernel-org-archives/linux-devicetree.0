Return-Path: <robherring2@gmail.com>
Date: Mon, 5 Nov 2018 14:39:09 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: adv748x: make data-lanes property
 mandatory for CSI-2 endpoints
Message-ID: <20181105203909.GA5500@bogus>
References: <20181102160009.17267-1-niklas.soderlund+renesas@ragnatech.se>
 <20181102160009.17267-2-niklas.soderlund+renesas@ragnatech.se>
 <20181105084106.GE20885@w540>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181105084106.GE20885@w540>
To: jacopo mondi <jacopo@jmondi.org>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Nov 05, 2018 at 09:41:06AM +0100, jacopo mondi wrote:
> Hi Niklas,
> 
> On Fri, Nov 02, 2018 at 05:00:06PM +0100, Niklas S�derlund wrote:
> > The CSI-2 transmitters can use a different number of lanes to transmit
> > data. Make the data-lanes mandatory for the endpoints that describe the
> > transmitters as no good default can be set to fallback on.
> >
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> >
> > ---
> > * Changes since v2
> > - Update paragraph according to Laurents comments.
> > ---
> >  Documentation/devicetree/bindings/media/i2c/adv748x.txt | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.txt b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
> > index 5dddc95f9cc46084..bffbabc879efd86c 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/adv748x.txt
> > +++ b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
> > @@ -48,7 +48,9 @@ are numbered as follows.
> >  	  TXA		source		10
> >  	  TXB		source		11
> >
> > -The digital output port nodes must contain at least one endpoint.
> > +The digital output port nodes, when present, shall contain at least one
> > +endpoint. Each of those endpoints shall contain the data-lanes property as
> > +described in video-interfaces.txt.
> >
> >  Ports are optional if they are not connected to anything at the hardware level.
> >
> 
> Re-vamping my ignored comment on v2, I still think you should list here the
> accepted values for each TX as they're actually a property of the hw
> device itself.
> 
>  Required endpoint properties:
> - data-lanes: See "video-interfaces.txt" for description. The property
>   is mandatory for CSI-2 output endpoints and the accepted value
>   depends on which endpoint the property is applied to:
>   - TXA: accepted values are <1>, <2>, <4>
>   - TXB: accepted value is <1>

+1

Rob
