From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH 06/17] dt-bindings: display: sun4i-drm: Add
 R40 TV TCON description
Date: Fri, 06 Jul 2018 22:44:20 +0200
Message-ID: <8232482.X57NU8v1zb@jernej-laptop>
References: <20180706175113.26698-1-jernej.skrabec@siol.net> <20180706175113.26698-7-jernej.skrabec@siol.net> <20180706204052.GA9680@rob-hp-laptop>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBB5K77MQKGQEOQMXBNY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180706204052.GA9680@rob-hp-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne petek, 06. julij 2018 ob 22:40:52 CEST je Rob Herring napisal(a):
> On Fri, Jul 06, 2018 at 07:51:02PM +0200, Jernej Skrabec wrote:
> > TCON description is expanded with R40 TV TCON compatible. It is a bit
> > special, because it is connected to TCON TOP instead directly to mixer
> > and it needs special handling.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > ---
> > 
> >  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Please add acks/reviews when posting new versions.

This is not exactly the same version you give ack for, so I didn't include it. 
I'm not sure where the line for that is.

In contrast to previous version, it doesn't introduce additional clock.

Best regards,
Jernej
