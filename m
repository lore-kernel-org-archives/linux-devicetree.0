From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH 1/3] media: dt: bindings: sunxi-ir: Add A64 compatible
Date: Thu, 24 Jan 2019 19:56:57 +0100
Message-ID: <2800701.S2xdS7azMu@jernej-laptop>
References: <20190111173015.12119-1-jernej.skrabec@siol.net> <20190121095014.b6iq5dubfi7x2pi4@flea> <CAGb2v66d0wM8Yt2uS4MMhU6PP02h8CKwKjinasO6jtZ4ue1CAQ@mail.gmail.com>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERB7UUVDRAKGQEQ6FNFDA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v66d0wM8Yt2uS4MMhU6PP02h8CKwKjinasO6jtZ4ue1CAQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dne ponedeljek, 21. januar 2019 ob 10:57:57 CET je Chen-Yu Tsai napisal(a):
> On Mon, Jan 21, 2019 at 5:50 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> 
wrote:
> > Hi,
> > 
> > I'm a bit late to the party, sorry for that.
> > 
> > On Sat, Jan 12, 2019 at 09:56:11AM +0800, Chen-Yu Tsai wrote:
> > > On Sat, Jan 12, 2019 at 1:30 AM Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org> 
wrote:
> > > > A64 IR is compatible with A13, so add A64 compatible with A13 as a
> > > > fallback.
> > > 
> > > We ask people to add the SoC-specific compatible as a contigency,
> > > in case things turn out to be not so "compatible".
> > > 
> > > To be consistent with all the other SoCs and other peripherals,
> > > unless you already spotted a "compatible" difference in the
> > > hardware, i.e. the hardware isn't completely the same, this
> > > patch isn't needed. On the other hand, if you did, please mention
> > > the differences in the commit log.
> > 
> > Even if we don't spot things, since we have the stable DT now, if we
> > ever had that compatible in the DT from day 1, it's much easier to
> > deal with.
> > 
> > I'd really like to have that pattern for all the IPs even if we didn't
> > spot any issue, since we can't really say that the datasheet are
> > complete, and one can always make a mistake and overlook something.
> > 
> > I'm fine with this version, and can apply it as is if we all agree.
> 
> I'm OK with having the fallback compatible. I'm just pointing out
> that there are and will be a whole bunch of them, and we don't need
> to document all of them unless we are actually doing something to
> support them.
> 
> On the other hand, the compatible string situation for IR needs a
> bit of cleaning up at the moment. Right now we have sun4i-a10 and
> sun5i-a13. As Jernej pointed out, the A13's register definition is
> different from A64 (or any other SoCs later than sun6i). So we need
> someone with an A10s/A13 device that has IR to test it and see if
> the driver or the manual is wrong, and we'd likely add a compatible
> for the A20.
> 
> Also, the earlier SoCs (A10/sun5i/A20) have IR TX capability. This
> was lost in A31, and also all of sun8i / sun50i. So we're going to
> need to add an A31 compatible that all later platforms would need
> to switch to.

Actually, A13 also doesn't have IR TX capability. So I still think it's best 
having A13 compatible as a fallback and not A31. Unless A31 was released 
before A13?

Best regards,
Jernej
