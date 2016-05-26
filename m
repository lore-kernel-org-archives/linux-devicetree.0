From: Paul Handrigan <paul.handrigan-jGc1dHjMKG3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 2/2] ASoC: cs35l33: Add device tree bindings file for
 cs35l33
Date: Thu, 26 May 2016 17:19:39 -0500
Message-ID: <alpine.DEB.2.10.1605261714310.16316@phandrigan>
References: <1463173373-648-1-git-send-email-Paul.Handrigan@cirrus.com> <20160516163922.GA21073@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160516163922.GA21073@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Paul.Handrigan-jGc1dHjMKG3QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, brian.austin-jGc1dHjMKG3QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Mon, 16 May 2016, Rob Herring wrote:

> On Fri, May 13, 2016 at 04:02:53PM -0500, Paul.Handrigan-jGc1dHjMKG3QT0dZR+AlfA@public.gmane.org wrote:
> > From: Paul Handrigan <Paul.Handrigan-jGc1dHjMKG3QT0dZR+AlfA@public.gmane.org>
> > 
> > Add device tree bindings file for the cs35l33 8V boosted
> > class D amplifier.
> > 
> > Signed-off-by: Paul Handrigan <Paul.Handrigan-jGc1dHjMKG3QT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../devicetree/bindings/sound/cs35l33.txt          | 73 ++++++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/cs35l33.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/cs35l33.txt b/Documentation/devicetree/bindings/sound/cs35l33.txt
> > new file mode 100644
> > index 0000000..273d73a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/cs35l33.txt
> > @@ -0,0 +1,73 @@
> > +CS35L33 Speaker Amplifier
> > +  - boost-ctl : Booster voltage use to supply the amp. If the value is
> > +    0, then VBST = VP. If greater than 0, the boost voltage will be 3.3V with
> > +    a value of 1 and will increase at a step size of 0.1V until a maximum of
> > +    8.0V.
> 
> Can you just specify this is microvolts? Looks like an easy conversion.
Yes, I can change that.
> 
> > +
> > +  - ramp-rate : On power up, it affects the time from when the power
> > +    up sequence begins to the time the audio reaches a full-scale output.
> > +    On power down, it affects the time from when the power-down sequence
> > +    begins to when the amplifier disables the PWM outputs. If this property
> > +    is not set then soft ramping will be disabled and ramp time would be
> > +    20ms. If this property is set to 0,1,2,3 then ramp times would be 40ms,
> > +    60ms,100ms,175ms respectively for 48KHz sample rate.
> 
OK.  Thanks!
> Either use time units or add vendor prefix.
> 
> > +  - boost-ipk : The maximum current allowed for the boost converter.
> > +    The range starts at 1.85A (0xF0) and goes to a maximum of 3.60A (0xE0)
> > +    with a step size of 0.015625A. The default is 2.50A (0x90).
> 
> Can this be in microamps?
> 
Yes.

> Are these standard/typical properties for Class D amps?
Not typical for class D amps in general, but some would be fairly common
for boosted class D amps.  For example boost current maximum should be
fairly common.  It is standard for all Cirrus class D boosted amps.

> 
> > +
> > +  - hg-algo : Parameters for internal Class H/G algorithm that
> > +    controls the amplifier supplies.
> 
> Each property in this node needs to be defined.
OK.  Will do.
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
