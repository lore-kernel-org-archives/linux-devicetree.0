From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 0/9] of: fix compatible-child-node lookups
Date: Wed, 24 Oct 2018 09:32:25 +0200
Message-ID: <20181024073225.GD20058@localhost>
References: <20180827082153.22537-1-johan@kernel.org>
 <20180904130557.GT28861@localhost>
 <20181023091951.GC20058@localhost>
 <CAL_Jsq+eX0Zr46UT6_+OKhfxLhc315Un5MZkHHAWhK0tt4OvzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+eX0Zr46UT6_+OKhfxLhc315Un5MZkHHAWhK0tt4OvzA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, Ulf Hansson <ulf.hansson@linaro.org>, Josh Wu <rainyfeeling@outlook.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Doug Berger <opendmb@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, David Miller <davem@davemloft.net>, Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, joabreu@synopsys.com, Samuel Ortiz <sameo@linux.intel.com>, Sebastian Reichel <sre@ker>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 23, 2018 at 01:32:56PM -0500, Rob Herring wrote:
> On Tue, Oct 23, 2018 at 4:21 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > Hi Rob,
> >
> > On Tue, Sep 04, 2018 at 03:05:57PM +0200, Johan Hovold wrote:

> > > I think Rob will be picking up any patches that remain by the end of the
> > > release cycle for 4.20.
> >
> > So far only Ulf has picked up the mmc patch below directly, so if you
> > could take the rest through your tree for -rc1 that would be great.
> 
> Thanks for the reminder, though before the merge window opened would
> have been better. I've applied all but the mtd patch.

Yeah, sorry about that, this slipped my mind. Thanks for picking them
up.

Johan
