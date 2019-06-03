From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [linux-sunxi] [PATCH v6 0/6] Add support for Orange Pi 3
Date: Mon, 3 Jun 2019 19:53:09 +0200
Message-ID: <20190603175309.qjlyfymbl6ybrpag@flea>
References: <20190527162237.18495-1-megous@megous.com>
 <20190531125246.qqfvmgmw2mv442tq@core.my.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190531125246.qqfvmgmw2mv442tq@core.my.home>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-sunxi@googlegroups.com, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Fri, May 31, 2019 at 02:52:46PM +0200, Ondřej Jirman wrote:
> Hello,
>
> On Mon, May 27, 2019 at 06:22:31PM +0200, megous via linux-sunxi wrote:
> > From: Ondrej Jirman <megous@megous.com>
> >
> > This series implements support for Xunlong Orange Pi 3 board.
> >
> > Unfortunately, this board needs some small driver patches, so I have
> > split the boards DT patch into chunks that require patches for drivers
> > in various subsystems.
> >
> > Suggested merging plan/dependencies:
> >
> > - stmmac patches are needed for ethernet support (patches 1-3)
> >   - these should be ready now
> > - HDMI support (patches 4-6)
> >   - should be ready
>
> If there are no futher comments, can all these patches please be merged?

I'm waiting for some feedback on the stmmac and the DW-HDMI
developpers to merge the rest

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
