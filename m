Return-Path: <SRS0=OpkU=G6=verge.net.au=horms@kernel.org>
Date: Mon, 9 Apr 2018 13:59:27 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH/RFT v2 0/3] thermal: add support for r8a77995
Message-ID: <20180409115926.l5xmxlzu4usqnedw@verge.net.au>
References: <1522379583-4503-1-git-send-email-ykaneko0929@gmail.com>
 <20180330134946.pa3565f2cbtucgja@verge.net.au>
 <CAH1o70Km=f8merfVUDprJjF84ziKWgnxCPswbKgov9p3Ja-TeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH1o70Km=f8merfVUDprJjF84ziKWgnxCPswbKgov9p3Ja-TeA@mail.gmail.com>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 03, 2018 at 08:00:50PM +0900, Yoshihiro Kaneko wrote:
> Hi Simon-san,
> 
> 2018-03-30 22:49 GMT+09:00 Simon Horman <horms@verge.net.au>:
> > On Fri, Mar 30, 2018 at 12:13:00PM +0900, Yoshihiro Kaneko wrote:
> >> This series adds thermal support for r8a77995.
> >> R-Car D3 (r8a77995) have a thermal sensor module which is similar to Gen2.
> >> Therefore this series adds r8a77995 support to rcar_thermal driver not
> >> rcar_gen3_thermal driver.
> >>
> >> This series is based on the next branch of Zhang Rui's linux tree.
> >
> > I have very lightly tested this as follows after enabling
> > CONFIG_RCAR_THERMAL in the kernel .config.
> >
> > # cat /sys/devices/virtual/thermal/thermal_zone0/temp
> > 40000
> 
> Thanks for the testing.
> Probably 40C is reasonable, is not?

Yes, probably.

Niklas do you have any guidance here?
