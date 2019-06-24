From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v7 0/6] Add support for Orange Pi 3
Date: Mon, 24 Jun 2019 10:29:27 -0700 (PDT)
Message-ID: <20190624.102927.1268781741493594465.davem@davemloft.net>
References: <20190620134748.17866-1-megous@megous.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190620134748.17866-1-megous@megous.com>
Sender: linux-kernel-owner@vger.kernel.org
To: megous@megous.com
Cc: linux-sunxi@googlegroups.com, maxime.ripard@bootlin.com, wens@csie.org, robh+dt@kernel.org, jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

From: megous@megous.com
Date: Thu, 20 Jun 2019 15:47:42 +0200

> From: Ondrej Jirman <megous@megous.com>
> 
> This series implements support for Xunlong Orange Pi 3 board.
> 
> - ethernet support (patches 1-3)
> - HDMI support (patches 4-6)
> 
> For some people, ethernet doesn't work after reboot (but works on cold
> boot), when the stmmac driver is built into the kernel. It works when
> the driver is built as a module. It's either some timing issue, or power
> supply issue or a combination of both. Module build induces a power
> cycling of the phy.
> 
> I encourage people with this issue, to build the driver into the kernel,
> and try to alter the reset timings for the phy in DTS or
> startup-delay-us and report the findings.

This is a mixture of networking and non-networking changes so it really
can't go through my tree.

I wonder how you expect this series to be merged?

Thanks.
