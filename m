From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 2/9] crypto: Add Allwinner sun8i-ce Crypto Engine
Date: Mon, 9 Sep 2019 15:59:10 +0200
Message-ID: <20190909135908.vkvcuykrplhxxwtd@flea>
References: <20190906184551.17858-1-clabbe.montjoie@gmail.com>
 <20190906184551.17858-3-clabbe.montjoie@gmail.com>
 <20190907081951.v2huvhm44jfprfop@flea>
 <20190907190408.GE2628@Red>
 <20190909113837.vrnqdfgzhsiymfpm@flea>
 <20190909131906.GA12882@Red>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190909131906.GA12882@Red>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: davem@davemloft.net, herbert@gondor.apana.org.au, linux@armlinux.org.uk, mark.rutland@arm.com, robh+dt@kernel.org, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Mon, Sep 09, 2019 at 03:19:06PM +0200, Corentin Labbe wrote:
> On Mon, Sep 09, 2019 at 01:38:37PM +0200, Maxime Ripard wrote:
> > On Sat, Sep 07, 2019 at 09:04:08PM +0200, Corentin Labbe wrote:
> > > > Also, I'm not sure what is the point of having the clocks names be
> > > > parameters there as well. It's constant across all the compatibles,
> > > > the only thing that isn't is the number of clocks and the module clock
> > > > rate. It's what you should have in there.
> > >
> > > Since the datasheet give some max frequency, I think I will add a
> > > max_freq and add a check to verify if the clock is in the right
> > > range
> >
> > It's a bit pointless. What are you going to do if it's not correct?
> > What are you trying to fix / report with this?
>
> I thinked to print a warning.  If someone want to play with
> overclocking for example, the driver should said that probably some
> result could be invalid.

If someone wants to play with overclocking, the crypto engine is going
to be the least of their concern.

> > > > > +int sun8i_ce_get_engine_number(struct sun8i_ce_dev *ce)
> > > > > +{
> > > > > +	return atomic_inc_return(&ce->flow) % ce->variant->maxflow;
> > > > > +}
> > > >
> > > > I'm not sure what this is supposed to be doing, but that mod there
> > > > seems pretty dangerous.
> > > >
> > > > ...
> > >
> > > This mod do a round robin on each channel.
> > > I dont see why it is dangerous.
> >
> > Well, you're using the atomic API here which is most commonly used for
> > refcounting, while you're using a mod.
> >
> > Plus, while the increment is atomic, the modulo isn't, so you can end
> > up in a case where you would be preempted between the
> > atomic_inc_return and the mod, which is dangerous.
> >
> > Again, I'm not sure what this function is doing (which is also a
> > problem in itself). I guess you should just make it clearer what it
> > does, and then we can discuss it properly.
>
> Each request need to be assigned to a channel.
> Each channel are identified by a number from 1 to 4.
>
> So this function return the channel to use, 1 then 2 then 3 then 4 then 1...
>
> Note that this is uncritical. If, due to anything, two request are
> assigned to the same channel, nothing will break.

I'm not sure why you're using the atomic API then?

Also, I guess a bitfield and find_first_bit (and a different function
name) would be more obvious to the reader.

Thanks!
Maxime
