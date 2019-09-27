From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 2/2] ptp: Add a ptp clock driver for IDT ClockMatrix.
Date: Fri, 27 Sep 2019 16:56:32 +0200
Message-ID: <20190927145632.GI20927@lunn.ch>
References: <1569556128-22212-1-git-send-email-vincent.cheng.xh@renesas.com>
 <1569556128-22212-2-git-send-email-vincent.cheng.xh@renesas.com>
 <20190927122518.GA25474@lunn.ch>
 <20190927141215.GA24424@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190927141215.GA24424@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vincent Cheng <vincent.cheng.xh@renesas.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "richardcochran@gmail.com" <richardcochran@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> >> +static void set_default_function_pointers(struct idtcm *idtcm)
> >> +{
> >> +	idtcm->_idtcm_gettime = _idtcm_gettime;
> >> +	idtcm->_idtcm_settime = _idtcm_settime;
> >> +	idtcm->_idtcm_rdwr = idtcm_rdwr;
> >> +	idtcm->_sync_pll_output = sync_pll_output;
> >> +}
> >
> >Why does this indirection? Are the SPI versions of the silicon?
> 
> The indirection is to enable us to replace those functions in
> our unit tests with mocked functions.

Due to Spectra/meltdown etc, indirection is now expensive. But i guess
the I2C operations are a lot more expensive.

But in general, we try to keep the code KISS. Have you tried other
ways of doing this. Have your unit test framework implement
i2c_transfer()?
 
> I read somewhere that I should leave a week between sending a
> revised patch series.  Is this a good rule to follow?

There are different 'timers'. One is how long to wait for review
comments, and reposting when you don't receiver any comments. netdev
for example is fast, a couple of days. Other subsystems, you need to
wait two weeks. Another 'timer' is how often to post new versions. In
general, never more than once per day. And the slower the subsystem is
for making reviews, the longer you should wait for additional review
comments.

What also plays a role is that the merge window is currently open. So
most subsystems won't accept patches at the moment. You need to wait
until it closes before submitting patches you expect to be good enough
to be accepted.

   Andrew
