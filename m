From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/4] arm64: renesas: enable M3ULCB board peripherals
Date: Fri, 7 Apr 2017 09:52:13 -0400
Message-ID: <20170407135212.GA24096@verge.net.au>
References: <1485442422-18259-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1489788135.8957.2.camel@collabora.co.uk>
 <CAMuHMdX9caECvsBnfUQhbQKdW_uGJ_VXAUksMMXw7EAGP8QUCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdX9caECvsBnfUQhbQKdW_uGJ_VXAUksMMXw7EAGP8QUCQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 06, 2017 at 11:53:45AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Fri, Mar 17, 2017 at 11:02 PM, Sjoerd Simons
> <sjoerd.simons@collabora.co.uk> wrote:
> > On Thu, 2017-01-26 at 17:53 +0300, Vladimir Barinov wrote:
> >> This adds the folowing:
> >> - R8A7796 SoC based M3ULCB board peripherals
> >>
> >> Vladimir Barinov (4):
> >> [1/4] arm64: dts: m3ulcb: enable I2C
> >> [2/4] arm64: dts: m3ulcb: Update memory node to 2 GiB map

I have queued up the above two patches.
> >> [3/4] arm64: dts: m3ulcb: enable EthernetAVB

Please update the above patch to reflect the changes made in
ef3f08c83fd1 ("arm64: dts: r8a7796: salvator-x: Fix EthernetAVB PHY timing")

> >> [4/4] arm64: dts: m3ulcb: enable HS200 for eMMC

I will look at queuing this up in the near future
with other HS200 enablement patches.

> > Seems these didn't hit -next just yet, for this series (tested on a
> > M3ULCB)
> >
> > Tested-By: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
> 
> It seems this series is still pending? Any reason (not) to apply it?

Sorry for the extended delay.
