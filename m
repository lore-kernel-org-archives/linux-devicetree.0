From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH 1/3] media: dt: bindings: sunxi-ir: Add A64 compatible
Date: Sat, 12 Jan 2019 09:08:08 +0100
Message-ID: <4866484.1b519qCrCi@jernej-laptop>
References: <20190111173015.12119-1-jernej.skrabec@siol.net> <20190111173015.12119-2-jernej.skrabec@siol.net> <CAGb2v66DiqK9sL-hQev4Wy08d9T7f1Yc2DFWJ0gYOnqChJyBRw@mail.gmail.com>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERB2WA43QQKGQECTD4PWI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v66DiqK9sL-hQev4Wy08d9T7f1Yc2DFWJ0gYOnqChJyBRw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dne sobota, 12. januar 2019 ob 02:56:11 CET je Chen-Yu Tsai napisal(a):
> On Sat, Jan 12, 2019 at 1:30 AM Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org> 
wrote:
> > A64 IR is compatible with A13, so add A64 compatible with A13 as a
> > fallback.
> 
> We ask people to add the SoC-specific compatible as a contigency,
> in case things turn out to be not so "compatible".
> 
> To be consistent with all the other SoCs and other peripherals,
> unless you already spotted a "compatible" difference in the
> hardware, i.e. the hardware isn't completely the same, this
> patch isn't needed. On the other hand, if you did, please mention
> the differences in the commit log.

When comparing registers descriptions between A13 and A64, I noticed few minor 
differences:

A13: RXINT: 11:6 RAL
A64: RXINT: 13:8 RAL

A13: IR_RXSTA: 12:6 RAC
A64: IR_RXSTA: 14:8 RAC, 7 STAT (missing on A13)

What is strange that  RAL and RAC field have offset defined as 8 in driver. I'm 
not sure if that is a typo in A13 manual or driver issue. I assume the former, 
otherwise it wouldn't work. I couldn't found original BSP driver source to 
confirm, though.

STAT bit is really not that important. It just tells if IR unit is busy or 
not.

The biggest difference is in 0x34 register. A64 has one more clock option 
(without postdivider), although register values are backward compatible. A64 
also has Active threshold setting (duration of CIR going from idle to active 
state).

If we dismiss RAC and RAL differences as manual error and don't care for new 
clock option and active threshold, then having new compatible maybe really 
doesn't make sense.

Best regards,
Jernej

> 
> ChenYu
> 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > ---
> > 
> >  Documentation/devicetree/bindings/media/sunxi-ir.txt | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/sunxi-ir.txt
> > b/Documentation/devicetree/bindings/media/sunxi-ir.txt index
> > 278098987edb..ecac6964b69b 100644
> > --- a/Documentation/devicetree/bindings/media/sunxi-ir.txt
> > +++ b/Documentation/devicetree/bindings/media/sunxi-ir.txt
> > @@ -1,7 +1,10 @@
> > 
> >  Device-Tree bindings for SUNXI IR controller found in sunXi SoC family
> > 
> >  Required properties:
> > -- compatible       : "allwinner,sun4i-a10-ir" or "allwinner,sun5i-a13-ir"
> > +- compatible       : value must be one of:
> > +  * "allwinner,sun4i-a10-ir"
> > +  * "allwinner,sun5i-a13-ir"
> > +  * "allwinner,sun50i-a64-ir", "allwinner,sun5i-a13-ir"
> > 
> >  - clocks           : list of clock specifiers, corresponding to
> >  
> >                       entries in clock-names property;
> >  
> >  - clock-names      : should contain "apb" and "ir" entries;
> > 
> > --
> > 2.20.1
