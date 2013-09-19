From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v2] clk: si570: Add a driver for SI570 oscillators
Date: Thu, 19 Sep 2013 07:48:47 -0700
Message-ID: <9037e962-30eb-4762-84c4-14bb266a504a@TX2EHSMHS014.ehs.local>
References: <1379544219-23579-1-git-send-email-soren.brinkmann@xilinx.com>
 <1379545361.1787.87.camel@joe-AO722>
 <0da25c5c-660c-4836-8179-6e7c51fd0d9f@CO9EHSMHS005.ehs.local>
 <1379546336.1787.95.camel@joe-AO722>
 <1119f60e-99dd-45f8-8d91-2b0fa8b7f03b@DB8EHSMHS027.ehs.local>
 <20130919002308.GA11266@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130919002308.GA11266@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Joe Perches <joe@perches.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Mike Turquette <mturquette@linaro.org>, Grant Likely <grant.likely@linaro.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Hyun Kwon <hyunk@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 18, 2013 at 05:23:08PM -0700, Guenter Roeck wrote:
> On Wed, Sep 18, 2013 at 04:32:59PM -0700, S=C3=B6ren Brinkmann wrote:
> > On Wed, Sep 18, 2013 at 04:18:56PM -0700, Joe Perches wrote:
> > > On Wed, 2013-09-18 at 16:09 -0700, S=C3=B6ren Brinkmann wrote:
> > > > On Wed, Sep 18, 2013 at 04:02:41PM -0700, Joe Perches wrote:
> > > > > On Wed, 2013-09-18 at 15:43 -0700, Soren Brinkmann wrote:
> > > > > > Add a driver for SILabs 570, 571, 598, 599 programmable osc=
illators.
> > > > > > The devices generate low-jitter clock signals and are repro=
grammable via
> > > > > > an I2C interface.
> > > > > []
> > > > > > v2:
> > > > > []
> > > > > >  - use 10000 as MIN and MAX value in usleep_range
> > > > > []
> > > > > > diff --git a/drivers/clk/clk-si570.c b/drivers/clk/clk-si57=
0.c
> > > > > []
> > > > > > +static int si570_set_frequency(struct clk_si570 *data, uns=
igned long frequency)
> > > > > > +{
> > > > > []
> > > > > > +	/* Applying a new frequency can take up to 10ms */
> > > > > > +	usleep_range(10000, 10000);
> > > > >=20
> > > > > Generally it's nicer to have an actual range for usleep_range=
=2E
> > > > Well, as I said in the discussion with Guenther. I'm flexible a=
nd nobody
> > > > objected when I said to make both equal. A real range doesn't m=
ake sense
> > > > here though, but I don't know what's common practice for cases =
like
> > > > this.
> > >=20
> > > udelay is normal, but I guess you don't need atomic context.
> > After checkpatch correcting me a few times I went with what
> > Documentation/timers/timers-howto.txt suggests. But yes, then we ha=
ve
> > this situation, that I want to sleep 10ms, but not longer using a
> > *_range function. I guess it is very application specific whether a
> > longer delay here is acceptable or not.
> >=20
> You really want to sleep and not call udelay for 10ms. The idea behin=
d usleep_range
> is that you give the kernel some slack. In this case, you could for e=
xample make it
> 10-12 ms. That doesn't make much difference for the driver, but it mi=
ght save a
> timer interrupt in the kernel because it might be able to coalesce mo=
re than one
> event. After all, it doesn't have to be _exactly_ 10 ms, which is wha=
t you are
> claiming with the fixed number. Prior to usleep_range, you would have=
 happily
> called msleep(10) without realizing that it might sleep up to 20 ms o=
n you.
> Keep that in mind ...
>=20
> > You're right. I'll add a delay there as well. The 'rang' question
> > applies here as well.
> >=20
> Same thing, really. You could make it 100-200uS. That doesn't make mu=
ch
> difference for this driver, but it might make a difference for overal=
l
> performance, especially if everyone is playing nicely.
>=20

Okay, so I'll use a real range. 10 - 12 ms for big frequency changes an=
d
100 - 200 us for small ones, as Guenther suggests. Does that sound okay=
?

	Thanks,
	S=C3=B6ren
