From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] media: dt: bindings: sunxi-ir: Add A64 compatible
Date: Tue, 22 Jan 2019 07:37:51 -0600
Message-ID: <CAL_Jsq+u2PdLK3YaYMERHndNpN_PprksPF9gVF+V76c343yrMg@mail.gmail.com>
References: <20190111173015.12119-1-jernej.skrabec@siol.net>
 <20190111173015.12119-2-jernej.skrabec@siol.net> <CAGb2v66DiqK9sL-hQev4Wy08d9T7f1Yc2DFWJ0gYOnqChJyBRw@mail.gmail.com>
 <20190121095014.b6iq5dubfi7x2pi4@flea> <CAGb2v66d0wM8Yt2uS4MMhU6PP02h8CKwKjinasO6jtZ4ue1CAQ@mail.gmail.com>
 <20190122001917.GA31407@bogus> <CAGb2v67YsevDvjvTSh67wJNSJSUBuZ613hQWyorEiSzCUqjjkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGb2v67YsevDvjvTSh67wJNSJSUBuZ613hQWyorEiSzCUqjjkQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Jernej Skrabec <jernej.skrabec@siol.net>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2019 at 8:16 PM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Tue, Jan 22, 2019 at 8:19 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, Jan 21, 2019 at 05:57:57PM +0800, Chen-Yu Tsai wrote:
> > > On Mon, Jan 21, 2019 at 5:50 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > I'm a bit late to the party, sorry for that.
> > > >
> > > > On Sat, Jan 12, 2019 at 09:56:11AM +0800, Chen-Yu Tsai wrote:
> > > > > On Sat, Jan 12, 2019 at 1:30 AM Jernej Skrabec <jernej.skrabec@siol.net> wrote:
> > > > > >
> > > > > > A64 IR is compatible with A13, so add A64 compatible with A13 as a
> > > > > > fallback.
> > > > >
> > > > > We ask people to add the SoC-specific compatible as a contigency,
> > > > > in case things turn out to be not so "compatible".
> > > > >
> > > > > To be consistent with all the other SoCs and other peripherals,
> > > > > unless you already spotted a "compatible" difference in the
> > > > > hardware, i.e. the hardware isn't completely the same, this
> > > > > patch isn't needed. On the other hand, if you did, please mention
> > > > > the differences in the commit log.
> > > >
> > > > Even if we don't spot things, since we have the stable DT now, if we
> > > > ever had that compatible in the DT from day 1, it's much easier to
> > > > deal with.
> > > >
> > > > I'd really like to have that pattern for all the IPs even if we didn't
> > > > spot any issue, since we can't really say that the datasheet are
> > > > complete, and one can always make a mistake and overlook something.
> > > >
> > > > I'm fine with this version, and can apply it as is if we all agree.
> > >
> > > I'm OK with having the fallback compatible. I'm just pointing out
> > > that there are and will be a whole bunch of them, and we don't need
> > > to document all of them unless we are actually doing something to
> > > support them.
> >
> > Yes, you do. Otherwise, how will we validate what is and isn't a valid
> > set of compatible strings? It's not required yet, but bindings are
> > moving to json-schema.
>
> Ideally, if we knew which IP blocks in each SoC were compatible with
> each other, we wouldn't need "per-SoC" compatible strings for each
> block. However in reality this doesn't happen, due to a combination
> of lack of time, lack of / uncertainty of documentation, and lack of
> hardware for testing by the contributors.
>
> The per-SoC compatible we ask people to add are a contigency plan,
> for when things don't actually work, and we need some way to support
> that specific piece of hardware on old DTs.

You are right up to here.

> At which point we will
> add that SoC-specific compatible as a new compatible string to the
> bindings. But not before.

No, the point SoC-specific compatibles is they are already present in
the DT and you only have to update the OS to fix issues. The SoC
specific compatible has to be documented when first used in dts files,
not when the OS uses them. That is the rule.

Rob
