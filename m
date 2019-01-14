From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 1/5] gnss: sirf: write data to gnss only when the gnss
 device is open
Date: Mon, 14 Jan 2019 13:00:21 +0100
Message-ID: <20190114120021.GF3691@localhost>
References: <20181209195150.5192-1-andreas@kemnade.info>
 <20181209195150.5192-2-andreas@kemnade.info>
 <20190110120228.GB3430@localhost>
 <20190113215036.11c543db@aktux>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190113215036.11c543db@aktux>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Johan Hovold <johan@kernel.org>, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 13, 2019 at 09:50:36PM +0100, Andreas Kemnade wrote:
> On Thu, 10 Jan 2019 13:02:28 +0100
> Johan Hovold <johan@kernel.org> wrote:
> 
> > On Sun, Dec 09, 2018 at 08:51:46PM +0100, Andreas Kemnade wrote:
> > > The api forbids writing data there otherwise. Prepare for the
> > > serdev_open()/close() being a part of runtime pm.
> > > 
> > > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > > ---
> > > Changes in v2:
> > >  add locking
> > > 
> > >  drivers/gnss/sirf.c | 28 +++++++++++++++++++++++++++-
> > >  1 file changed, 27 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gnss/sirf.c b/drivers/gnss/sirf.c
> > > index 2c22836d3ffd..ba663de1db49 100644
> > > --- a/drivers/gnss/sirf.c
> > > +++ b/drivers/gnss/sirf.c
> > > @@ -35,6 +35,12 @@ struct sirf_data {
> > >  	struct gpio_desc *wakeup;
> > >  	int irq;
> > >  	bool active;
> > > +	/*
> > > +	 * There might be races between returning data and closing the gnss
> > > +	 * device.
> > > +	 */  
> > 
> > Please drop this comment, which is too verbose. The mutex protects the
> > opened flag, and that could be indicated using a new line above the
> > mutex and below the flag, or using a short comment before the mutex.
> > 
> > > +	struct mutex gdev_mutex;  
> > 
> > Please rename "mutex". We should be able to reuse this for the serdev
> > open count as well, right?
> 
> No. we cannot. The problem here is that we would take the same mutex
> in a serdev callback and around a serdev call. Then we have things like
> that:
> 
> [   36.700408] ======================================================
> [   36.706970] WARNING: possible circular locking dependency detected

Right, we need to be able to flush as part of close. Thanks for
investigating, though.

Johan
