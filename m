From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 1/3] media: dt: bindings: sunxi-ir: Add A64 compatible
Date: Fri, 25 Jan 2019 10:29:07 +0800
Message-ID: <CAGb2v67saMfK58vSx7=Mhq6Z06Qbj+vmbFv7=psddzB1X-GHkA@mail.gmail.com>
References: <20190111173015.12119-1-jernej.skrabec@siol.net>
 <20190111173015.12119-2-jernej.skrabec@siol.net> <CAGb2v66DiqK9sL-hQev4Wy08d9T7f1Yc2DFWJ0gYOnqChJyBRw@mail.gmail.com>
 <20190121095014.b6iq5dubfi7x2pi4@flea> <CAGb2v66d0wM8Yt2uS4MMhU6PP02h8CKwKjinasO6jtZ4ue1CAQ@mail.gmail.com>
 <20190122001917.GA31407@bogus> <CAGb2v67YsevDvjvTSh67wJNSJSUBuZ613hQWyorEiSzCUqjjkQ@mail.gmail.com>
 <CAL_Jsq+u2PdLK3YaYMERHndNpN_PprksPF9gVF+V76c343yrMg@mail.gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBAXJVHRAKGQE5SZG7WA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAL_Jsq+u2PdLK3YaYMERHndNpN_PprksPF9gVF+V76c343yrMg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 22, 2019 at 9:38 PM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> On Mon, Jan 21, 2019 at 8:16 PM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> >
> > On Tue, Jan 22, 2019 at 8:19 AM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > >
> > > On Mon, Jan 21, 2019 at 05:57:57PM +0800, Chen-Yu Tsai wrote:
> > > > On Mon, Jan 21, 2019 at 5:50 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > I'm a bit late to the party, sorry for that.
> > > > >
> > > > > On Sat, Jan 12, 2019 at 09:56:11AM +0800, Chen-Yu Tsai wrote:
> > > > > > On Sat, Jan 12, 2019 at 1:30 AM Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org> wrote:
> > > > > > >
> > > > > > > A64 IR is compatible with A13, so add A64 compatible with A13 as a
> > > > > > > fallback.
> > > > > >
> > > > > > We ask people to add the SoC-specific compatible as a contigency,
> > > > > > in case things turn out to be not so "compatible".
> > > > > >
> > > > > > To be consistent with all the other SoCs and other peripherals,
> > > > > > unless you already spotted a "compatible" difference in the
> > > > > > hardware, i.e. the hardware isn't completely the same, this
> > > > > > patch isn't needed. On the other hand, if you did, please mention
> > > > > > the differences in the commit log.
> > > > >
> > > > > Even if we don't spot things, since we have the stable DT now, if we
> > > > > ever had that compatible in the DT from day 1, it's much easier to
> > > > > deal with.
> > > > >
> > > > > I'd really like to have that pattern for all the IPs even if we didn't
> > > > > spot any issue, since we can't really say that the datasheet are
> > > > > complete, and one can always make a mistake and overlook something.
> > > > >
> > > > > I'm fine with this version, and can apply it as is if we all agree.
> > > >
> > > > I'm OK with having the fallback compatible. I'm just pointing out
> > > > that there are and will be a whole bunch of them, and we don't need
> > > > to document all of them unless we are actually doing something to
> > > > support them.
> > >
> > > Yes, you do. Otherwise, how will we validate what is and isn't a valid
> > > set of compatible strings? It's not required yet, but bindings are
> > > moving to json-schema.
> >
> > Ideally, if we knew which IP blocks in each SoC were compatible with
> > each other, we wouldn't need "per-SoC" compatible strings for each
> > block. However in reality this doesn't happen, due to a combination
> > of lack of time, lack of / uncertainty of documentation, and lack of
> > hardware for testing by the contributors.
> >
> > The per-SoC compatible we ask people to add are a contigency plan,
> > for when things don't actually work, and we need some way to support
> > that specific piece of hardware on old DTs.
>
> You are right up to here.
>
> > At which point we will
> > add that SoC-specific compatible as a new compatible string to the
> > bindings. But not before.
>
> No, the point SoC-specific compatibles is they are already present in
> the DT and you only have to update the OS to fix issues. The SoC
> specific compatible has to be documented when first used in dts files,
> not when the OS uses them. That is the rule.

We also want to be able to differentiate between per-SoC compatibles
vs actual backwards-compatible tuples, such as

    - "allwinner,sun8i-r40-rtc", "allwinner,sun8i-h3-rtc"

found in Documentation/devicetree/bindings/rtc/sun6i-rtc.txt .

In the future, if someone has the time to do an in-depth comparison
and testing, they should be able to deprecated and/or remove the per-SoC
compatible strings that we added for contingency from the bindings.

As such, I'd like implementors to not target the SoC-specific compatibles,
unless imcompatiblities are discovered, at which point the bindings would
also be updated, removing the fallback compatible.

The SoC-specific compatible strings are really a workaround for the lack
of resources of the community supporting this platform, while being able
to support DT stability. I want to make it clear in some way visible to
all that this is an exception, not the norm. And I'd also like to leave
the door open to later cleanup.

What would be an acceptable way to do this? Add extra notes accompanying
the per-SoC compatibles?

Regards
ChenYu
