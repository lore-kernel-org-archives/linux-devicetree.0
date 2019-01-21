From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
Subject: Re: [PATCH 1/3] media: dt: bindings: sunxi-ir: Add A64 compatible
Date: Mon, 21 Jan 2019 18:33:19 +0100
Message-ID: <3128239.8RYQUhiYef@jernej-laptop>
References: <20190111173015.12119-1-jernej.skrabec@siol.net> <20190121095014.b6iq5dubfi7x2pi4@flea> <CAGb2v66d0wM8Yt2uS4MMhU6PP02h8CKwKjinasO6jtZ4ue1CAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGb2v66d0wM8Yt2uS4MMhU6PP02h8CKwKjinasO6jtZ4ue1CAQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

Dne ponedeljek, 21. januar 2019 ob 10:57:57 CET je Chen-Yu Tsai napisal(a):
> On Mon, Jan 21, 2019 at 5:50 PM Maxime Ripard <maxime.ripard@bootlin.com> 
wrote:
> > Hi,
> > 
> > I'm a bit late to the party, sorry for that.
> > 
> > On Sat, Jan 12, 2019 at 09:56:11AM +0800, Chen-Yu Tsai wrote:
> > > On Sat, Jan 12, 2019 at 1:30 AM Jernej Skrabec <jernej.skrabec@siol.net> 
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

If you don't document them, checkpatch will complain. But if you can live with 
this warning, that's fine by me.

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
> 

H6 has IR TX peripheral too, but it's different IP block...

Do you want me to switch all A31 and newer to different compatible in this 
series? I can do this, but I haven't any A13 device to test if this is really 
needed. Or you can argue that this is needed anyway due to missing TX 
capability.

BR,
Jernej
