From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: display: sun4i: Add
 component endpoint ID numbering scheme
Date: Tue, 2 May 2017 16:54:53 +0200
Message-ID: <20170502145453.3moqzsr3venpn4mu@lukather>
References: <20170421083857.29636-1-wens@csie.org>
 <20170421083857.29636-2-wens@csie.org>
 <20170428134841.cc5jrqhunh2rxhog@rob-hp-laptop>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yyfdqyfvjibu4hc6"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBSF3ULEAKGQE75NG67Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170428134841.cc5jrqhunh2rxhog@rob-hp-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--yyfdqyfvjibu4hc6
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Fri, Apr 28, 2017 at 08:48:41AM -0500, Rob Herring wrote:
> On Fri, Apr 21, 2017 at 04:38:49PM +0800, Chen-Yu Tsai wrote:
> > The Allwinner display pipeline contains many hardware components, some
> > of which can consume data from one of multiple upstream components.
> > The numbering scheme of these components must be encoded into the device
> > tree so the driver can figure out which component out of two or more of
> > the same type it is supposed to use or program.
> > 
> > This patch adds the constraint that local endpoint IDs must be the index
> > or number of the remote endpoint's hardware block, for all components
> > in the display pipeline up to the TCONs.
> > 
> > Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > index 57a8d0610062..7acdbf14ae1c 100644
> > --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > @@ -4,6 +4,16 @@ Allwinner A10 Display Pipeline
> >  The Allwinner A10 Display pipeline is composed of several components
> >  that are going to be documented below:
> >  
> > +For the input port of all components up to the TCON in the display
> > +pipeline, if there are multiple components, the local endpoint IDs
> > +must correspond to the index of the upstream block. For example, if
> > +the remote endpoint is Frontend 1, then the local endpoint ID must
> > +be 1.
> > +
> > +Conversely, for the output ports of the same group, the remote endpoint
> > +ID must be the index of the local hardware block. If the local backend
> > +is backend 1, then the remote endpoint ID must be 1.
> 
> It would be clearer if you just explicitly listed IDs and their 
> connections. From how this is worded, it would not work if you had 
> connections like this:
> 
> DevA 0
> DevA 1
> DevB 0
> DevB 1
> 
> These would need to be endpoints 0-3 in TCON, and that doesn't reflect 
> the remote devices' index.

Chen-Yu, can you send a patch to rephrase the doc that way?

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--yyfdqyfvjibu4hc6--
