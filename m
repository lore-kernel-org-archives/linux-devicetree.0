Return-Path: <SRS0=gbiX=WO=hellion.org.uk=ijc@kernel.org>
Message-ID: <0403ebf34d5d13c604e7109d8fb3e4bb6ab3c8a2.camel@hellion.org.uk>
Subject: Re: devicetree-rebasing.git updates pausing for a couple of months
From: Ian Campbell <ijc@hellion.org.uk>
Date: Sun, 18 Aug 2019 19:11:57 +0800
In-Reply-To: <20190709215403.GA26049@bogus>
References: <3bc28d409a6e09046c001611972cc3c33b1695e3.camel@hellion.org.uk>
	 <20190709215403.GA26049@bogus>
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Andre Przywara <andre.przywara@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

(replying to the two subthreads in one go)

On Tue, 2019-07-09 at 15:54 -0600, Rob Herring wrote:
> On Fri, Jun 21, 2019 at 01:01:27PM +0100, Ian Campbell wrote:
> > Hi all,
> > 
> > I've no idea if anyone actually uses it any more, but the split out
> > devicetree only git repo [0] is not going to receive any new updates
> > for a little while (likely 1-2 months) while I relocate to another
> > country.
> 
> Can you sync your move to the kernel release schedule? JK

:-)

I'm back online and have pushed the backlog[0] up to v5.3-rc4-dts.

> Seriously, I've been wondering if we could turn this into a Gitlab CI 
> job instead. Then it's not solely up to you to run it.

That would work for the bulk of the work (daily run of git filter-
branch), the only manual bit is merging the tags of each release (so
approx weekly). I currently sign the tags with my own PGP key so isn't
really suitable for pushing to a CI system (I think that's true no
matter which key we are using?)

On Tue, 2019-06-25 at 09:05 +0200, Sascha Hauer wrote:
> On Tue, Jun 25, 2019 at 09:02:40AM +0200, Sascha Hauer wrote:
> > I am still using it for barebox, so I'd appreciate devicetree-rebasing
> > coming back once you are relocated. Anyway, barebox can live without a
> > dts update for a while, so take your time ;)
> 
> BTW thanks for keeping devicetree-rebasing up to date for all the time.
> If the repository is of no personal use for you anymore, we at
> Pengutronix could offer to take over the repository.

Thanks, it's approximately no actual effort so I don't mind to keep
running it for the time being. So far the real actual work has been
hacking on git filter-branch, which has been a 2-3 events per decade
type thing...

Cheers,
Ian.

[0]
v5.2-rc7-dts v5.2-dts v5.3-rc1-dts v5.3-rc2-dts v5.3-rc3-dts v5.3-rc4-dts
