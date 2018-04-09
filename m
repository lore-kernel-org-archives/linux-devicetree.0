Return-Path: <SRS0=sI4l=G6=ragnatech.se=niklas.soderlund@kernel.org>
Date: Mon, 9 Apr 2018 15:32:29 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH/RFT v2 0/3] thermal: add support for r8a77995
Message-ID: <20180409133229.GI12256@bigcity.dyn.berto.se>
References: <1522379583-4503-1-git-send-email-ykaneko0929@gmail.com>
 <20180330134946.pa3565f2cbtucgja@verge.net.au>
 <CAH1o70Km=f8merfVUDprJjF84ziKWgnxCPswbKgov9p3Ja-TeA@mail.gmail.com>
 <20180409115926.l5xmxlzu4usqnedw@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180409115926.l5xmxlzu4usqnedw@verge.net.au>
To: Simon Horman <horms@verge.net.au>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

On 2018-04-09 13:59:27 +0200, Simon Horman wrote:
> On Tue, Apr 03, 2018 at 08:00:50PM +0900, Yoshihiro Kaneko wrote:
> > Hi Simon-san,
> > 
> > 2018-03-30 22:49 GMT+09:00 Simon Horman <horms@verge.net.au>:
> > > On Fri, Mar 30, 2018 at 12:13:00PM +0900, Yoshihiro Kaneko wrote:
> > >> This series adds thermal support for r8a77995.
> > >> R-Car D3 (r8a77995) have a thermal sensor module which is similar to Gen2.
> > >> Therefore this series adds r8a77995 support to rcar_thermal driver not
> > >> rcar_gen3_thermal driver.
> > >>
> > >> This series is based on the next branch of Zhang Rui's linux tree.
> > >
> > > I have very lightly tested this as follows after enabling
> > > CONFIG_RCAR_THERMAL in the kernel .config.
> > >
> > > # cat /sys/devices/virtual/thermal/thermal_zone0/temp
> > > 40000
> > 
> > Thanks for the testing.
> > Probably 40C is reasonable, is not?
> 
> Yes, probably.
> 
> Niklas do you have any guidance here?

Yes judging from other Gen3 boards which al be it is using the gen3 
thermal driver the temperature seems to be in range of what is observed 
there in idle where the 3 different zones on those H3 for example is 
between 38C - 42C.

But I have no method of observing the real temperature other then with 
the driver that is being under test. And then tests i do is to 
increasing the CPU load in order to generate heat and observe the 
temperature increasing. But 40C seems like a reasonable value during 
idle compared to other Gen3 SoCs I looked at.

-- 
Regards,
Niklas S�derlund
